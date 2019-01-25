/*
 * @Description: 用户权限表
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:45:38
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-25 17:13:28
 */

module.exports = app => {
  // 类型获取
  const { INTEGER, STRING, BOOLEAN } = app.Sequelize;

  const Privilege = app.model.define('Privilege', {
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
    },
    create_member: {
      type: BOOLEAN,
      comment: '是否可以添加成员'
    },
    remove_member: {
      type: BOOLEAN,
      comment: '是否可以删除成员'
    },
    update_member: {
      type: BOOLEAN,
      comment: '是否可以更改成员信息'
    },
    query_member: {
      type: BOOLEAN,
      comment: '是否可以获取其他用户信息'
    },
  }, {
    tableName: 'PRIVILEGE_TABLE',
    comment: '用户权限',
  })

  // 关联关系
  Privilege.associate = () => {
    app.model.Privilege.hasMany(app.model.User, { foreignKey: 'privilege_id', targetKey: 'id'});
  }

  return Privilege;
}