
const mixins = require('./mixins')

const { 
  email // 邮箱
} = mixins

module.exports = {

  // 用户注册
  email: email.required()

}