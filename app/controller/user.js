// module
const Controller = require('egg').Controller
// validate rules
const rule = {
  username: 'string',
  password: 'string'
}
// contoller
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
    let { ctx } = this
    // 获取用户名、密码
    let { password, username, email, type } = ctx.request.body
    // 字段校验
    let condition = type ? 'username' : 'email'
    username = type ? username : email
    // 校验待修改
    try {
      ctx.validate('string', [password, email, username])
    } catch (err) {
      return ctx.end(false, '用户名或密码校验未通过')
    }
    // 数据库查询
    let query
    try {
      query = await ctx.service.user.find({ [condition]: username })
    } catch (err) {
      return ctx.end(false, err.message)
    }
    // 检验用户信息是否获取
    if (!query) {
      return ctx.end(false, '用户信息不存在')
    }
    // 密码是否正确
    let result = await ctx.service.bcrypt.compare(password, query.hash)
    // 解密是否成功的结果
    const { user_id } = query
    // jwt 主体
    const content = { username, user_id}
    // jwt token
    const token = ctx.service.jwt.encrypt(content, {expiresIn: '1d'})
    // 返回结果
    result ? ctx.end(true, '登录成功', { token }) : ctx.end(false, '密码错误')
  }

  // 修改密码 post
  async modify () {
    let {ctx} = this
    ctx.body = 'modify'
  }
  
  // 忘记密码 post
  async forget () {
    let {ctx} = this
    ctx.body = 'forget'
  }

  // 绑定邮箱
  async email () {
    // ctx
    let { ctx } = this
    // jwt 中获取user_id
    let { user_id } = ctx.service.jwt.decrypt()
    // 获取email
    let { email } = ctx.request.body
    // 查询
    let query = await ctx.service.user.find({ user_id })
    if (!query) {
      ctx.end(false, '未查找到改用户相关信息')
    }
    // 更新相关数据
    let result = await ctx.service.user.update({ user_id, email })
    // res
    return ctx.end(result)
  }

  // 设置头像
  async avatar () {
    let { ctx } = this
    // 上传成功获得文件对象
    const files = ctx.request.files
    // 重新分类调整位置
    const result = await ctx.service.upload.files(files.avatar)
    ctx.end(result)
  }
}

module.exports = UserController;