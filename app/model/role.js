/*
 * @Description: 用户角色表
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:52:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-31 17:55:41
 */

module.exports = app => {

  const { INTEGER, STRING } = app.Sequelize;
  
  const Role = app.model.define('Role', {
    role_id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    role_type: {
      type: STRING(24),
      unique: true,
      comment: '角色分类'
    },
    role_remark: {
      type: STRING(24),
      unique: true,
      comment: '详细说明'
    },
    group_id: {
      type: INTEGER,
      min: 1,
      max: 4,
      defaultValue: 1
    }
  }, {
    tableName: 'ROLE_TABLE',
    comment: '用户角色',
  })

  // 关联关系
  Role.associate = () => {
    app.model.Role.hasMany(app.model.User, { foreignKey: 'role_id', targetKey: 'role_id'});
    app.model.Role.belongsTo(app.model.RoleGroup, { foreignKey: 'group_id', targetKey: 'group_id', as: 'rg'});
  }

  // 额外方法
  Role.detail = async (id) => {
    const result = await Role.findById(id, {
      attributes: ['type', 'remark', 'group']
    })
    return result.get({plian: true})
  } 

  return Role
}