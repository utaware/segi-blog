// module
const Service = require('egg').Service
const matther = require('gray-matter')
const { readFile } = require('./utils/file')
const svg = require('svg-captcha')
// 不涉及数据库的一些额外功能
class SupportService extends Service {
  // 头文件解析
  async parse (path) {
    let text = await readFile(path)
    return matther(text)
  }
  // 生成svg验证码
  async svgCheckCode () {
    return svg.create({
      size: 4,
      ignoreChars: '0o1i',
      noise: 1,
      color: true,
      background: '#fff'
    })
  }
}

module.exports = SupportService