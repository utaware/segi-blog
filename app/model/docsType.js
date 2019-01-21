/*
 * @Description: 文档分类相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 18:16:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-21 11:43:57
 */

module.exports = app => {

  const { INTEGER, STRING } = app.Sequelize;

  const Docs_type = app.model.define('Docs_type', {
    id: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true,
      unique: true,
      comment: 'id'
    },
    value: {
      type: STRING(24),
      allowNull: false,
      comment: '对应选择值'
    },
    name: {
      type: STRING(24),
      allowNull: false,
      comment: '文档对应类别名'
    },
    remark: {
      type: STRING(24),
      allowNull: false,
      comment: '类别名说明'
    }
  }, {
    tableName: 'docs_type',
    comment: '文档类型分类',
  })

  return Docs_type
}