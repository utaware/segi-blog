const Controller = require('egg').Controller;       
// 文档相关
class DocsController extends Controller {
  // 上传文档
  async upload () {
    // ctx
    const { ctx } = this
    // user_id 用户id
    const { user_id } = ctx.state.user
    // docs file对象
    const { path, type, size, name } = ctx.request.files.docs
    // docs content
    const content = await ctx.service.file.readFile(path)
    // translate to markdown
    const { html } = await ctx.service.support.vuepress(content)
    // 匹配title结构
    const reg = {
      group: /<(h[1-6]).*?>[\s\S]*?<\/\1>/gim,
      tag: /<(h[1-6]).*?>.*?<\/\1>/gi,
      title: /<[\s\S]*?>/gi,
      href: /<.*?id="(.*?)".*>/gi
    }
    // html 匹配 hgroup 分组(match无匹配时会是null)
    const matchGroup = html.match(reg.group) || []
    // 描写结构树
    const title = matchGroup.map((v) => {
      let o = {}
      o.tag = v.replace(reg.tag, '$1'),
      o.title = v.replace(reg.title, '').replace(/\W\s/, '')
      o.href = v.replace(reg.href, '$1')
      return o
    })
    // res
    return ctx.end(true, {title})
  }
  // 删除文档
  async remove () {
    // ctx
    const { ctx } = this
    // 获取文档id
    const { id } = ctx.request.body
    // 查询文章
    
  }
}

module.exports = DocsController;