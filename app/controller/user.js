// Controller
const Controller = require('egg').Controller
// 包含的功能：用户注册, 登录, 修改密码, 忘记密码
class UserController extends Controller {

  // 新增用户 post
  async register () {
    // get params
    let { ctx } = this
    // 获取用户名、密码
    // 暂不对邮箱登录作区分
    let { password, username } = ctx.request.body
    // 检查用户名是否存在
    let usable = await ctx.service.user.find({ username })
    // null(不存在) 数组(存在)
    if (usable) {
      return ctx.end(0, '用户名已存在')
    }
    // bcrypt加密过程
    let hash = await ctx.service.bcrypt.hash(password)
    // 存储加密hash和用户信息
    let query = await ctx.service.user.insert(username, hash)
    // res
    ctx.end(!!query)
  }

  // 用户登录 post
  async login () {
    // get params
    let { ctx, app } = this
    // 获取用户名、密码
    let { password, username } = ctx.request.body
    // 数据库查询
    let query = await ctx.service.user.find({ username })
    // 用户名是否存在
    if (!query) {
      return ctx.end(0, '用户名不存在')
    }
    // 密码是否正确
    let result = await ctx.service.bcrypt.compare(password, query.hash)
    // 解密是否成功的结果
    const { user_id } = query
    // jwt 主体
    const content = { username, user_id}
    // jwt token
    const token = `Bearer ${app.jwt.sign(content, app.config.jwt.secret, {expiresIn: '24h'})}`
    // ctx.cookies.set('token', token, {maxAge:60*1000, httpOnly:false, overwrite:true, signed:false})
    // 返回结果
    result ? ctx.end(1, '登录成功', { token }) : ctx.end(0, '密码错误')
  }

  // 修改密码 post
  async modify () {
    ctx.body = 'modify'
  }
  
  // 忘记密码 post
  async forget () {
    ctx.body = 'forget'
  }
}

module.exports = UserController;