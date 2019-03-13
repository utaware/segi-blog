/*
 * @Description: 文件上传相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-27 14:18:40
 * @LastEditors: utaware
 * @LastEditTime: 2019-03-13 16:32:34
 */

const Controller = require('egg').Controller;

class UploadController extends Controller {

  // 上传头像 => 图片

  async avatar () {

    const { ctx } = this

    try {

      const upload = await ctx.service.file.uploadOne({
        allowType: ['.png', '.jpg', '.jpeg', '.gif', '.bmp', '.webp'],
        transferDir: 'avatar'
      })
      
      const { src, file_id } = upload
      
      return ctx.end(true, '头像上传成功', {src, file_id})
    
    } catch (err) {
    
      console.log(err)
      return ctx.end(ctx.status, false, '头像上传失败', err)
    
    }
  
  }

  // 上传分享 => ppt(幻灯片)

  async share () {

    const { ctx } = this

    try {

      const upload = await ctx.service.file.uploadOne({
        allowType: ['.txt', '.md', '.ppt', '.rar', '.zip', '.doc'],
        transferDir: 'share'
      })
     
      const { src, file_id } = upload
     
      return ctx.end(true, '分享成功', {src, file_id})
    
    } catch (err) {
    
      return ctx.end(ctx.status, false, '分享失败', err)

    }

  }

  // 删除某个上传的文件

  async deleteOne () {

    const { ctx, app } = this

    const { user_id } = ctx.state.user

    const { file_id } = ctx.request.body

    // 查询上传文件
    let uploadFile

    try {

      uploadFile = await app.model.Upload.findOne({ where: { file_id, user_id } })

      if (!uploadFile) {
        
        return ctx.end(false, '对应上传的文件信息不存在')
      
      }
    
    } catch (err) {
    
      return ctx.end(false, '文件查询失败')
    
    }

    // 确认查询结果存在

    const { resource } = query

    try {
      
      await ctx.service.file.deleteOne(resource)
     
      return ctx.end(true, '文件删除成功')
    
    } catch (err) {
    
      return ctx.end(false, '文件删除失败')
    
    }

  }

}

module.exports = UploadController;