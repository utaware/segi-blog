// had enabled by egg
// exports.static = true;
'use strict';

module.exports = (appInfo => {
  const config = {};
  
  config.nunjucks  = {
    enable: true,
    package: 'egg-view-nunjucks',
  };

  return config;
})();
