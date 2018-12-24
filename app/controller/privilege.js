/*
 * @Description: 用户权限相关操作
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-18 11:44:14
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-24 18:18:36
 */

// egg-controller
const { Controller } = require('egg')

class PrivilegeController extends Controller {
  // 查询所有权限信息 get
  async index () {

    const { ctx } = this

    const list = await ctx.service.privilege.getAll({
      attributes: ['id', 'type', 'remark', 'level']
    })

    return ctx.end({ list })
  }
  // 新增职位类型 post
  async create () {

    const { ctx } = this

    const { type, remark, group } = ctx.request.body

    const info = {
      type,
      remark,
      group
    }

    try {
      await ctx.service.privilege.create({info})
      return ctx.end(true, '权限添加成功')
    } catch (err) {
      ctx.log(err)
      return ctx.end(false, '查询错误', {err})
    }
  }
  // 删除职位类型 delete
  async destroy () {
    // ctx
    const { ctx } = this
    // body
    const { id } = ctx.params
    // database
    return ctx.end(await ctx.service.role.remove({ id }))
  }
  // 更改职位类型 put
  async update () {
    // ctx
    const { ctx } = this
    // id
    const { id } = ctx.params
    // body
    const data = ctx.request.body
    // update_time
    const update_time = ctx.helper.moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    // update
    let info = {
      ...data,
      update_time
    }
    // database
    return ctx.end(await ctx.service.role.update(info, id))
  }
  // 查询单个岗位 get /:id
  async show () {
    // ctx
    const { ctx } = this
    // query
    const { id } = ctx.params
    // database
    const query = await ctx.service.role.query({ id })
    // res
    return ctx.end({ query })
  }
}

module.exports = PrivilegeController;