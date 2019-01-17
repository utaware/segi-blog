/*
 * @Description: user 相关接口格式校验
 * @Author: HasebeAya
 * @Date: 2018-12-19 23:57:30
 * @LastEditTime: 2019-01-17 17:37:33
 */ 

// https://github.com/hapijs/joi/blob/v14.3.0/API.md

module.exports = app => {

  const Joi = app.Joi;

  const rules = {
    username: Joi.string().alphanum().min(4).max(12),
    email: Joi.string().email(),
    password: Joi.string().regex(/^[a-zA-Z0-9]{6,16}$/),
    mode: Joi.any().valid(['username', 'email']),
    checkCode: Joi.string().regex(/^[a-zA-Z0-9]{4}$/),
    pageNo: Joi.number().min(1),
    pageSize: Joi.number().min(10).max(100),
    id: Joi.number().min(1),
    privilege: Joi.number().min(1),
    role: Joi.number().min(1)
  }

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
