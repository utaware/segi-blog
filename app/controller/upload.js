/*
 * @Description: 文件上传相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-27 14:18:40
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-09 17:10:54
 */

const Controller = require('egg').Controller;

class UploadController extends Controller {

  // 上传头像 => 图片
  async avatar () {

    const { ctx, app } = this
    const { user_id } = ctx.state.user

    try {
      const upload = await ctx.service.file.single({
        allowType: ['.png', '.jpg', '.jpeg', '.gif', '.bmp', '.webp'],
        transferDir: 'avatar'
      })
      const info = Object.assign(upload, {user_id})
      const result = await app.model.Upload.create(info)
      const { src, id } = result.get({plain: true})
      return ctx.end(true, '头像上传成功', {src, id})
    } catch (err) {
      return ctx.end(ctx.status, false, '头像上传失败', {err})
    }
  }

  // 上传分享 => ppt(幻灯片)
  async share () {

    const { ctx, app } = this
    const { user_id } = ctx.state.user

    try {
      const upload = await ctx.service.file.single({
        allowType: ['.txt', '.md', '.ppt', '.rar', '.zip', '.doc'],
        transferDir: 'share'
      })
      const info = Object.assign(upload, {user_id})
      const result = await app.model.Upload.create(info)
      const { src, id } = result.get({plain: true})
      return ctx.end(true, '分享成功', {src, id})
    } catch (err) {
      return ctx.end(ctx.status, false, '分享失败', {err})
    }
  }

}

module.exports = UploadController;