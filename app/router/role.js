module.exports = (app) => {

  const { router, controller } = app

  // privilege => 权限相关
  router.put('/api/privilege/recovery', controller.privilege.recovery) // 软删除恢复
  router.resources('privilege', '/api/privilege', controller.privilege) // 权限相关
  
}