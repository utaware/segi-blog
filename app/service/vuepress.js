'use strict';
const Service = require('egg').Service;
const { readFile } = require('./utils/file')
const md = require('../markdown/index')
const slugify = (s) => encodeURIComponent(String(s).trim().toLowerCase().replace(/\s+/g, '-'))

class VuepressService extends Service {
  async marked (path) {
    let data = await readFile(path)
    return md({slugify}).render(data)
  }
}

module.exports = VuepressService;
