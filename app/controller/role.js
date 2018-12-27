/*
 * @Description: 用户角色(岗位)相关操作
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-18 11:44:14
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-25 11:07:17
 */

// egg-controller
const { Controller } = require('egg')

class RoleController extends Controller {

  /**
   * @description 查询所有职位信息 get
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async index () {

    const { ctx } = this
    
    try {
      const result = await ctx.service.role.getAll({
        attributes: ['id', 'type', 'remark', 'group']
      })
      return ctx.end(true, { result })
    } catch (err) {
      return ctx.end(false, {err})
    }
  }

  /**
   * @description 新增职位类型 post
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async create () {

    const { ctx } = this
    const { type, remark, group } = ctx.request.body

    try {
      const result = await ctx.service.role.create({ type, remark, group })
      return ctx.end(true, {result})
    } catch (err) {
      return ctx.end(false, {err})
    }
  }

  /**
   * @description 删除职位类型 delete
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async destroy () {
    
    const { ctx } = this
    const { id } = ctx.params

    try {
      const result = await ctx.service.role.destroy({ where: { id }})
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
    const { type, remark, group } = ctx.request.body
    
    try {
      const result = await ctx.service.role.update({ type, remark, group }, { where: {id} })
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

    try {
      const result = await ctx.service.role.query({ where: { id }})
      return ctx.end(true, {result}) 
    } catch (err) {
      return ctx.end(false, {err})
    }
  }

  /**
   * @description 软删除恢复 get
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async recovery () {

    const { ctx } = this

    const { id } = ctx.params

    try {
      const result = await ctx.service.role.recovery({ where: { id }})
      return ctx.end(true, {result}) 
    } catch (err) {
      return ctx.end(false, {err})
    }
  }
}

module.exports = RoleController;