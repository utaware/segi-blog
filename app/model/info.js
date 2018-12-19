/*
 * @Description: 用户信息相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:22:48
 * @LastEditors: utaware
 * @LastEditTime: 2018-12-19 17:44:31
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
    freezeTableName: true,
    timestamps: true,
    tableName: 'user_info',
    comment: '用户详细信息',
    underscored: true
  })
  
  return Info
}