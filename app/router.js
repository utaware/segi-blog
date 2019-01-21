'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;

  // home => test
  router.get('/api/home', controller.home.index)

  // md => md相关
  router.get('/api/support/md/github', controller.support.github)
  router.get('/api/support/md/vuepress', controller.support.vuepress)

  // support => 附属支持相关
  router.get('/api/support/checkCode', controller.support.checkCode)
  router.post('/api/support/email', controller.support.sendEmail)

  // upload => 上传相关
  router.post('/api/upload/avatar', controller.upload.avatar)
  router.post('/api/upload/share', controller.upload.share)
  router.delete('/api/upload/deleteOne', controller.upload.deleteOne)

  // user => 用户相关
  router.post('/api/user/register', controller.user.register) // 注册
  router.post('/api/user/login', controller.user.login) // 登录
  router.post('/api/user/forget', controller.user.forget) // 忘记密码
  router.post('/api/user/increase', controller.user.increase) // 新增用户
  router.put('/api/user/modify', controller.user.modify) // 修改密码
  router.put('/api/user/email', controller.user.bindEmail) // 更改邮箱
  router.get('/api/user/getAll', controller.user.getAll) // 获取所有用户
  router.get('/api/user/getList', controller.user.getList) // 获取所有用户
  router.delete('/api/user/cancellation', controller.user.cancellation) // 用户账户注销
  router.put('/api/user/recovery', controller.user.recovery) // 用户账户恢复
  router.get('/api/user/getBreifInfo', controller.user.getBreifInfo) // 获取概览信息
  router.get('/api/user/query', controller.user.query) // 获取单个用户信息

  // role => 角色相关
  router.put('/api/role/recovery', controller.role.recovery) // 软删除恢复
  router.resources('role', '/api/role', controller.role) // 角色相关

  // privilege => 权限相关
  router.put('/api/privilege/recovery', controller.privilege.recovery) // 软删除恢复
  router.resources('privilege', '/api/privilege', controller.privilege) // 权限相关
  
  // docs => 文档相关
  router.post('/api/docs/upload', controller.docs.upload) // 上传文档
  router.put('docs', '/api/docs', controller.docs)
  router.resources('docs', '/api/docs', controller.docs)

  // share => 分享相关
  router.post('/api/share/create', controller.share.create) // 新增
  router.get('/api/share/query', controller.share.query) // 查询所有分享信息
  router.get('/api/share/cycle', controller.share.cycle) // 查询按期数统计
  router.delete('/api/share/remove', controller.share.remove) // 单条信息删除

  // docsType => 文档类型
  router.resources('docsType', '/api/docsType', controller.docsType)

  // info => 用户信息
  router.put('/api/info/update', controller.info.update) // 完善用户信息
  router.get('/api/info/show', controller.info.show) // 完善用户信息

  // comment => 评论相关
  router.get('/api/comment/getAll', controller.comment.index) // 查询所有评论

  // database => 数据库相关
  router.delete('/api/database/truncate', controller.database.truncate) // 重置表数据
};
