/*
 * @Description: user 相关接口格式校验
 * @Author: HasebeAya
 * @Date: 2018-12-19 23:57:30
 * @LastEditTime: 2018-12-26 23:13:20
 */ 

// https://github.com/hapijs/joi/blob/v14.3.0/API.md

module.exports = app => {

  const Joi = app.Joi;

  const rules = {
    username: Joi.string().alphanum().min(4).max(12).required(),
    email: Joi.string().email().required(),
    password: Joi.string().regex(/^[a-zA-Z0-9]{6,16}$/).required(),
    mode: Joi.any().valid(['username', 'email']).required(),
    checkCode: Joi.string().regex(/^[a-zA-Z0-9]{4}$/).required(),
    pageNo: Joi.number().min(1),
    pageSize: Joi.number().min(10).max(100),
    id: Joi.number().min(1).required(),
    privilege: Joi.number().min(1).required(),
    role: Joi.number().min(1).required()
  }

  return (order) => {
      let o = {}
      order.forEach(v => {
        if (rules[v] === undefined) {
          throw new Error('不存在的校验规则')
        } else {
          o[v] = rules[v]
        }
      })
      return Joi.object().keys(o)
    }

};
