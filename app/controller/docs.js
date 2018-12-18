const Controller = require('egg').Controller;       
// 文档相关
class DocsController extends Controller {
  // 上传文档 => md
  async upload () {
    // ctx
    const { ctx } = this
    // user_id 用户id
    const { user_id } = ctx.state.user
    // docs file对象 path, type, size, name
    const { path, type, size, name } = ctx.request.files.docs
    // 读取文档内容
    const content_md = await ctx.service.file.readFile(path)
    // 头文件解析
    const parse = await ctx.service.support.fileHeader(content_md)
    // 头信息
    const file_header = parse.isEmpty ? '' : parse.data
    // 转换到md
    const { html } = await ctx.service.support.vuepress(content_md)
    // 正则结构匹配
    const reg = {
      group: /<(h[1-6]).*?>[\s\S]*?<\/\1>/gim,
      tag: /<(h[1-6]).*?>.*?<\/\1>/gi,
      title: /<[\s\S]*?>/gi,
      href: /<.*?id="(.*?)".*>/gi
    }
    // html 匹配 hgroup 分组(match无匹配时会是null)
    const matchGroup = html.match(reg.group) || []
    // 确定文本结构
    const filter_text = matchGroup.map((v) => {
      let o = {}
      o.tag = v.replace(reg.tag, '$1'),
      o.title = v.replace(reg.title, '').replace(/\W\s/, '')
      o.href = v.replace(reg.href, '$1')
      return o
    })
    // 数据库存储
    const create_time = ctx.helper.moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    let info = {
      user_id,
      path,
      name,
      size,
      content_md,
      content_html: html,
      filter_text: JSON.stringify(filter_text),
      create_time,
      title: '内容标题',
      file_header: JSON.stringify(file_header)
    }
    // database
    let result = await ctx.service.docs.increase(info)
    // res
    return ctx.end(result)
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