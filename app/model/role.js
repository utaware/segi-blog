/*
 * @Description: 用户角色表
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:52:01
 * @LastEditors: Please set LastEditors
 * @LastEditTime: 2018-12-26 23:36:53
 */

module.exports = app => {

  const { INTEGER, STRING } = app.Sequelize;
  
  const Role = app.model.define('Role', {
    id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    type: {
      type: STRING(24),
      unique: true,
      comment: '角色分类'
    },
    remark: {
      type: STRING(24),
      unique: true,
      comment: '详细说明'
    },
    group: {
      type: INTEGER,
      min: 1,
      max: 4,
      defaultValue: 1
    }
  }, {
    freezeTableName: true,
    timestamps: true,
    tableName: 'role_list',
    comment: '用户角色',
    underscored: true
  })

  return Role
}