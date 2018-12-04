// module
const Service = require('egg').Service
const jwt = require('jsonwebtoken')
// constant
const sign = 'sign_text'
// service
class JwtService extends Service {
  // methods
  /**
   * @description 签名相关内容生成jwt-token
   * @date 2018-12-04
   * @param {object} d => data 加密数据
   * @param {string} s => sign 签名字符
   * @param {object} o => options 设置
   * @returns {string} token
   */
  encrypt (d, s, o) {
    return `Bearer ${jwt.sign(d, s, o)}`
  }
  // 解密
  /**
   * @description 拿到token
   * @date 2018-12-04
   * @returns {object} result
   */
  decrypt () {
    // this
    let { ctx } = this
    // jwt-token => header
    const authorization = ctx.header.authorization
    // authorization-check
    if (!authorization || !authorization.includes(' ')) {
      return 'jwt token error'
    }
    // token获取解密
    const token = authorization.split(' ')[1]
    return jwt.verify(token, sign);
  }
}

module.exports = JwtService