// module
const Service = require('egg').Service;
// constant
const PRIVILEGE_TABLE = 'privilege_list'
// service
class RoleService extends Service {
  // 查找所有的职位类型
  async getAll () {
    // ctx
    const { ctx, app } = this
    // 查询数据库
    return await app.mysql.select(PRIVILEGE_TABLE).then((r) => {
      return r
    }).catch((err) => {
      return ctx.throw(500, ctx.log(err.sqlMessage))
    })
  }
  // 查询一条
  async query (info) {
    // ctx
    const { ctx, app } = this
    // database
    return await app.mysql.get(PRIVILEGE_TABLE, info).then((r) => {
      return r
    }).catch((err) => {
      return ctx.throw(500, ctx.log(err.sqlMessage))
    })
  }
  // 新增一条
  async insert (info) {
    // ctx
    const { ctx, app } = this
    // database
    return await app.mysql.insert(PRIVILEGE_TABLE, info).then((r) => {
      return r.affectedRows === 1
    }).catch((err) => {
      return ctx.throw(500, ctx.log(err.sqlMessage))
    })
  }
  // 删除一条
  async remove (condition) {
    // ctx
    const { ctx, app } = this
    // database
    return await app.mysql.delete(PRIVILEGE_TABLE, condition).then((r) => {
      return r.affectedRows === 1
    }).catch((err) => {
      return ctx.throw(500, ctx.log(err.sqlMessage))
    })
  }
  // 更新单条
  async update (info, id) {
    // ctx
    const { ctx, app } = this
    // database
    return await app.mysql.update(PRIVILEGE_TABLE, info, {
      where: { id }
    }).then((r) => {
      return r.affectedRows === 1
    }).catch((err) => {
      return ctx.throw(500, ctx.log(err.sqlMessage))
    })
  }
}

module.exports = RoleService;
