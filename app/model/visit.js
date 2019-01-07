/*
 * @Description: 请求统计表
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:52:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-07 16:30:54
 */

module.exports = app => {

  const { INTEGER, STRING } = app.Sequelize;
  
  const Visit = app.model.define('Visit', {
    id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    ip: {
      type: STRING,
      comment: '请求ip'
    },
    url: {
      type: STRING,
      comment: '请求url'
    },
    method: {
      type: STRING,
      comment: '请求method'
    },
    type: {
      type: STRING,
      comment: '请求content-type'
    },
    user_agent: {
      type: STRING,
      comment: '请求user-agent'
    },
    host: {
      type: STRING,
      comment: '请求host'
    },
    protocol: {
      type: STRING,
      comment: '请求protocol'
    }
  }, {
    tableName: 'visit_log',
    comment: '访问记录表',
  })

  return Visit
}