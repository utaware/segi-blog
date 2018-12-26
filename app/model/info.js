/*
 * @Description: 用户信息相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:22:48
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-26 18:07:55
 */

module.exports = app => {
  // 类型获取
  const { INTEGER, STRING, DATE } = app.Sequelize;

  const Info = app.model.define('Info', {
    // id
    user_id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: '用户id'
    },
    alias: {
      type: STRING(24),
      allowNull: true,
      defaultValue: null,
      unique: true,
      comment: '昵称'
    },
    adress: {
      type: STRING,
      allowNull: true,
      defaultValue: null,
      comment: '地址'
    },
    avatar: {
      type: STRING,
      allowNull: true,
      defaultValue: null,
      comment: '头像'
    },
    phone: {
      type: STRING(12),
      allowNull: true,
      defaultValue: null,
      comment: '电话'
    },
    birthday: {
      type: DATE,
      allowNull: true,
      defaultValue: null,
      comment: '生日'
    }
  }, {
    tableName: 'user_info',
    comment: '用户详细信息',
    hooks: {
      // 创建后
      afterCreate: async (u, options) => {
        app.log('afterCreate-info')
      },
      // 软删除后
      afterDestroy: async (u, options) => {
        app.log('afterDestroy-info')
      },
      // 恢复前
      afterRestore: async (u, options) => {
        app.log('afterRestore-info')
      },
      // 更新前
      beforeUpdate: async (u, options) => {
        app.log('beforeUpdate-info')
      }
    }
  })
  
  Info.associate = () => {
    app.model.Info.belongsTo(app.model.User, { foreignKey: 'user_id', targetKey: 'user_id', onDelete: 'cascade', hooks: true, as: 'i'})
  }

  return Info
}