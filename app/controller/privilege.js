/*
 * @Description: 用户权限相关操作
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-18 11:44:14
 * @LastEditors: utaware
 * @LastEditTime: 2019-03-13 16:14:49
 */

// egg-controller
const { Controller } = require('egg')

class PrivilegeController extends Controller {
  
  /**
   * @description 查询所有权限信息 get
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async getAll () {

    const { ctx, app } = this

    // 查询所有权限列表

    try {

      const result = await app.model.Privilege.findAll({attributes: {exclude: ['created_at', 'updated_at', 'deleted_at'] }})
     
      return ctx.end(true, '权限查询成功', result)
    
    } catch (err) {
    
      return ctx.end(false, '权限查询失败', err)
   
    }
  
  }

  /**
   * @description 新增权限类型 post
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async create () {

    const { ctx, app } = this

    const { privilege_type, privilege_remark, privilege_level } = ctx.request.body

    const params = { privilege_type, privilege_remark, privilege_level }

    // 参数校验

    try {

      ctx.paramsCheck('privilege.create', params)

    } catch (err) {

      return ctx.end(false, '参数校验失败', err)

    }

    // 创建新的权限说明

    try {
      
      const result = await app.model.Privilege.create(params)
      
      return ctx.end(true, '权限新增成功', result)
    
    } catch (err) {
    
      return ctx.end(false, '权限新增失败', err)
   
    }
  
  }
  
  /** 删除权限类型 delete
   * @description
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async destroy () {

    const { ctx, app } = this
    
    const { privilege_id } = ctx.request.body

    // 参数校验

    try {

      ctx.paramsCheck('privilege.destroy', { privilege_id })

    } catch (err) {

      return ctx.end(false, '参数校验失败', err)

    }

    // 删除权限 => 软删除

    try {
      
      await app.model.Privilege.destroy({ where: { privilege_id } })
      
      return ctx.end(true, '权限删除成功')
    
    } catch (err) {
    
      return ctx.end(false, '权限删除失败', err)
    
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
    
    const { privilege_type, privilege_remark, privilege_level, privilege_id } = ctx.request.body

    // 参数校验

    try {
      
      ctx.paramsCheck('privilege.update', { privilege_type, privilege_remark, privilege_level, privilege_id })
    
    } catch (err) {

      return ctx.end(false, '参数校验错误', err)

    }

    // 更新对应对应权限信息

    try {
    
      await app.model.Privilege.update({ privilege_type, privilege_remark, privilege_level }, { where: { privilege_id }})
    
      return ctx.end(true, '权限更新成功')
    
    } catch (err) {
    
      return ctx.end(false, '权限更新失败', err)
   
    }
  
  }

  /**
   * @description 查询单个岗位 get /:id
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

   async show () {

    const { ctx, app } = this
    
    const { privilege_id } = ctx.request.body

    // 参数校验

    try {

      ctx.paramsCheck('privilege.show', { privilege_id })

    } catch (err) {

      return ctx.end(false, '参数校验失败', err)

    }

    // 查询单个权限信息

    try {
    
      const result = await app.model.Privilege.findOne({ where: {privilege_id}})
      
      return ctx.end(true, '权限查询成功', result)
    
    } catch (err) {
    
      return ctx.end(false, '权限查询失败', err)
   
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

    const { privilege_id } = ctx.request.body

    // 参数校验

    try {

      ctx.paramsCheck('privilege.recovery', { privilege_id })

    } catch (err) {

      return ctx.end(false, '参数校验失败', err)

    }

    // 恢复软删除的权限信息

    try {
    
      await app.model.Privilege.restore({ where: {privilege_id}})
    
      return ctx.end(true, '权限恢复成功')
   
    } catch (err) {
   
      return ctx.end(false, '权限恢复失败', err)
   
    }
  
  }

}

module.exports = PrivilegeController;