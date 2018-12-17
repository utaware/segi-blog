/*
 * @Description: jsonwebtoken 相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-04 19:48:52
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-17 11:52:03
 */

// egg-service
const Service = require('egg').Service
const jwt = require('jsonwebtoken')
// data-table
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
  encrypt (d, o) {
    return `Bearer ${jwt.sign(d, sign, o)}`
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
    if (!authorization) {
      return ctx.throw(401, 'header中未包含authorization')
    }
    // authorization-check
    if (!authorization.startsWith('Bearer ')) {
      return ctx.throw(401, 'authorization格式不符')
    }
    // token获取解密
    try {
      const token = authorization.split(' ')[1]
      return jwt.verify(token, sign)
    } catch (err) {
      return ctx.throw(401, 'jwt token错误或已失效')
    }
  }
}

module.exports = JwtService