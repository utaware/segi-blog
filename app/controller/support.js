/*
 * @Description: 附属功能支持
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-11-20 15:47:49
 * @LastEditors: utaware
 * @LastEditTime: 2019-03-09 17:25:00
 */

// https://segmentfault.com/q/1010000010862121
 
const { Controller } = require('egg')

const fs = require('fs-extra')

class SupportController extends Controller {

  // 发送验证码

  async sendCheckCode () {
    
    const { ctx, app } = this

    const { email } = ctx.request.body

    try {

      ctx.paramsCheck('support.email', email)

    } catch (err) {

      return ctx.end(false, '邮箱格式校验未通过', err)

    }

    // 查询邮箱是否已被使用
    const isExist = await app.model.User.findOne({ where: {email} })

    if (isExist) { 
      
      return ctx.end(false, '邮箱已经被注册') 
    
    }

    // 15分钟内不重复发送
    const sendEmailLastest = await app.model.Email.findLastestEmail(email)

    if (sendEmailLastest) { 
      
      return ctx.end(false, '验证码15分钟内有效, 请勿重复操作') 
    
    }

    // 发送次数统计
    const sendEmailCount = await app.model.Email.countSendEmailNumber(email)

    if (sendEmailCount >= 5) { 
      
      return ctx.end(false, '当日邮件发送已超过5封') 
    
    }

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