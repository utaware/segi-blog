const Service = require('egg').Service
const matther = require('gray-matter')
const { readFile } = require('./utils/file')
const svg = require('svg-captcha')

class SupportService extends Service {
  // 头文件解析
  async parse (path) {
    let text = await readFile(path)
    return matther(text)
  }
  // 生成svg验证码
  async svgCheckCode () {
    return svg.create()
  }
}

// email
const nodemailer = require('nodemailer')

const transporter = nodemailer.createTransport({
  // host: '192.168.1.111',
  service: 'qq',
  port: 465, // 端口
  sercure: true, // 是否使用TLS，true，端口为465，否则其他或者568
  auth: {
    user: '1175272135@qq.com',
    pass: 'pknrkirfmgtdjbcg'
  }
})

let mail = {
  from: '1175272135@qq.com',
  to: '1264051408@qq.com',
  subject: 'utaware_blog',
  html: `<h3>hello world</h3>`
}

let sendEmail = (config) => {
  transporter.sendMail(config, (err, info) => {
    if (err) {
        return console.log(err)
    }
    console.log('send email success')
  })
}

module.exports = SupportService