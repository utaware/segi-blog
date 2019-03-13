/*
 * @Description: 用户角色(岗位)相关操作
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-18 11:44:14
 * @LastEditors: utaware
 * @LastEditTime: 2019-02-01 15:12:50
 */

// egg-controller
const { Controller } = require('egg')

class RoleController extends Controller {

  /**
   * @description 查询所有职位信息 get
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async getAll () {

    const { ctx, app } = this

    const Sql = app.Sequelize
    
    try {

      const result = await app.model.Role.findAll({
        
        attributes: ['role_id', 'role_type', 'role_remark', 'group_id', [Sql.col('rg.group_remark'), 'group_remark']],
        
        include: { model: app.model.RoleGroup, as: 'rg', attributes: [] }

      })
     
      return ctx.end(true, '查询角色成功', result )
    
    } catch (err) {

      return ctx.end(false, '查询角色失败', err)
   
    }
  
  }

  /**
   * @description 新增职位类型 post
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async create () {

    const { ctx, app } = this
    
    const { role_type, role_remark, group_id } = ctx.request.body

    const params = { role_type, role_remark, group_id }

    try {

      ctx.paramsCheck('role.create', params)

    } catch (err) {

      return ctx.end(false, '参数校验失败', err)

    }

    try {
      
      const result = await app.model.Role.create(params)
      
      return ctx.end(true, '新增角色成功', result)
    
    } catch (err) {
    
      return ctx.end(false, '新增角色失败', err)
    
    }
  
  }

  /**
   * @description 删除职位类型 delete
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async destroy () {
    
    const { ctx, app } = this

    const { role_id } = ctx.request.body


    try {

      ctx.paramsCheck('role.destroy', { role_id })

    } catch (err) {

      return ctx.end(false, '参数校验失败', err)

    }


    try {
      
      const result = await app.model.Role.destroy({ where: { role_id }, force: true})
      
      return ctx.end(true, '删除角色成功', {result}) 
    
    } catch (err) {
    
      return ctx.end(false, '删除角色失败', err)
   
    }
  
  }

  /**
   * @description 更改职位类型 put
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

   async update () {

    const { ctx, app } = this
    
    const { role_id, role_type, role_remark, group_id } = ctx.request.body

    try {

      ctx.paramsCheck('role.update', { role_id, role_type, role_remark, group_id })

    } catch (err) {

      return ctx.end(false, '参数校验失败', err)

    }
    
    try {
    
      const result = await app.model.Role.update({ role_type, role_remark, group_id }, { where: {role_id} })
     
      return ctx.end(true, '更新角色成功', result)
    
    } catch (err) {
    
      return ctx.end(false, '更新角色失败', err)
    
    }
  
  }

  /**
   * @description 查询单个岗位 get
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async show () {

    const { ctx, app } = this
    
    const { role_id } = ctx.request.query

    try {

      ctx.paramsCheck('role.show', { role_id })

    } catch (err) {

      return ctx.end(false, '参数校验失败', err)

    }

    try {
      
      const result = await app.model.Role.findOne({ where: { role_id }})
      
      return ctx.end(true, '查询角色成功', {result}) 
    
    } catch (err) {
    
      return ctx.end(false, '查询角色失败', err)
    
    }
  
  }

  /**
   * @description 软删除恢复 put
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async recovery () {

    const { ctx, app } = this
    
    const { role_id } = ctx.request.body

    try {

      ctx.paramsCheck('role.recovery', { role_id })

    } catch (err) {

      return ctx.end(false, '参数校验失败', err)

    }

    try {
      
      const result = await app.model.Role.restore({ where: { role_id }})
    
      return ctx.end(true, '恢复角色成功', {result}) 
   
    } catch (err) {
   
      return ctx.end(false, '恢复角色失败', err)
   
    }
  
  }

}

module.exports = RoleController;