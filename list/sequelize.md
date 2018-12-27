## 增删查改

- 查询
  - findAll => []
  - findOne => {} || null
  - findById => {} || null
- 删除
  - destroy
  - restore => [] (受影响的内容)
- 增加
  - create => {} (新增信息)
- 更改
  - update

## config

需要对字段限制的时候: 
```js
user.update(
  {'emp_id': '33', 'nick': '小白'}
  {'fields': ['nick']}
)
```

paranoid => 偏执模式

如果开启了该模式, destroy的时候不会执行DELETE语句, 而是执行一个UPDATE语句, 将deleted_at字段设置为当前时间(开始为NULL). 我们可以使用user.destroy({force: true})来强制删除, 从而执行DELETE语句进行物理删除

排除某些字段:

```js
app.model.DocsType.findAll({
  attributes: {exclude: ['created_at', 'updated_at', 'deleted_at']}
})
```