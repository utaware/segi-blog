
const mixins = require('./mixins')

const { 
  name, // 用户名
  password, // 密码
  email, // 邮箱
  checkCode, // 验证码
  group // 字段组合
} = mixins

module.exports = {

  // 用户登录

  login: group({ name, password }),

  // 用户注册
  
  register: group({ name, password, email, checkCode }),

  // 登录状态 -- 修改密码
  
  modify: group({ oldPass: password, newPass: password }),

  // 非登录状态 -- 重置密码

  forget: group({ email, checkCode, password }),

  // 绑定邮箱 -- 更换邮箱地址
  
  bindEmail: group({ email })

}