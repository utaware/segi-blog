'use strict';

module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1541994609332_7211';

  // add your config here
  config.middleware = [];
  // config.koaJwt = {
  //   enable: true,
  //   package: "koa-jwt",
  //   ignore: ['/api/user', '/public'],
  //   secret: 'sign_text'
  // }
  config.jwt = {
    secret: 'sign_text',
    // property: 'auth',
    ignore: ['/api/user', '/public']
  }
  // 模板引擎
  config.view = {
    // 默认渲染引擎
    defaultViewEngine: 'nunjucks',
    // 遍历查找相关的渲染引擎
    mapping: {
      '.tpl': 'nunjucks'
    }
  };
  // csrf
  config.security = {
    csrf: {
      headerName: 'x-csrf-token', // 通过 header 传递 CSRF token 的默认字段为 x-csrf-token
    }
  }
  // 数据库
  config.mysql = {
    // 单数据库信息配置
    client: {
      // host
      host: 'localhost',
      // 端口号
      port: '3306',
      // 用户名
      user: 'root',
      // 密码
      password: 'minagi626QQ',
      // 数据库名
      database: 'dev',
    },
    // 是否加载到 app 上，默认开启
    app: true,
    // 是否加载到 agent 上，默认关闭
    agent: false
  }

  return config;
};
