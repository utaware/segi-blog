/*
 * @Description: 用户角色(岗位)相关操作
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-18 11:44:14
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-18 18:32:25
 */

// egg-controller
const { Controller } = require('egg')
// controller
class RoleController extends Controller {
  // 获取所有职位类型 get
  async index () {
    // ctx
    const { ctx } = this
    // select
    const result = await ctx.service.role.getAll()
    // res
    return ctx.end({ result })
  }
  // 新增职位类型 post
  async create () {
    // ctx
    const { ctx } = this
    // body
    const { type, remark, group } = ctx.request.body
    // create_time
    const create_time = ctx.helper.moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    const info = {
      type,
      remark,
      group,
      create_time
    }
    return ctx.end(await ctx.service.role.insert(info))
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

module.exports = RoleController;