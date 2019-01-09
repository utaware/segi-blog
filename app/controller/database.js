/*
 * @Description: 数据库相关操作
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-27 14:18:40
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-09 18:24:23
 */

const Controller = require('egg').Controller;
// https://itbilu.com/nodejs/npm/V1PExztfb.html#api-upsert 相关参数
class DatabaseController extends Controller {

  // 重置visit表
  async truncate () {
  
    const { ctx, app } = this
    const { tableModle } = ctx.request.body

    try {
      const result = await app.model[tableModle].destroy({
        truncate: true,
        force: true
      })
      return ctx.end(true, '重置表成功', {result})
    } catch (err) {
      return ctx.end(false, '重置表失败', {err})
    }
  }

}

module.exports = DatabaseController;