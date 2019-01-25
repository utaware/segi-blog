module.exports = (app) => {

  const { router, controller } = app
  
  // support => 附属支持相关
  router.get('/api/support/checkCode', controller.support.checkCode)
  router.post('/api/support/email', controller.support.sendEmail)
  
}