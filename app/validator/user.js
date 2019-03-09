
const mixins = require('./mixins')

const { 
  name, // 用户名
  password, // 密码
  email, // 邮箱
  checkCode, // 验证码
  group
} = mixins

module.exports = {

  // 用户登录
  login: group({
    name: name.required(),
    password: password.required()
  }),

  // 用户注册
  register: group({
    name: name.required(),
    password: password.required(),
    email: email.required(),
    checkCode: checkCode.required()
  })

}