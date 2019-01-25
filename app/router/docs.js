module.exports = (app) => {

  const { router, controller } = app

  // docs => 文档相关
  router.post('/api/docs/upload', controller.docs.upload) // 上传文档
  router.put('docs', '/api/docs', controller.docs)
  router.resources('docs', '/api/docs', controller.docs)
  
}