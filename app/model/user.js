/*
 * @Description: user-model
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 10:43:43
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-21 14:46:53
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
    // 不允许调整表名 默认地, sequelize 会自动转换所有传递的模型名字(define 的第一个参数)
    freezeTableName: true,
    // 使用createdAt updatedAt
    timestamps: true,
    // 表名
    tableName: 'user_list',
    // 注释
    comment: '用户列表',
    // 不要使用驼峰式语法,用下划线代替
    underscored: true,
    // 引擎
    // engine: 'InnoDB'
  })

  User.associate = () => {
    app.model.User.belongsTo(app.model.Role, { foreignKey: 'role', targetKey: 'id', as: 'r'});
    app.model.User.belongsTo(app.model.Privilege, { foreignKey: 'privilege', targetKey: 'id', as: 'p'});
  }

  return User
}