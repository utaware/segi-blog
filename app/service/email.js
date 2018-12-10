// module
const Service = require('egg').Service
const mailer = require('./utils/mailer')
// constant
const EMAIL_TABLE = 'email_list'
// service
class EmailService extends Service {
  // 发送邮件
  async send (content) {
    // ctx
    let { ctx } = this
    // 调用nodemailer配置的方法
    return await mailer.send(content).then((r) => {
      return r
    }).catch((err) => {
      return ctx.throw(500, '邮件发送错误')
    })
  }
  // 保存记录
  async insert (info) {
    // ctx
    let { ctx, app } = this
    // mysql
    return await app.mysql.insert(EMAIL_TABLE, info).then((r) => {
      return r.affectedRows === 1
    }).catch((err) => {
      ctx.log(err)
      return ctx.throw(500, '邮件信息存储失败')
    })
  }
  // 查询对应发送邮件信息
  async query (info) {
    // ctx
    let { app, ctx } = this
    // 查询
    return await app.mysql.select(EMAIL_TABLE, {
      where: info,
      orders: [['create_time', 'desc']],
      limit: 1
    }).then((r) => {
      return r
    }).catch((err) => {
      return ctx.throw(500, '邮件查询失败')
    })
  }
}

module.exports = EmailService