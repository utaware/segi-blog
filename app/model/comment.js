/*
 * @Description: 文档评论：1.关联文档id 2.楼中楼关联楼层id
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 18:16:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-24 15:10:54
 */

module.exports = app => {

  const Sql = app.Sequelize
  const { INTEGER, STRING } = Sql

  const Comment = app.model.define('Comment', {
    id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    docs_id: {
      type: INTEGER,
      allowNull: false,
      comment: '文档关联id'
    },
    user_id: {
      type: INTEGER,
      allowNull: false,
      comment: '上传用户user_id'
    },
    user_name: {
      type: STRING(24),
      allowNull: false,
      comment: '回复人用户名'
    },
    replier_id: {
      type: INTEGER,
      allowNull: false,
      comment: '被回复人id'
    },
    replier_name: {
      type: STRING(24),
      allowNull: false,
      comment: '被回复人用户名'
    },
    floor: {
      type: INTEGER,
      defaultValue: 1,
      allowNull: false,
      comment: '评论楼层'
    },
    content: {
      type: STRING,
      allowNull: false,
      comment: '回复内容'
    }
  }, {
    tableName: 'comment_list',
    comment: '评论相关',
  })
  
  // 关联关系
  Comment.associate = () => {
    Comment.belongsTo(app.model.Docs, {foreignKey: 'docs_id', targetKey: 'id', as: 'c'})
  }

  // 公共方法
  Comment.currentfloor = async (docs_id) => {
    const result = await Comment.findOne({
      attributes: [[Sql.fn('MAX', Sql.col('floor')), 'max_floor']],
      where: { docs_id }
    })
    const { max_floor } = result.get({plain: true})
    return Number(max_floor) + 1
  }

  return Comment
}