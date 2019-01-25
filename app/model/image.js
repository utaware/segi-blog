/*
 * @Description: 用户图片上传相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 18:16:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-25 10:45:05
 */

module.exports = app => {

  const { INTEGER, STRING } = app.Sequelize;

  const Image = app.model.define('Image', {
    id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    user_id: {
      type: INTEGER,
      allowNull: false,
      comment: '上传用户user_id'
    },
    path: {
      type: STRING,
      allowNull: false,
      comment: '图片上传路径'
    },
    name: {
      type: STRING,
      allowNull: false,
      comment: '原始图片名'
    },
    size: {
      type: STRING,
      allowNull: false,
      comment: '图片大小'
    },
    mime_type: {
      type: STRING(24),
      allowNull: false,
      comment: '文件类型'
    },
    src: {
      type: STRING,
      allowNull: false,
      comment: '资源路径'
    }
  }, {
    freezeTableName: true,
    timestamps: true,
    tableName: 'IMAGE_TABLE',
    comment: '用户图片上传',
    underscored: true
  })

  return Image
}