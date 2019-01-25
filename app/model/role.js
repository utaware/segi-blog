/*
 * @Description: 用户角色表
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:52:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-25 11:43:38
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
    tableName: 'ROLE_TABLE',
    comment: '用户角色',
  })

  // 关联关系
  Role.associate = () => {
    app.model.Role.hasMany(app.model.User, { foreignKey: 'role_id', targetKey: 'id'});
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