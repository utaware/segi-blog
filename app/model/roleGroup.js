/*
 * @Description: 用户角色分组表
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:52:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-31 17:47:16
 */

module.exports = app => {

  const { INTEGER, STRING } = app.Sequelize;
  
  const RoleGroup = app.model.define('RoleGroup', {
    group_id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    group_remark: {
      type: STRING(24),
      unique: true,
      comment: '分组说明'
    }
  }, {
    tableName: 'ROLE_GROUP',  
    comment: '角色分组',
  })

  // 关联关系
  RoleGroup.associate = () => {
    RoleGroup.hasMany(app.model.Role, { foreignKey: 'group_id', targetKey: 'group_id', as: 'rg'});
  }

  return RoleGroup
}