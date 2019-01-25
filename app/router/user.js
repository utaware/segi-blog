module.exports = (app) => {

  const { router, controller } = app

  // user => 用户相关
  router.post('/api/user/register', controller.user.register) // 注册
  router.post('/api/user/login', controller.user.login) // 登录
  router.post('/api/user/forget', controller.user.forget) // 忘记密码
  router.put('/api/user/modify', controller.user.modify) // 修改密码
  router.put('/api/user/email', controller.user.bindEmail) // 更改邮箱
  router.get('/api/user/getList', controller.user.getList) // 获取角色和权限相关内容
  router.get('/api/user/getBreifInfo', controller.user.getBreifInfo) // 获取概览信息
  
}