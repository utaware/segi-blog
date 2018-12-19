/*
 * @Description: 用户权限表
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:45:38
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-19 17:53:50
 */

module.exports = app => {
  // 类型获取
  const { INTEGER, STRING } = app.Sequelize;

  const Privilege = app.model.define('Privilege', {
    id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    privilege: {
      type: STRING(24),
      unique: true,
      comment: '角色'
    },
    remark: {
      type: STRING(24),
      unique: true,
      comment: '详细说明'
    },
    level: {
      type: INTEGER,
      unique: true,
      comment: '权限等级'
    }
  }, {
    freezeTableName: true,
    timestamps: true,
    tableName: 'privilege_list',
    comment: '用户权限',
    underscored: true
  })

  return Privilege;
}