/*
 * @Description: 相关直接挂在到ctx上的一些直接性方法
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-03 17:59:09
 * @LastEditors: utaware
 * @LastEditTime: 2019-03-09 16:00:29
 */

const _ = require('lodash')

module.exports = {
  
  /**
   * @description 类型判断
   * @author utaware
   * @date 2019-01-21
   * @param {any} o
   * @returns {string} 类型
   */

  typeCheck (o) {
    return Object.prototype.toString.apply(o).slice(8, -1)
  },

  /**
   * @description 对于response做数据整理
   * @author utaware
   * @date 2018-12-19
   * @param {number, boolean, object, string} args
   * @returns object 返回所需的ctx.response对象
   */
  
  mergeRes (...args) {
    // 包装器
    let container = {}
    // 循环遍历
    args.forEach((v) => {
        const type = this.typeCheck(v)
        switch (type) {
          case 'Number': container.status = v
            break
          case 'String': container.message = v
            break
          case 'Boolean': container.code = Number(v)
            break
          case 'Error': container.stack = v
            break
          default: container.data = v
            break
        }
    })
    // 获取simple的值
    let { code = 1, message = '', data = null, status = 200, stack = '' } = container
    message = message || (code ? 'success' : 'fail')
    // 返回response
    return { status, body : { message, code, data, stack } }
  },

  /**
   * @description 便于日志打印的标识方法
   * @author utaware
   * @date 2018-12-19
   * @param {any} msg 需要打印的信息
   * @param {string} [s='-'] 标识符号
   * @param {number} [n=16] 标识符号数量
   * @returns msg
   */
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
  },

  /**
   * @description 筛选某个对象中所需字段
   * @author utaware
   * @date 2018-12-19
   * @param {object} o 所需筛选对象
   * @param {array} array 所需要筛选的条件
   * @param {boolean} equal 相等还是不等
   * @returns Object 筛选后的新对象
   */
  filterData (o, array, equal = true) {
    let t = {}, f = {}
    for (let keys in o) {
      array.includes(keys) ? t[keys] = o[keys] : f[keys] = o[keys]
    }
    return equal ? t : f
  },
 
  
  /**
   * @description 分页统一处理
   * @author utaware
   * @date 2019-01-24
   * @param {object} page
   * @returns {object}
   */
  pageFormat (page) {
    const { pageNo, pageSize } = page
    const limit = Number(pageSize)
    const offset = (Number(pageNo) - 1) * limit
    return {offset , limit, no: Number(pageNo), size: Number(pageSize)}
  },

  // 参数校验方法
  paramsCheck (ctx, name, data) {

    const { app } = ctx
    // 生成joi相关校验规则
    const [ schema ] = _.at(app.validator, [ name ])
    // 执行校验
    return ctx.validate(schema, data)

  }
}