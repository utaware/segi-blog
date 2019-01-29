/*
 * @Description: 附属功能支持
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-11-20 15:47:49
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-29 11:48:05
 */

// https://segmentfault.com/q/1010000010862121
 
const { Controller } = require('egg')

const fs = require('fs-extra')

class SupportController extends Controller {

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
  
  // 发送验证码
  async sendCheckCode () {
    
    const { ctx, app } = this
    const Sql = app.Sequelize

    const { email } = ctx.request.body

    try {

      ctx.validate(app.validator.schema('email'), email)

    } catch (err) {

      return ctx.end(false, '邮箱格式校验未通过', err)

    }

    // 查询邮箱是否已被使用
    const isExist = await app.model.User.findOne({ where: {email} })

    // if (isExist) { return ctx.end(false, '邮箱已经被注册') }

    // 查询最近发送邮件时间, 放置连续发送
    const hasSend = await app.model.Email.findOne({ 
      where: { $and: [ {receiver: email }, Sql.where(Sql.fn('DATE_SUB', Sql.fn('NOW'), Sql.literal('INTERVAL 1 MINUTE')), '<=', Sql.col('created_at')) ] }
    })

    if (hasSend) { return ctx.end(false, '邮件已发送, 1分钟内请勿多次操作') }

    const sendTotal = await app.model.Email.findAndCount({
      where: { $and: [ {receiver: email }, Sql.where(Sql.fn('DATE_SUB', Sql.fn('NOW'), Sql.literal('INTERVAL 1 DAY')), '<=', Sql.col('created_at')) ] }
    })

    if (sendTotal.count >= 5) { return ctx.end(false, '当日邮件发送已超过5封') }

    const { data, text } = await ctx.service.support.svgCheckCode()
    
    // 邮件格式
    const config = {
      to: email,
      html: `<h3 title="${text}">您的验证码为</h3>${data}`,
      subject: '四格互联文档库注册'
    }

    // 插入结果
    try {
      
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

      await app.model.Email.create(emailInfo)
      
      return ctx.end(true, '邮件发送成功')
    
    } catch (err) {
    
      return ctx.end(false, '邮件发送失败', err)
    
    }
  
  }

}

module.exports = SupportController;