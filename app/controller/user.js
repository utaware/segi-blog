const Controller = require('egg').Controller;       
// 包含的功能：用户注册, 登录, 修改密码, 忘记密码
class UserController extends Controller {
  // 新增用户 post
  async register () {
    let { ctx } = this
    ctx.body = await ctx.service.user.register()
  }
  // 用户登录 post
  async login () {
    let { ctx } = this
    ctx.body = await ctx.service.user.login()
  }
  // 修改密码 post
  async modify () {
    let { ctx } = this
    ctx.body = await ctx.service.user.modify()
  }
  // 忘记密码 post
  async forget () {
    let { ctx } = this
    ctx.body = await ctx.service.user.forget()
  }
}

module.exports = UserController;