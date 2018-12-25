const Service = require('egg').Service;

class RoleService extends Service {
  // 查询所有
  async getAll (condition = {}) {

    return await this.app.model.Role.findAll(condition)

  }
  // 查询一条
  async query (info) {

    return await this.app.model.Role.findOne(info)

  }
  // 新增一条
  async create (info) {
  
    return await this.app.model.Role.create(info)

  }
  // 删除一条
  async destroy (condition, config = {}) {
    
    return await this.app.model.Role.destroy(condition, config)

  }
  // 更新单条
  async update (info, condition) {

    return await this.app.model.Role.update(info, condition)

  }
  // 恢复一条
  async recovery (info) {

    return await this.app.model.Role.restore(info)
  
  }
}

module.exports = RoleService;
