const Controller = require('egg').Controller;       
// 文档相关
class DocsController extends Controller {
  // 上传文档
  async upload () {
    let { ctx, app } = this
    // 获取token
    ctx.log(ctx.state.user)
    ctx.body = 'docs'
  }
  // 默认
  async index () {
    let { ctx, app } = this
    // 获取token
    ctx.log(ctx.state.user)
    ctx.body = 'docs'
  }
}

module.exports = DocsController;