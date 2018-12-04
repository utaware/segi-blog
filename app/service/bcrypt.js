// module
const Service = require('egg').Service;
const bcrypt = require('bcrypt')
// constant
const saltRounds = 10
// service
class BcryptService extends Service {
  // 加密
  /**
   * @description bcrypt加密传入的文本
   * @date 2018-12-05
   * @param {string} text
   * @returns {string} hash
   */
  async hash (text) {
    return await bcrypt.hash(text, saltRounds).then((hash) => {
      return hash
    }).catch((err) => {
      return ctx.log('加密过程中出现错误', err)
    })
  }
  // 解密
  /**
   * @description bcrypt解密传入的文本
   * @date 2018-12-05
   * @param {string} text
   * @param {string} hash
   * @returns {boolean} result
   */
  async compare (text, hash) {
    return await bcrypt.compare(text, hash).then((check) => {
      return check
    }).catch((err) => {
      return ctx.log('解密过程中出现错误', err)
    })
  }
}

module.exports = BcryptService;
