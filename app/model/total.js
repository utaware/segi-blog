/*
 * @Description: 相关信息统计表
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:52:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-25 10:42:20
 */

module.exports = app => {

  const { INTEGER, STRING } = app.Sequelize;
  
  const Total = app.model.define('Total', {
    id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    category: {
      type: STRING(24),
      unique: true,
      comment: '分类'
    },
    remark: {
      type: STRING(24),
      unique: true,
      comment: '详细说明'
    },
    total: {
      type: INTEGER,
      defaultValue: 0
    }
  }, {
    tableName: 'TOTAL_TABLE',
    comment: '用户角色',
  })

  return Total
}