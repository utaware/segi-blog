/*
 * @Description: 用户功能相关模块
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-11-26 16:27:34
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-17 15:30:25
 */

// egg-service
const { Service } = require('egg')
// data-table
const USER_TABLE = 'user_list'
// service
class UserService extends Service {
  /**
   * @description 根据条件查询单个用户信息
   * @date 2018-12-10
   * @param {查询条件} info
   * @returns 查询结果
   */
  async find (info) {
    return await this.app.mysql.get(USER_TABLE, info).then((r) => {
      return r
    }).catch((err) => {
      return this.ctx.throw(500, err.sqlMessage)
    })
  }
  /**
   * @description 用户注册
   * @date 2018-12-10
   * @param {string} username 用户名
   * @param {string} hash 密码加密hash值
   * @returns 
   */
  async insert (username, hash) {
    // 生成创建时间
    let create_time = this.ctx.helper.moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    let info = {
      username,
      hash,
      create_time
    }
    return await this.app.mysql.insert(USER_TABLE, info).then((r) => {
      return r.affectedRows === 1
    }).catch((err) => {
      return this.ctx.throw(500, err.sqlMessage)
    })
  }
  /**
   * @description 对应更新用户信息
   * @date 2018-12-10
   * @param {object} info 需要更新的信息字段
   * @param {查询条件} condition
   * @returns 
   */
  async update (info, condition, need = true) {
    let { ctx } = this
    let update_time = ctx.helper.moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    let row = need ? Object.assign({}, info, { update_time }) : info
    return await this.app.mysql.update(USER_TABLE, row, {
      where: condition
    }).then((r) => {
      return r.affectedRows === 1
    }).catch((err) => {
      return ctx.throw(500, err.sqlMessage)
    })
  }
}

module.exports = UserService