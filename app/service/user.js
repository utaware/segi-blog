/*
 * @Description: 用户功能相关服务
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-11-26 16:27:34
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-29 17:00:39
 */

// egg-service
const { Service } = require('egg')

class UserService extends Service {

  /**
   * @description 新增用户产生的事务: 1. 新增用户 2. 新增用户信息 3. 更新用户数量
   * @author utaware
   * @date 2018-12-29
   * @param {*} info
   */

  async createUser (info) {

    const { ctx, app } = this
    const { username, password, email, privilege = 0, role = 0 } = info
    const transaction = await app.model.transaction()

    try {
      const { user_id } = await app.model.User.create({username, hash: password, email, privilege, role}, {transaction})
      await app.model.Info.create({alias: username, user_id}, {transaction})
      await app.model.Total.increment(['total'], {where: {category: 'user'}, transaction})
      await transaction.commit()
    } catch (err) {
      await transaction.rollback()
      throw new Error(JSON.stringify(err))
    }
  }
}

module.exports = UserService