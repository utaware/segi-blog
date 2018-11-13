---
title: hello world
description: 这是一个关于yaml-md的尝试
author: utaware 
---

## title

```
行内式：[百度一下](http://www.baidu.com)
参数式：[baidu]: http://www.baidu.com '百度'
```

<http://example.com/>

[baidu]: http://www.baidu.com '百度'

这里是[baidu]

!(图片)[~@img]

图片和链接的方式基本相同 行内式前需要加上！

## 代码框

单行可以用``包起来
多行使用
```js
const a = {}
let b = function () {
  return a
}
console.log('hello world')
```
