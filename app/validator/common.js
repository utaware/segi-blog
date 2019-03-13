// 引入Joi

const Joi = require('joi')

module.exports = {

    // 用户名
    name: Joi.string().alphanum().min(4).max(12),

    // 邮箱
    email: Joi.string().email(),

    // 密码
    password: Joi.string().regex(/^[a-zA-Z0-9]{6,16}$/),

    // 验证码
    checkCode: Joi.string().regex(/^[a-zA-Z0-9]{4}$/),

    // id
    id: Joi.number().min(1),

    // 页数
    pageNo: Joi.number().min(1),

    // 单页限制
    pageLimit: Joi.number().min(10).max(100),

    // 文本字符串
    text: Joi.string(),

    // 权限等级
    level: Joi.number(),

    // 备注
    remark: Joi.string(),

    // 组合生成
    group: (data, required = true) => {
        
      let o = {}
      
      for (const k in data) {

        o[k] = required ? data[k].required() : data[k]

      }

      return Joi.object().keys(o)
      
    }

}