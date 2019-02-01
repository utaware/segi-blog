/*
 * @Description: user 相关接口格式校验
 * @Author: HasebeAya
 * @Date: 2018-12-19 23:57:30
 * @LastEditTime: 2019-02-01 18:12:39
 */ 

// https://github.com/hapijs/joi/blob/v14.3.0/API.md
// https://blog.csdn.net/u013707249/article/details/79034138

module.exports = app => {

  const Joi = app.Joi;

  const common = require('./common')(app)

  const { id } = common

  const extend = {
    // 权限id
    privilege_id: id,
    // 角色id
    role_id: id,
    // 文档id
    docs_id: id
  }

  const rules = Object.assign({}, common, extend)

  return (order, required = true) => {
    // 单个规则 => string 多个规则组合 => 数组
    const type = Object.prototype.toString.call(order).slice(8, -1)

    switch (type) {
      case 'String':
        return required ? rules[order].required() : rules[order]
      case 'Array':
        let o = {}
        order.forEach(v => {
          rules[v] && (o[v] = required ? rules[v].required() : rules[v])
        })
        return Joi.object().keys(o)
      default: 
        throw new TypeError('入参应为字符串或者数组类型')  
    }
    
  }
};
