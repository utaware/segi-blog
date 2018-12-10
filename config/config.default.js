const path = require('path')
const sequelizeConfig = require('./sequelize')

module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1541994609332_7211';

  // add your config here
  config.middleware = ['jwt', 'body'];
  config.jwt = {
    enable: true,
    ignore: ['/api/user/login', '/api/user/register', '/public'],
    secret: 'sign_text'
  }
  // http://www.ptbird.cn/koa-body.html
  // https://blog.csdn.net/simple__dream/article/details/80890696
  config.body = {
    enable: true,
    multipart: true,
    match: (ctx) => {
      return ctx.request.method === 'POST' && ctx.request.header['content-type'].includes('multipart/form-data')
    },
    formidable: {
      maxFieldsSize: 5 * 1024 * 1024,
      // 默认存储位置
      uploadDir: `${path.resolve(__dirname, '..', 'app/public/upload')}`,
      keepExtensions: true
    }
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
      enable: false
      // ignore: ['/api/user/login'],
      // cookieName: 'csrfToken', // Cookie 中的字段名，默认为 csrfToken
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
  // 错误处理
  config.onerror = {
    // 所有响应类型的错误处理方法
    all (err, ctx) {
      ctx.status = 500
      ctx.body = {
        code: -1,
        message: err.message || err
      }
    }
  }
  // Sequelize
  config.sequelize = sequelizeConfig;
  // https://www.npmjs.com/package/egg-joi
  return config;
};
