// 扩展this上下文
let tools = require('./lib/tools')

module.exports = {
  // 合并响应参数  
  mergeRes: tools.mergeRes,
  // 响应的方法
  end (...args) {
    // 调用hepler utils方法
    let res = tools.mergeRes(...args)
    // 返回结果
    return this.body = res
  }
  
}