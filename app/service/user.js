const { Service } = require('egg')

const USER_TABLE = 'user_list'
// service
class UserService extends Service {
  // 查询用户
  async find (info) {
    return await this.app.mysql.get(USER_TABLE, info).catch((err) => {
      return this.ctx.throw(500, err.sqlMessage)
    })
  }
  // 新增用户
  async insert (username, hash) {
    // 生成创建时间
    let create_time = this.ctx.helper.moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    let info = {
      username,
      hash,
      create_time
    }
    return await this.app.mysql.insert(USER_TABLE, info).then((r) => {
      return r.affectedRows === 1
    }).catch((err) => {
      return this.ctx.throw(500, err.sqlMessage)
    })
  }
  // 更新信息
  async update (info) {
    let { ctx } = this
    let { user_id, email } = info
    let update_time = ctx.helper.moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    let row = {
      update_time,
      email
    }
    return await this.app.mysql.update(USER_TABLE, row, {
      where: {user_id}
    }).then((r) => {
      return r.affectedRows === 1
    }).catch((err) => {
      return ctx.throw(500, err.sqlMessage)
    })
  }
}

module.exports = UserService