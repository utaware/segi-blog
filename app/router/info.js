module.exports = (app) => {

  const { router, controller } = app

  // info => 用户信息
  router.put('/api/info/update', controller.info.update) // 完善用户信息
  router.get('/api/info/show', controller.info.show) // 完善用户信息
  
}