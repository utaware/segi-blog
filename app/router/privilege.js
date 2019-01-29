module.exports = (app) => {

  const { router, controller } = app

  // privilege => 权限相关
  router.put('/api/privilege/recovery', controller.privilege.recovery)
  router.resources('privilege', '/api/privilege', controller.privilege)
  
}