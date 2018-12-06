'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  const parser = app.middleware.body

  router.get('/', controller.home.index)
  router.get('/github', controller.home.github);
  router.get('/vuepress', controller.home.vuepress);
  router.post('/api/identifyingCode', controller.support.checkCode)

  // user => 用户相关
  router.post('/api/user/register', controller.user.register)
  router.post('/api/user/login', controller.user.login)
  router.post('/api/user/modify', controller.user.modify)
  router.post('/api/user/forget', controller.user.forget)

  // docs => 文档相关
  router.post('/api/docs', controller.docs.index)

  // info => 用户信息
  router.post('/api/upload/avatar', controller.user.avatar)
};
