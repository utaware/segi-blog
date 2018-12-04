// had enabled by egg
// exports.static = true;
'use strict';

module.exports = (appInfo => {
  const config = {};
  
  config.nunjucks  = {
    enable: true,
    package: 'egg-view-nunjucks'
  };

  config.jwt = {
    enable: true,
    package: 'egg-jwt'
  }

  config.mysql = {
    enable: true,
    package: 'egg-mysql'
  }

  return config;
})();
