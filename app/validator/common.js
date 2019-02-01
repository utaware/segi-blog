module.exports = app => {

  const Joi = app.Joi;

  return {
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
    // 分页
    page: Joi.object().keys({
      no: Joi.number().min(1),
      size: Joi.number().min(10).max(100)
    }),
    // 内容
    content: Joi.string(),
    // 备注
    remark: Joi.string(),
    // 类型
    type: Joi.string(),
    // 等级
    level: Joi.number()
  }

}