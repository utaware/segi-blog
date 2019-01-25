/*
 * @Description: 邮件发送相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 18:04:22
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-21 11:43:52
 */

module.exports = app => {

  const { INTEGER, STRING, TEXT } = app.Sequelize;

  const Eamil = app.model.define('Email', {
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
    tableName: 'EMAIL_TABLE',
    comment: '邮件发送记录',
  })

  return Eamil
}