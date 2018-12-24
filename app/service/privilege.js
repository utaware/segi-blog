/*
 * @Description: 用户权限相关service
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 09:49:48
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-24 18:19:15
 */

const Service = require('egg').Service;
// service
class RoleService extends Service {
  // 查找所有的职位类型
  async getAll (query = {}) {

    const { ctx, app } = this

    return await app.model.Privilege.findAll(query).then((r) => {
      return r
    }).catch((err) => {
      return ctx.throw(500, ctx.log(err.sqlMessage))
    })
  }
  // 查询一条
  async query (info) {

    const { ctx, app } = this

    return await app.model.Privilege.findOne(info).then((r) => {
      return r
    }).catch((err) => {
      return ctx.throw(500, ctx.log(err.sqlMessage))
    })
  }
  // 新增一条
  async create (info) {

    const { ctx, app } = this

    return await app.model.Privilege.create(info).then((r) => {
      return r
    }).catch((err) => {
      return ctx.throw(500, ctx.log(err.sqlMessage))
    })
  }
  // 删除一条
  async remove (condition) {

    const { ctx, app } = this

    return await app.model.Privilege.remove(condition).then((r) => {
      return r
    }).catch((err) => {
      return ctx.throw(500, ctx.log(err.sqlMessage))
    })
  }
  // 更新单条
  async update (info, condition) {

    const { ctx, app } = this

    return await app.model.Privilege.update(info, condition).then((r) => {
      return r
    }).catch((err) => {
      return ctx.throw(500, ctx.log(err.sqlMessage))
    })
  }
}

module.exports = RoleService;
