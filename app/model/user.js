/*
 * @Description: user-model
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 10:43:43
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-18 17:07:33
 */

// https://github.com/caiya/vuejs-admin-server/blob/master/app/model/user.js

const bcrypt = require('bcrypt')
const moment = require('moment')
// const precise = require('moment-precise-range-plugin')
// https://github.com/codebox/moment-precise-range 用以获取精确的时间差字符串
moment.locale('zh-cn'); 
const saltRounds = 10

module.exports = app => {
  // 类型获取
  const Sql = app.Sequelize
  const { INTEGER, STRING, DATE } = Sql
  // define
  const User = app.model.define('user', {
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
      comment: '登录密码加密hash',
      set (v) {
        this.setDataValue('hash', bcrypt.hashSync(v, saltRounds))
      }
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
      min: 1,
      max: 13,
      comment: '用户权限'
    },
    role: {
      type: INTEGER,
      allowNull: false,
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
    // 表名
    tableName: 'user_list',
    // 注释
    comment: '用户列表',
    // 额外获取
    getterMethods: {},
    // 额外设置
    setterMethods: {},
    // 钩子
    hooks: {
      afterDestroy () {
        app.log('删除钩子被触发--user')
      },
      afterUpdate () {
        app.log('更新钩子被触发--user')
      },
      afterRestore () {
        app.log('恢复钩子被触发--user')
      }
    }
  })

  // 校验密码与hash匹配是否正确
  User.compareHash = async (password, condition) => {
    const result = await User.findOne(condition)
    const hash = result.get({plain: true}).hash
    const contrast = await bcrypt.compare(password, hash)
    return contrast
  }

  // 关联关系
  User.associate = () => {
    app.model.User.hasOne(app.model.Info, { foreignKey: 'user_id', targetKey: 'user_id', onDelete: 'CASCADE', as: 'i'});
    app.model.User.hasMany(app.model.Docs, { foreignKey: 'user_id', targetKey: 'user_id', as: 'UserDocs' })
    app.model.User.belongsTo(app.model.Role, { foreignKey: 'role', targetKey: 'id', as: 'r'});
    app.model.User.belongsTo(app.model.Privilege, { foreignKey: 'privilege', targetKey: 'id', as: 'p'});
  }

  return User
}