// 依据common所继承的校验规则
const common = require('./common')

const { id, text } = common

const alias = {

  // 权限id
  privilege_id: id,
  // 角色id
  role_id: id,
  // 文档id
  docs_id: id,
  // 内容
  content: text,
  // 备注
  remark: text,
  // 类型
  type: text

}

const rules = Object.assign({}, common, alias)

module.exports = rules