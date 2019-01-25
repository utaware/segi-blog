/*
 * @Description: 分享相关内容
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2019-01-09 17:14:23
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-17 16:57:11
 */

const Controller = require('egg').Controller;

class ShareController extends Controller {

  /**
   * @description 查询今年按期分组的统计数量 get
   * @author utaware
   * @date 2019-01-12
   * @returns 
   */

  async cycle () {

    const { ctx, app } = this
    const Sql = app.Sequelize
    const year = ctx.helper.moment().year()
    
    try {
      let result = {}
      result.year = year
      result.total = (await app.model.Share.findOne({
        attributes: [[Sql.fn('COUNT', '*'), 'total']]
      })).get({plain: true}).total
      result.group = await app.model.Share.findAll({
        attributes: ['cycle', [Sql.fn('COUNT', 'cycle'), 'count']],
        group: ['cycle'],
        where: Sql.where(Sql.fn('DATE_FORMAT', Sql.col('created_at'), '%Y'), '=', year)
      })
      return ctx.end(true, '分享期数查询成功', {result})
    } catch (err) {
      return ctx.end(false, '分享期数查询失败', err)
    }

  }

  /**
   * @description 获取用户单个用户分享信息 get
   * @author utaware
   * @date 2019-01-12
   * @returns 
   */

  async query () {

    const { ctx, app } = this
    const { cycle } = ctx.request.query
    
    try {
      const result = await app.model.Share.findAndCountAll({
        attributes: { exclude: ['user_id', 'deleted_at'] },
        where: { cycle }
      })
      return ctx.end(true, '查询分享成功', {result})
    } catch (err) {
      return ctx.end(false, '查询分享失败', err)
    }
    
  }
  
  /**
   * @description 创建分享信息 post
   * @author utaware
   * @date 2019-01-10
   * @returns 
   */

  async create () {

    const { ctx, app } = this
    const { user_id, name } = ctx.state.user
    const { file_id, cycle, title, descript } = ctx.request.body

    const day = ctx.helper.moment(cycle).format('YYYY/MM/DD')
    const cycle_format = ctx.helper.moment(cycle).format('W')

    try {
      await app.model.Share.create({file_id, cycle: cycle_format, title, descript, user_id, author: name, day})
      return ctx.end(true, '新增成功')
    } catch (err) {
      return ctx.end(false, '新增失败', err)
    }

  }

  /**
   * @description 删除单个分享
   * @author utaware
   * @date 2019-01-12
   * @returns 
   */

  async remove () {

    const { ctx, app } = this
    const { id } = ctx.request.body

    try {
      const result = await app.model.Share.destroy({
        where: {id}
      })
      return ctx.end(true, '删除分享成功', {result})
    } catch (err) {
      return ctx.end(false, '删除分享失败', err)
    }

  }

}

module.exports = ShareController;