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
  // 发送邮件功能
  async sendEmail () {
    // ctx
    let { ctx } = this
    // 发送邮箱地址 email
    let { email } = ctx.request.body
    // 生成验证码
    let { data, text } = await this.ctx.service.support.svgCheckCode()
    let config = {
      to: email,
      html: `<h3 title="${text}">您的验证码为</h3>${data}`,
      subject: 'segi_blog'
    }
    // 发送邮件
    let send = await ctx.service.email.send(config)
    // 邮件创建
    let create_time = ctx.helper.moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    // 保存至数据库格式
    let format = {
      messageId: send.messageId,
      sender: send.envelope.from,
      receiver: send.envelope.to,
      text,
      create_time
    }
    // 插入结果
    return ctx.end(await ctx.service.email.insert(format))
  }
}

module.exports = SupportController;