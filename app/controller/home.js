'use strict';

const Controller = require('egg').Controller;       

class HomeController extends Controller {
  // index
  async index () {
    await this.ctx.service.ppt.parse()
    this.ctx.body = '小草莓是笨蛋';
  }
  // 以github style 为主要搭配的模板
  async github () {
    let ctx = this.ctx;
    let data = await ctx.service.md.marked('app/lib/md/mark.md');
    await ctx.render('github.tpl', {data});
  }
  // 以vuepress为原型
  async vuepress () {
    let ctx = this.ctx;
    let data = await ctx.service.vuepress.marked('app/lib/md/mark.md')
    await ctx.render('vuepress.tpl', {data})
  }
  // js-yaml page test
  async yaml () {
    let ctx = this.ctx
    let data = await ctx.service.yaml.parse('app/lib/md/yaml.md')
    await ctx.render('yaml.tpl', {data})
  }
}

module.exports = HomeController;