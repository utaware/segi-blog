/*
 * @Description: 邮件发送相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 18:04:22
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-18 16:56:05
 */

module.exports = app => {

  const { INTEGER, STRING, TEXT } = app.Sequelize;

  const Eamil = app.model.define('email', {
    id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    messageId: {
      type: STRING,
      allowNull: false,
      comment: 'nodemailerId'
    },
    sender: {
      type: STRING,
      allowNull: false,
      comment: '发送人'
    },
    receiver: {
      type: STRING,
      allowNull: false,
      comment: '接收人'
    },
    content: {
      type: TEXT('long'),
      allowNull: false,
      comment: '发送邮件内容'
    },
    code: {
      type: STRING(12),
      allowNull: true,
      comment: '邮件发送验证码'
    }
  }, {
    freezeTableName: true,
    timestamps: true,
    tableName: 'email_list',
    comment: '邮件发送记录',
    underscored: true
  })

  return Eamil
}