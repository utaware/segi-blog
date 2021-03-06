// 扩展this上下文
let tools = require('./lib/tools')

module.exports = {
  // 合并响应参数  
  mergeRes: tools.mergeRes,
  // 简易日志打印工具
  log: tools.log,
  // 响应的方法
  end (...args) {
    // 调用hepler utils方法
    const { status, body } = tools.mergeRes(...args)
    // 返回结果
    this.status = status
    this.body = body
    return false
  },
  // 筛选的方法
  filterData: tools.filterData,
  // 分页公共方法
  pageFormat: tools.pageFormat,
  // 请求参数校验
  paramsCheck (name, data) {
    tools.paramsCheck(this, name, data)
  }
}