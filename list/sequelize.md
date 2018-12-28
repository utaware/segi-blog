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

## Virtual类型做虚拟数据处理

定义假属性可以使用访问器或定义为VIRTUAL类型两种方式，Virtual类型可以验证而访问器则不能。

## Getters & setters - 访问器&设置器

* 做为一个属性定义
* 做为模型选项

```js
// 为属性定义
var Employee = sequelize.define('employee', {
  name:  {
    type     : Sequelize.STRING,
    allowNull: false,
    get      : function()  {
      var title = this.getDataValue('title');
      // 'this' allows you to access attributes of the instance
      return this.getDataValue('name') + ' (' + title + ')';
    },
  },
  title: {
    type     : Sequelize.STRING,
    allowNull: false,
    set      : function(val) {
      this.setDataValue('title', val.toUpperCase());
    }
  }
});
// 为模型定义
var Foo = sequelize.define('foo', {
  firstname: Sequelize.STRING,
  lastname: Sequelize.STRING
}, {
  getterMethods   : {
    fullName       : function()  { return this.firstname + ' ' + this.lastname }
  },

  setterMethods   : {
    fullName       : function(value) {
        var names = value.split(' ');

        this.setDataValue('firstname', names.slice(0, -1).join(' '));
        this.setDataValue('lastname', names.slice(-1).join(' '));
    },
  }
});
```

