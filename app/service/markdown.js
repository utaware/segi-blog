const { Service } = require('egg')
const { readFile } = require('./utils/file')
const { base } = require('./utils/render')
// vuepress about
const vuepress = require('../markdown/index')
const slugify = (s) => encodeURIComponent(String(s).trim().toLowerCase().replace(/\s+/g, '-'))

class MdService extends Service {
  // 将md => html
  async baseSupport (path) {
    let md = await readFile(path)
    let html = base(md)
    return html
  }
  // vuepress相关样式支持
  async vuepressSupport (path) {
    let data = await readFile(path)
    return vuepress({slugify}).render(data)
  }
}

module.exports = MdService