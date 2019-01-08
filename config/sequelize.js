const moment = require('moment')
// https://github.com/demopark/sequelize-docs-Zh-CN/blob/master/models-usage.md

module.exports = {
  // 数据库类型
  dialect: 'mysql',
  // 数据库
  database: 'dev',
  // 主机名
  host: 'localhost',
  // 端口
  port: '3306',
  // username
  username: 'root',
  // password
  password: 'minagi626QQ',
  // 时区设置
  timezone: '+08:00',
  // 设置别名，否则不识别$like等关键词($like: Op.like对应关系)
  // operatorsAliases: 'object',
  // operatorsAliases: false,
  // 定义时的全局设置
  define: {
    // 可以给表设置别名
    freezeTableName: true,
    // 默认创建表有 createAt, updateAt
    timestamps: true,
    // 字段以下划线（_）来分割（默认是驼峰命名风格）
    underscored: true,
    // 不删除数据库条目，但将新添加的属性deletedAt设置为当前日期（删除完成时)
    // paranoid 只有在启用时间戳时才能工作
    paranoid: true
  }  
}