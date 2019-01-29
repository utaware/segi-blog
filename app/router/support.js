module.exports = (app) => {

  const { router, controller } = app
  
  // support => 附属支持相关
  router.post('/api/support/sendCheckCode', controller.support.sendCheckCode)
  
}