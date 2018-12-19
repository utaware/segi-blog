const path = require('path')
const sequelizeConfig = require('./sequelize')

module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1541994609332_7211';

  // add your config here
  config.middleware = ['jwt', 'body'];
  // koa-jwt config
  config.jwt = {
    enable: true,
    ignore: ['/api/user/login', '/api/user/register', '/public', '/api/support'],
    secret: 'sign_text'
  }
  // http://www.ptbird.cn/koa-body.html
  // https://blog.csdn.net/simple__dream/article/details/80890696
  config.body = {
    enable: true,
    // 只处理multipart/form-data类型表单
    match: (ctx) => {
      return ctx.request.method === 'POST' && ctx.request.header['content-type'].includes('multipart/form-data')
    },
    // 将请求体打到原生 node.js 的ctx.req中 Boolean
    patchNode: true,
    // 将请求体打到 koa 的 ctx.request 中 Boolean
    patchKoa: true,
    // JSON 数据体的大小限制 String / Integer	
    jsonLimit: '1mb',
    // 限制表单请求体的大小	String / Integer	
    formLimit: '56kb',
    // 限制 text body 的大小	String / Integer
    textLimit: '56kb',
    // 表单的默认编码	String
    encoding: 'utf-8',
    // 是否支持 multipart-formdate 的表单	Boolean
    multipart: true,
    // 是否支持 urlencoded 的表单	Boolean
    urlencoded: false,
    // 是否解析 text/plain 的表单	Boolean
    text: false,
    // 是否解析 json 请求体	Boolean
    json: false,
    // 是否使用 json 严格模式，true 会只处理数组和对象	Boolean
    jsonStrict: true,
    // 配置更多的关于 multipart 的选项	Object
    formidable: {
      // 限制字段的数量	Integer
      maxFields: 1000,
      // 限制字段的最大大小	Integer
      maxFieldsSize: 10 * 1024 * 1024,
      // 文件上传的文件夹	String
      uploadDir: `${path.resolve(__dirname, '..', 'app/public/upload')}`,
      // 保留原来的文件后缀	Boolean
      keepExtensions: true,
      // 如果要计算文件的 hash，则可以选择 md5/sha1	String
      hash: false,
      // 是否支持多文件上传	Boolean
      multipart: true,
      // 文件上传前的一些设置操作	Function	
      onFileBegin: () => {}
    },
    // 错误处理	Function
    onError: () => {},
    // 严格模式,启用后不会解析  GET, HEAD, DELETE  请求 Boolean
    stict: true
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
    enable: false,
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
      ctx.end(false, 200, err.message)
    }
  }
  // Sequelize
  config.sequelize = sequelizeConfig;
  // https://www.npmjs.com/package/egg-joi
  return config;
};
