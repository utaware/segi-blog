'use strict';

const Controller = require('egg').Controller;       

class UserController extends Controller {
  // index
  async index () {
    
  }
  // 新增用户
  async create () {
    let { ctx } = this
    // 获取参数
    let result = await ctx.service.user.createUser()
    ctx.end(200, 'success', result)
  }
}

module.exports = UserController;