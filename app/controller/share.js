/*
 * @Description: 分享相关内容
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2019-01-09 17:14:23
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-10 11:51:00
 */

const Controller = require('egg').Controller;

class ShareController extends Controller {

  async index () {

    const { ctx, app } = this
    const user_id = ctx.state.user

    let result
    try { 
      result = await app.model.User.privilege(user_id)
    } catch (err) {
      ctx.log(err)
    }

    return ctx.end(true, {result})
  }
  
  /**
   * @description 创建分享信息 post
   * @author utaware
   * @date 2019-01-10
   * @returns 
   */
  async create () {

    const { ctx, app } = this
    const { user_id, username } = ctx.state.user
    const { file_id, cycle, title, descript } = ctx.request.body

    const day = ctx.helper.moment(cycle).format('YY/MM/DD')
    const cycle_format = ctx.helper.moment(cycle).format('W')

    try {
      await app.model.Share.create({file_id, cycle: cycle_format, title, descript, user_id, username, day})
      return ctx.end(true, '新增成功')
    } catch (err) {
      return ctx.end(false, '新增失败', {err})
    }

  }

}

module.exports = ShareController;