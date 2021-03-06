// 其他模块配置
const sequelizeConfig = require('./sequelize')
const koaBodyConfig = require('./koaBody')

// https://yq.aliyun.com/articles/609447 egg
// https://new01.cn/blog/new005-1/ config
module.exports = appInfo => {
  
  const config = exports = {};
  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1541994609332_7211';
  // middleware
  config.middleware = ['jwt', 'body', 'visit'];
  // koa-jwt
  config.jwt = {
    enable: true,
    ignore: ['/api/user/login', '/api/user/register', '/public', '/api/support'],
    secret: 'sign_text'
  }
  // koa-body
  config.body = koaBodyConfig
  config.visit = {
    enable: true
  }
  // multipart
  config.multipart = {
    fileExtensions: ['.txt', '.md', '.ppt', '.doc', '.rar', '.zip', '.xlsx']
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
    }
  }
  // 数据库
  config.mysql = {
    enable: false,
    // 单数据库信息配置
    client: {
      host: 'localhost',
      port: '3306',
      user: 'root',
      password: 'minagi626QQ',
      database: 'dev',
    },
    app: true, // 是否加载到 app 上，默认开启
    agent: false // 是否加载到 agent 上，默认关闭
  }
  // Sequelize
  config.sequelize = sequelizeConfig;
  // joi
  config.joi = {
    options: {},
    locale: {
        'zh-cn': {}
    },
    throw: true, // 校验出错是是否自动抛出错误
    throwHandle: (error) => { return error; }, // throw 为 true 时对抛出的错误做格式化处理
    errorHandle: (error) => { return error; }, // throw 为 false 时错误会作为结果返回，默认 { error, value }，此函数可以对错误做格式化  
    resultHandle: (result) => { return result; } // 对返回结果做处理的函数，默认返回结果 { error, value 
  }
  // cluster
  config.cluster = {
    listen: {
      port: 3000
    }
  }

  return config;
};
