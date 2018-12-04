const Controller = require('egg').Controller;       
// 文档相关
class DocsController extends Controller {
  // 上传文档
  async index () {
    let { ctx, app } = this
    // 获取token
    // let jwt = ctx.service.jwt.decrypt()
    // let token = ctx.header.authorization.split(' ')[1]
    // let eggJwt = app.jwt.verify(token, app.config.jwt.secret)
    // ctx.log(jwt)
    ctx.log(ctx.state.user)
    // ctx.log(eggJwt)
    ctx.body = 'docs'
  }
}

module.exports = DocsController;