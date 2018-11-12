'use strict';

const Controller = require('egg').Controller;       

class HomeController extends Controller {
  async index() {
    let ctx = this.ctx
    let data = await ctx.service.md.marked('app/lib/md/mark.md')
    this.ctx.body = data;
  }
}

module.exports = HomeController;