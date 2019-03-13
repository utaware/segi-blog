
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
    privilege_type: text.max(32),
    privilege_remark: remark.max(32),
    privilege_level: level.min(0).max(4)
  }),

  // 删除

  destroy: group({
    privilege_id: id
  }),

  // 查看
  
  show: group({
    privilege_id: id
  }),

  // 恢复

  recovery: group({
    privilege_id: id
  }),

  // 更新

  update: group({
    privilege_id: id,
    privilege_type: text.max(32),
    privilege_remark: remark.max(32),
    privilege_level: level.min(0).max(4)
  })

}