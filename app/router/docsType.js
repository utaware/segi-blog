module.exports = (app) => {

  const { router, controller } = app

  // docsType => 文档类型
  router.resources('docsType', '/api/docsType', controller.docsType)
  
}