// had enabled by egg
// exports.static = true;
'use strict';

module.exports = (appInfo => {
  const config = {};
  // 模板
  config.nunjucks  = {
    enable: true,
    package: 'egg-view-nunjucks'
  }
  // mysql数据库
  config.mysql = {
    enable: true,
    package: 'egg-mysql'
  }
  // validate 校验
  config.validate = {
    enable: true,
    package: 'egg-validate',
  }
  
  return config;
})();
