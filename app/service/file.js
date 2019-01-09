/*
 * @Description: 文件操作处理
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-17 11:24:36
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-09 17:04:20
 */
const { Service } = require('egg')
const path = require('path')
const fs = require('fs-extra') // https://www.colabug.com/3668248.html
const pump = require('mz-modules/pump')
const uuidV3 = require('uuid/v3') // namespace
const uuidV4 = require('uuid/v4') // random
const sendToWormhole = require('stream-wormhole')
const uploadDir = '/public/upload'
// service
class FileService extends Service {

  // 上传单个文件
  async single (options) {
    // allowType: 允许的文件后缀 => Array []
    // transferDir: 转移的文件目录(相对cache) => String
    const { allowType, transferDir } = options
    const { ctx, app } = this
    // 解决cache => upload => transferDir 文件路径映射
    const dirMap = dirname => path.join(this.config.baseDir, 'app', uploadDir, dirname)
    const cacheDir = dirMap('cache')
    const transDir = dirMap(transferDir)
    // 只能上传单个文件并且在所有其他的 fields 后面
    const stream = await ctx.getFileStream()
    const { filename, mimeType, encoding } = stream
    const { name, ext } = path.parse(filename)
    // 文件格式是否符合
    if (allowType && !allowType.includes(ext)) {
      await sendToWormhole(stream)
      ctx.status = 403
      return ctx.throw(403, '文件格式校验未通过')
    }
    // 随机文件名
    const random = uuidV4(filename)
    const target = path.join(cacheDir, random)
    const writeStream = fs.createWriteStream(target)
    try {
      // 确认文件目录
      await fs.ensureDir(cacheDir)
      await fs.ensureDir(transDir)
      // 生成目标文件
      await pump(stream, writeStream)
      // 获取文件大小uuid重新编码文件名便于存储
      const { size } = await fs.stat(target)
      const relname = uuidV3(`${name + mimeType + encoding + size}`, uuidV3.URL) + ext
      const resource = path.join(transDir, relname)
      // 从cache中转移到指定目录
      const isExist = await fs.pathExists(resource)
      if (isExist) {
        await app.model.Upload.destroy({
          where: {resource},
          force: true
        })
      }
      await fs.move(target, resource, {overwrite: true})
      const src = `${uploadDir}/${transferDir}/${relname}`
      return {resource, size, relname, mimeType, encoding, filename, src, tag: transferDir}
    } catch (err) {
      // 消费流避免持续读取浏览器卡死
      ctx.status = 500
      await sendToWormhole(stream)
      return ctx.throw(500, '文件操作错误', {err})
    }
  }

}

module.exports = FileService