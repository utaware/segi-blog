 /*
 * @Description: 管理相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2019-01-21 15:56:41
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-25 17:39:59
 */

const Controller = require('egg').Controller;

class AdminController extends Controller {

  /**
   * @description 获取所有用户信息 get
   * @author utaware
   * @date 2018-12-20
   * @returns 
   */

  async getAll () {

    const { ctx, app } = this

    const { pageNo = 1, pageSize = 10 } = ctx.request.body

    const { no, size, offset, limit } = ctx.pageFormat({pageNo, pageSize})

    // 校验
    try {

      ctx.validate(app.validator.schema('page'), {no, size})
    
    } catch (err) {
    
      return ctx.end(false, '参数校验未通过', err)
    
    }

    // 整合查询
    try {
      
      const Seq = app.Sequelize
      
      const result = await app.model.User.findAll({
        // 字段
        attributes: [
          'user_id', 'name', 'email', 'created_at', 'login_time', 'role_id', 'privilege_id', 'deleted_at',
          [Seq.col('r.type'), 'role_type'], [Seq.col('r.remark'), 'role_remark'], Seq.col('r.group'),
          [Seq.col('p.type'), 'privilege_type'], [Seq.col('p.remark'), 'privilege_remark'], Seq.col('p.level'),
        ],
        include: [
          { model: app.model.Role, as: 'r', attributes: [] },
          { model: app.model.Privilege, as: 'p', attributes: [] }
        ],
        raw: true, 
        nest: false,
        orders: [['user_id', 'desc']],
        paranoid: false,
        limit,
        offset
      })

      return ctx.end({result})
    
    } catch (err) {
    
      return ctx.end(false, '查询错误', err)
    
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

    const handler = ctx.state.user.privilege
    
    const { name, password, email, privilege_id, role_id } = ctx.request.body
    
    // 检查该用户是否有新增用户的权限

    try {
      
      ctx.validate(app.validator.schema(['name', 'password', 'email', 'privilege_id', 'role_id']), { name, password, email, privilege_id, role_id })
    
    } catch (err) {

      return ctx.end(false, '参数校验未同构', err)

    }
      
    if (!handler.create_member) { return ctx.end(false, '无权限新增用户') }
    
    const creater = await app.model.Privilege.findById(privilege_id)

    if (handler.level <= creater.level) { return ctx.end(false, '用户权限不足') }
    
    // 检查用户名和邮箱是否已存在 -- 防止重复
    try {
      
      const usable = await app.model.User.findAll({ where: { $or: [ { email }, { name } ] } })
      
      if (usable.length) { return ctx.end(false, '邮箱或者用户名已被注册') }
    
    } catch (err) {
      
      return ctx.end(false, '查询失败', err)
    
    }

    try {
      
      await app.model.User.create({ name, hash: password, email, privilege_id, role_id })
      
      return ctx.end(true, '创建用户成功')
    
    } catch (err) {
      
      return ctx.end(false, '创建用户失败', err)
    
    }
  
  }
  
  /**
   * @description 账户注销 delete 软删除
   * @author utaware
   * @date 2018-12-21
   * @returns 
   */

  async cancellation () {

    const { ctx, app } = this

    const handler = ctx.state.user.privilege
    
    const { user_id } = ctx.request.body

    // 权限
    try {

      const user = await app.model.User.findById(user_id)

      if (!user) { return ctx.end(false, '用户不存在') }

      const account = await app.model.Privilege.findById(user.privilege_id)
      
      if (!handler.remove_member) { return ctx.end(false, '无权删除用户') }

      if (handler.level <= account.level) { return ctx.end(false, '无足够的权限')}
    
    } catch (err) {
    
      return ctx.end(false, '权限查询出错', err)
    
    }

    // 作废

    try {
      
      const result = await app.model.User.destroy({ where: {user_id}, individualHooks: true })
      
      return ctx.end(true, '账户注销成功', result)
    
    } catch (err) {
    
      return ctx.end(false, '账户注销失败', err)
    
    }

  }

  /**
   * @description 用户账户恢复 put
   * @author utaware
   * @date 2018-12-21
   * @returns 
   */

  async recovery () {
    
    const { ctx, app } = this

    const handler = ctx.state.user.privilege
    
    const { user_id } = ctx.request.body

    // 是否有恢复账户的权限
    
    try {
      
      const user = await app.model.User.findOne({where: {user_id}})

      if (!user) { return ctx.end(false, '操作用户不存在') }

      const account = await app.model.Privilege.findOne({ where: {id: user.privilege_id} })

      if (!handler.update_member) { return ctx.end(false, '您无权修改用户信息') }

      if (handler.level <= account.level) { return ctx.end(false, '权限不足') }
    
    } catch (err) {
    
      return ctx.end(false, '权限查询失败', err)
    
    }

    // 恢复账户
    try {
      
      await app.model.User.restore({ where: {user_id}, individualHooks: true })
      
      return ctx.end(true, '用户信息恢复成功')
    
    } catch (err) {
      
      return ctx.end(false, '用户信息恢复失败', err)      
    
    }
  
  }

}

module.exports = AdminController;