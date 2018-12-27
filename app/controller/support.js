/*
 * @Description: 附属功能支持
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-11-20 15:47:49
 * @LastEditors: Please set LastEditors
 * @LastEditTime: 2018-12-26 23:47:31
 */

const { Controller } = require('egg');

class SupportController extends Controller {
  // 生成验证码 => svg路径 和 验证字符串
  async checkCode () {
    // reponse
    this.ctx.end(true, await this.ctx.service.support.svgCheckCode())
  }
  // 以github style 为主要搭配的模板
  async github () {
    let ctx = this.ctx;
    let data = await ctx.service.markdown.baseSupport('app/lib/md/mark.md');
    await ctx.render('github.tpl', {data});
  }
  // 以vuepress为原型
  async vuepress () {
    let ctx = this.ctx;
    let data = await ctx.service.markdown.vuepressSupport('app/lib/md/mark.md')
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
}

module.exports = SupportController;