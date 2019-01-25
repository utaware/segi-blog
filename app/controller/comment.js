 /*
 * @Description: 文章评论相关功能
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2019-01-21 15:56:41
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-25 17:45:55
 */

const { Controller } = require('egg')

class CommentController extends Controller {

  // 查询所有评论评论 get
  async index () {

    const { ctx, app } = this

    const { pageNo = 1, pageSize = 10, docs_id } = ctx.request.query
    
    const { limit, offset, no, size } = ctx.pageFormat({pageNo, pageSize})

    // 参数校验
    try {
  
      ctx.validate(app.validator.schema(['page', 'docs_id']), {page: {no, size}, docs_id})
  
    } catch (err) {
  
      return ctx.end(false, '参数校验未通过', err)
  
    }

    // 查询
    try {
      
      const result = await app.model.Comment.findAndCount({ 
        limit, offset, where: {docs_id},
        attributes: ['id', 'user_name', 'replier_name', 'floor', 'content', 'created_at'] 
      })
      
      return ctx.end(false, '查询所有评论成功', result)
    
    } catch (err) {
    
      return ctx.end(false, '查询所有评论失败', err)
    
    }

  }

  // 新增评论 post
  async create () {

    const { ctx, app } = this

    const { docs_id, replier_name, content } = ctx.request.body
    
    const { user_id, name } = ctx.state.user

    // 校验
    try {
      
      ctx.validate(app.validator.schema(['id', 'name', 'content']), { docs_id, name: replier_name, content})
    
    } catch (err) {
    
      return ctx.end(false, '参数校验未通过', err)
    
    }

    // 新增评论
    try {
    
      const find = await app.model.User.findOne({where: {name: replier_name}})
    
      const replier_id = find.user_id
    
      const floor = await app.model.Comment.currentfloor(docs_id)
    
      const result = await app.model.Comment.create({docs_id, user_id, user_name: name, replier_id, replier_name, floor, content})
    
      const data = ctx.helper._.pick(result, ['id', 'user_name', 'replier_name', 'floor', 'content', 'created_at'])
    
      return ctx.end(true, '新增评论成功', data)
    
    } catch (err) {
    
      return ctx.end(false, '新增评论失败', err)
    
    }

  }

  // 删除评论 delete
  async destroy () {

    const { ctx, app } = this
    
    const { user_id } = ctx.state.user
    
    const { id } = ctx.request.body

    // 校验
    try {
    
      ctx.validate(app.validator.schema('id'), id)
    
    } catch (err) {
    
      return ctx.end(false, '参数校验未通过', err)
    
    }

    // 删除
    try {

      const find = await app.model.Comment.findById(id)

      if (find.user_id !== user_id) { return ctx.end(false, '非评论人操作') }
     
      await app.model.Comment.destroy({where: {id}})
     
      return ctx.end(true, '删除评论成功')
    
    } catch (err) {

      return ctx.end(false, '评论删除失败', err)

    }

  }

}

module.exports = CommentController;