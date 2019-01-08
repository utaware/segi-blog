/*
 * @Description: 文件上传相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-27 14:18:40
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-08 17:31:01
 */

const Controller = require('egg').Controller;

const path = require('path')
const fs = require('fs-extra')
const pump = require('mz-modules/pump')
const uuid = require('uuid/v3')
const sendToWormhole = require('stream-wormhole')

class UploadController extends Controller {

  // 上传头像 => 图片
  async avatar () {
    const resource = '/public/upload/avatar'
    const allowType = ['.png', '.jpg', '.jpeg', '.gif', '.bmp', '.webp']
    const { ctx } = this
    const stream = await ctx.getFileStream()
    const { filename, mimeType  } = stream
    const { name, ext } = path.parse(filename)
    if (!allowType.includes(ext)) {
      return ctx.end(false, '文件格式校验未通过')
    }
    const avatarname = uuid(name + mimeType, uuid.URL) + ext
    const target = path.join(this.config.baseDir, `app${resource}`, avatarname)
    await fs.ensureFile(target)
    const writeStream = fs.createWriteStream(target)
    // 要通过 ctx.getFileStream 便捷的获取到用户上传的文件，需要满足两个条件：
    // 只支持上传一个文件
    // 上传文件必须在所有其他的 fields 后面，否则在拿到文件流时可能还获取不到 fields
    try {
      await pump(stream, writeStream)
      return ctx.end(true, '头像上传成功', {src: `${resource}/${avatarname}`})
    } catch (err) {
      // 必须将上传的文件流消费掉，要不然浏览器响应会卡死
      await sendToWormhole(stream)
      return ctx.end(false, '头像上传失败')
    }
  }

  // 上传分享 => ppt(幻灯片)
  async share () {
    const resource = '/public/upload/share'
    const { ctx } = this
    const stream = await ctx.getFileStream()
    const target = path.join(this.config.baseDir, `app${resource}`, 'test.txt')
    // 确认文件路径
    await fs.ensureFile(target)
    const writeStream = fs.createWriteStream(target)

    try {
      await pump(stream, writeStream)
      return ctx.end(true, '文件上传成功', {stream})
    } catch (err) {
      ctx.log(err)
      await sendToWormhole(stream)
      return ctx.end(false, '文件上传失败', {err})
    }
  }

}

module.exports = UploadController;