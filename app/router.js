module.exports = app => {

  const { router, controller } = app;

  // home => test
  router.get('/api/home', controller.home.index)

  require('./router/user')(app)
  require('./router/share')(app)
  require('./router/upload')(app)
  require('./router/info')(app)
  require('./router/comment')(app)
  require('./router/docs')(app)
  require('./router/role')(app)
  require('./router/privilege')(app)
  require('./router/docsType')(app)
  require('./router/support')(app)
  require('./router/admin')(app)
  require('./router/roleGroup')(app)

  // database => 数据库相关
  router.delete('/api/database/truncate', controller.database.truncate) // 重置表数据
};
