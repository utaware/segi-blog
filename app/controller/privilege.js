/*
 * @Description: 用户权限相关操作
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-18 11:44:14
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-25 10:37:41
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

    const { ctx } = this

    try {
      const list = await ctx.service.privilege.getAll({
        attributes: ['id', 'type', 'remark', 'level']
      })
      return ctx.end(true, { list })
    } catch (err) {
      return ctx.end(false, {err})
    }
  }

  /**
   * @description 新增权限类型 post
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async create () {

    const { ctx } = this

    const { type, remark, level } = ctx.request.body

    const info = { type, remark, level }

    try {
      const result = await ctx.service.privilege.create(info)
      return ctx.end(true, {result})
    } catch (err) {
      return ctx.end(false, {err})
    }
  }
  
  /** 删除职位类型 delete
   * @description
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async destroy () {

    const { ctx } = this

    const { id } = ctx.params

    try {
      const result = await ctx.service.privilege.destroy({ where: {id} })
      return ctx.end(true, {result})
    } catch (err) {
      return ctx.end(false, {err})
    }
  }

  /**
   * @description 更改职位类型 put
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

   async update () {

    const { ctx } = this

    const { id } = ctx.params

    const { type, remark, level } = ctx.request.body

    const info = { type, remark, level }

    try {
      const result = await ctx.service.privilege.update(info, {where: {id}})
      return ctx.end(true, {result})
    } catch (err) {
      return ctx.end(false, {err})
    }
  }

  /**
   * @description 查询单个岗位 get /:id
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

   async show () {

    const { ctx } = this

    const { id } = ctx.params

    ctx.log(id)

    try {
      const result = await ctx.service.privilege.query({ where: {id}})
      return ctx.end(true, {result})
    } catch (err) {
      return ctx.end(false, {err})
    }
  }

  /**
   * @description
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */
  async recovery () {
    
    const { ctx } = this

    const { id } = ctx.params

    try {
      const result = await ctx.service.privilege.recovery({ where: {id}})
      return ctx.end(true, {result})
    } catch (err) {
      return ctx.end(false, {err})
    }
  }
}

module.exports = PrivilegeController;