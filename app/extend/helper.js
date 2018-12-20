const moment = require('moment')

module.exports = {
  // 命令行颜色
  chalk: require('chalk'),
  // 文件操作
  fs: require('fs-extra'),
  // os path
  path: require('upath'),
  // 文件目录匹配库
  globby: require('globby'),
  // hash化
  hash: require('hash-sum'),
  // 字符串扁平化
  slugify: require('./lib/slugify'),
  // console日志输出
  logger: require('./lib/logger'),
  // 类型判断函数
  datatypes: require('./lib/datatypes'),
  // 转换文件头部变量语法
  matter: require('gray-matter'),
  // 时间转换
  moment,
  // tools
  tools: require('./lib/tools'),
  // now获取当前时间
  now: (f = 'YYYY-MM-DD HH:mm:ss') => moment(new Date()).format(f)
}