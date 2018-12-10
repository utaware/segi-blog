// email https://nodemailer.com/message/
const nodemailer = require('nodemailer')
// 创建实例
const transporter = nodemailer.createTransport({
  // host: '192.168.1.111',
  service: 'qq',
  port: 465, // 端口
  sercure: true, // 是否使用TLS，true，端口为465，否则其他或者568
  auth: {
    // 邮箱
    user: '1175272135@qq.com',
    // stmp授权码
    pass: 'pknrkirfmgtdjbcg'
  }
})

// 发送邮件配置
const mail = {
  // from: 发件人的电子邮件地址
  from: '1175272135@qq.com',
  // to: 收件人电子邮件地址数组
  to: '1264051408@qq.com',
  // subject: 电子邮件的主题
  subject: 'utaware_blog',
  // html: 作为Unicode字符串，Buffer，Stream或类似附件的对象的消息的HTML版本
  html: `<h3>hello world</h3>`
  // text: 消息的纯文本版本
  // cc: 抄送
  // bcc: 秘密抄送
  // attachments: 附件  
}

module.exports = { 
  send: (config) => {
    // 合并配置
    config = Object.assign({}, mail, config)
    // promise封装
    return new Promise((resolve, reject) => {
      transporter.sendMail(config, (err, info) => {
        if (err) {
          reject(err)
        }
        resolve(info)
      })
    })
  }
}
