/*
 * @Description: 分享相关内容
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2019-01-09 17:14:23
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-09 18:38:54
 */

const Controller = require('egg').Controller;

class ShareController extends Controller {

  // create post
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