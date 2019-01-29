module.exports = (app) => {

  const { router, controller } = app

  // role => 角色相关
  router.put('/api/role/recovery', controller.role.recovery)
  router.resources('role', '/api/role', controller.role)
}