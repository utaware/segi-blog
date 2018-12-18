'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  // support => 生成验证码
  router.get('/api/support/checkCode', controller.support.checkCode)
  router.post('/api/support/email', controller.support.sendEmail)

  // user => 用户相关
  router.post('/api/user/register', controller.user.register) // 注册
  router.post('/api/user/login', controller.user.login) // 登录
  router.post('/api/user/forget', controller.user.forget) // 忘记密码
  router.put('/api/user/modify', controller.user.modify) // 修改密码
  router.put('/api/user/email', controller.user.email) // 更改邮箱
  router.get('/api/user/getAll', controller.user.getAll) // 获取所有用户

  // position => 职位相关
  router.resources('role', '/api/role', controller.role) // 职位相关
  
  // docs => 文档相关
  router.post('/api/docs/upload', controller.docs.upload) // 上传文档

  // info => 用户信息
  router.post('/api/upload/avatar', controller.user.avatar) // 上传头像
};
