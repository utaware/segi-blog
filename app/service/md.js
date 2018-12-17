// module
const { Service } = require('egg')
const { base } = require('./utils/baseRender')
// vuepress about
const vuepress = require('../markdown/index')
const slugify = (s) => encodeURIComponent(String(s).trim().toLowerCase().replace(/\s+/g, '-'))

// service
class MdService extends Service {
  // 将md => html
  async baseSupport (md) {
    return await base(md)
  }
  // vuepress相关样式支持
  async vuepressSupport (md) {
    return vuepress({slugify}).render(md)
  }
}

module.exports = MdService