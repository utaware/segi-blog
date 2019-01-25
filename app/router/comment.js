module.exports = (app) => {

  const { router, controller } = app

  // comment => 评论相关
  router.get('/api/comment/getAll', controller.comment.index) // 查询所有评论
  router.post('/api/comment/create', controller.comment.create) // 新增评论评论
  router.delete('/api/comment/destroy', controller.comment.destroy) // 本人删除评论
  
}