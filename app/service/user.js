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
  async register () {
    // get params
    let { ctx, app } = this
    // 获取用户名、密码
    let { password, username } = ctx.request.body
    // 检查用户名是否存在
    let usable = await app.mysql.get(USER_TABLE, {
      username
    })
    // null(不存在) 数组(存在)
    if (usable) {
      return ctx.mergeRes('用户名不存在', 1)
    }
    // 生成创建时间
    let create_time = ctx.helper.moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    // bcrypt加密过程
    return await bcrypt.hash(password, saltRounds).then(async (hash) => {
      let query = await app.mysql.insert(USER_TABLE, {
        hash,
        username,
        create_time
      });
      return query ? { 
        code: ctx.SUCCESS_CODE,
        message: '注册成功',
        data: null 
      } : { 
        code: ctx.FAIL_CODE,
        message: '注册失败',
        data: null
      }
    }).catch((err) => {
      console.log(err)
      return { code: ctx.FAIL_CODE, message: '查询错误', data: null }
    })
  }

  // 用户登录
  async login () {
    // get params
    let { ctx, app } = this
    // 获取用户名、密码
    let { password, username } = ctx.request.body
    // 数据库查询
    let query = await app.mysql.get(USER_TABLE, { username })
    // bcrypt解密过程
    return await bcrypt.compare(password, query.hash).then((result) => {
      // 验证结果
      return result
    })
  }
}

module.exports = UserService