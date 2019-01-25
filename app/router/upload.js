module.exports = (app) => {

  const { router, controller } = app

  // upload => 上传相关
  router.post('/api/upload/avatar', controller.upload.avatar)
  router.post('/api/upload/share', controller.upload.share)
  router.delete('/api/upload/deleteOne', controller.upload.deleteOne)
  
}