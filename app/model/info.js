/*
 * @Description: 用户信息相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:22:48
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-25 10:41:01
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
    address: {
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
    tableName: 'USER_INFO',
    comment: '用户详细信息'
  })
  
  // 关联关系
  Info.associate = () => {
    app.model.Info.belongsTo(app.model.User, { foreignKey: 'user_id', targetKey: 'user_id', hooks: true, onDelete: 'cascade'})
  }

  // 单个用户详细信息
  Info.$query = async (user_id, exclude = ['user_id', 'created_at', 'updated_at', 'deleted_at'], paranoid = true) => {
    const result = await app.model.Info.findOne({
      attributes: { exclude },
      where: {user_id},
      paranoid
    })
    return result.get({plain: true})
  }

  return Info
}