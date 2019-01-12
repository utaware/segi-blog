/*
 * @Description: 相关接口统计 相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-04 19:48:52
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-12 11:10:16
 */

const Service = require('egg').Service

class VisitService extends Service {

  // 查询访问信息
  async index () {
    const { ctx, app } = this
    const Sql = app.Sequelize

    let data
    try {
      data = await app.model.Visit.findAll({
        where: {
          created_at: Sql.where(Sql.fn('DATE_SUB', Sql.fn('now'), Sql.literal('INTERVAL 1 day')), '<=', Sql.col('created_at'))
        }
      })
    } catch (err) {
      ctx.throw(500, '定时任务错误', {err})
    }

    const moment = ctx.helper.moment
    const formatTime = ['created_at', 'updated_at']

    data = data.map((row) => {
      let r = []
      row = row.get({plain: true})
      for (let k in row) {
        if (formatTime.includes(k)) {
          row[k] = moment(row[k]).format('YYYY-MM-DD HH:mm:ss')
        }
        r.push(row[k])
      }
      return r
    })

    data.unshift(['id', 'ip', 'url', 'method', 'type', 'user-agent', 'host', 'protocol', 'status', 'code', 'message', 'created_at', 'updated_at'])
    return data
  }

  // 每次访问添加访问信息
  async create () {
    const { ctx, app } = this
    const { ip, url, method, type, host, protocol } = ctx
    const user_agent = ctx.request.header['user-agent']
    const { status } = ctx.response
    const body = ctx.response.body
    const code = status === 200 ? body.code : 0
    const message = status === 200 ? body.message : 'fail create'

    try {
      return await app.model.Visit.create({ip, url, method, type, host, protocol, user_agent, code, message, status})
    } catch (err) {
      return ctx.throw(500, '插入访问日志失败', {err})
    }
  }

}

module.exports = VisitService