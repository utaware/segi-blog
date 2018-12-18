// module
const { Service } = require('egg')
// constant
const DOCS_TABLE = 'upload_docs'
// service
class DocsService extends Service {
  // 添加文档到数据库
  async increase (info) {
    // user_id path name size content title
    const { ctx, app } = this
    // 插入数据
    return await app.mysql.insert(DOCS_TABLE, info).then((r) => {
      return { id: r.insertId }
    }).catch((err) => {
      ctx.log(err.sqlMessage)
      return ctx.throw(500, '数据库文档插入错误')
    })
  }
}

module.exports = DocsService