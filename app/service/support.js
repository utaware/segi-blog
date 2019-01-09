/*
 * @Description: 额外附属功能的一些扩展支持
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-11-13 09:21:52
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-09 10:46:02
 */

// egg-service
const Service = require('egg').Service
// module
const matther = require('gray-matter')
const svg = require('svg-captcha')
const { base } = require('./utils/baseRender')
// vuepress about
const vuepress = require('../markdown/index')
const slugify = (s) => encodeURIComponent(String(s).trim().toLowerCase().replace(/\s+/g, '-'))

// Service
class SupportService extends Service {
  // baseRender for markdown
  async baseMd (md) {
    return base(md)
  }
  // vuepress style content
  async vuepress (md) {
    return vuepress({slugify}).render(md)
  }
  // 头文件解析
  async fileHeader (text) {
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