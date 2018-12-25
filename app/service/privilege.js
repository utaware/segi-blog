/*
 * @Description: 用户权限相关service
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 09:49:48
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-25 10:45:55
 */

const Service = require('egg').Service;
// service
class RoleService extends Service {
  // 查找所有的职位类型
  async getAll (condition = {}) {

    return await this.app.model.Privilege.findAll(condition)
    
  }
  // 查询一条
  async query (info) {

    return await this.app.model.Privilege.findOne(info)
    
  }
  // 新增一条
  async create (info) {

    return await this.app.model.Privilege.create(info)
     
  }
  // 删除一条
  async destroy (condition, config = {}) {

    return await this.app.model.Privilege.destroy(condition, config)
    
  }
  // 更新单条
  async update (info, condition) {

    return await this.app.model.Privilege.update(info, condition)
  
  }
  // 恢复一条
  async recovery (info) {

    return await this.app.model.Privilege.restore(info)
  
  }
}

module.exports = RoleService;
