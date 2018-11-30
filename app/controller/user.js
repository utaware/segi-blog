'use strict';

const Controller = require('egg').Controller;       

class UserController extends Controller {
  // 新增用户 post
  async register () {
    let { ctx } = this
    // 获取参数
    let result = await ctx.service.user.register()
    ctx.end(200, 'success', result)
  }
  // 用户登录 post
  async login () {
    let {ctx} = this
    let result = await ctx.service.user.login()
    ctx.end(200, 'success', result)
  }
}

module.exports = UserController;