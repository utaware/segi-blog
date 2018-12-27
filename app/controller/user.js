/*
 * @Description: 用户功能相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-11-26 14:07:48
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-27 10:25:26
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
    const { password, username, email } = ctx.request.body

    // 校验
    try {
      ctx.validate(app.validator.main(['username', 'password', 'email']),{ password, username, email })
    } catch (err) {
      return ctx.end(false, '参数校验未通过', {err})
    }

    // 检查用户名是否存在
    try {
      const usable = await app.model.User.findAll({
        where: { 
          $or: [ { email }, { username } ]
        }
      })
      if (usable.length) {
        return ctx.end(false, '用户名或邮箱已存在')
      }
    } catch (err) {
      return ctx.end(false, '用户查询错误', {err})
    }

    // 存储加密hash和用户信息
    try {
      const hash = await ctx.service.bcrypt.hash(password)
      await app.model.User.create({ username, hash, email })
      return ctx.end(true, '用户信息创建成功')
    } catch (err) {
      return ctx.end(false, '用户信息创建失败', {err})
    }
  }

  /**
   * @description 用户登陆
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

  async login () {

    const { ctx, app } = this
    const { username, password, mode } = ctx.request.body

    // 校验
    try {
      ctx.validate(app.validator.main(['mode']), { mode })
      ctx.validate(app.validator.main(['password'].concat(mode)), { [mode]: username, password })
    } catch (err) {
      return ctx.end(false, '参数校验未通过', {err})
    }

    // 用户是否存在
    let query
    try {
      query = await app.model.User.findOne({
        where: { [mode]: username }
      })
      if (!query) {
        return ctx.end(false, '用户信息不存在')
      }
    } catch (err) {
      return ctx.end(false, '用户信息查询出错', {err})
    }

    // 密码是否正确
    const result = await ctx.service.bcrypt.compare(password, query.hash)
    if (!result) {
      return ctx.end(false, '密码错误')
    }

    const { user_id, role, privilege } = query
    const content = { username, user_id, privilege, role }
    const token = ctx.service.jwt.encrypt(content, {expiresIn: '7d'})
    const login_time = ctx.helper.now()

    try {
      await app.model.User.update({ login_time }, { where: {user_id} })
      return ctx.end(true, '登录成功', { token })
    } catch (err) {
      return ctx.end(false, '登陆时间更新失败', {err})
    }
  }

  /**
   * @description 用户密码修改 put
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

  async modify () {

    const { ctx, app } = this
    const { user_id } = ctx.state.user
    const { oldPass, newPass } = ctx.request.body

    try {
      ctx.validate(app.validator.main(['password']), { password: oldPass })
    } catch (err) {
      return ctx.end(false, '原密码格式校验不符', {err})
    }

    // 验证旧密码是否正确
    try {
      const find_user = await app.model.User.findOne({where: {user_id}})
      const hash = find_user.hash
      const result = await ctx.service.bcrypt.compare(oldPass, hash)
      if (!find_user) {
        return ctx.end(false, '用户不存在')
      }
      if (!result) {
        return ctx.end(false, '原密码错误')
      }
    } catch (err) {
      return ctx.end(false, '用户查询错误')
    }

    try {
      ctx.validate(app.validator.main(['password']), { password: newPass })
    } catch (err) {
      return ctx.end(false, '新密码格式校验不符', {err})
    }

    if (oldPass === newPass) {
      return ctx.end(false, '新密码不能与原密码相同')
    }

    try {
      const hash = await ctx.service.bcrypt.hash(newPass)
      await app.model.User.update({ hash }, { where: { user_id } })
      return ctx.end(true, '密码修改成功')
    } catch (err) {
      return ctx.end(false, '密码修改失败', {err})
    }
  }
  
  /**
   * @description 忘记密码 post
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

  async forget () {

    const { ctx, app } = this
    const { email, checkCode, password } = ctx.request.body

    // 参数校验
    try {
      ctx.validate(app.validator.main(['email', 'checkCode', 'password']), { email, checkCode, password })
    } catch (err) {
      return ctx.end(false, '参数校验未通过', {err})
    }

    // 查找该邮箱是否有注册的账户
    try {
      const find_user = await app.model.User.findOne({ where: { email } })
      if (!find_user) {
        return ctx.end(false, '此邮箱未被用户绑定')
      }
    } catch (err) {
      return ctx.end(false, '用户查询失败', {err})
    }

    // 邮箱查询出对应的发送得最早的邮件 => 过期的时间条件增加
    let find_email
    try {
      find_email = await app.model.Email.findOne({ 
        where: { receiver: email },
        order: [['created_at', 'DESC']],
        attributes: ['id', 'code', 'receiver', 'sender']
      })
    } catch (err) {
      return ctx.end(false, '邮件查询失败', {err})
    }

    // 确认邮箱记录中存在发送记录
    if (!find_email) {
      return ctx.end(false, '请先发送邮箱验证码')
    }
    // 对比
    if (code !== find_email.code) {
      return ctx.end(false, '邮箱验证码错误')
    }

    // 存储加密hash和用户信息
    try {
      const hash = await ctx.service.bcrypt.hash(password)
      await app.model.User.update({ hash }, { where: { email } })
      return ctx.end(true, '密码重置成功')
    } catch (err) {
      return ctx.end(false, '密码重置失败', {err})
    }
  }

  /**
   * @description 换绑邮箱
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

  async bindEmail () {

    const { ctx, app } = this
    const { user_id } = ctx.state.user
    const { email } = ctx.request.body
    
    // 校验邮箱
    try {
      ctx.validate(app.validator.main(['email']), email)
    } catch (err) {
      return ctx.end(false, '邮箱格式校验未通过', {err})
    }

    // 查询
    try {
      const find_user = await app.model.User.findOne({ where: { email } })
      if (find_user) {
        return ctx.end(false, '该邮箱已被其他用户绑定')
      }
    } catch (err) {
      return ctx.end(false, '用户查询失败', {err})
    }

    // 更新相关数据
    try {
      await app.model.User.update({ email }, { where: { user_id } })
      return ctx.end(true, '邮箱换绑成功')
    } catch (err) {
      return ctx.end(false, '邮箱更新失败', {err})
    }
  }

  // 设置头像
  async avatar () {

    const { ctx } = this
    const files = ctx.request.files
    const result = await ctx.service.upload.files(files.avatar)
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
    const { pageNo = 1, pageSize = 10 } = ctx.request.body

    // 整合查询
    try {
      const Seq = app.Sequelize
      const result = await app.model.User.findAll({
        // 字段
        attributes: [
          'user_id', 'username', 'email', 'created_at', 'login_time', 'role', 'privilege', 'deleted_at',
          [Seq.col('r.type'), 'role_type'], [Seq.col('r.remark'), 'role_remark'], Seq.col('r.group'),
          [Seq.col('p.type'), 'privilege_type'], [Seq.col('p.remark'), 'privilege_remark'], Seq.col('p.level'),
        ],
        // 嵌套
        include: [
          { 
            model: app.model.Role,
            as: 'r',
            attributes: []
          },
          {
            model: app.model.Privilege,
            as: 'p',
            attributes: []
          }
        ],
        // 数据格式化
        raw: true, 
        // 对象层级关系转换
        nest: false,
        orders: [['created_at', 'desc']],
        paranoid: false,
        limit: pageSize,
        offset: pageSize * (pageNo - 1)
      })
      return ctx.end({result})
    } catch (err) {
      return ctx.end(false, '查询错误', {err})
    }
  }
  
  /**
   * @description 账户注销 delete 软删除
   * @author utaware
   * @date 2018-12-21
   * @returns 
   */
  // 作废
  async cancellation () {

    const { ctx, app } = this
    const { privilege } = ctx.state.user
    const { user_id } = ctx.request.body

    // 查询该用户是否存在
    let queryUser
    try {
      queryUser = await app.model.User.findById(user_id)
      if (!queryUser) {
        return ctx.end(false, '用户不存在')
      }
    } catch (err) {
      return ctx.end(false, '用户查询错误', {err})
    }

    // 查询权限是否可以移除用户
    try {
      const result = await app.model.Privilege.findById(privilege)
      if (!result.remove_member) {
        return ctx.end(false, '无权删除用户')
      }
      if (privilege <= queryUser.privilege) {
        return ctx.end(false, '无足够的权限')
      }
    } catch (err) {
      return ctx.end(false, '权限查询出错', {err})
    }

    // 删除用户
    try {
      const result = await app.model.User.destroy({
        where: {user_id}
      })
      return ctx.end(true, '账户注销成功', {result})
    } catch (err) {
      return ctx.end(false, '账户注销失败', {err})
    }

  }

  /**
   * @description 用户账户恢复
   * @author utaware
   * @date 2018-12-21
   * @returns 
   */

  async recovery () {
    
    const { ctx, app } = this
    const { privilege } = ctx.state.user
    const { user_id } = ctx.request.body

    // 是否有恢复账户的权限
    try {
      const result = await app.model.Privilege.findOne({
        where: { id: privilege },
        plain: true
      })
      if (!result.update_member) {
        return ctx.end(false, '您无权修改用户信息')
      }
    } catch (err) {
      return ctx.end(false, '权限查询失败', {err})
    }

    // 账户是否可恢复
    try {
      const user = await app.model.User.findOne({
        paranoid: false,
        where: {
          $and: [ {user_id}, {deleted_at: {$ne: null}} ]
        }
      })
      if (!user) {
        return ctx.end(false, '用户不存在或者信息错误')
      }
    } catch (err) {
      return ctx.end(false, '用户信息查询失败', {err})
    }

    // 恢复账户
    try {
      const result = await app.model.User.restore({
        where: {user_id}
      })
      return ctx.end(true, '用户信息恢复成功')
    } catch (err) {
      return ctx.end(false, '用户信息恢复失败', {err})      
    }
  }

  /**
   * @description 获取角色相关列表和权限相关列表信息 get
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async getList () {

    const { ctx } = this

    try {
      const privilegeList = await ctx.service.privilege.getAll({
        attributes: ['id', 'type', 'remark', 'level']
      })
      const roleList = await ctx.service.role.getAll({
        attributes: ['id', 'type', 'remark', 'group']
      })
      return ctx.end(true, {roleList, privilegeList})
    } catch (err) {
      return ctx.end(false, {err})
    }
  }

  /**
   * @description 管理员新增用户
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async increase () {

    const { ctx, app } = this
    const current_user = ctx.state.user
    
    // 检查该用户是否有新增用户的权限
    try {
      const result = await app.model.Privilege.findById(current_user.privilege)
      if (!result.create_member) {
        return ctx.end(false, '无权限新增用户')
      }
    } catch (err) {
      return ctx.end(false, '权限查询失败', {err})
    }

    const { username, password, email, privilege, role } = ctx.request.body

    if (current_user.privilege <= privilege) {
      return ctx.end(false, '用户权限不足')
    }
    // 检查用户名和邮箱是否已存在 -- 防止重复
    try {
      const usable = await app.model.User.findAll({
        where: { 
          $or: [ { email }, { username } ]
        }
      })
      if (usable.length) {
        return ctx.end(false, '邮箱或者用户名已被注册')
      }
    } catch (err) {
      return ctx.end(false, '查询失败', {err})
    }
    // 1. 加密密码
    // 2. 新增用户
    try {
      const hash = await ctx.service.bcrypt.hash(password)
      await app.model.User.create({username, hash, email, privilege, role})
      return ctx.end(true, '用户添加成功')
    } catch (err) {
      return ctx.end(false, '加密或者创建用户失败', {err})
    }
  }

}

module.exports = UserController;