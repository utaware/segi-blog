/*
 * @Description: 分享表
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:52:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-18 16:55:45
 */

module.exports = app => {

  const { INTEGER, STRING, TEXT } = app.Sequelize;
  
  const Share = app.model.define('share', {
    id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    user_id: {
      type: INTEGER,
      comment: '用户关联id'
    },
    author: {
      type: STRING,
      comment: '用户名'
    },
    file_id: {
      type: INTEGER,
      comment: '文件关联id'
    },
    day: {
      type: STRING(24),
      comment: '分享日期'
    },
    cycle: {
      type: STRING,
      comment: '分享期数'
    },
    title: {
      type: STRING,
      comment: '分享标题'
    },
    descript: {
      type: TEXT('long'),
      comment: '分享描述'
    }
  }, {
    tableName: 'share_list',
    comment: '分享信息表',
  })

  return Share
}