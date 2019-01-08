/*
 * @Description: 文件操作处理
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-17 11:24:36
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-08 18:56:14
 */
const { Service } = require('egg')
const path = require('path')
const fs = require('fs-extra') // https://www.colabug.com/3668248.html
const pump = require('mz-modules/pump')
const uuidV3 = require('uuid/v3') // namespace
const uuidV4 = require('uuid/v4') // random
const sendToWormhole = require('stream-wormhole')
// service
class FileService extends Service {

  // 上传单个文件
  async single (options) {
    // allowType: 允许的文件后缀 => Array []
    // transferDir: 转移的文件目录(相对cache) => String
    const { allowType, transferDir } = options
    const { ctx, app } = this
    // 上传的主要路径
    const uploadDir = 'app/public/upload'
    // 解决cache => upload => transferDir 文件路径映射
    const dirMap = dirname => path.join(this.config.baseDir, uploadDir, dirname)
    const cacheDir = dirMap('cache')
    // 只能上传单个文件并且在所有其他的 fields 后面
    const stream = await ctx.getFileStream()
    const { filename, mimeType, encoding } = stream
    const { name, ext } = path.parse(filename)
    // 文件格式是否符合
    if (!allowType.includes(ext)) {
      await sendToWormhole(stream)
      return ctx.throw(403, '文件格式校验未通过')
    }
    // 随机文件名
    const random = uuidV4(filename)
    const target = path.join(cacheDir, random)
    const writeStream = fs.createWriteStream(target)
    try {
      await fs.ensureFile(target)
      await pump(stream, writeStream)
      const { size } = await fs.stat(target)
      const relname = uuidV3(`${name + mimeType + encoding + size}`, uuidV3.URL) + ext
      const resource = path.join(dirMap(transferDir), relname)
      await fs.ensureFile(resource)
      await fs.copyFile(target, resource)
      return {resource, size, relname, mimeType, encoding, filename}
    } catch (err) {
      await sendToWormhole(stream)
      return ctx.throw(500, '文件操作错误', {err})
    }
  }

  // 重命名的目的
  // 1: 不同文件能够唯一标识
  // 2: 相同文件能够共享标识
  async rename () {

  }

}

module.exports = FileService