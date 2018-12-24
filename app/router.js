'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;

  // home => test
  router.get('/api/home', controller.home.index)

  // support => 生成验证码
  router.get('/api/support/checkCode', controller.support.checkCode)
  router.post('/api/support/email', controller.support.sendEmail)

  // user => 用户相关
  router.post('/api/user/register', controller.user.register) // 注册
  router.post('/api/user/login', controller.user.login) // 登录
  router.post('/api/user/forget', controller.user.forget) // 忘记密码
  router.put('/api/user/modify', controller.user.modify) // 修改密码
  router.put('/api/user/email', controller.user.bindEmail) // 更改邮箱
  router.get('/api/user/getAll', controller.user.getAll) // 获取所有用户
  router.delete('/api/user/cancellation', controller.user.cancellation) // 用户账户注销
  router.put('/api/user/recovery', controller.user.recovery) // 用户账户恢复

  // role => 角色相关
  router.resources('role', '/api/role', controller.role) // 角色相关

  // privilege => 权限相关
  router.resources('privilege', '/api/privilege', controller.privilege) // 角色相关
  
  // docs => 文档相关
  router.post('/api/docs/upload', controller.docs.upload) // 上传文档

  // info => 用户信息
  router.post('/api/upload/avatar', controller.user.avatar) // 上传头像
};
