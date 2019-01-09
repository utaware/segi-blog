/*
 * @Description: visit定时任务
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2019-01-07 16:59:47
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-09 10:58:35
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

    const data = await ctx.service.visit.index()
    const now = ctx.helper.now('YYYY-MM-DD')
    const buffer = xlsx.build([{name: '访问信息', data}]);
    const fileName = `${__dirname}/${now}.xlsx`
    
    try {
      await fs.writeFile(fileName, buffer, {flag: 'a'})
    } catch (err) {
      ctx.log(err)
    }

  }
}