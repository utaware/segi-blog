module.exports = (app) => {

  const { router, controller } = app

  // admin => 管理员相关
  router.get('/api/admin/getAll', controller.admin.getAll) // 获取所有用户
  router.delete('/api/admin/cancellation', controller.admin.cancellation) // 用户账户注销
  router.put('/api/admin/recovery', controller.admin.recovery) // 用户账户恢复
  router.post('/api/admin/increase', controller.admin.increase) // 新增用户

}