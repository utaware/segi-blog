module.exports = {
  // 对于response做数据整理
  mergeRes (...args) {
    // 类型检查
    let typeCheck = o => Object.prototype.toString.apply(o).slice(8, -1)
    // 包装器
    let container = {}
    // 类型匹配
    let match = {
        'Number': { name: 'status', merge: false },
        'String': { name: 'message', merge: false },
        'Object': { name: 'data', merge: true },
        'Boolean': { name: 'code', merge: false, format: v => Number(v) }
    }
    // 简要模式判断
    let simple = args.some(v => typeCheck(v) === 'Boolean')
    // 循环遍历
    args.forEach((v) => {
        let type = typeCheck(v)
        let extend = match[type].name
        let merge = match[type].merge
        let format = match[type].format
        container[extend] = merge ? Object.assign({}, container[extend], v) : v
        container[extend] = format ? format(container[extend]) : v
    })
    // 获取simple的值
    let { code = 1, message = '', data = null, status = 200 } = container
    message = message || (code ? 'success' : 'fail')
    // 返回response
    return { status, body : { message, code, data } }
  },
  // 日志打印方法
  log (msg, s = '-', n = 16) {
    // 定义标记  
    let sign = new Array(n).fill(s).join('')
    // 打印传入结果和标记分隔
    console.log(sign)
    console.log(msg)
    console.log(sign)
    return msg
  },
  // 异步forEach
  asyncForEach: async (array, fn) => {
    for (let i =0 ; i < array.length; i++) {
      await fn(array[i], i, array)
    }
  }
}