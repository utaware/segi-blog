'use strict';

module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1541994609332_7211';

  // add your config here
  config.middleware = ['jwt'];
  config.jwt = {
    enable: true,
    package: "koa-jwt",
    ignore: ['/api/user', '/public'],
    secret: 'sign_text'
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
      ignore: ['/api/user/login'],
      useSession: true, // 默认为 false，当设置为 true 时，将会把 csrf token 保存到 Session 中
      cookieName: 'csrfToken', // Cookie 中的字段名，默认为 csrfToken
      sessionName: 'csrfToken' // Session 中的字段名，默认为 csrfToken
      // useSession: false,          // if useSession set to true, the secret will keep in session instead of cookie
      // ignoreJSON: false,          // skip check JSON requests if ignoreJSON set to true
      // cookieName: 'csrfToken',    // csrf token's cookie name
      // sessionName: 'csrfToken',   // csrf token's session name
      // headerName: 'x-csrf-token', // request csrf token's name in header
      // bodyName: '_csrf',          // request csrf token's name in body
      // queryName: '_csrf',         // request csrf token's name in query
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
