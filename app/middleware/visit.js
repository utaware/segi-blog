/*
 * @Description: 为访问构造一个中间件
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2019-01-09 10:15:28
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-09 17:55:38
 */

module.exports = options => {
  return async (ctx, next) => {
    try {
      await next()
      await ctx.service.visit.create()
    } catch (err) {
      ctx.response.status = err.statusCode || err.status || 500;
      ctx.response.body = {
        code: -1,
        message: err.message || 'server error'
      }
    }
  }
}