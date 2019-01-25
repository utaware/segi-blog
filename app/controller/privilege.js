/*
 * @Description: 用户权限相关操作
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-18 11:44:14
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-03 16:26:13
 */

// egg-controller
const { Controller } = require('egg')

class PrivilegeController extends Controller {
  
  /**
   * @description 查询所有权限信息 get
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async index () {

    const { ctx, app } = this

    try {
      const result = await app.model.Privilege.findAll()
      return ctx.end(true, '权限查询成功', { result })
    } catch (err) {
      return ctx.end(false, '权限查询失败', err)
    }
  }

  /**
   * @description 新增权限类型 post
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async create () {

    const { ctx, app } = this
    const { type, remark, level } = ctx.request.body
    const info = { type, remark, level }

    try {
      const result = await app.model.Privilege.create(info)
      return ctx.end(true, '权限新增成功', {result})
    } catch (err) {
      return ctx.end(false, '权限新增失败', err)
    }
  }
  
  /** 删除职位类型 delete
   * @description
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async destroy () {

    const { ctx, app } = this
    const { id } = ctx.params

    try {
      const result = await app.model.Privilege.destroy({ where: {id} })
      return ctx.end(true, '权限删除成功', {result})
    } catch (err) {
      return ctx.end(false, '权限删除失败', err)
    }
  }

  /**
   * @description 更改职位类型 put
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

   async update () {

    const { ctx, app } = this
    const { id } = ctx.params
    const { type, remark, level } = ctx.request.body
    const info = { type, remark, level }

    try {
      const result = await app.model.Privilege.update(info, {where: {id}})
      return ctx.end(true, '权限更新成功', {result})
    } catch (err) {
      return ctx.end(false, '权限更新失败', err)
    }
  }

  /**
   * @description 查询单个岗位 get /:id
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

   async show () {

    const { ctx, app } = this
    const { id } = ctx.params

    try {
      const result = await app.model.Privilege.findOne({ where: {id}})
      return ctx.end(true, '权限查询成功', {result})
    } catch (err) {
      return ctx.end(false, '权限查询失败', err)
    }
  }

  /**
   * @description 软删除恢复 put
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async recovery () {
    
    const { ctx, app } = this
    const { id } = ctx.request.body

    try {
      const result = await app.model.Privilege.restore({ where: {id}})
      return ctx.end(true, '权限恢复成功', {result})
    } catch (err) {
      return ctx.end(false, '权限恢复失败', err)
    }
  }

}

module.exports = PrivilegeController;