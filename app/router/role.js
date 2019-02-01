module.exports = (app) => {

  const { router, controller } = app

  // role => 角色相关
  router.post('/api/role/create', controller.role.create)
  router.delete('/api/role/destroy', controller.role.destroy)
  router.get('/api/role/getAll', controller.role.getAll)
  router.get('/api/role/show', controller.role.show)
  router.put('/api/role/update', controller.role.update)
  router.put('/api/role/recovery', controller.role.recovery)
}