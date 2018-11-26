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

  router.resources('user', '/api/user', controller.user)
};
