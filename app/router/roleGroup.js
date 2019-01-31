module.exports = (app) => {

  const { router, controller } = app

  // 角色分组 => 角色相关
  router.get('/api/roleGroup', controller.roleGroup.index)
  router.post('/api/roleGroup', controller.roleGroup.create)
  router.put('/api/roleGroup', controller.roleGroup.update)
  router.delete('/api/roleGroup', controller.roleGroup.destroy)
  
}