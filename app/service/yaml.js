const Service = require('egg').Service
const matther = require('gray-matter')
const { readFile } = require('./utils/file')

class YamlService extends Service {
  async parse (path) {
    let text = await readFile(path)
    return matther(text)
  }
}

module.exports = YamlService