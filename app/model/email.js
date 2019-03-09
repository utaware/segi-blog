/*
 * @Description: 邮件发送相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 18:04:22
 * @LastEditors: utaware
 * @LastEditTime: 2019-03-09 17:24:10
 */

module.exports = app => {

  const Sql = app.Sequelize
  const { INTEGER, STRING, TEXT } = app.Sequelize;

  const Email = app.model.define('Email', {
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

  // 查询距离现在时间段最新发送的邮件
  Email.findLastestEmail = async (receiver, time = '15 MINUTE') => {
    
    return await Email.findOne({ 

      where: { $and: [ { receiver }, Sql.where(Sql.fn('DATE_SUB', Sql.fn('NOW'), Sql.literal(`INTERVAL ${time}`)), '<=', Sql.col('created_at')) ] }
   
    })
  
  }

  // 查询短期内邮件发送数量
  Email.countSendEmailNumber = async (receiver, time = '1 DAY') => {
    
    const { count } = await Email.findAndCount({ 

      where: { $and: [ { receiver }, Sql.where(Sql.fn('DATE_SUB', Sql.fn('NOW'), Sql.literal(`INTERVAL ${time}`)), '<=', Sql.col('created_at')) ] }
   
    })

    return count
  
  }

  return Email
}