/*
 * @Description: yoghurt角色分组
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2019-01-31 16:08:40
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-31 17:14:46
 */

const { Controller } = require('egg')

class RoleGroupController extends Controller {

  // 添加角色分组 post

  async create () {

    const { ctx, app } = this

    const { group_remark } = ctx.request.body

    try {

      await app.model.RoleGroup.create({group_remark})

      return ctx.end(true, '新增角色分组成功')

    } catch (err) {

      ctx.log(err)

      return ctx.end(false, '新增角色分组失败', err)

    }

  }

  // 获取角色分组列表 get

  async index () {
    
    const { ctx, app } = this

    try {
      
      const result = await app.model.RoleGroup.findAll({attributes: ['group_id', 'group_remark']})

      return ctx.end(true, '查询角色分组列表成功', result)

    } catch (err) {

      return ctx.end(false, '查询角色分组列表失败', err)

    }

  }

  // 修改角色分组列表 put

  async update () {

    const { ctx, app } = this

    const { group_remark, group_id } = ctx.request.body

    try {

      const result = await app.model.RoleGroup.update({group_remark}, {where: {group_id}})

      return ctx.end(true, '修改角色分组列表成功', result)

    } catch (err) {

      return ctx.end(false, '修改角色分组列表失败', err)

    }

  }

  // 删除角色分组列表 delete

  async destroy () {

    const { ctx, app } = this

    const { group_id } = ctx.request.body

    try {

      await app.model.RoleGroup.destroy({where: {group_id}, force: true})

      return ctx.end(true, '删除角色分组列表成功')

    } catch (err) {

      return ctx.end(false, '删除角色分组列表失败', err)

    }

  }

}

module.exports = RoleGroupController;