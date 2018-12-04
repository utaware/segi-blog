const { Service } = require('egg')
// 加密框架
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
// 所需使用盐值
const saltRounds = 10
// user表
const USER_TABLE = 'user_list'
const SECRET = 'sign_text'
// service
class UserService extends Service {
  // 新增用户
  async register () {
    // get params
    let { ctx, app } = this
    // 获取用户名、密码
    // 暂不对邮箱登录作区分
    let { password, username } = ctx.request.body
    // 检查用户名是否存在
    let usable = await app.mysql.get(USER_TABLE, { username })
    // null(不存在) 数组(存在)
    if (usable) {
      return ctx.mergeRes(0, '用户名已存在')
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
      return query ? ctx.mergeRes(1, '注册成功') : ctx.mergeRes(0, '注册失败')
    }).catch((err) => {
      ctx.log(err)
      return ctx.mergeRes(0, '加密过程中出现错误')
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
    // 用户名是否存在
    if (!query) {
      return ctx.mergeRes(0, '用户名不存在')
    }
    // bcrypt解密过程
    let result = await bcrypt.compare(password, query.hash).then((check) => {
      // 验证结果
      return check
    }).catch((err) => {
      ctx.log(err)
      return ctx.mergeRes(0, '解密过程中出现错误')
    })
    // 解密是否成功的结果
    const { user_id } = query
    const header = {
      username,
      user_id
    }
    const token = jwt.sign(header, SECRET, {expiresIn: '24h'})
    // ctx.cookies.set('token', token, {maxAge:60*1000, httpOnly:false, overwrite:true, signed:false})
    // 返回结果
    return result ? ctx.mergeRes(1, '登录成功', { token }) : ctx.mergeRes(0, '密码错误')
  }

  // 修改密码
  async modify () {
    // get params
    let { ctx, app } = this
    // 暂定
    return ctx.mergeRes(1, '修改密码')
  }

  // 忘记密码
  async forget () {
    // get params
    let { ctx, app } = this
    // 暂定
    return ctx.mergeRes(1, '忘记密码')
  }
}

module.exports = UserService