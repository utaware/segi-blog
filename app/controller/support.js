const Controller = require('egg').Controller;       
// 附属功能支持控制器
class SupportController extends Controller {
  // 生成验证码 => svg路径 和 验证字符串
  async checkCode () {
    let code = await this.ctx.service.support.svgCheckCode()
    // this.ctx.body = Object.assign({ code: 200 }, code)
    this.ctx.end(true, code)
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
  // js-yaml page test
  async yaml () {
    let ctx = this.ctx
    let data = await ctx.service.support.parse('app/lib/md/yaml.md')
    await ctx.render('yaml.tpl', {data})
  }
}

module.exports = SupportController;