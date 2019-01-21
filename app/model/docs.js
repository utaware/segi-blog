/*
 * @Description: 文档相关
 * @version: 1.0.0
 * @Author: utaware
 * @Date: 2018-12-19 18:16:01
 * @LastEditors: utaware
 * @LastEditTime: 2019-01-21 11:44:02
 */

module.exports = app => {

  const { INTEGER, STRING, TEXT, ENUM } = app.Sequelize;

  const Docs = app.model.define('Docs', {
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
    author: {
      type: STRING(24),
      allowNull: false,
      comment: '作者名'
    },
    comment: {
      type: INTEGER,
      allowNull: false,
      defaultValue: 0,
      comment: '评论数目'
    },
    type: {
      type: INTEGER,
      allowNull: false,
      comment: '文档对应类别'
    },
    title: {
      type: STRING(64),
      allowNull: false,
      comment: '文档标题'
    },
    editor: {
      type: ENUM('md', 'html'),
      allowNull: false,
      comment: '编辑方式'
    },
    md: {
      type: TEXT('medium'),
      allowNull: true,
      comment: '文档内容_md'
    },
    html: {
      type: TEXT('medium'),
      allowNull: true,
      comment: '文档内容_html'
    }
  }, {
    tableName: 'docs_list',
    comment: '文档相关',
  })

  Docs.associate = () => {
    app.model.Docs.belongsTo(app.model.DocsType, { foreignKey: 'type', targetKey: 'id', as: 'DocsType'});
    app.model.Docs.belongsTo(app.model.User, { foreignKey: 'user_id', targetKey: 'user_id', foreignKeyConstraint : true,
    hooks: true, as: 'UserDocs'})
  }

  return Docs
}