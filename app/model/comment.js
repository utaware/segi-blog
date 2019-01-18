/*
 * @Description: 评论相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 18:16:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-18 16:56:22
 */

module.exports = app => {

  const { INTEGER, STRING } = app.Sequelize;

  const Comment = app.model.define('comment', {
    id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    user_id: {
      type: INTEGER,
      allowNull: false,
      comment: '上传用户user_id'
    },
    floor: {
      type: INTEGER,
      defaultValue: 0,
      allowNull: false,
      comment: '评论楼层'
    },
    replier_id: {
      type: INTEGER,
      allowNull: false,
      comment: '被回复人id'
    },
    replier_name: {
      type: INTEGER,
      allowNull: false,
      comment: '被回复人用户名'
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

  return Comment
}