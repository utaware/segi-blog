/*
 * @Description: 用户角色(岗位)相关操作
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-18 11:44:14
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-28 16:29:12
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

    const { ctx, app } = this
    
    try {
      const result = await app.model.Role.findAll({
        attributes: ['id', 'type', 'remark', 'group']
      })
      return ctx.end(true, '查询角色成功', { result })
    } catch (err) {
      return ctx.end(false, '查询角色失败', {err})
    }
  }

  /**
   * @description 新增职位类型 post
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async create () {

    const { ctx, app } = this
    const { type, remark, group } = ctx.request.body

    try {
      const result = await app.model.Role.create({ type, remark, group })
      return ctx.end(true, '新增角色成功', {result})
    } catch (err) {
      return ctx.end(false, '新增角色失败', {err})
    }
  }

  /**
   * @description 删除职位类型 delete
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async destroy () {
    
    const { ctx, app } = this
    const { id } = ctx.params

    try {
      const result = await app.model.Role.destroy({ where: { id }})
      return ctx.end(true, '删除角色成功', {result}) 
    } catch (err) {
      return ctx.end(false, '删除角色失败', {err})
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
    const { type, remark, group } = ctx.request.body
    
    try {
      const result = await app.model.Role.update({ type, remark, group }, { where: {id} })
      return ctx.end(true, '更新角色成功', {result})
    } catch (err) {
      return ctx.end(false, '更新角色失败', {err})
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
      const result = await app.model.Role.findOne({ where: { id }})
      return ctx.end(true, '查询角色成功', {result}) 
    } catch (err) {
      return ctx.end(false, '查询角色失败', {err})
    }
  }

  /**
   * @description 软删除恢复 get
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async recovery () {

    const { ctx, app } = this
    const { id } = ctx.params

    try {
      const result = await app.model.Role.restore({ where: { id }})
      return ctx.end(true, '恢复角色成功', {result}) 
    } catch (err) {
      return ctx.end(false, '恢复角色失败', {err})
    }
  }
}

module.exports = RoleController;