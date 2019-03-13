// 依据common所继承的校验规则
const common = require('./common')

const { id, text, group, pageNo, pageLimit } = common

const alias = {

  // 内容
  content: text,
  
  // 备注
  remark: text,
  
  // 类型
  type: text,
  
  // 分页
  page: group({ pageNo, pageLimit })

}

const rules = Object.assign({}, common, alias)

module.exports = rules