 /*
 * @Description: 文章评论相关功能
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2019-01-21 15:56:41
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-21 18:08:28
 */

 /*
 * @Description: 文件上传相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-27 14:18:40
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-10 11:34:19
 */

const Controller = require('egg').Controller;

class CommentController extends Controller {

  // 查询所有评论评论
  async index () {

    const { ctx, app } = this
    const { pageNo = 1, pageSize = 10 } = ctx.request.query

    // 参数校验
    try {
      ctx.validate(app.validator.main('page', {pageNo, pageSize}))
    } catch (err) {
      return ctx.end(false, '校验未通过', err)
    }

    // 查询
    try {
      const result = await app.model.Comment.findAndCount({
        limit: +pageSize,
        offset: (+pageNo - 1) * (+pageSize)
      })
      return ctx.end(false, '查询所有评论成功', result)
    } catch (err) {
      ctx.log(err)
      return ctx.end(false, '查询所有评论失败', err)
    }

  }

}

module.exports = CommentController;