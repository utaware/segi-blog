/*
 * @Description: visit定时任务
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2019-01-07 16:59:47
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-08 16:06:02
 */

// https://blog.csdn.net/qq411397201/article/details/52593491 sequelize
// http://www.nodeclass.com/api/sequelize.html#class-model api 文档
// https://blog.csdn.net/bocongbo/article/details/84065418 定时任务

const xlsx = require('node-xlsx')
const fs = require('fs-extra')

module.exports = {
  schedule: {
    // interval: '', // 间隔执行
    cron: '0 0 3 * * *', // 定时执行
    type: 'all',
    immediate: true // 启动立即执行一次
  },
  // 生成访问日志
  async task (ctx) {
    const { app } = ctx
    const Sql = app.Sequelize

    let data
    try {
      data = await app.model.Visit.findAll({
        where: {
          created_at: Sql.where(Sql.fn('DATE_SUB', Sql.fn('now'), Sql.literal('INTERVAL 1 day')), '<=', Sql.col('created_at'))
        }
      })
    } catch (err) {
      ctx.log(err)
    }

    const moment = ctx.helper.moment
    const formatTime = ['created_at', 'updated_at']

    data = data.map((row) => {
      let r = []
      row = row.get({plain: true})
      ctx.log(row)
      for (let k in row) {
        if (formatTime.includes(k)) {
          row[k] = moment(row[k]).format('YYYY-MM-DD HH:MM:SS')
        }
        r.push(row[k])
      }
      return r
    })

    const now = ctx.helper.now('YYYY-MM-DD')
    ctx.log(data)
    data.unshift(['id', 'ip', 'url', 'method', 'type', 'user-agent', 'host', 'created_at', 'updated_at', 'deleted_at'])
    
    const buffer = xlsx.build([{name: '访问信息', data}]);
    const fileName = `${__dirname}/${now}.xlsx`
    
    try {
      await fs.writeFile(fileName, buffer, {flag: 'a'})
    } catch (err) {
      ctx.log(err)
    }

  }
}