const { Service } = require('egg')
// 加密框架
const bcrypt = require('bcrypt')
// 所需使用盐值
const saltRounds = 10
// user表
const USER_TABLE = 'user_list'
// service
class UserService extends Service {
  // 新增用户
  async createUser () {
    // get params
    let { ctx, app } = this
    // 获取用户名、密码
    let { password, username } = ctx.request.body
    // 生成创建时间
    let create_time = ctx.helper.moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    // bcrypt加密过程
    return await bcrypt.hash(password, saltRounds).then(async (hash) => {
      return await app.mysql.insert(USER_TABLE, {
        hash,
        username,
        create_time
      }) 
    }).catch((err) => {
      return console.log(err)
    })
  }
  // 用户登录
  async userLogin () {
    // get params
    let { ctx, app } = this
    // 获取用户名、密码
    let { password, username } = ctx.request.body
    // 数据库查询
    let query = await app.mysql.get(USER_TABLE, { username })
    console.log(query)
    // bcrypt解密过程
    return await bcrypt.compare(password, query.hash).then((res) => {
      return res
    })
  }
}

module.exports = UserService