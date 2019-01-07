/*
 * @Description: visit定时任务
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2019-01-07 16:59:47
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-07 18:41:34
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
    immediate: true
  },
  // 生成访问日志
  async task (ctx) {
    const { app } = ctx
    const Sql = app.Sequelize
    
    let data = await app.model.Visit.findAll({
      where: { 
        created_at: {
          // $eq: Sql.where(Sql.fn('TO_DAYS', Sql.fn('NOW( )')) - Sql.fn('TO_DAYS', Sql.col('created_at')),'<=', 1)
          $ne: null
        }  
      }
    })
    data = data.map((row) => {
      let r = []
      row = row.get({plain: true})
      for (let k in row) {
        r.push(row[k])
      }
      return r
    })

    ctx.log(data)

    const buffer = xlsx.build([{name: '访问信息', data}]);
    const fileName = `${__dirname}/task.xlsx`
    
    try {
      await fs.writeFile(fileName, buffer, {flag: 'a'})
      await fs.writeFile(`${__dirname}/log.txt`, data)
    } catch (err) {
      ctx.log(err)
    }

  }
}