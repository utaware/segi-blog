/*
 * @Description: user-model
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 10:43:43
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-27 10:42:23
 */

// https://github.com/caiya/vuejs-admin-server/blob/master/app/model/user.js

module.exports = app => {
  // 类型获取
  const { INTEGER, STRING, DATE } = app.Sequelize;
  // define
  const User = app.model.define('User', {
    // 表结构
    user_id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: '用户id'
    },
    username: {
      type: STRING(24),
      allowNull: false,
      validate: {
        // 4-16位 字母开头 数字和字母的组合
        is: {
          args: /^[a-zA-Z][a-zA-Z0-9]{3,15}$/,
          msg: '用户名必须为4-16位字母与数字的组合'
        }  
      },
      comment: '登录用户名'
    },
    hash: {
      type: STRING,
      allowNull: false,
      comment: '登录密码加密hash'
    },
    email: {
      type: STRING,
      allowNull: true,
      unique: true,
      validate: {
        isEmail: {
          args: true,
          msg: '邮箱格式错误'
        }
      },
      comment: '用户邮箱'
    },
    privilege: {
      type: INTEGER,
      allowNull: false,
      defaultValue: 1,
      min: 1,
      max: 13,
      comment: '用户权限'
    },
    role: {
      type: INTEGER,
      allowNull: false,
      defaultValue: 1,
      min: 1,
      max: 4,
      comment: '用户角色'
    },
    login_time: {
      type: DATE,
      allowNull: true,
      defaultValue: null,
      comment: '用户最后登录时间'
    }
  }, {
    // 额外配置
    // 表名
    tableName: 'user_list',
    // 注释
    comment: '用户列表',
    // 钩子函数
    hooks: {
      // 软删除后
      beforeCreate: async (u, options) => {
        app.log('beforeCreate-user')
      },
      // 创建后
      afterCreate: async (u, options) => {
        return await app.model.Info.create({
          alias: u.username,
          user_id: u.user_id
        })
      },
      // 软删除后
      afterDestroy: async (u, options) => {
        app.log('afterDestroy-user')
      },
      // 更新后
      afterUpdate: async (u, options) => {
        app.log('afterUpdate-user')
      },
      // 更新前
      afterSave: async (u, options) => {
        app.log('afterSave-user')
      },
      // 恢复后
      afterRestore: async (u, options) => {
        app.log('afterRestore-user')
      },
      // 插入后
      afterUpsert: async (u, options) => {
        app.log('afterUpsert-user')
      }
    }
  })

  User.associate = () => {
    app.model.User.hasOne(app.model.Info, { foreignKey: 'user_id', targetKey: 'user_id', onDelete: 'cascade', hooks: true, as: 'i'});
    app.model.User.belongsTo(app.model.Role, { foreignKey: 'role', targetKey: 'id', as: 'r'});
    app.model.User.belongsTo(app.model.Privilege, { foreignKey: 'privilege', targetKey: 'id', as: 'p'});
  }

  return User
}