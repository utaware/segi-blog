/*
 * @Description: 用户角色信息相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-01-04 11:44:14
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-04 16:48:44
 */

// egg-controller
const { Controller } = require('egg')

class InfoController extends Controller {

  /**
   * @description 查询所有用户角色信息 get
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

  async index () {

    const { ctx, app } = this
    const { privilege } = ctx.state.user

    try {
      const access = await app.model.Privilege.findOne({
        where: { id: privilege }
      })
      if (!access.query_member) {
        return ctx.end(false, '您没有查询用户信息的权限')
      }
    } catch (err) {
      return ctx.end(false, err)
    }
    
    try {
      const result = await app.model.Info.findAll()
      return ctx.end(true, '查询角色信息成功', {result})
    } catch (err) {
      return ctx.end(false, '查询角色信息失败', err)
    }
  }

  /**
   * @description 更新用户角色信息 put
   * @author utaware
   * @date 2018-12-25
   * @returns 
   */

   async update () {

    const { ctx, app } = this
    const { user_id } = ctx.state.user
    const { alias, address, avatar, phone, birthday } = ctx.request.body
    
    try {
      const result = await app.model.Info.update({ alias, address, avatar, phone, birthday }, { where: {user_id} })
      return ctx.end(true, '更新角色成功', {result})
    } catch (err) {
      return ctx.end(false, '更新角色失败', err)
    }
  }

  /**
   * @description 查询用户个人的角色信息 get
   * @author utaware
   * @date 2019-01-04
   * @returns 
   */

  async show () {

    const { ctx, app } = this
    const { user_id } = ctx.state.user

    try {
      const result = await app.model.Info.findOne({
        where: {user_id},
        attributes: ['alias', 'phone', 'avatar', 'address', 'birthday']
      })
      return ctx.end(true, '查询角色信息成功', {result})
    } catch (err) {
      return ctx.end(false, '查询用户角色信息失败', err)
    }

  }

}

module.exports = InfoController;