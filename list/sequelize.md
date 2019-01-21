## 增删查改

- 查询
  - findAll => []
  - findOne => {} || null
  - findById => {} || null
  - findOrCreate => {} 查询或者创建
  - findAndCountAll => { count: 匹配的总数, rows: 匹配的分页的数据 } 
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

## 自增自减的实现

[docs](https://itbilu.com/nodejs/npm/N1pPjUdMf.html)

* instance.increment(fields, [options]) - 字段值自增
* nstance.decrement(fields, [options]) - 字段值自减

```js
user.increment(['age', 'number'], {by:2}).then(function(user){
 console.log('success');
})
```

increment()和decrement()都是针对单个实例进行自增或自减操作的，也就是说操作的数据为数据库中的一行数据。要实现类似如下批量自增、自减操作，就无法通过Instance操作

```sql
UPDATE `user` SET `age`=`age` + 1 WHERE `number` > 10;
```

这时，我们可以通过Model.update()并借助sequelize中的顶级方法sequelize.literal()来实现：

sequelize.literal()方法用于创建一个字面量对象，该对象（val）会被直接传入所生成的SQL语句中，而不会进行任何转义。

如，将number大于10的用户年龄增加1：

```js
User.update({sex:sequelize.literal('`age` +1')}, {where:{number:{$gt:10}}}).then(function(user){
 console.log('success');
})
```

## issues

[sequelize 删除钩子触发](https://github.com/sequelize/sequelize/issues/2547)

添加删除和恢复钩子的时候, 首先触发的会是批量删除和恢复的钩子,即 
beforeBulkRestore / beforeBulkUpdate / beforeBulkDestroy
afterBulkRestore / afterBulkUpdate / afterBulkDestroy
这时候单个实例的destroy和restore钩子并不会触发
如果希望单个的钩子触发, 需要添加individualHooks: true

## 从实例中获取干净的数据

```js
User.get({plain: true})
```

## log

> get 坑点

1. 模型关联关系的时候(查询所有用户信息的时候)
2. 关于时间错误的问题(timeZone时区设置)
3. 钩子函数触发问题(destory, restore) => 事务处理
4. 事务的写法
```js
try {
  const transaction = await app.model.transaction()
  const hash = await ctx.service.bcrypt.hash(password)
  const { user_id } = await app.model.User.create({ username, hash, email }, {transaction})
  await app.model.Info.create({ alias: username, user_id}, {transaction})
  await app.model.Total.increment(['total'], { where: { category: 'user' }, transaction})
  await transaction.commit();
  return ctx.end(true, '用户信息创建成功')
} catch (err) {
  await transaction.rollback();
  return ctx.end(false, '用户信息创建失败', {err})
}
```

## 

添加钩子的时候存在的两种方式

1. Sequelize.options.define (默认钩子)
```js
const sequelize = new Sequelize(..., {
  define: {
    hooks: {
      beforeCreate: () => {
        // Do stuff
      }
    }
  }
});
```

2. Sequelize.addHook（永久挂钩）
```js
sequelize.addHook('beforeCreate', () => {
  // Do stuff
});

User.beforeCreate(user => {
  if (user.accessLevel > 10 && user.username !== "Boss") {
    throw new Error("You can't grant this user an access level above 10!")
  }
})
```