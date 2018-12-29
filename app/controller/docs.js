/*
 * @Description: 文档内容相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-04 18:08:56
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-29 10:39:26
 */

const Controller = require('egg').Controller;       
// 文档相关
class DocsController extends Controller {

  // 文档操作管理

  async upload () {

    const { ctx } = this
    const { user_id } = ctx.state.user
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
 
  /**
   * @description 新增文档 post
   * @author utaware
   * @date 2018-12-27
   * @returns 
   */

  async create () {

    const { ctx, app } = this
    const { user_id, username } = ctx.state.user
    const { type, editor, title, md, html } = ctx.request.body

    try {
      const result = await app.model.Docs.create({user_id, type, editor, title, md, html, author: username})
      return ctx.end(true, '新增文档成功', {result})
    } catch (err) {
      return ctx.end(false, '新增文档失败', {err})
    }
  }

  /**
   * @description 查询文档 get
   * @author utaware
   * @date 2018-12-27
   * @returns 
   */

  async index () {

    const { ctx, app } = this
    let { pageNo = 1, pageSize = 15 } = ctx.request.query

    pageNo = Number(pageNo)
    pageSize = Number(pageSize)

    try {
      const Sql = app.Sequelize
      let [ pagination ] = await app.model.Docs.findAll({
        attributes: [[Sql.fn('COUNT', Sql.col('id')), 'totalCount']]
      })
      const result = await app.model.Docs.findAll({
        attributes: ['id', 'title', 'editor', 'md', 'html', 'comment', 'created_at', 'author',
          [Sql.col('d.remark'), 'type'], [Sql.col('d.value'), 'value'], [Sql.col('d.name'), 'name']],
        include: [
          {
            model: app.model.DocsType,
            as: 't',
            attributes: []
          }
        ]
      })
      pagination = Object.assign(pagination.get({plain: true}), {pageNo, pageSize})
      return ctx.end(true, '文档查询成功', {result, pagination})
    } catch (err) {
      return ctx.end(false, '文档查询失败', {err})
    }
  }

  /**
   * @description 查看单个文档内容
   * @author utaware
   * @date 2018-12-27
   * @returns 
   */

   async show () {

    const { ctx, app } = this
    const { id } = ctx.params
    
    try {
      const Sql = app.Sequelize
      const result = await app.model.Docs.findOne({
        attributes: ['id', 'title', 'editor', 'md', 'html', 'comment', 'created_at', 'author',
          [Sql.col('d.remark'), 'type'], [Sql.col('d.value'), 'value'], [Sql.col('d.name'), 'name']],
        include: [
          {
            model: app.model.DocsType,
            as: 'd',
            attributes: []
          }
        ],
        where: {id}
      })
      return ctx.end(true, '文档查询成功', {result})
    } catch (err) {
      return ctx.end(false, '文档查询失败', {err})
    }
  }

  /**
   * @description 编辑文档 put
   * @author utaware
   * @date 2018-12-28
   * @returns 
   */

  async update () {
    
    const { ctx, app } = this
    const { id } = ctx.params
    const { user_id, username } = ctx.state.user
    const { type, editor, title, md, html } = ctx.request.body

    try {
      const result = await app.model.Docs.update(
        {user_id, type, editor, title, md, html, author: username},
        {where: {id}})
      return ctx.end(true, '编辑文档成功', {result})
    } catch (err) {
      return ctx.end(false, '编辑文档失败', {err})
    }
  }

  /**
   * @description 删除文档 delete
   * @author utaware
   * @date 2018-12-28
   * @returns 
   */

  async destroy () {

    const { ctx, app } = this
    const { id } = ctx.params

    try {
      const result = await app.model.Docs.destroy({where: {id}})
      return ctx.end(true, '删除文档成功', {result})
    } catch (err) {
      return ctx.end(false, '删除文档失败', {err})
    }
  }
  
  /**
   * @description 恢复软删除的文档 put
   * @author utaware
   * @date 2018-12-28
   * @returns 
   */

  async recovery () {

    const { ctx, app } = this
    const { id } = ctx.params

    try {
      const result = await app.model.Docs.restore({where: {id}})
      return ctx.end(true, '恢复文档成功', {result})
    } catch (err) {
      return ctx.end(false, '恢复文档失败', {err})
    }
  }
}

module.exports = DocsController;