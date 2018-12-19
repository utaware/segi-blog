// module
const Controller = require('egg').Controller
// validate rules
const rule = {
  username: 'string',
  password: 'string',
  mode: ['username', 'email']
}
// contoller
class UserController extends Controller {

  /**
   * @description 用户注册 post
   * @author utaware
   * @date 2018-12-19
   * @returns 
   */

  async register () {
    // get params
    let { ctx, app } = this
    // 获取用户名、密码
    // 暂不对邮箱登录作区分
    let { password, username, email } = ctx.request.body
    // 检查用户名是否存在
    // let usable = await ctx.service.user.find({ username })
    let usable = await app.model.User.findAll({
      where: { 
        $or: [ { username }, { email } ]
      }
    })
    ctx.log(usable)
    // null(不存在) 数组(存在)
    if (usable) {
      return ctx.end(false, '用户名已存在')
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
    let { username, password, mode } = ctx.request.body
    // 校验待修改
    try {
      ctx.validate(rule, ctx.request.body)
    } catch (err) {
      return ctx.end(false, '用户名或密码校验未通过')
    }
    // 数据库查询
    let query
    try {
      query = await ctx.service.user.find({ [mode]: username })
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
    if (!result) {
      return ctx.end(false, '密码错误')
    }
    const { user_id, role, privilege } = query
    // jwt 主体
    const content = { username, user_id, privilege, role }
    // jwt token
    const token = ctx.service.jwt.encrypt(content, {expiresIn: '1d'})
    // 更新登录时间
    let login_time = ctx.helper.moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    await ctx.service.user.update({ login_time }, { username }, false)
    // 返回结果
    return ctx.end(true, '登录成功', { token })
  }

  // 修改密码 post
  async modify () {
    // 修改密码
    let {ctx} = this
    // jwt 中获取user_id
    ctx.log(ctx.state.user)
    let { user_id } = ctx.service.jwt.decrypt()
    // 修改的密码
    let { password } = ctx.request.body
    // 查询
    let query = await ctx.service.user.find({ user_id })
    if (!query) {
      ctx.end(false, '未查找到改用户相关信息')
    }
    // 对比原密码
    let result = await ctx.service.bcrypt.compare(password, query.hash)
    if (result) {
      return ctx.end(false, '新密码不能与原密码相同')
    }
    // bcrypt加密过程
    let hash = await ctx.service.bcrypt.hash(password)
    // 更新hash
    try {
      let result = await ctx.service.user.update({ hash }, { user_id })
      return ctx.end(result)
    } catch (err) {
      return ctx.end(false, '密码修改失败')
    }
  }
  
  // 忘记密码 post
  async forget () {
    // ctx
    let { ctx } = this
    // 通过邮箱找回密码
    let { email, code, password } = ctx.request.body
    let queryUser = await ctx.service.user.find({ email })
    if (!queryUser) {
      return ctx.end(false, '此邮箱未被用户绑定')
    }
    // 邮箱查询出对应的发送得最早的邮件 => 过期的时间条件增加
    let queryEmail = await ctx.service.email.query({ receiver: email })
    // 确认邮箱记录中存在发送记录
    let [ info ] = queryEmail
    if (!info) {
      return ctx.end(false, '请先发送邮箱验证码')
    }
    // 对比
    if (code !== info.text) {
      return ctx.end(false, '邮箱验证码错误')
    }
    // 使用新密码重置
    let hash = await ctx.service.bcrypt.hash(password)
    // 存储加密hash和用户信息
    let update = await ctx.service.user.update({ hash }, { email })
    // res
    return ctx.end(update)
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
    let result = await ctx.service.user.update({ email }, { user_id })
    // res
    return ctx.end(result)
  }

  // 设置头像
  async avatar () {
    // ctx
    let { ctx } = this
    // 上传成功获得文件对象
    const files = ctx.request.files
    // 重新分类调整位置
    const result = await ctx.service.upload.files(files.avatar)
    // res
    return ctx.end(result)
  }
  // 获取所有用户信息
  async getAll () {
    // ctx
    const { ctx } = this
    // 获取查询的数量和偏移量
    const { pageNo, pageSize } = ctx.request.body
    // body
    const info = {
      columns: ['user_id', 'username', 'email', 'privilege', 'role', 'create_time', 'login_time'],
      orders: [['create_time', 'desc']],
      limit: pageSize,
      offset: pageSize * pageNo
    }
    // database
    let result = await ctx.service.user.getAll(info)
    // res
    return ctx.end({ result })
  }
}

module.exports = UserController;