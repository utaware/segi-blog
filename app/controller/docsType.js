/*
 * @Description: 文档类型相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-27 14:18:40
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-27 14:37:29
 */

const Controller = require('egg').Controller;       
// 文档相关
class DocsTypeController extends Controller {

  /**
   * @description 新增文档类别信息 post
   * @author utaware
   * @date 2018-12-27
   * @returns 
   */

  async create () {

    const { ctx, app } = this
    const { value, name, remark } = ctx.request.body

    try {
      const result = await app.model.DocsType.create({value, name, remark})
      return ctx.end(true, '新增文档类别成功', {result})
    } catch (err) {
      ctx.log(Object.keys(app.model))
      return ctx.end(false, '新增文档类别失败', {err})
    }
  }

  /**
   * @description 删除文档类别信息 delete
   * @author utaware
   * @date 2018-12-27
   * @returns 
   */

  async destroy () {

    const { ctx, app } = this
    const { id } = ctx.params
    
    try {
      const result = await app.model.DocsType.destory({where: {id}})
      return ctx.end(true, '删除文档类别成功', {result})
    } catch (err) {
      ctx.log(Object.keys(app.model))
      return ctx.end(false, '删除文档类别失败', {err})
    }
  }

  /**
   * @description 查询所有文档类别信息 get
   * @author utaware
   * @date 2018-12-27
   * @returns 
   */

  async index () {

    const { ctx, app } = this
    
    try {
      const result = await app.model.DocsType.findAll({
        attributes: ['id', 'name', 'remark', 'value']
      })
      return ctx.end(true, '查询文档类别成功', {result})
    } catch (err) {
      return ctx.end(false, '查询文档类别失败', {err})
    }
  }

  /**
   * @description 更新单个文档类别信息 put
   * @author utaware
   * @date 2018-12-27
   * @returns 
   */

  async update () {

    const { ctx, app } = this
    const { id } = ctx.params
    const { value, name, remark } = ctx.request.body
    
    try {
      const result = await app.model.DocsType.update({value, name, remark}, {where: {id}})
      return ctx.end(true, '更新文档类别成功', {result})
    } catch (err) {
      return ctx.end(false, '更新文档类别失败', {err})
    }
  }

  /**
   * @description 查询单条信息 get
   * @author utaware
   * @date 2018-12-27
   * @returns 
   */

  async show () {

    const { ctx, app } = this
    const { id } = ctx.params
    
    try {
      const result = await app.model.DocsType.findOne({where: {id}})
      return ctx.end(true, '查询文档类别成功', {result})
    } catch (err) {
      return ctx.end(false, '查询文档类别失败', {err})
    }

  }
}

module.exports = DocsTypeController;