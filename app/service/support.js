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

module.exports = SupportService