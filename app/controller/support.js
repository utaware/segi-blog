/*
 * @Description: 附属功能支持
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-11-20 15:47:49
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-04 18:22:24
 */

// https://segmentfault.com/q/1010000010862121
 
const { Controller } = require('egg')

const fs = require('fs-extra')
const path = require('path')
const pump = require('mz-modules/pump')
const uuid = require('uuid/v3')
const sendToWormhole = require('stream-wormhole')

class SupportController extends Controller {

  // 生成验证码 => svg路径 和 验证字符串
  async checkCode () {
    // reponse
    this.ctx.end(true, await this.ctx.service.support.svgCheckCode())
  }

  // 以github style 为主要搭配的模板
  async github () {
    let ctx = this.ctx;
    let md = await fs.readFile('app/lib/md/mark.md')
    ctx.log(md.toString())
    let data = await ctx.service.md.baseSupport(md.toString())
    await ctx.render('github.tpl', {data})
  }

  // 以vuepress为原型
  async vuepress () {
    let ctx = this.ctx;
    let md = await fs.readFile('app/lib/md/mark.md')
    ctx.log(md.toString())
    let data = await ctx.service.md.vuepressSupport(md.toString())
    await ctx.render('vuepress.tpl', {data})
  }

  // js-yaml page test
  async yaml () {
    let ctx = this.ctx
    let data = await ctx.service.support.parse('app/lib/md/yaml.md')
    await ctx.render('yaml.tpl', {data})
  }
  
  // 发送邮件功能
  async sendEmail () {
    
    const { ctx, app } = this
    // 发送邮箱地址 email
    const { email } = ctx.request.body
    // 校验邮箱
    try {
      ctx.validate(app.validator.main(['email']), email)
    } catch (err) {
      return ctx.end(false, '邮箱格式校验未通过', {err})
    }
    // 查询邮箱是否已被使用
    const queryEmail = await app.model.User.findOne({ where: {email} })
    if (queryEmail) {
      return ctx.end(false, '邮箱已经被注册')
    }
    // 生成验证码
    const { data, text } = await ctx.service.support.svgCheckCode()
    // 邮件格式
    const config = {
      to: email,
      html: `<h3 title="${text}">您的验证码为</h3>${data}`,
      subject: 'segi_blog'
    }
    // 发送邮件
    const sendEmail = await ctx.service.email.send(config)
    // 保存至数据库格式
    const emailInfo = {
      messageId: sendEmail.messageId,
      sender: sendEmail.envelope.from,
      receiver: sendEmail.envelope.to[0],
      code: text,
      content: config.html
    }
    // 插入结果
    try {
      await app.model.Email.create(emailInfo)
      return ctx.end(true, '邮件发送成功')
    } catch (err) {
      return ctx.end(false, '邮件发送失败', {err})
    }
  }

  // 上传头像
  async uploadAvatar () {
    // encodeURIComponent
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
}

module.exports = SupportController;