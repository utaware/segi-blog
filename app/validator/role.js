
const mixins = require('./mixins')

const { 
  group,
  level,
  remark,
  text,
  id
} = mixins

module.exports = {

  // 新增

  created: group({
    role_type: text.max(32),
    role_remark: remark.max(32),
    group_id: id
  }),

  // 删除

  destroy: group({
    role_id: id
  }),

  // 查看
  
  show: group({
    role_id: id
  }),

  // 恢复

  recovery: group({
    role_id: id
  }),

  // 更新

  update: group({
    role_id: id,
    role_type: text.max(32),
    role_remark: remark.max(32),
    group_id: id
  })

}