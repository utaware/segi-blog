'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;

  // 附加功能
  router.get('/', controller.home.index)
  router.get('/github', controller.home.github);
  router.get('/vuepress', controller.home.vuepress);

  // support => 生成验证码
  router.get('/api/support/checkCode', controller.support.checkCode)
  router.post('/api/support/email', controller.support.sendEmail)

  // user => 用户相关
  router.post('/api/user/register', controller.user.register) // 注册
  router.post('/api/user/login', controller.user.login) // 登录
  router.post('/api/user/forget', controller.user.forget) // 忘记密码
  router.put('/api/user/modify', controller.user.modify) // 修改密码
  router.put('/api/user/email', controller.user.email) // 更改邮箱

  // docs => 文档相关
  router.post('/api/docs', controller.docs.index)

  // info => 用户信息
  router.post('/api/upload/avatar', controller.user.avatar)
};
