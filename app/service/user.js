const { Service } = require('egg')

class UserService extends Service {
  // 新增用户
  async createUser () {
    // get params
    let { ctx, app } = this
    let { password, username } = ctx.request.body
    return await app.mysql.insert('user_list', { password, username })
  }
}

module.exports = UserService