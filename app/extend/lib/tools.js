let { success, fail } = require('./constant')

module.exports = {
  // 对于response做数据整理
  mergeRes (...args) {
    // 类型检查
    let typeCheck = o => Object.prototype.toString.apply(o).slice(8, -1)
    // 包装器
    let container = {}
    // 类型匹配
    let match = {
        'Number': { name: 'code', merge: false, require: true },
        'String': { name: 'message', merge: false, require: true },
        'Object': { name: 'data', merge: true, require: true },
        'Boolean': { name: 'result', merge: false, require: false }
    }
    // 简要模式判断
    let simple = args.some(v => typeCheck(v) === 'Boolean')
    // 循环遍历
    args.forEach((v) => {
        let type = typeCheck(v)
        let extend = match[type].name
        let merge = match[type].merge
        container[extend] = merge ? Object.assign({}, container[extend], v) : v
    })
    // 获取simple的值
    let result = container.result
    // response中删除
    delete container.result
    // data默认为null
    container.data = container.data || null
    // 返回response
    return simple ? result ? success : fail : container
  },
  // 日志打印方法
  log (msg, s = '-', n = 16) {
    // 定义标记  
    let sign = new Array(n).fill(s).join('')
    // 打印传入结果和标记分隔
    console.log(sign)
    console.log(msg)
    console.log(sign)
  }
}