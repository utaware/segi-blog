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
    enable: false,
    package: 'egg-validate',
  }
  // sequelize 数据库模型
  config.sequelize = {
    enable: true,
    package: 'egg-sequelize',
  }
  // joi 校验
  config.joi = {
    enable: true,
    package: 'egg-joi',
  }

  return config;
})()
