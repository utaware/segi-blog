const { Service } = require('egg')
const { readFile } = require('./utils/file')
const { render } = require('./utils/render')

class MdService extends Service {
  // 将md => html
  async marked (path) {
    let md = await readFile(path)
    console.log(md)
    let html = render(md)
    return html
  }
}

module.exports = MdService