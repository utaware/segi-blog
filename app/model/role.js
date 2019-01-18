/*
 * @Description: 用户角色表
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:52:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-18 16:07:31
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

  // 关联关系
  Role.associate = () => {
    app.model.Role.hasMany(app.model.User, { foreignKey: 'role', targetKey: 'id'});
  }

  return Role
}