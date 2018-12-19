'use strict';

const Controller = require('egg').Controller;       

class HomeController extends Controller {
  // index
  async index () {
    // ctx
    const { ctx, app } = this
    let result = await app.model.Role.findAll()
    return ctx.end({result});
  }
  // 以github style 为主要搭配的模板
  async github () {
    let ctx = this.ctx;
    let data = await ctx.service.markdown.baseSupport('app/lib/md/mark.md');
    await ctx.render('github.tpl', {data});
  }
  // 以vuepress为原型
  async vuepress () {
    let ctx = this.ctx;
    let data = await ctx.service.markdown.vuepressSupport('app/lib/md/mark.md')
    await ctx.render('vuepress.tpl', {data})
  }
}

module.exports = HomeController;