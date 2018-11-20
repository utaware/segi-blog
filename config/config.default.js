'use strict';

module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1541994609332_7211';

  // add your config here
  config.middleware = [];
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

  return config;
};
