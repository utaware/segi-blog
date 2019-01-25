module.exports = (app) => {

  const { router, controller } = app

  // share => 分享相关
  router.post('/api/share/create', controller.share.create) // 新增
  router.get('/api/share/query', controller.share.query) // 查询所有分享信息
  router.get('/api/share/cycle', controller.share.cycle) // 查询按期数统计
  router.delete('/api/share/remove', controller.share.remove) // 单条信息删除
  
}