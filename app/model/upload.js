/*
 * @Description: 文件上传相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 17:52:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-21 11:43:14
 */

module.exports = app => {

  const { INTEGER, STRING } = app.Sequelize;
  
  const Upload = app.model.define('Upload', {
    id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    user_id: {
      type: INTEGER,
      comment: 'user_id'
    },
    tag: {
      type: STRING,
      comment: '分类标记'
    },
    filename: {
      type: STRING,
      comment: '原始文件名'
    },
    mimeType: {
      type: STRING,
      comment: '文件mime类型'
    },
    encoding: {
      type: STRING,
      comment: '文件编码'
    },
    size: {
      type: INTEGER,
      comment: '文件大小'
    },
    resource: {
      type: STRING,
      comment: '文件路径'
    },
    relname: {
      type: STRING,
      comment: '存储的文件名',
      primaryKey: true
    },
    src: {
      type: INTEGER,
      comment: '相对资源路径'
    }
  }, {
    tableName: 'upload_list',
    comment: '上传信息',
  })

  return Upload
}