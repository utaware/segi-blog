const { Service } = require('egg')
// user表
const USER_TABLE = 'user_list'
// service
class UserService extends Service {
  // 查询用户
  async find (info) {
    return await this.app.mysql.get(USER_TABLE, info)
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
    return await this.app.mysql.insert(USER_TABLE, info)
  }
}

module.exports = UserService