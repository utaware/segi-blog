/*
 * @Description: 用户功能相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-11-26 14:07:48
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-20 18:39:28
 */
// module
const Controller = require('egg').Controller
// contoller
class UserController extends Controller {

  /**
   * @description 用户注册 post
   * @author utaware
   * @date 2018-12-19
   * @returns 
   */

  async register () {
    
    const { ctx, app } = this
    // 获取用户名、邮箱、密码
    const { password, username, email } = ctx.request.body
    // 校验
    try {
      ctx.validate(app.validator.main.register, { password, username, email })
    } catch (err) {
      return ctx.end(false, '参数校验未通过', {err})
    }
    // 检查用户名是否存在
    const usable = await app.model.User.findAll({
      where: { 
        $or: [ { username }, { email } ]
      }
    })
    // 判断是否已存在
    if (usable.length) {
      return ctx.end(false, '用户名或邮箱已存在')
    }
    // bcrypt加密过程
    let hash = await ctx.service.bcrypt.hash(password)
    // 存储加密hash和用户信息
    try {
      const result = await app.model.User.create({ username, hash, email })
      const { user_id } = result
      await app.model.Info.create({ user_id, alias: username })
    } catch (err) {
      return ctx.end(false, '用户信息创建失败', {err})
    }
    // res
    return ctx.end(true)
  }

  /**
   * @description 用户登陆
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

  async login () {

    const { ctx, app } = this
    // 获取用户名、密码
    const { username, password, mode } = ctx.request.body
    // 校验
    try {
      ctx.validate(app.validator.main.loginMode, { mode })
      const rule = mode === 'username' ? app.validator.main.loginUsername : app.validator.main.loginEmail
      ctx.validate(rule, { [mode]: username, password })
    } catch (err) {
      return ctx.end(false, '参数校验未通过', {err})
    }
    // 数据库查询
    const query = await app.model.User.findOne({
      where: { [mode]: username }
    })
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
    const token = ctx.service.jwt.encrypt(content, {expiresIn: '7d'})
    // 更新登录时间
    const login_time = ctx.helper.now()
    // 更新信息
    await app.model.User.update({ login_time }, { where: {user_id} })
    // 返回结果
    return ctx.end(true, '登录成功', { token })
  }

  /**
   * @description 用户密码修改 put
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

  async modify () {

    const { ctx, app } = this
    // jwt 中获取user_id
    const { user_id } = ctx.state.user
    // 修改的密码
    const { password } = ctx.request.body
    // 校验
    try {
      ctx.validate(app.validator.main.modify, { password })
    } catch (err) {
      return ctx.end(false, '密码格式校验不符', {err})
    }
    // 查询
    const userQuery = await app.model.User.findOne({ where: { user_id } })
    // 查询结果
    if (!userQuery) {
      ctx.end(false, '未查找到改用户相关信息')
    }
    // 对比原密码
    const compare = await ctx.service.bcrypt.compare(password, userQuery.hash)
    if (compare) {
      return ctx.end(false, '新密码不能与原密码相同')
    }
    // bcrypt加密过程
    let hash = await ctx.service.bcrypt.hash(password)
    // 更新hash
    try {
      await app.model.User.update({ hash }, { where: { user_id } })
    } catch (err) {
      return ctx.end(false, '密码修改失败', {err})
    }
    return ctx.end(true, '密码修改成功')
  }
  
  /**
   * @description 忘记密码 post
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

  async forget () {

    const { ctx, app } = this
    // 通过邮箱找回密码
    const { email, code, password } = ctx.request.body
    // 参数校验
    try {
      ctx.validate(app.validator.main.forget, { email, code, password })
    } catch (err) {
      ctx.log(err)
      return ctx.end(false, '参数校验未通过', {err})
    }
    // 查找该邮箱是否有注册的账户
    const userQuery = await app.model.User.findOne({ where: { email } })

    if (!userQuery) {
      return ctx.end(false, '此邮箱未被用户绑定')
    }
    // 邮箱查询出对应的发送得最早的邮件 => 过期的时间条件增加
    const emailQuery = await app.model.Email.findOne({ 
      where: { receiver: email },
      order: [['created_at', 'DESC']],
      attributes: ['id', 'code', 'receiver', 'sender']
    })
    // 确认邮箱记录中存在发送记录
    if (!emailQuery) {
      return ctx.end(false, '请先发送邮箱验证码')
    }
    // 对比
    if (code !== emailQuery.code) {
      return ctx.end(false, '邮箱验证码错误')
    }
    // 使用新密码重置
    let hash = await ctx.service.bcrypt.hash(password)
    // 存储加密hash和用户信息
    try {
      await app.model.User.update({ hash }, { where: { email } })
    } catch (err) {
      return ctx.end(false, '密码重置失败', {err})
    }
    // res
    return ctx.end(true, '密码重置成功')
  }

  /**
   * @description 换绑邮箱
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

  async bindEmail () {

    const { ctx, app } = this
    // jwt 中获取user_id
    const { user_id } = ctx.state.user
    // 获取email
    const { email } = ctx.request.body
    // 校验邮箱
    try {
      ctx.validate(app.validator.main.email, email)
    } catch (err) {
      return ctx.end(false, '邮箱格式校验未通过', {err})
    }
    // 查询
    const userQuery = await app.model.User.findOne({ where: { email } })

    if (userQuery) {
      return ctx.end(false, '该邮箱已被其他用户绑定')
    }
    // 更新相关数据
    const result = await app.model.User.update({ email }, { where: { user_id } })
    // res
    return ctx.end(true, '邮箱换绑成功', {result})
  }

  // 设置头像
  async avatar () {

    let { ctx } = this
    // 上传成功获得文件对象
    const files = ctx.request.files
    // 重新分类调整位置
    const result = await ctx.service.upload.files(files.avatar)
    // res
    return ctx.end(result)
  }

  /**
   * @description 获取所有用户信息
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

   async getAll () {

    const { ctx, app } = this
    // 获取查询的数量和偏移量
    const { pageNo = 1, pageSize = 10 } = ctx.request.body
    // body
    try {
      // 用户清单
      let user_list = await app.model.User.findAll({
        attributes: ['user_id', 'username', 'email', 'privilege', 'role', 'created_at', 'login_time'],
        orders: [['created_at', 'desc']],
        limit: pageSize,
        offset: pageSize * (pageNo - 1)
      })
      // 权限清单
      let privilege_list = await app.model.Privilege.findAll({
        attributes: ['id', 'privilege', 'remark', 'level']
      })
      // 角色清单
      let role_list = await app.model.Role.findAll({
        attributes: ['id', 'type', 'remark', 'group']
      })
      // 数据填充
      const result = user_list.map((v) => {
        let { privilege, role } = v
        const pl = privilege_list.filter(p => p.id === privilege)[0]
        const rl = role_list.filter(r => r.id === role)[0]
        v.privilege = pl.privilege
        v.role = rl.type
        // 增加属性
        v.dataValues.remark_privilege = pl.remark
        v.dataValues.remark_role = rl.remark
        v.dataValues.level = pl.level
        return v
      })
      return ctx.end({ result })
    } catch (err) {
      return ctx.end(false, '数据获取错误', {err})
    }
    // https://blog.csdn.net/qq_30101131/article/details/79474905
  }
}

module.exports = UserController;