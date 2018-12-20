/*
 * @Description: user 相关接口格式校验
 * @Author: HasebeAya
 * @Date: 2018-12-19 23:57:30
 * @LastEditTime: 2018-12-20 11:42:01
 */ 

module.exports = app => {

  const Joi = app.Joi;
  // 用户名
  const username = Joi.string().alphanum().min(4).max(12).required()
  // 邮箱
  const email = Joi.string().email().required()
  // 密码
  const password = Joi.string().regex(/^[a-zA-Z0-9]{6,16}$/).required()
  // 模式
  const mode = Joi.any().valid(['username', 'email'])
  // 验证码
  const code = Joi.string().regex(/^[a-zA-Z0-9]{4}$/).required()
  // 页数
  const pageNo = Joi.number().min(1)
  // 单页数目
  const pageSize = Joi.number().min(10).max(100)

  return {
    // 注册
    register: Joi.object().keys({ username, email, password }),
    // 登陆-用户名
    loginUsername: Joi.object().keys({ username, password }),
    // 登陆-邮箱
    loginEmail: Joi.object().keys({ email, password}),
    // 登陆方式
    loginMode: Joi.object().keys({ mode }),
    // 修改密码
    modify: Joi.object().keys({ password }),
    // 忘记密码
    forget: Joi.object().keys({ password, code, email }),
    // 邮箱校验
    email,
    // 分页校验
    page: Joi.object().keys({ pageNo, pageSize })
  }
};
