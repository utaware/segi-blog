module.exports = (app) => {

  const { router, controller } = app

  // privilege => 权限相关
  router.post('/api/privilege/create', controller.privilege.create)
  router.delete('/api/privilege/destroy', controller.privilege.destroy)
  router.get('/api/privilege/getAll', controller.privilege.getAll)
  router.get('/api/privilege/show', controller.privilege.show)
  router.put('/api/privilege/update', controller.privilege.update)
  router.put('/api/privilege/recovery', controller.privilege.recovery)
  
}