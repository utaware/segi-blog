/*
 * @Description: 用户功能相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-11-26 14:07:48
 * @LastEditors: utaware
 * @LastEditTime: 2019-03-13 15:50:41
 */

const { Controller } = require('egg')

class UserController extends Controller {

  /**
   * @description 用户注册 post
   * @author utaware
   * @date 2018-12-19
   * @returns 
   */

  // 用户注册 -- 用户名, 密码, 验证码, 邮箱 
  async register () {
    
    const { ctx, app } = this
    
    const { password, name, email, checkCode } = ctx.request.body

    // 参数校验
    try {
    
      ctx.paramsCheck('user.register', { password, name, email, checkCode })
    
    } catch (err) {

      return ctx.end(false, '参数校验未通过', err)
    
    }

    // 查询验证码邮件是否发送 -- 15分钟有效期
    try {
      
      const lastestSendEmail = await app.model.Email.findLastestEmail(email)
      
      // 1.超过15分钟失效 2.没有发送过 => 需要先发送邮件
      if (!lastestSendEmail) { 
        
        return ctx.end(false, '请先发送验证码')
      
      }
      
      // 验证码不匹配 => 错误
      if (lastestSendEmail.code !== checkCode) {
      
        return ctx.end(false, '验证码错误')
      
      }

    } catch (err) {

      return ctx.end(false, '邮件查询失败', err)

    }

    // 查看对应用户是否存在
    // 1. 存在 => 提示已存在相关用户
    // 2. 不存在 => 创建相关用户信息
    try {

      const isCreate = await app.model.User.findOrCreate({ where: { $or: [{email}, {name}]}, defaults: {name, hash: password, email} }).spread((u, i) => i)

      return isCreate ? ctx.end(true, '用户信息创建成功') : ctx.end(false, '用户名或邮箱已存在')

    } catch (err) {

      return ctx.end(false, '用户信息创建失败', err )

    }

  }

  /**
   * @description 用户登陆 post
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

  async login () {

    const { ctx, app } = this

    const { name, password } = ctx.request.body

    try {
     
      ctx.paramsCheck('user.login', {name, password})
    
    } catch (err) {
    
      return ctx.end(false, '参数校验未通过', err)
    
    }

    let userInfo = null

    try {
      
      userInfo = await app.model.User.findOne({ where: { name } })

      if (!userInfo) { 

        return ctx.end(false, '用户信息不存在') 
      
      }
    
    } catch (err) {
    
      return ctx.end(false, '用户信息查询出错', err)
    
    }
    
    const { role_id, privilege_id, email, user_id, hash } = userInfo

    // 密码是否正确
    const passwordIsCorrect = await ctx.service.bcrypt.compare(password, hash)

    if (!passwordIsCorrect) { 
      
      return ctx.end(false, '密码错误') 
    
    }

    // jwt token相关信息处理
    const filter = {attributes: {exclude: ['created_at', 'updated_at', 'deleted_at', 'user_id']}}
    
    const privilege = await app.model.Privilege.findById(privilege_id, filter)
    
    const role = await app.model.Role.findById(role_id, filter)
    
    const info = await app.model.Info.findById(user_id, filter)

    const login_time = ctx.helper.now()
    
    const content = { user_id, name, email, login_time, info, privilege, role }
    
    const token = ctx.service.jwt.encrypt(content, {expiresIn: '7d'})

    try {
    
      await app.model.User.update({ login_time }, { where: {user_id} })

      return ctx.end(true, '登录成功', {token, user: { name, email, login_time }, privilege, role, info})
    
    } catch (err) {
    
      return ctx.end(false, '登陆时间更新失败', err)
    }

  }

  /**
   * @description 用户密码修改 put => 登录情况下
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

  async modify () {

    const { ctx, app } = this

    const { user_id } = ctx.state.user

    const { oldPass, newPass } = ctx.request.body

    // 校验新旧密码格式

    try {
    
      ctx.paramsCheck('user.modify', { oldPass, newPass })
    
    } catch (err) {
    
      return ctx.end(false, '密码格式校验不符', err)
    
    }

    // 新旧密码比对

    if (oldPass === newPass) { return ctx.end(false, '新密码不能与原密码相同') }

    // 校验用户

    try {

      // 校验用户是否存在

      const user = await app.model.User.findOne({where: { user_id }})

      if (!user) { 
        
        return ctx.end(false, '用户不存在')
      
      }

      // 获取密码hash值和旧密码比对

      const { hash } = user

      const passwordIsCorrect = await ctx.service.bcrypt.compare(oldPass, hash)
      
      if (!passwordIsCorrect) { 
        
        return ctx.end(false, '原密码错误')
      
      }
    
    } catch (err) {
    
      return ctx.end(false, '密码修改错误', err)
    
    }

    // 讲新密码hash写入数据库

    try {
      
      await app.model.User.update({ hash: newPass }, { where: { user_id } })
    
      return ctx.end(true, '密码修改成功')
    
    } catch (err) {
    
      return ctx.end(false, '密码修改失败', err)
    
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
    
      ctx.paramsCheck('user.forget', { email, checkCode, password })
    
    } catch (err) {
    
      return ctx.end(false, '参数校验未通过', err)
    
    }

    // 查找该邮箱是否有注册的账户
    try {
      
      const userInfo = await app.model.User.findOne({ where: { email } })
      
      if (!userInfo) { 
        
        return ctx.end(false, '此邮箱未被用户绑定')
      
      }
    
    } catch (err) {
    
      return ctx.end(false, '用户查询失败', err)
    
    }

    // 邮件查询 --> 1. 是否有发送对应邮件 2. 验证码是否正确

    let lastestSendEmail

    try {
    
      lastestSendEmail = await app.model.Email.findLastestEmail(email)

      // 没有查到15分钟内丢应的邮件信息

      if (!lastestSendEmail) { 
        
        return ctx.end(false, '请先发送邮箱验证码') 
      
      }

      // 邮件验证码对比

      if (checkCode !== lastestSendEmail.code) { 
        
        return ctx.end(false, '邮箱验证码错误')
      
      }

    } catch (err) {
      
      return ctx.end(false, '请先发送验证码', err)
    
    }

    // 更新密码hash值 => 修改密码

    try {
      
      await app.model.User.update({ hash: password }, { where: { email } })
      
      return ctx.end(true, '密码重置成功')
    
    } catch (err) {
      
      return ctx.end(false, '密码重置失败', err)
    
    }
  
  }

  /**
   * @description 换绑邮箱 -- put
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

  async bindEmail () {

    const { ctx, app } = this

    const { user_id } = ctx.state.user
   
    const { email } = ctx.request.body

    // 参数校验
    
    try {

      ctx.paramsCheck('user.bindEmail', { email })
    
    } catch (err) {
    
      return ctx.end(false, '邮箱格式校验未通过', err)
    
    }

    // 查询邮箱是否已被绑定 => 邮箱地址唯一性

    try {

      const userInfo = await app.model.User.findOne({ where: { email } })
      
      if (userInfo) { 
        
        return ctx.end(false, '该邮箱已被其他用户绑定')
      
      }

    } catch (err) {
      
      return ctx.end(false, '用户查询失败', err)
    
    }

    // 更新用户信息

    try {
      
      await app.model.User.update({ email }, { where: { user_id } })
      
      return ctx.end(true, '邮箱换绑成功')
    
    } catch (err) {
    
      return ctx.end(false, '邮箱更新失败', err)
   
    }
  
  }

  /**
   * @description 获取角色相关列表和权限相关列表信息 get
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async getList () {

    const { ctx, app } = this

    try {
      
      const privilegeList = await app.model.Privilege.findAll({ attributes: ['id', 'type', 'remark', 'level'] })
      
      const roleList = await app.model.Role.findAll({ attributes: ['id', 'type', 'remark', 'group'] })
      
      return ctx.end(true, '获取角色权限列表成功', {roleList, privilegeList})
    
    } catch (err) {
    
      return ctx.end(false, '获取角色权限列表失败', err)
    
    }
  
  }

  /**
   * @description 获取概览信息 get
   * @author utaware
   * @date 2018-12-29
   * @returns 
   */
  
  async getBreifInfo () {

    const { ctx, app } = this

    try {

      // 七天内访问量
      const visit = [10, 52, 200, 334, 390, 330, 220]
      
      // 统计信息
      const total = await app.model.Total.findAll({
        attributes: ['category', 'total', 'remark']
      })
      
      // 最后登录信息
      const login = await app.model.User.findAll({
        attributes: ['name', 'login_time'],
        where: {
          login_time: { $ne: null }
        },
        order: [['login_time', 'desc']],
        limit: 10
      })
    
      return ctx.end({login, total, visit})
    
    } catch (err) {
    
      return ctx.end(false, err)
    
    }

  }

}

module.exports = UserController;