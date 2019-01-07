/*
Navicat MySQL Data Transfer

Source Server         : utaware
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : dev

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2019-01-07 18:42:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment_list
-- ----------------------------
DROP TABLE IF EXISTS `comment_list`;
CREATE TABLE `comment_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '发起评论的人',
  `floor` int(11) NOT NULL DEFAULT '0' COMMENT '评论楼层',
  `replier_id` int(11) NOT NULL COMMENT '回复人',
  `replier_name` varchar(24) NOT NULL,
  `content` varchar(255) NOT NULL COMMENT '评论内容',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_list
-- ----------------------------

-- ----------------------------
-- Table structure for docs_list
-- ----------------------------
DROP TABLE IF EXISTS `docs_list`;
CREATE TABLE `docs_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档id',
  `user_id` int(11) NOT NULL COMMENT '上传用户id',
  `author` varchar(24) NOT NULL COMMENT '文章作者',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT '评论数目',
  `type` int(11) NOT NULL COMMENT '文档对应类别',
  `editor` enum('md','html') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'md' COMMENT '编辑方式',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文档标题',
  `md` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'md格式内容',
  `html` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'html格式内容',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docs_list
-- ----------------------------
INSERT INTO `docs_list` VALUES ('1', '12', 'test3', '0', '1', 'md', 'hello', '++下划线++\n\n# 一级标题\n\n*斜体*\n\n**粗体**\n\n^上角标^\n\n~下角标~\n', '<p><ins>下划线</ins></p>\n<h1><a id=\"_2\"></a>一级标题</h1>\n<p><em>斜体</em></p>\n<p><strong>粗体</strong></p>\n<p><sup>上角标</sup></p>\n<p><sub>下角标</sub></p>\n', '2018-12-27 18:14:31', '2018-12-28 15:19:25', '2018-12-28 15:49:54');
INSERT INTO `docs_list` VALUES ('2', '12', 'test3', '0', '1', 'md', 'HTML 5 文档规范', '# segi-blog\n\nnone\n\n## QuickStart\n\n<!-- add docs here for user -->\n\nsee [egg docs][egg] for more detail.\n\n### Development\n\n```bash\n$ npm i\n$ npm run dev\n$ open http://localhost:7001/\n```\n\n### Deploy\n\n```bash\n$ npm start\n$ npm stop\n```\n\n### npm scripts\n\n- Use `npm run lint` to check code style.\n- Use `npm test` to run unit test.\n- Use `npm run autod` to auto detect dependencies upgrade, see [autod](https://www.npmjs.com/package/autod) for more detail.\n', '<h1><a id=\"segiblog_0\"></a>segi-blog</h1>\n<p>none</p>\n<h2><a id=\"QuickStart_4\"></a>QuickStart</h2>\n<!-- add docs here for user -->\n<p>see [egg docs][egg] for more detail.</p>\n<h3><a id=\"Development_10\"></a>Development</h3>\n<pre><div class=\"hljs\"><code class=\"lang-bash\">$ npm i\n$ npm run dev\n$ open http://localhost:7001/\n</code></div></pre>\n<h3><a id=\"Deploy_18\"></a>Deploy</h3>\n<pre><div class=\"hljs\"><code class=\"lang-bash\">$ npm start\n$ npm stop\n</code></div></pre>\n<h3><a id=\"npm_scripts_25\"></a>npm scripts</h3>\n<ul>\n<li>Use <code>npm run lint</code> to check code style.</li>\n<li>Use <code>npm test</code> to run unit test.</li>\n<li>Use <code>npm run autod</code> to auto detect dependencies upgrade, see <a href=\"https://www.npmjs.com/package/autod\" target=\"_blank\">autod</a> for more detail.</li>\n</ul>\n', '2018-12-27 18:18:07', '2018-12-27 18:18:07', null);
INSERT INTO `docs_list` VALUES ('3', '12', 'test3', '0', '1', 'md', '文档测试', '\n# 代码示范\n\n**粗体**\n\n```js\nconsole.log(\'hello world\')\n```', '<h1><a id=\"_1\"></a>代码示范</h1>\n<p><strong>粗体</strong></p>\n<pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'hello world\'</span>)\n</code></div></pre>\n', '2018-12-28 11:10:26', '2018-12-28 11:10:26', null);

-- ----------------------------
-- Table structure for docs_type
-- ----------------------------
DROP TABLE IF EXISTS `docs_type`;
CREATE TABLE `docs_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(24) NOT NULL,
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(24) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docs_type
-- ----------------------------
INSERT INTO `docs_type` VALUES ('1', '1', 'develop', '开发规范', '2018-12-27 11:51:42', '2018-12-27 11:51:42', null);
INSERT INTO `docs_type` VALUES ('2', '2', 'design', '设计规范', '2018-12-27 11:52:26', '2018-12-27 11:52:26', null);
INSERT INTO `docs_type` VALUES ('3', '3', 'test', '测试流程', '2018-12-27 11:52:41', '2018-12-27 14:00:54', null);
INSERT INTO `docs_type` VALUES ('4', '4', 'process', '流程规范', '2018-12-27 11:53:19', '2018-12-27 11:53:19', null);

-- ----------------------------
-- Table structure for email_list
-- ----------------------------
DROP TABLE IF EXISTS `email_list`;
CREATE TABLE `email_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '邮件对应id',
  `messageId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件id',
  `sender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件发送人',
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件接收人',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件发送内容',
  `code` varchar(12) DEFAULT NULL COMMENT '验证码',
  `created_at` datetime DEFAULT NULL COMMENT '邮件创建时间',
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email_list
-- ----------------------------
INSERT INTO `email_list` VALUES ('1', '<5543a4e9-45fb-df7d-ae92-d22b9713220d@qq.com>', '1175272135@qq.com', '1264051408@qq.com', 'VJxE', '1222', '2018-12-10 14:27:09', null, null);
INSERT INTO `email_list` VALUES ('2', '<ef5df309-e0ff-41e6-602e-e5e484f8fff5@qq.com>', '1175272135@qq.com', '1264051408@qq.com', 'Wbq5', '1234', '2018-12-10 16:19:47', null, null);
INSERT INTO `email_list` VALUES ('3', '<8584b278-6c7e-d8e0-d597-8ba2a38ff57b@qq.com>', '1175272135@qq.com', '1175272135@qq.com', '<h3 title=\"nVj6\">您的验证码为</h3><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"150\" height=\"50\"><rect width=\"100%\" height=\"100%\" fill=\"#fff\"/><path fill=\"#eaa289\" d=\"M115.44 29.14L115.38 29.08L115.34 29.04Q113.68 29.09 112.44 30.52L112.38 30.46L112.26 30.33Q111.21 31.95 111.02 33.85L110.97 33.81L110.97 33.80Q110.62 35.74 111.71 36.71L111.69 36.69L111.82 36.83Q112.82 37.71 114.92 37.60L115.03 37.71L115.05 37.74Q117.03 37.47 118.13 36.78L118.12 36.77L118.23 36.88Q119.36 35.76 119.36 34.20L119.22 34.06L119.34 34.18Q119.29 33.75 119.21 33.37L119.29 33.44L119.28 33.44Q119.23 31.64 118.13 30.29L118.14 30.30L118.13 30.28Q117.07 28.98 115.39 29.09ZM115.04 40.28L115.05 40.28L115.04 40.28Q110.54 40.15 109.13 39.39L109.23 39.49L109.15 39.41Q108.13 38.65 107.94 36.94L107.91 36.92L107.94 36.94Q107.99 36.34 108.02 35.62L107.95 35.54L107.91 35.50Q108.05 34.54 108.05 34.09L108.11 34.14L108.13 34.16Q108.59 31.31 108.74 30.62L108.64 30.52L108.75 30.63Q109.23 28.71 110.06 27.30L109.93 27.17L110.07 27.31Q112.74 22.94 118.68 16.58L118.70 16.60L118.53 16.43Q121.28 16.21 123.49 15.41L123.56 15.48L123.56 15.48Q116.54 22.78 113.34 27.01L113.49 27.15L113.36 27.02Q114.52 26.70 115.81 26.70L115.75 26.63L115.69 26.57Q118.95 26.52 120.48 28.47L120.56 28.55L120.57 28.56Q121.85 30.14 122.19 33.68L122.18 33.68L122.29 33.78Q122.35 34.49 122.35 35.10L122.39 35.13L122.32 35.07Q122.33 38.20 120.13 39.27L120.11 39.25L120.07 39.21Q118.83 39.80 114.94 40.18ZM117.32 42.67L117.36 42.71L117.25 42.60Q118.52 42.53 120.50 42.61L120.59 42.70L120.45 42.56Q122.26 42.81 123.82 42.08L123.82 42.09L123.69 41.95Q124.92 41.28 124.92 39.49L124.94 39.51L124.77 39.35Q124.91 38.99 124.73 38.00L124.72 37.99L124.58 37.85Q124.60 37.05 124.60 36.59L124.53 36.52L124.42 36.40Q123.65 31.80 122.05 29.89L121.94 29.78L122.11 29.94Q121.88 29.68 121.72 29.45L121.80 29.52L121.46 29.26L121.44 29.28L121.39 29.23Q121.18 28.87 120.57 27.92L120.42 27.76L120.49 27.84Q119.48 26.78 117.50 26.33L117.65 26.48L117.66 26.49Q118.73 24.74 121.70 21.05L121.79 21.14L125.98 15.81L126.03 15.86Q124.51 16.78 122.12 17.54L121.97 17.40L122.03 17.46Q122.89 16.41 124.68 14.43L124.82 14.58L124.66 14.42Q122.41 15.63 118.52 16.20L118.36 16.03L118.51 16.18Q112.80 22.08 109.83 27.03L109.83 27.03L109.82 27.02Q108.27 29.51 107.70 35.75L107.67 35.72L107.66 35.72Q107.52 36.22 107.60 37.17L107.67 37.24L107.62 37.20Q107.80 39.05 108.90 39.96L108.96 40.02L108.77 39.83Q109.19 40.02 109.15 40.05L109.15 40.06L109.29 40.20Q109.63 41.07 110.43 41.49L110.38 41.44L110.41 41.47Q111.75 42.05 113.70 42.24L113.77 42.31L113.78 42.33Q113.72 42.27 117.22 42.57ZM117.08 31.42L117.01 31.36L116.95 31.30Q117.65 31.31 118.60 31.80L118.61 31.82L118.53 31.74Q118.93 32.74 118.93 33.39L118.94 33.40L118.86 33.33Q119.07 35.21 118.12 36.20L118.08 36.15L118.13 36.21Q117.15 37.01 115.05 37.32L114.97 37.23L114.92 37.19Q113.54 37.25 113.01 36.99L113.02 37.00L112.98 36.96Q112.73 36.44 112.73 36.14L112.85 36.26L112.80 36.21Q112.52 32.88 115.45 31.59L115.47 31.60L115.52 31.66Q116.36 31.39 117.12 31.47Z\"/><path fill=\"#90bce8\" d=\"M56.35 40.12L56.50 40.27L53.93 33.25L53.99 33.31Q49.61 20.70 43.67 14.31L43.74 14.37L43.80 14.44Q45.75 15.43 48.34 16.04L48.36 16.06L48.39 16.10Q53.49 22.34 57.83 35.09L57.86 35.12L57.79 35.05Q60.75 26.85 61.43 25.25L61.48 25.30L61.59 25.41Q63.91 19.73 66.72 16.42L66.81 16.50L66.79 16.49Q68.84 16.10 71.47 15.22L71.33 15.09L71.44 15.20Q66.90 19.83 63.85 27.06L63.71 26.93L63.89 27.11Q62.44 30.71 58.75 40.23L58.80 40.28L58.77 40.26Q58.13 40.19 57.56 40.15L57.49 40.08L57.61 40.20Q57.06 40.22 56.49 40.26ZM61.51 42.69L61.48 42.66L61.42 42.60Q64.18 32.57 65.75 28.54L65.87 28.67L65.75 28.54Q68.84 20.93 73.25 16.06L73.12 15.93L73.29 16.10Q72.13 16.34 70.03 17.07L70.03 17.07L71.31 15.87L71.18 15.74Q71.78 15.08 72.39 14.43L72.49 14.53L72.37 14.42Q69.69 15.54 66.68 16.11L66.57 16.00L66.57 16.00Q62.30 21.44 58.42 32.90L58.40 32.88L58.41 32.89Q54.59 22.60 51.39 18.22L51.40 18.23L51.43 18.26Q51.10 18.23 50.22 18.08L50.30 18.16L50.30 18.15Q49.93 17.63 48.33 15.58L48.32 15.56L48.46 15.71Q45.35 14.85 42.65 13.44L42.80 13.59L42.67 13.46Q49.34 20.59 53.72 33.38L53.75 33.41L53.67 33.33Q54.92 37.02 56.10 40.60L56.11 40.60L56.03 40.52Q56.58 40.77 57.42 40.65L57.28 40.52L57.32 40.56Q57.63 41.20 58.31 42.54L58.41 42.63L58.28 42.51Q59.15 42.46 59.87 42.54L59.86 42.53L59.97 42.63Q60.64 42.58 61.40 42.58Z\"/><path d=\"M13 4 C78 45,55 15,147 26\" stroke=\"#e773ad\" fill=\"none\"/><path fill=\"#56db77\" d=\"M30.94 30.95L30.82 30.82L30.95 30.96Q30.80 29.71 28.86 28.98L28.90 29.02L28.80 28.92Q28.44 28.86 27.91 28.86L27.81 28.77L27.79 28.74Q26.48 28.81 25.42 29.38L25.40 29.36L25.35 29.32Q24.07 30.13 24.18 31.35L24.19 31.35L24.15 31.31Q24.50 34.14 24.35 36.38L24.24 36.28L24.22 36.26Q24.22 38.85 23.50 41.36L23.52 41.38L23.36 41.22Q21.34 41.83 20.16 42.25L20.17 42.25L20.16 42.24Q21.73 38.60 21.73 34.60L21.78 34.65L21.71 34.59Q21.76 29.19 19.17 24.73L19.12 24.68L19.10 24.66Q20.33 25.17 22.72 25.89L22.72 25.88L22.71 25.87Q23.15 26.73 23.53 28.26L23.44 28.17L23.40 28.13Q24.86 26.16 28.74 26.23L28.64 26.13L28.57 26.06Q30.16 26.20 30.96 26.32L30.97 26.33L31.03 26.39Q33.92 26.69 34.00 28.71L33.99 28.71L34.02 28.73Q34.00 29.59 33.81 30.62L33.92 30.73L33.77 30.58Q33.46 33.23 33.65 36.24L33.65 36.25L33.49 36.09Q33.63 38.93 34.62 41.48L34.75 41.61L34.75 41.61Q32.95 41.11 31.24 40.95L31.36 41.08L31.18 40.89Q30.77 38.58 30.70 35.92L30.72 35.94L30.80 36.02Q30.62 33.17 30.85 30.85ZM30.88 41.32L30.98 41.42L30.85 41.29Q31.70 41.34 32.99 41.56L33.01 41.58L33.46 42.72L33.35 42.61Q33.46 43.03 33.69 43.56L33.87 43.74L33.80 43.66Q36.00 44.00 38.70 45.18L38.87 45.35L38.68 45.16Q36.34 42.05 35.65 38.25L35.71 38.31L35.65 38.25Q35.42 36.23 35.54 32.54L35.51 32.51L35.44 32.43Q35.41 32.11 35.45 31.31L35.61 31.47L35.50 31.35Q35.68 30.85 35.60 30.36L35.47 30.22L35.48 30.23Q35.36 28.55 34.25 28.05L34.34 28.14L34.27 28.07Q34.18 27.30 33.42 26.69L33.45 26.72L33.50 26.77Q31.67 25.62 28.62 25.70L28.58 25.65L28.57 25.65Q26.82 25.80 25.98 25.99L25.95 25.96L25.97 25.97Q24.47 26.26 23.51 27.17L23.58 27.24L23.53 27.19Q23.41 26.65 23.03 25.62L22.99 25.59L22.99 25.58Q20.25 24.98 18.42 23.99L18.33 23.90L18.43 23.99Q21.36 28.75 21.36 34.50L21.52 34.66L21.37 34.51Q21.51 39.03 19.61 42.88L19.47 42.73L19.45 42.72Q20.16 42.44 21.46 42.06L21.44 42.04L21.57 42.17Q21.08 43.43 20.55 44.42L20.50 44.37L20.57 44.45Q21.95 43.97 25.50 43.39L25.36 43.26L25.36 43.26Q26.44 38.21 26.32 33.37L26.24 33.29L26.31 33.35Q26.26 32.50 27.44 31.78L27.49 31.83L27.51 31.86Q28.50 31.17 29.60 31.06L29.65 31.10L29.58 31.04Q30.00 30.96 30.42 31.15L30.51 31.24L30.56 31.29Q30.28 33.72 30.32 36.27L30.45 36.39L30.28 36.23Q30.30 38.72 30.80 41.24Z\"/><path fill=\"#db5bdb\" d=\"M79.81 47.15L79.68 47.02L79.79 47.13Q78.86 47.35 76.96 47.65L76.98 47.67L76.84 47.53Q78.15 45.38 79.18 44.09L79.25 44.15L79.15 44.05Q81.04 44.50 81.19 44.50L81.04 44.34L81.05 44.36Q81.33 44.41 81.86 44.29L81.97 44.40L81.97 44.40Q82.71 44.38 82.90 44.38L82.87 44.35L82.92 44.40Q85.37 44.03 85.29 41.86L85.34 41.91L85.35 41.92Q85.31 40.43 85.19 34.18L85.11 34.10L85.17 34.17Q85.11 30.60 85.18 26.45L85.12 26.39L86.65 26.31L86.64 26.30Q87.33 26.23 88.01 26.00L87.98 25.97L87.96 25.95Q87.76 30.40 87.80 34.77L87.68 34.66L87.76 34.73Q87.82 39.14 88.35 43.51L88.33 43.49L88.34 43.50Q88.45 43.83 88.45 44.10L88.47 44.12L88.29 43.94Q88.29 45.58 86.61 45.96L86.72 46.06L86.69 46.03Q83.65 46.50 79.81 47.15ZM86.42 22.77L84.47 19.83L84.35 19.71Q85.31 18.24 87.14 15.46L87.17 15.49L87.17 15.49Q87.91 16.45 89.24 18.28L89.34 18.38L86.45 22.80ZM89.60 49.55L89.60 49.56L89.54 49.50Q90.01 49.47 90.77 49.13L90.87 49.22L90.89 49.24Q91.18 48.51 91.18 48.05L91.25 48.12L91.17 48.04Q91.22 47.75 91.11 47.14L90.94 46.98L90.97 47.01Q89.62 40.59 89.62 32.67L89.73 32.78L89.65 32.70Q89.73 29.93 89.88 27.04L89.84 26.99L89.85 27.00Q89.20 27.07 88.06 27.38L88.23 27.55L88.20 27.52Q88.19 27.02 88.23 26.49L88.29 26.54L88.27 25.35L88.37 25.45Q86.67 26.11 84.88 26.15L84.87 26.13L84.81 26.08Q84.71 30.35 84.75 33.93L84.78 33.96L85.00 41.91L84.85 41.76Q85.02 43.84 82.85 43.95L82.92 44.02L82.73 43.82Q82.54 43.86 82.02 43.92L82.14 44.04L82.01 43.90Q81.47 43.94 81.20 43.94L81.27 44.01L81.30 44.04Q80.78 43.97 79.21 43.55L79.22 43.56L79.31 43.65Q78.87 44.27 77.77 45.94L77.76 45.94L76.07 48.09L76.10 48.13Q76.98 47.94 78.62 47.56L78.60 47.54L78.21 48.33L77.73 49.03L77.62 48.92Q80.06 48.93 81.40 49.00L81.23 48.84L81.32 48.93Q83.50 48.98 89.44 49.40ZM86.49 23.61L86.49 23.61L86.90 23.14L86.87 23.10Q87.16 23.47 88.11 25.07L88.06 25.03L88.20 25.16Q89.75 22.07 91.31 18.98L91.27 18.94L91.27 18.95Q90.20 17.26 89.25 15.97L89.25 15.97L89.29 16.01Q89.20 16.34 88.86 16.87L88.74 16.75L88.78 16.80Q88.42 16.21 87.43 14.91L87.34 14.82L87.38 14.86Q86.17 16.43 83.85 19.78L83.80 19.74L83.92 19.86Q84.71 20.95 86.42 23.54Z\"/></svg>', 'nVj6', '2018-12-20 11:07:25', '2018-12-20 11:07:25', null);
INSERT INTO `email_list` VALUES ('4', '<1c4a13a2-737d-c4b3-943f-bd1773f813d6@qq.com>', '1175272135@qq.com', '1264051408@qq.com', '<h3 title=\"plpg\">您的验证码为</h3><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"150\" height=\"50\"><rect width=\"100%\" height=\"100%\" fill=\"#fff\"/><path d=\"M10 36 C59 27,95 8,148 14\" stroke=\"#6faae5\" fill=\"none\"/><path fill=\"#3bdc8c\" d=\"M28.56 29.82L28.58 29.85L28.64 29.90Q26.13 29.79 24.79 31.00L24.72 30.93L24.72 30.93Q23.35 32.11 23.65 34.62L23.83 34.80L23.66 34.63Q24.03 37.21 25.25 38.46L25.22 38.44L25.28 38.49Q26.40 39.89 28.54 39.81L28.43 39.70L28.48 39.76Q29.10 39.80 29.29 39.80L29.25 39.77L29.18 39.69Q32.83 39.19 32.94 34.59L32.87 34.52L32.96 34.61Q32.96 32.17 32.28 31.37L32.22 31.31L32.33 31.42Q31.15 30.01 28.60 29.86ZM31.88 41.55L31.89 41.57L32.00 41.67Q30.59 42.17 29.03 42.10L29.07 42.14L28.97 42.04Q25.28 42.38 23.99 39.79L23.90 39.71L23.97 39.77Q23.75 45.08 22.42 49.34L22.52 49.44L22.36 49.28Q20.61 49.82 18.98 50.54L18.96 50.53L19.06 50.62Q21.51 44.55 21.25 37.58L21.21 37.55L21.22 37.56Q21.13 30.88 18.24 24.83L18.09 24.68L18.10 24.69Q20.17 26.00 21.88 26.46L21.81 26.38L22.27 27.80L22.35 27.88Q22.41 28.17 22.68 29.27L22.67 29.26L22.62 29.22Q23.70 27.21 27.28 27.02L27.28 27.02L27.40 27.14Q28.22 27.05 29.10 27.05L29.07 27.02L29.54 27.00L29.51 26.97Q29.76 27.10 29.95 27.14L29.84 27.03L30.23 27.11L30.16 27.05Q32.30 27.40 33.03 27.63L33.02 27.62L32.92 27.52Q34.43 28.00 35.31 28.96L35.27 28.92L35.33 28.97Q36.21 30.20 36.17 31.61L36.09 31.53L36.24 31.68Q36.09 34.38 35.29 37.05L35.31 37.07L35.26 37.01Q34.27 40.55 31.90 41.58ZM36.16 42.18L36.19 42.17L36.20 42.18Q37.37 40.27 37.68 36.16L37.63 36.11L37.62 36.10Q37.72 34.30 37.72 33.04L37.85 33.17L37.79 33.12Q37.77 31.57 37.01 30.16L37.09 30.24L36.98 30.14Q36.67 29.79 36.18 29.41L36.13 29.36L35.87 28.99L35.83 28.83L35.72 28.60L35.78 28.66Q33.96 26.54 29.62 26.54L29.65 26.58L29.14 26.67L29.05 26.58Q24.40 26.58 22.77 28.18L22.71 28.12L22.72 28.13Q22.54 27.61 22.39 27.12L22.37 27.10L22.22 26.14L22.15 26.08Q19.63 25.42 17.42 23.94L17.53 24.05L17.52 24.04Q20.65 30.21 20.95 37.45L21.07 37.56L21.13 37.62Q21.37 44.83 18.52 51.30L18.37 51.15L20.37 50.30L20.51 50.44Q20.27 51.19 19.59 52.75L19.55 52.72L19.48 52.64Q22.30 51.69 24.62 51.35L24.48 51.21L24.63 51.36Q25.69 46.48 25.84 42.75L25.82 42.73L25.84 42.75Q27.19 44.17 30.80 44.40L30.90 44.49L30.86 44.45Q34.85 44.75 36.30 42.32L36.22 42.24ZM30.48 32.08L30.57 32.18L30.56 32.16Q31.14 32.02 32.25 32.37L32.33 32.45L32.25 32.37Q32.49 33.34 32.45 34.52L32.44 34.50L32.46 34.52Q32.49 35.47 32.30 36.12L32.43 36.25L32.43 36.24Q31.53 38.96 29.02 39.27L29.09 39.33L29.30 39.43L29.23 39.37Q29.23 39.44 29.11 39.48L29.13 39.49L28.51 39.41L28.46 39.36Q27.26 39.34 26.27 38.84L26.38 38.95L25.99 36.85L25.94 36.80Q25.80 34.48 27.09 33.45L27.22 33.59L27.14 33.50Q28.18 32.45 30.58 32.18Z\"/><path fill=\"#71ee90\" d=\"M87.76 29.82L87.85 29.92L87.89 29.95Q85.35 29.81 84.01 31.03L83.93 30.94L83.91 30.92Q82.69 32.25 83.00 34.77L82.91 34.68L82.93 34.70Q83.27 37.25 84.49 38.50L84.55 38.57L84.56 38.57Q85.58 39.86 87.71 39.79L87.77 39.84L87.74 39.81Q88.13 39.64 88.32 39.64L88.35 39.66L88.48 39.79Q92.00 39.16 92.11 34.55L91.99 34.43L92.00 34.45Q92.12 32.13 91.44 31.33L91.41 31.30L91.44 31.33Q90.36 30.03 87.81 29.88ZM91.08 41.56L91.11 41.59L91.08 41.55Q89.75 42.13 88.19 42.05L88.18 42.05L88.25 42.12Q84.56 42.46 83.26 39.87L83.13 39.73L83.10 39.71Q82.92 45.05 81.59 49.31L81.74 49.46L81.67 49.39Q79.82 49.83 78.18 50.55L78.30 50.67L78.19 50.55Q80.86 44.70 80.59 37.73L80.42 37.55L80.55 37.69Q80.22 30.77 77.33 24.72L77.42 24.81L77.47 24.86Q79.34 25.97 81.05 26.43L81.09 26.46L81.51 27.84L81.60 27.93Q81.65 28.21 81.92 29.31L81.97 29.36L81.87 29.27Q82.99 27.30 86.57 27.11L86.50 27.04L86.46 27.00Q87.47 27.09 88.34 27.09L88.33 27.08L88.82 27.07L88.74 27.00Q88.88 27.02 89.07 27.06L88.99 26.97L89.34 27.02L89.35 27.04Q91.53 27.43 92.26 27.66L92.15 27.55L92.18 27.58Q93.70 28.08 94.58 29.03L94.57 29.02L94.46 28.91Q95.36 30.16 95.33 31.56L95.28 31.51L95.38 31.62Q95.31 34.40 94.51 37.06L94.63 37.19L94.47 37.02Q93.58 40.67 91.22 41.70ZM95.49 42.31L95.51 42.29L95.52 42.30Q96.49 40.19 96.79 36.08L96.90 36.18L96.76 36.05Q97.05 34.43 97.05 33.17L96.91 33.03L96.94 33.06Q97.06 31.67 96.30 30.26L96.28 30.23L96.29 30.24Q95.86 29.78 95.37 29.40L95.34 29.37L95.19 29.11L94.92 28.72L95.02 28.71L94.85 28.54Q93.22 26.61 88.88 26.61L88.86 26.58L88.28 26.61L88.26 26.60Q83.63 26.61 81.99 28.20L81.98 28.19L81.93 28.15Q81.85 27.72 81.70 27.22L81.64 27.17L81.47 26.19L81.36 26.09Q79.00 25.59 76.79 24.10L76.67 23.99L76.74 24.05Q79.96 30.32 80.26 37.55L80.23 37.52L80.19 37.48Q80.56 44.82 77.70 51.29L77.71 51.30L79.57 50.30L79.57 50.30Q79.36 51.08 78.68 52.64L78.67 52.63L78.67 52.64Q81.45 51.65 83.78 51.31L83.78 51.32L83.66 51.19Q84.85 46.44 85.00 42.71L85.01 42.72L85.02 42.73Q86.34 44.13 89.96 44.36L90.03 44.43L89.97 44.36Q93.91 44.61 95.35 42.18L95.39 42.21ZM89.78 32.19L89.76 32.16L89.85 32.25Q90.44 32.12 91.55 32.47L91.57 32.49L91.44 32.36Q91.79 33.43 91.75 34.61L91.76 34.62L91.73 34.60Q91.78 35.55 91.58 36.20L91.46 36.07L91.53 36.15Q90.92 39.15 88.40 39.45L88.32 39.37L88.49 39.43L88.47 39.40Q88.33 39.34 88.21 39.38L88.33 39.49L87.76 39.46L87.74 39.43Q86.60 39.47 85.61 38.98L85.60 38.97L85.15 36.80L85.11 36.77Q84.98 34.46 86.27 33.43L86.38 33.54L86.25 33.41Q87.37 32.45 89.77 32.18Z\"/><path fill=\"#e362c3\" d=\"M54.11 14.08L54.07 14.05L54.05 14.03Q54.99 16.03 56.67 16.38L56.66 16.36L56.61 16.32Q57.18 16.47 57.86 16.28L57.88 16.29L57.83 16.24Q57.73 22.28 57.66 28.14L57.61 28.10L57.55 28.03Q57.70 34.01 57.93 39.94L57.93 39.94L57.89 39.90Q57.66 39.90 57.35 39.90L57.34 39.89L57.35 39.90Q55.73 39.84 54.43 41.67L54.32 41.55L54.34 41.58Q55.03 34.65 54.99 27.80L55.10 27.90L55.10 27.90Q55.02 21.01 54.18 14.16ZM53.92 42.71L54.05 42.84L54.05 42.85Q54.97 40.87 56.04 40.42L56.17 40.54L56.04 40.42Q56.03 41.51 56.03 42.50L56.11 42.58L55.98 42.45Q56.80 42.17 57.60 42.28L57.65 42.33L57.59 42.28Q59.52 42.49 60.74 45.19L60.78 45.23L60.70 45.16Q59.62 37.71 59.62 30.25L59.57 30.20L59.60 30.23Q59.55 22.46 60.39 15.15L60.39 15.15L60.43 15.19Q59.37 17.03 58.23 17.64L58.36 17.76L58.35 17.76Q58.41 16.78 58.48 15.72L58.43 15.66L58.37 15.61Q57.51 16.04 56.75 15.88L56.86 16.00L56.78 15.91Q54.69 15.62 53.70 12.77L53.64 12.70L53.68 12.74Q54.75 20.29 54.83 27.82L54.75 27.75L54.76 27.75Q54.95 35.33 54.07 42.87Z\"/><path fill=\"#629ed9\" d=\"M115.30 29.80L115.14 29.64L115.23 29.73Q111.00 29.50 110.43 32.55L110.43 32.55L110.49 32.60Q110.25 33.62 110.44 34.50L110.48 34.53L110.46 34.52Q110.51 35.33 110.97 36.74L110.97 36.74L110.98 36.74Q111.93 39.79 115.24 39.64L115.43 39.82L115.32 39.72Q117.42 39.88 118.76 38.32L118.73 38.29L118.61 38.17Q119.90 36.76 119.90 34.70L119.96 34.77L119.93 34.73Q119.98 34.06 119.83 33.00L119.93 33.10L119.82 32.98Q119.92 32.25 119.50 31.56L119.38 31.44L119.36 31.42Q117.82 29.85 115.23 29.73ZM120.03 48.16L120.16 48.29L120.01 48.14Q118.31 48.84 110.24 49.22L110.08 49.05L110.21 49.19Q108.41 49.14 106.77 48.30L106.78 48.31L106.82 48.34Q107.69 47.43 109.52 45.64L109.43 45.56L109.41 45.54Q111.93 46.68 114.03 46.49L113.91 46.38L113.92 46.39Q116.86 46.17 117.70 45.90L117.76 45.96L117.69 45.90Q120.00 45.28 120.00 43.49L120.05 43.53L119.91 43.40Q119.94 43.19 119.86 42.96L119.89 43.00L119.88 41.50L119.90 41.52Q119.71 40.57 119.71 39.77L119.84 39.89L119.76 39.82Q118.34 42.02 114.96 42.02L115.03 42.10L115.01 42.07Q111.05 41.99 109.41 39.79L109.46 39.83L109.60 39.97Q108.45 38.41 107.65 33.99L107.66 34.00L107.65 33.99Q107.24 32.36 107.24 30.96L107.34 31.05L107.24 30.95Q107.26 29.18 108.17 28.19L108.31 28.33L108.12 28.14Q109.90 26.84 114.55 26.84L114.44 26.73L116.35 27.08L116.37 27.10Q119.39 27.27 120.73 29.21L120.81 29.30L120.83 29.32Q120.99 28.45 121.41 26.81L121.52 26.92L121.42 26.82Q123.20 26.39 124.95 25.67L124.99 25.71L124.99 25.71Q122.31 31.78 122.31 39.01L122.35 39.05L122.26 38.97Q122.24 41.61 122.62 44.24L122.75 44.37L122.72 44.34Q122.89 45.00 122.81 45.68L122.82 45.70L122.84 45.71Q122.56 47.00 121.35 47.76L121.33 47.74L121.51 47.92Q120.96 48.13 120.12 48.25ZM123.03 51.12L123.00 51.09L123.01 51.10Q124.61 51.29 125.37 50.34L125.36 50.32L125.27 50.24Q125.68 49.35 125.57 48.63L125.45 48.52L125.45 48.52Q125.52 48.05 125.33 47.29L125.23 47.19L125.30 47.26Q124.05 42.01 124.39 36.76L124.38 36.75L124.41 36.78Q124.68 31.26 126.81 26.42L126.80 26.41L124.73 27.39L124.70 27.36Q124.94 26.76 125.17 26.19L125.25 26.27L125.62 25.01L125.62 25.00Q123.31 26.01 121.10 26.43L121.14 26.47L121.11 26.44Q120.84 27.35 120.69 28.37L120.65 28.34L120.72 28.41Q118.59 26.47 114.56 26.47L114.46 26.37L112.82 26.48L112.68 26.34Q109.46 26.36 107.79 27.77L107.80 27.79L107.82 27.80Q106.99 28.87 107.03 30.78L107.02 30.77L106.87 30.62Q107.03 33.22 108.06 37.48L108.06 37.48L108.04 37.46Q108.59 39.46 109.81 40.87L109.78 40.84L110.10 41.16L110.10 41.16L110.13 41.19Q111.15 43.39 113.74 43.92L113.72 43.91L113.78 43.96Q115.21 44.29 116.66 44.33L116.75 44.42L116.65 44.32Q118.48 44.44 119.55 44.06L119.54 44.05L119.48 43.99Q118.88 45.56 116.22 45.91L116.27 45.96L116.25 45.94Q115.09 46.00 114.40 46.00L114.50 46.09L114.12 46.10L114.12 46.09Q111.28 46.07 109.61 45.12L109.54 45.06L107.88 46.82L107.82 46.76Q107.11 47.72 106.27 48.67L106.20 48.60L106.13 48.54Q107.28 49.23 108.27 49.42L108.27 49.42L107.23 50.13L107.34 50.24Q110.10 51.36 115.73 51.36L115.73 51.36L115.95 51.35L115.93 51.33Q119.57 51.35 123.14 51.23ZM117.07 31.98L117.13 32.05L117.09 32.01Q118.42 31.96 119.33 32.38L119.29 32.35L119.41 32.46Q119.52 32.88 119.60 33.56L119.68 33.65L119.63 33.60Q119.67 33.91 119.64 34.82L119.51 34.69L119.69 34.87Q119.54 36.70 118.44 38.00L118.47 38.04L118.50 38.06Q117.32 39.47 115.42 39.43L115.24 39.26L115.39 39.41Q113.81 39.20 112.97 38.78L113.07 38.88L113.04 38.85Q112.75 37.79 112.71 36.76L112.67 36.72L112.57 36.63Q112.55 32.38 117.15 32.07Z\"/></svg>', 'plpg', '2018-12-20 11:08:17', '2018-12-20 11:08:17', null);

-- ----------------------------
-- Table structure for image_list
-- ----------------------------
DROP TABLE IF EXISTS `image_list`;
CREATE TABLE `image_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单张图片id',
  `user_id` int(11) NOT NULL COMMENT '图片上传人id',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原始图片名',
  `size` int(11) NOT NULL COMMENT '图片大小',
  `mime_type` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片格式',
  `src` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外链地址',
  `created_at` datetime DEFAULT NULL COMMENT '图片上传时间',
  `updated_at` datetime DEFAULT NULL COMMENT '图片相关信息被修改时间',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image_list
-- ----------------------------

-- ----------------------------
-- Table structure for privilege_list
-- ----------------------------
DROP TABLE IF EXISTS `privilege_list`;
CREATE TABLE `privilege_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(24) NOT NULL,
  `level` int(11) NOT NULL,
  `create_member` tinyint(1) DEFAULT '0' COMMENT '是否可以添加成员',
  `remove_member` tinyint(1) DEFAULT '0' COMMENT '是否可以删除成员',
  `update_member` tinyint(1) DEFAULT '0' COMMENT '是否可以更改成员信息',
  `query_member` tinyint(1) DEFAULT '0' COMMENT '是否可以获取其他用户信息',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege_list
-- ----------------------------
INSERT INTO `privilege_list` VALUES ('1', 'tourist', '无权限', '0', '0', '0', '0', '0', '2018-12-18 18:17:18', null, null);
INSERT INTO `privilege_list` VALUES ('2', 'ordinary', '普通成员', '1', '0', '0', '0', '0', '2018-12-18 18:22:45', null, null);
INSERT INTO `privilege_list` VALUES ('3', 'chargeman', '组长', '2', '1', '1', '0', '0', '2018-12-18 18:26:42', null, null);
INSERT INTO `privilege_list` VALUES ('4', 'headman', '负责人', '3', '1', '1', '1', '1', '2018-12-18 18:27:27', null, null);
INSERT INTO `privilege_list` VALUES ('5', 'root', '管理员', '4', '1', '1', '1', '1', '2018-12-18 18:27:42', null, null);
INSERT INTO `privilege_list` VALUES ('7', 'test', '测试', '3', '0', '0', '0', '0', '2019-01-03 17:36:59', '2019-01-03 17:37:10', '2019-01-03 17:37:27');

-- ----------------------------
-- Table structure for role_list
-- ----------------------------
DROP TABLE IF EXISTS `role_list`;
CREATE TABLE `role_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位类型id',
  `type` varchar(24) NOT NULL,
  `remark` varchar(24) NOT NULL,
  `group` enum('0','1','2','3','4') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0-待分组 1-前端开发 2-后端开发 3-非开发人员 4-管理人员',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_list
-- ----------------------------
INSERT INTO `role_list` VALUES ('1', 'tourist', '游客', '0', '2018-12-18 18:40:26', null, null);
INSERT INTO `role_list` VALUES ('2', 'web', 'web前端开发', '1', '2018-12-18 16:01:25', null, null);
INSERT INTO `role_list` VALUES ('3', 'java', 'java后端开发', '2', '2018-12-18 16:02:45', null, null);
INSERT INTO `role_list` VALUES ('4', 'ios', 'ios开发', '1', '2018-12-18 16:03:16', null, null);
INSERT INTO `role_list` VALUES ('5', 'android', 'android开发', '1', '2018-12-18 16:03:27', null, null);
INSERT INTO `role_list` VALUES ('6', 'test', '测试', '3', '2018-12-18 16:04:18', null, null);
INSERT INTO `role_list` VALUES ('7', 'product', '产品', '3', '2018-12-18 16:05:26', null, null);
INSERT INTO `role_list` VALUES ('8', 'operator', '运营', '3', '2018-12-18 16:07:46', '2019-01-03 16:10:36', null);
INSERT INTO `role_list` VALUES ('9', 'UI', 'UI设计', '3', '2018-12-18 16:07:59', null, null);
INSERT INTO `role_list` VALUES ('10', 'finance', '财务', '3', '2018-12-18 16:08:15', null, null);
INSERT INTO `role_list` VALUES ('11', 'spread', '推广', '3', '2018-12-18 16:09:09', null, null);
INSERT INTO `role_list` VALUES ('12', 'C_plus', 'C++开发', '2', '2018-12-18 16:09:35', null, null);
INSERT INTO `role_list` VALUES ('13', 'manage', '负责人', '4', '2018-12-18 16:09:59', null, null);
INSERT INTO `role_list` VALUES ('16', 'tests', '测试类型', '2', '2019-01-03 16:08:20', '2019-01-03 16:08:38', '2019-01-03 16:09:39');

-- ----------------------------
-- Table structure for total_list
-- ----------------------------
DROP TABLE IF EXISTS `total_list`;
CREATE TABLE `total_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(24) NOT NULL,
  `total` int(24) NOT NULL DEFAULT '0',
  `remark` varchar(24) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of total_list
-- ----------------------------
INSERT INTO `total_list` VALUES ('1', 'user', '11', '用户', '2018-12-29 11:02:03', '2018-12-29 17:01:13', null);
INSERT INTO `total_list` VALUES ('2', 'share', '0', '分享', '2018-12-29 16:49:06', null, null);
INSERT INTO `total_list` VALUES ('3', 'comment', '0', '评论', '2018-12-29 16:49:22', null, null);
INSERT INTO `total_list` VALUES ('4', 'docs', '0', '文档', '2018-12-29 16:50:57', null, null);
INSERT INTO `total_list` VALUES ('5', 'picture', '0', '图片', '2018-12-29 16:51:25', null, null);

-- ----------------------------
-- Table structure for upload_docs
-- ----------------------------
DROP TABLE IF EXISTS `upload_docs`;
CREATE TABLE `upload_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `user_id` int(11) NOT NULL COMMENT '文档创建人',
  `type` enum('4','3','2','1','0') NOT NULL DEFAULT '0' COMMENT '0-未分类 1-开发 2-设计 3-测试 4-流程',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件上传路径',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名',
  `size` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件大小',
  `content_html` mediumtext NOT NULL COMMENT 'html结构',
  `content_md` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'markdown结构',
  `file_header` text,
  `title` varchar(24) DEFAULT NULL,
  `filter_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章相关标题',
  `create_time` datetime DEFAULT NULL COMMENT '文档创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '文档修改时间',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload_docs
-- ----------------------------
INSERT INTO `upload_docs` VALUES ('8', '6', '0', 'E:\\project\\segi-blog\\app\\public\\upload\\upload_3d660d560df62aad60607ea456c14472.md', '1.md', '2846', '<hr>\n<h2 id=\"title%3A-\'mysql%E5%86%85%E5%AE%B9%E7%AE%80%E4%BB%8B\'\"><a class=\"header-anchor\" href=\"#title%3A-\'mysql%E5%86%85%E5%AE%B9%E7%AE%80%E4%BB%8B\'\" aria-hidden=\"true\">#</a> title: \'mysql内容简介\'</h2>\n<div class=\"tip custom-block\"><p class=\"custom-block-title\">主要概念</p>\n<p>数据库(dataBase)：保存有组织数据的容器</p>\n<p>表(table)：某种特定类型数据的结构化清单</p>\n<p>模式(schema)：关于数据库和表的布局及特性的信息</p>\n<p>列(column)：表中的一个字段，所有表都是由一个列或者多个列组成的</p>\n<p>数据类型(datatype)：所容许的数据的类型，每个表列都有相应的数据类型，限制该列中存储的数据</p>\n<p>行(row)：表中的一个记录</p>\n<p>主键(primary key)：一列(或一组列)，其值能够唯一区分表中每个行</p>\n<p>数据库软件(DBMS)：通常用来访问操作数据库的管理软件(基于文件共享系统或客户机-服务器)</p>\n<p>字段(field): 基本上与列的意思相同，数据库内称列，数据库外作为字段</p>\n</div>\n<h2 id=\"points\"><a class=\"header-anchor\" href=\"#points\" aria-hidden=\"true\">#</a> points</h2>\n<ul>\n<li>正确地将数据分解为多个列极为重要</li>\n<li>应该总是定义主键 =&gt; 便于以后的数据操纵和管理</li>\n<li>主键值规则(多列作为主键组合值必须唯一,单列可以不唯一)\n<ul>\n<li>任意两行都不具备有相同的主键值</li>\n<li>每个航都必须具备有一个主键值(不允许为Null)</li>\n</ul>\n</li>\n<li>主键的最好习惯\n<ul>\n<li>不更新主键列中的值</li>\n<li>不重用主键列中的值</li>\n<li>不在逐渐列中使用可能会更改的值</li>\n</ul>\n</li>\n</ul>\n<h2 id=\"sql\"><a class=\"header-anchor\" href=\"#sql\" aria-hidden=\"true\">#</a> SQL</h2>\n<blockquote>\n<p>SQL是结构化查询语言(Structured Query Language) =&gt; 一种从数据中读写数据的简单有效的方法</p>\n</blockquote>\n<p>优点：</p>\n<ul>\n<li>SQL不是某个特定数据库供应商专有的语言。几乎所有重要的DBMS都支持SQL，所以，学习次语言使你几乎能与所有数据库打交道</li>\n<li>SQL简单易学。他的语句全都是由描述性很强的英语单词组成，而且这些单词的数据不多</li>\n<li>SQL尽管看上去很简单，但它实际上是一种强有力的语言，灵活使用其语言元素，可以进行非常复杂和高级的数据库操作</li>\n</ul>\n<h2 id=\"%E5%91%BD%E4%BB%A4\"><a class=\"header-anchor\" href=\"#%E5%91%BD%E4%BB%A4\" aria-hidden=\"true\">#</a> 命令</h2>\n<h3 id=\"show\"><a class=\"header-anchor\" href=\"#show\" aria-hidden=\"true\">#</a> SHOW</h3>\n<blockquote>\n<p>help show =&gt; learn more;</p>\n</blockquote>\n<ul>\n<li>\n<p>SHOW DATABASES: 返回可用数据库的一个列表(包含MySQL内部使用的)</p>\n</li>\n<li>\n<p>SHOW TABLES: 返回当前选择的数据库内可用表的列表</p>\n</li>\n<li>\n<p>SHOW COLUMNS FROM $table_name：返回表设计的详细信息</p>\n</li>\n<li>\n<p>SHOW STATUS: 显示广泛的服务器状态信息</p>\n</li>\n<li>\n<p>SHOW CREATE (DATABASE | TABLE) $name: 用来显示创建特定数据表或者表的SQL语句</p>\n</li>\n<li>\n<p>SHOW GRANTS: 用来显示授权用户的安全权限</p>\n</li>\n<li>\n<p>SHOW (ERROS | WARNINGS)：用来显示服务器错误或者警告信息</p>\n</li>\n<li>\n<p>链接数据库: mysql -u $user -p $password;</p>\n</li>\n<li>\n<p>创建数据库: create database $name;</p>\n</li>\n</ul>\n<h2 id=\"%E5%85%B6%E4%BB%96\"><a class=\"header-anchor\" href=\"#%E5%85%B6%E4%BB%96\" aria-hidden=\"true\">#</a> 其他</h2>\n<div class=\"tip custom-block\"><p class=\"custom-block-title\">补充</p>\n<p>自动增量：在每个行添加到表中时，MySQL可以自动的为每个行分配下一个可用编号，而不是手动分配唯一值的功能</p>\n<p>结束SQL语句：多条SQL语句必须以分号(;)分隔</p>\n<p>大小写：SQL语句不区分大小写</p>\n</div>\n', '---\r\ntitle: \'mysql内容简介\'\r\n---\r\n\r\n::: tip 主要概念\r\n\r\n数据库(dataBase)：保存有组织数据的容器\r\n\r\n表(table)：某种特定类型数据的结构化清单\r\n\r\n模式(schema)：关于数据库和表的布局及特性的信息\r\n\r\n列(column)：表中的一个字段，所有表都是由一个列或者多个列组成的\r\n\r\n数据类型(datatype)：所容许的数据的类型，每个表列都有相应的数据类型，限制该列中存储的数据\r\n\r\n行(row)：表中的一个记录\r\n\r\n主键(primary key)：一列(或一组列)，其值能够唯一区分表中每个行\r\n\r\n数据库软件(DBMS)：通常用来访问操作数据库的管理软件(基于文件共享系统或客户机-服务器)\r\n\r\n字段(field): 基本上与列的意思相同，数据库内称列，数据库外作为字段\r\n\r\n:::\r\n\r\n\r\n## points\r\n\r\n- 正确地将数据分解为多个列极为重要\r\n- 应该总是定义主键 => 便于以后的数据操纵和管理\r\n- 主键值规则(多列作为主键组合值必须唯一,单列可以不唯一) \r\n    - 任意两行都不具备有相同的主键值\r\n    - 每个航都必须具备有一个主键值(不允许为Null)\r\n- 主键的最好习惯\r\n    - 不更新主键列中的值\r\n    - 不重用主键列中的值\r\n    - 不在逐渐列中使用可能会更改的值\r\n\r\n## SQL\r\n\r\n> SQL是结构化查询语言(Structured Query Language) => 一种从数据中读写数据的简单有效的方法\r\n\r\n优点：\r\n\r\n* SQL不是某个特定数据库供应商专有的语言。几乎所有重要的DBMS都支持SQL，所以，学习次语言使你几乎能与所有数据库打交道\r\n* SQL简单易学。他的语句全都是由描述性很强的英语单词组成，而且这些单词的数据不多\r\n* SQL尽管看上去很简单，但它实际上是一种强有力的语言，灵活使用其语言元素，可以进行非常复杂和高级的数据库操作\r\n\r\n## 命令\r\n\r\n### SHOW \r\n\r\n> help show => learn more;\r\n\r\n* SHOW DATABASES: 返回可用数据库的一个列表(包含MySQL内部使用的)\r\n* SHOW TABLES: 返回当前选择的数据库内可用表的列表\r\n* SHOW COLUMNS FROM $table_name：返回表设计的详细信息\r\n* SHOW STATUS: 显示广泛的服务器状态信息\r\n* SHOW CREATE (DATABASE | TABLE) $name: 用来显示创建特定数据表或者表的SQL语句\r\n* SHOW GRANTS: 用来显示授权用户的安全权限\r\n* SHOW (ERROS | WARNINGS)：用来显示服务器错误或者警告信息  \r\n\r\n* 链接数据库: mysql -u $user -p $password;\r\n* 创建数据库: create database $name;\r\n\r\n## 其他\r\n\r\n::: tip 补充\r\n\r\n自动增量：在每个行添加到表中时，MySQL可以自动的为每个行分配下一个可用编号，而不是手动分配唯一值的功能\r\n\r\n结束SQL语句：多条SQL语句必须以分号(;)分隔\r\n\r\n大小写：SQL语句不区分大小写\r\n\r\n:::\r\n', '{\"title\":\"mysql内容简介\"}', '内容标题', '[{\"tag\":\"h2\",\"title\":\"title: \'mysql内容简介\'\",\"href\":\"title%3A-\'mysql%E5%86%85%E5%AE%B9%E7%AE%80%E4%BB%8B\'\"},{\"tag\":\"h2\",\"title\":\"points\",\"href\":\"points\"},{\"tag\":\"h2\",\"title\":\"SQL\",\"href\":\"sql\"},{\"tag\":\"h2\",\"title\":\"命令\",\"href\":\"%E5%91%BD%E4%BB%A4\"},{\"tag\":\"h3\",\"title\":\"SHOW\",\"href\":\"show\"},{\"tag\":\"h2\",\"title\":\"其他\",\"href\":\"%E5%85%B6%E4%BB%96\"}]', '2018-12-18 11:10:55', null, null);
INSERT INTO `upload_docs` VALUES ('9', '6', '0', 'E:\\project\\segi-blog\\app\\public\\upload\\upload_8d6180cb33bd07e615afaad401fd1d01.md', '2.md', '9513', '<h1 id=\"%E5%85%B3%E9%94%AE%E8%AF%8D\"><a class=\"header-anchor\" href=\"#%E5%85%B3%E9%94%AE%E8%AF%8D\" aria-hidden=\"true\">#</a> 关键词</h1>\n<h2 id=\"select-%E6%A3%80%E7%B4%A2\"><a class=\"header-anchor\" href=\"#select-%E6%A3%80%E7%B4%A2\" aria-hidden=\"true\">#</a> SELECT 检索</h2>\n<ul>\n<li>检索单个列: SELECT $COLUMN_NAME FROM $TABLE_NAME;</li>\n<li>检索多个列: SELECT [$COLUMN_NAMES] FROM $TABLE_NAME;</li>\n<li>检索所有列: SELECT * FROM $TABLE_NAME;</li>\n<li>检索不同行: SELECT DISTINCT ...;</li>\n</ul>\n<blockquote>\n<p>DISTINCT: 筛选相同行，DISTINCT应用于所有列而不是前置它的列，如果指定的列有多个，除非都不同，否则所有行都将被检索出来</p>\n</blockquote>\n<h2 id=\"insert-%E6%8F%92%E5%85%A5\"><a class=\"header-anchor\" href=\"#insert-%E6%8F%92%E5%85%A5\" aria-hidden=\"true\">#</a> INSERT 插入</h2>\n<blockquote>\n<p>对于自增类型或者没有值给与Null</p>\n</blockquote>\n<ul>\n<li>INSERT INTO $table_name VALUES (对应值) ... =&gt; 不安全, 依赖次序, 弱迁移, 自增NULL</li>\n<li>INSERT INTO $table_name(字段) VALUES (对应值) ... =&gt; 安全, 不依赖次序, 强迁移, 自增忽略</li>\n</ul>\n<p>如果数据检索是最重要的, 可以通过在INSET INTO之间添加关键字<strong>LOW_PRIORITY</strong>, 指示MYSQ降低INSET语句的优先级。因为INSET操作可能更耗时, 并且降低等待处理SELECT语句的性能, 使用单挑语句插入多个值比使用多条语句依次插入更快。以此提高INSERT性能</p>\n<p>INSERT也可以插入一条SELECT语句的结果形成所谓的INSERT SELECT</p>\n<h2 id=\"update-%E6%9B%B4%E6%96%B0\"><a class=\"header-anchor\" href=\"#update-%E6%9B%B4%E6%96%B0\" aria-hidden=\"true\">#</a> UPDATE 更新</h2>\n<blockquote>\n<p>以表名开始 ,以WHERE子句结束, 在多条更新其中一处发生错误时, 有无IGNORE决定是否继续。为了删除某个列的值, 可以设置它为NULL(表定义上允许)</p>\n</blockquote>\n<ul>\n<li>UPDATE [IGNORE] $table_name SET \'$update...\' WHERE ....</li>\n</ul>\n<h2 id=\"delete-%E5%88%A0%E9%99%A4\"><a class=\"header-anchor\" href=\"#delete-%E5%88%A0%E9%99%A4\" aria-hidden=\"true\">#</a> DELETE 删除</h2>\n<blockquote>\n<p>DELETE是为了删除行而不是列, 如果是为了删除列使用UPDATE语句.如果想从表中删除所有行，不要使用DELETE 可以使用TRUNCATE TABLE(删除原表新建一张表)语句。</p>\n</blockquote>\n<ul>\n<li>DELETE $table_name WHERE ...</li>\n</ul>\n<h2 id=\"from-%E6%9D%A5%E8%87%AA\"><a class=\"header-anchor\" href=\"#from-%E6%9D%A5%E8%87%AA\" aria-hidden=\"true\">#</a> FROM 来自</h2>\n<blockquote>\n<p>对应确定选择的表名</p>\n</blockquote>\n<h3 id=\"inner-join-%E8%81%94%E7%BB%93\"><a class=\"header-anchor\" href=\"#inner-join-%E8%81%94%E7%BB%93\" aria-hidden=\"true\">#</a> INNER JOIN 联结</h3>\n<blockquote>\n<p>在 FROM 后设置表的链接关系, 通过传递给ON的实际条件做匹配, 优先级相对WHERE条件使用更优先, 因为这样有明显的联结关系使用也更加规范, 有时候也能影响性能 =&gt; 不要联结不必要的表, 联结表越多性能下降越多</p>\n</blockquote>\n<h3 id=\"on-%E6%9D%A1%E4%BB%B6\"><a class=\"header-anchor\" href=\"#on-%E6%9D%A1%E4%BB%B6\" aria-hidden=\"true\">#</a> ON 条件</h3>\n<blockquote>\n<p>联结表所需匹配的条件</p>\n</blockquote>\n<h2 id=\"as-%E5%88%AB%E5%90%8D\"><a class=\"header-anchor\" href=\"#as-%E5%88%AB%E5%90%8D\" aria-hidden=\"true\">#</a> AS 别名</h2>\n<blockquote>\n<p>对展示列或者返回数据起别名(alias)</p>\n</blockquote>\n<p>对应的表也同样可以取别名, 但是与列不同表别人不返回客户端, 并且表别名可以用于SELECT、ORDER BY、WHERE等子句</p>\n<h2 id=\"where-%E7%AD%9B%E9%80%89\"><a class=\"header-anchor\" href=\"#where-%E7%AD%9B%E9%80%89\" aria-hidden=\"true\">#</a> WHERE 筛选</h2>\n<blockquote>\n<p>操作符：用来联结或者改变WHERE子句中的子句的关键字,也称为逻辑操作符</p>\n</blockquote>\n<ul>\n<li>筛选：... WHERE $CONDITION;</li>\n</ul>\n<p>操作符：</p>\n<table>\n<thead>\n<tr>\n<th style=\"text-align:center\">操作符</th>\n<th style=\"text-align:center\">说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:center\">=</td>\n<td style=\"text-align:center\">等于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">&lt;&gt;</td>\n<td style=\"text-align:center\">不等于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">!=</td>\n<td style=\"text-align:center\">不等于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">&lt;</td>\n<td style=\"text-align:center\">小于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">&lt;=</td>\n<td style=\"text-align:center\">小于等于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">&gt;</td>\n<td style=\"text-align:center\">大于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">&gt;=</td>\n<td style=\"text-align:center\">大于等于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">BETWEEN</td>\n<td style=\"text-align:center\">在指定的两个值之间</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">IS NULL</td>\n<td style=\"text-align:center\">空值检查</td>\n</tr>\n</tbody>\n</table>\n<blockquote>\n<p>范围值检索：BETWEN START AND END</p>\n</blockquote>\n<h3 id=\"%E8%AE%A1%E7%AE%97%E6%AC%A1%E5%BA%8F\"><a class=\"header-anchor\" href=\"#%E8%AE%A1%E7%AE%97%E6%AC%A1%E5%BA%8F\" aria-hidden=\"true\">#</a> 计算次序</h3>\n<p>WHERE可包含任意数目的AND和OR操作符, 允许两者结合以进行复杂和高级的过滤, 此时需要注意相关的优先级或者使用圆括号明确地分组相应的操作符, 并尽量使用原括号分组消除歧义而不是依赖默认计算次序</p>\n<p><strong>... WHERE A OR B AND C = ... WHERE A OR (B AND C)</strong></p>\n<blockquote>\n<p>() &gt; AND &gt; OR</p>\n</blockquote>\n<h3 id=\"and-%E5%B9%B6%E4%B8%94\"><a class=\"header-anchor\" href=\"#and-%E5%B9%B6%E4%B8%94\" aria-hidden=\"true\">#</a> AND 并且</h3>\n<blockquote>\n<p>指示检索满足所有给定条件的行</p>\n</blockquote>\n<h3 id=\"or-%E6%88%96%E8%80%85\"><a class=\"header-anchor\" href=\"#or-%E6%88%96%E8%80%85\" aria-hidden=\"true\">#</a> OR 或者</h3>\n<blockquote>\n<p>只是检索匹配满足任一条件的行</p>\n</blockquote>\n<h3 id=\"in-%E5%8C%85%E5%90%AB\"><a class=\"header-anchor\" href=\"#in-%E5%8C%85%E5%90%AB\" aria-hidden=\"true\">#</a> IN 包含</h3>\n<blockquote>\n<p>IN(..) 指定条件范围中每个条件都可以匹配的清单</p>\n</blockquote>\n<p>优点：</p>\n<ul>\n<li>在使用长的合法选项清单时, IN操作符的语法更清楚且更直观</li>\n<li>在使用IN时, 计算的次序更容易管理(因为使用的操作符更少)</li>\n<li>IN操作符一般比OR操作符清单执行更快</li>\n<li>IN的最大优点是可以包含其他SELECT语句, 是的能够更加动态的建立WHERE子句</li>\n</ul>\n<h3 id=\"not-%E5%90%A6%E5%AE%9A\"><a class=\"header-anchor\" href=\"#not-%E5%90%A6%E5%AE%9A\" aria-hidden=\"true\">#</a> NOT 否定</h3>\n<blockquote>\n<p>否定后跟条件的关键字 ... NOT IN (1002, 1003)</p>\n</blockquote>\n<h3 id=\"like-%E7%BB%93%E6%9E%84\"><a class=\"header-anchor\" href=\"#like-%E7%BB%93%E6%9E%84\" aria-hidden=\"true\">#</a> LIKE 结构</h3>\n<blockquote>\n<p>WHERE ... LIKE (通配符和字面量组合)</p>\n</blockquote>\n<ul>\n<li>百分号(%) =&gt; 表示任何字符出现任意次数 !不能匹配NULL</li>\n<li>下划线(_) =&gt; 只匹配单个字符</li>\n</ul>\n<p>通配符的处理一般比其他搜索花费时间更长</p>\n<p>技巧：</p>\n<ul>\n<li>不要过度使用通配符</li>\n<li>尽量不要把通配符作为搜索模式的开始</li>\n<li>自习注意通配符的位置</li>\n</ul>\n<h3 id=\"regexp-%E6%AD%A3%E5%88%99\"><a class=\"header-anchor\" href=\"#regexp-%E6%AD%A3%E5%88%99\" aria-hidden=\"true\">#</a> REGEXP 正则</h3>\n<blockquote>\n<p>... WHERE ... REGEXP $CONDITION;</p>\n</blockquote>\n<p>BINARY关键字在正则匹配中区分大小写</p>\n<blockquote>\n<p>区分大小写：... WHERE ... REGEXP BINARY $CONDITION</p>\n</blockquote>\n<p>LIKE针对列值整体匹配, REGEXP针对列值包含(部分)匹配</p>\n<ul>\n<li>\'string\': 包含该字符串</li>\n<li>. : 任意一个字符</li>\n<li>A | B : 并行条件</li>\n<li>[0-9] : 集合</li>\n<li>^...$ : 开头结尾</li>\n<li>\\\\[.-|]: 特殊字符</li>\n</ul>\n<p>多数正则表达式实现使用单个反斜杠转义特殊字符, 但MYSQL需要使用两个(正则解释一个,MYSQL解释另一个)</p>\n<table>\n<thead>\n<tr>\n<th style=\"text-align:center\">字符类</th>\n<th style=\"text-align:center\">说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:center\">[:alnum:]</td>\n<td style=\"text-align:center\">任意字符和数字([a-zA-Z0-9])</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:alpha:]</td>\n<td style=\"text-align:center\">任意字符([a-zA-Z])</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:blank:]</td>\n<td style=\"text-align:center\">空格和制表符([\\t])</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:cntrl:]</td>\n<td style=\"text-align:center\">ASCII控制字符(ASCII 0到31和127)</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:digit:]</td>\n<td style=\"text-align:center\">任意数字([0-9])</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:graph:]</td>\n<td style=\"text-align:center\">与[:print:]相同,但不包括空格</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:lower:]</td>\n<td style=\"text-align:center\">任意小写字母([a-z])</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:print:]</td>\n<td style=\"text-align:center\">任意可打印字符</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:punct:]</td>\n<td style=\"text-align:center\">不在[:alnum:]和[:cntrl:]的任意字符</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:space:]</td>\n<td style=\"text-align:center\">包括空格在内的任意空白字符([\\\\f\\\\n\\\\r\\\\t\\\\v])</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:upper:]</td>\n<td style=\"text-align:center\">任意大写字母[A-Z]</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:xdigit:]</td>\n<td style=\"text-align:center\">任意16进制数字([a-fA-F0-9])</td>\n</tr>\n</tbody>\n</table>\n<table>\n<thead>\n<tr>\n<th style=\"text-align:center\">元字符</th>\n<th style=\"text-align:center\">说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:center\">*</td>\n<td style=\"text-align:center\">0或者多个匹配</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">+</td>\n<td style=\"text-align:center\">1或者多个匹配{1,}</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">？</td>\n<td style=\"text-align:center\">0或者1个匹配{0, 1}</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">{n}</td>\n<td style=\"text-align:center\">指定数目的匹配</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">{n,}</td>\n<td style=\"text-align:center\">不少于指定数目的匹配</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">{n, m}</td>\n<td style=\"text-align:center\">匹配数目的范围(m&lt;255)</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">^</td>\n<td style=\"text-align:center\">文本的开始</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">$</td>\n<td style=\"text-align:center\">文本的结束</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[[:&lt;:]]</td>\n<td style=\"text-align:center\">词的开始</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[[:&gt;:]]</td>\n<td style=\"text-align:center\">词的结尾</td>\n</tr>\n</tbody>\n</table>\n<h2 id=\"group-by-%E5%88%86%E7%BB%84\"><a class=\"header-anchor\" href=\"#group-by-%E5%88%86%E7%BB%84\" aria-hidden=\"true\">#</a> GROUP BY 分组</h2>\n<blockquote>\n<p>通过分组将不同列的分组整合筛选做分类</p>\n</blockquote>\n<p>规定：</p>\n<ul>\n<li>GROUP BY子句可以包含任意数目的列, 这使得能对分组进行嵌套. 为数据分组提供更加精细的控制</li>\n<li>如果在子句中嵌套了分组, 数据将在最后规定的分组上进行汇总</li>\n<li>GROUP BY列出的每个列都必须是检索列或者有效的表达式(但不能是聚集函数)。如果在SELECT中使用表达式, 则必须在GROUP BY子句中指定相同的表达式。不能使用别名</li>\n<li>除聚集语句外, SELECT语句中的每个列都必须在GROUP BY中给出</li>\n<li>GROUP BY必须出现在WHERE子句之后, ORDER BY子句之前</li>\n</ul>\n<h2 id=\"with-rollup-%E7%BB%9F%E8%AE%A1\"><a class=\"header-anchor\" href=\"#with-rollup-%E7%BB%9F%E8%AE%A1\" aria-hidden=\"true\">#</a> WITH ROLLUP 统计</h2>\n<blockquote>\n<p>可以得到每个分组一级每个分组汇总级别(针对每个分组的值)需要在ORDER BY之前</p>\n</blockquote>\n<h2 id=\"having-%E8%BF%87%E6%BB%A4\"><a class=\"header-anchor\" href=\"#having-%E8%BF%87%E6%BB%A4\" aria-hidden=\"true\">#</a> HAVING 过滤</h2>\n<blockquote>\n<p>在有了组的概念以后, WHERE过滤的是行, 而对于分组的过滤则需要交给HAVING, 即没有分组前使用WHERE进行过滤, 分组后使用HAVING关键字过滤</p>\n</blockquote>\n<h2 id=\"order-by-%E6%8E%92%E5%BA%8F\"><a class=\"header-anchor\" href=\"#order-by-%E6%8E%92%E5%BA%8F\" aria-hidden=\"true\">#</a> ORDER BY 排序</h2>\n<ul>\n<li>单列排序：SELECT ($COLUMN_NAME | $COLUMN_NAMES) FROM $TABLE ORDER BY $COLUMN_NAME;</li>\n<li>多列排序：SELECT ... ORDER BY ...;</li>\n<li>排序方向: SLECT ... ORDER BY ... (DESC(降序) | ASC(升序--默认))</li>\n<li>组合排序：SELECT prod_id, prod_price, prod_name FROM products ORDER BY prod_price DESC, prod_name;</li>\n</ul>\n<blockquote>\n<p>非选择列排序：ORDER BY可以使用非检索显示所选择的列，用非检索的列排序数据是完全合法的</p>\n</blockquote>\n<blockquote>\n<p>ORDER BY子句的位置应位于LIMIT之后</p>\n</blockquote>\n<h2 id=\"limit-%E9%99%90%E5%88%B6\"><a class=\"header-anchor\" href=\"#limit-%E9%99%90%E5%88%B6\" aria-hidden=\"true\">#</a> LIMIT 限制</h2>\n<ul>\n<li>限制结果：SELECT ... LIMIT $NUMBER;</li>\n<li>某行开始:\n<ul>\n<li>SELECT ... LIMIT $START, $NUMBER;</li>\n<li>SELECT ... $NUMBER OFFSET $START;</li>\n</ul>\n</li>\n</ul>\n<h2 id=\"union-%E7%BB%84%E5%90%88\"><a class=\"header-anchor\" href=\"#union-%E7%BB%84%E5%90%88\" aria-hidden=\"true\">#</a> UNION 组合</h2>\n<blockquote>\n<p>用于将不同的SQL语句组成起来, 看起来像是一种合并(union的行为)</p>\n</blockquote>\n<p>规则：</p>\n<ul>\n<li>UNION必须由两条或者两条以上的SELECT语句组成, 语句之间用关键字UNION分割(n条查询语句就需要n-1个union关键字)</li>\n<li>UNION的每个查询必须包含相同的列、表达式或者聚集函数(但不需要相同的次序)</li>\n<li>列数据类型必须兼容, 类型不必完全相同, 但必须是可以隐式转换的</li>\n<li>UNION默认会去重, 如果不需要可以使用UNION ALL</li>\n<li>组合查询对于排序结果只能在最后一条SQL语句中指定</li>\n</ul>\n<h2 id=\"%E5%AD%90%E5%8F%A5%E9%A1%BA%E5%BA%8F\"><a class=\"header-anchor\" href=\"#%E5%AD%90%E5%8F%A5%E9%A1%BA%E5%BA%8F\" aria-hidden=\"true\">#</a> 子句顺序</h2>\n<table>\n<thead>\n<tr>\n<th style=\"text-align:center\">子句</th>\n<th style=\"text-align:center\">说明</th>\n<th style=\"text-align:center\">必须使用</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:center\">SELECT</td>\n<td style=\"text-align:center\">要返回的列或者表达式</td>\n<td style=\"text-align:center\">是</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">FROM</td>\n<td style=\"text-align:center\">从中检索数据的表</td>\n<td style=\"text-align:center\">仅在从表中检索数据时使用</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">WHERE</td>\n<td style=\"text-align:center\">行级过滤</td>\n<td style=\"text-align:center\">否</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">GROUP BY</td>\n<td style=\"text-align:center\">分组说明</td>\n<td style=\"text-align:center\">尽在按组计算聚集时使用</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">HAVING</td>\n<td style=\"text-align:center\">组级过滤</td>\n<td style=\"text-align:center\">否</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">ORDER BY</td>\n<td style=\"text-align:center\">输出排序顺序</td>\n<td style=\"text-align:center\">否</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">LIMIT</td>\n<td style=\"text-align:center\">限制检索行数</td>\n<td style=\"text-align:center\">否</td>\n</tr>\n</tbody>\n</table>\n<h2 id=\"%E9%99%84%E5%8A%A0\"><a class=\"header-anchor\" href=\"#%E9%99%84%E5%8A%A0\" aria-hidden=\"true\">#</a> 附加</h2>\n<div class=\"tip custom-block\"><p class=\"custom-block-title\">说明</p>\n<ul>\n<li>子句：SQL语句由子句构成，有些子句是必须得，有的是可选的。一个子句通常由一个关键字和所提供的数据组成。</li>\n<li>完全限定名：SELECT prodicts.prod_name FROM prodcucts; SELECT products.prod_name FROM crashcourse</li>\n</ul>\n</div>\n<div class=\"warning custom-block\"><p class=\"custom-block-title\">注意</p>\n<ul>\n<li>当心逗号: 多个列时注意列名间加上逗号，最后一个列名不加</li>\n<li>使用通配符：除非你确实需要每个列，否则不要使用，检索不需要的列通常会降低检索和应用程序的性能，但同时存在一个优点可以检索到未知列</li>\n<li>行0：检索出来的第一行为0，而不是为行1，因此如果LIMIT 1,1将检索出的是第二行而不是第一行</li>\n<li>行数不够时：如果没有足够的行，MySQL将只返回它能返回的行</li>\n<li>何时使用引号：单引号用来限定字符串，如果将值与串类型的列进行比较则需要，数值进行比较的值不需要</li>\n<li>MyISAM和InnoDB为最常使用的两个数据库引擎, InnoDB不支持全文本搜索, MyISAM支持</li>\n</ul>\n</div>\n', '# 关键词\r\n\r\n## SELECT 检索\r\n\r\n* 检索单个列: SELECT $COLUMN_NAME FROM $TABLE_NAME;\r\n* 检索多个列: SELECT \\[$COLUMN_NAMES\\] FROM $TABLE_NAME;\r\n* 检索所有列: SELECT * FROM $TABLE_NAME;\r\n* 检索不同行: SELECT DISTINCT ...;\r\n\r\n> DISTINCT: 筛选相同行，DISTINCT应用于所有列而不是前置它的列，如果指定的列有多个，除非都不同，否则所有行都将被检索出来\r\n\r\n## INSERT 插入\r\n\r\n> 对于自增类型或者没有值给与Null\r\n\r\n* INSERT INTO $table_name VALUES (对应值) ... => 不安全, 依赖次序, 弱迁移, 自增NULL\r\n* INSERT INTO $table_name(字段) VALUES (对应值) ... => 安全, 不依赖次序, 强迁移, 自增忽略\r\n\r\n如果数据检索是最重要的, 可以通过在INSET INTO之间添加关键字**LOW_PRIORITY**, 指示MYSQ降低INSET语句的优先级。因为INSET操作可能更耗时, 并且降低等待处理SELECT语句的性能, 使用单挑语句插入多个值比使用多条语句依次插入更快。以此提高INSERT性能\r\n\r\nINSERT也可以插入一条SELECT语句的结果形成所谓的INSERT SELECT\r\n\r\n## UPDATE 更新\r\n\r\n> 以表名开始 ,以WHERE子句结束, 在多条更新其中一处发生错误时, 有无IGNORE决定是否继续。为了删除某个列的值, 可以设置它为NULL(表定义上允许)\r\n\r\n* UPDATE \\[IGNORE\\] $table_name SET \'$update...\' WHERE ....\r\n\r\n## DELETE 删除\r\n\r\n> DELETE是为了删除行而不是列, 如果是为了删除列使用UPDATE语句.如果想从表中删除所有行，不要使用DELETE 可以使用TRUNCATE TABLE(删除原表新建一张表)语句。\r\n\r\n* DELETE $table_name WHERE ...\r\n\r\n## FROM 来自\r\n\r\n> 对应确定选择的表名\r\n\r\n### INNER JOIN 联结\r\n\r\n> 在 FROM 后设置表的链接关系, 通过传递给ON的实际条件做匹配, 优先级相对WHERE条件使用更优先, 因为这样有明显的联结关系使用也更加规范, 有时候也能影响性能 => 不要联结不必要的表, 联结表越多性能下降越多\r\n\r\n### ON 条件\r\n\r\n> 联结表所需匹配的条件\r\n\r\n## AS 别名\r\n\r\n> 对展示列或者返回数据起别名(alias)\r\n\r\n对应的表也同样可以取别名, 但是与列不同表别人不返回客户端, 并且表别名可以用于SELECT、ORDER BY、WHERE等子句\r\n\r\n## WHERE 筛选\r\n\r\n> 操作符：用来联结或者改变WHERE子句中的子句的关键字,也称为逻辑操作符\r\n\r\n* 筛选：... WHERE $CONDITION;\r\n  \r\n操作符：\r\n\r\n| 操作符 | 说明 |\r\n| :---: | :---: |\r\n|  = | 等于 |\r\n| <> | 不等于 |\r\n| != | 不等于 |\r\n| <  | 小于 |\r\n| <= | 小于等于 |\r\n| >  | 大于 |\r\n| >= | 大于等于 |\r\n| BETWEEN | 在指定的两个值之间 |\r\n| IS NULL | 空值检查 |\r\n\r\n> 范围值检索：BETWEN START AND END\r\n\r\n### 计算次序\r\n\r\nWHERE可包含任意数目的AND和OR操作符, 允许两者结合以进行复杂和高级的过滤, 此时需要注意相关的优先级或者使用圆括号明确地分组相应的操作符, 并尽量使用原括号分组消除歧义而不是依赖默认计算次序\r\n\r\n__... WHERE A OR B AND C = ... WHERE A OR (B AND C)__\r\n\r\n> () > AND > OR \r\n\r\n### AND 并且\r\n\r\n> 指示检索满足所有给定条件的行\r\n\r\n### OR 或者\r\n\r\n> 只是检索匹配满足任一条件的行\r\n\r\n### IN 包含\r\n\r\n> IN(..) 指定条件范围中每个条件都可以匹配的清单\r\n\r\n优点：\r\n\r\n* 在使用长的合法选项清单时, IN操作符的语法更清楚且更直观\r\n* 在使用IN时, 计算的次序更容易管理(因为使用的操作符更少)\r\n* IN操作符一般比OR操作符清单执行更快\r\n* IN的最大优点是可以包含其他SELECT语句, 是的能够更加动态的建立WHERE子句\r\n\r\n### NOT 否定\r\n\r\n> 否定后跟条件的关键字 ... NOT IN (1002, 1003)\r\n\r\n### LIKE 结构\r\n\r\n> WHERE ... LIKE (通配符和字面量组合)\r\n\r\n* 百分号(%) => 表示任何字符出现任意次数 !不能匹配NULL\r\n* 下划线(_) => 只匹配单个字符\r\n\r\n通配符的处理一般比其他搜索花费时间更长\r\n\r\n技巧：\r\n\r\n* 不要过度使用通配符\r\n* 尽量不要把通配符作为搜索模式的开始\r\n* 自习注意通配符的位置\r\n\r\n### REGEXP 正则\r\n\r\n> ... WHERE ... REGEXP $CONDITION;\r\n\r\nBINARY关键字在正则匹配中区分大小写\r\n\r\n> 区分大小写：... WHERE ... REGEXP BINARY $CONDITION\r\n\r\nLIKE针对列值整体匹配, REGEXP针对列值包含(部分)匹配\r\n\r\n* \'string\': 包含该字符串\r\n* . : 任意一个字符\r\n* A | B : 并行条件\r\n* \\[0-9\\] : 集合\r\n* ^...$ : 开头结尾\r\n* \\\\\\\\[\\.\\-\\|]: 特殊字符\r\n\r\n多数正则表达式实现使用单个反斜杠转义特殊字符, 但MYSQL需要使用两个(正则解释一个,MYSQL解释另一个)\r\n\r\n| 字符类 | 说明 |\r\n| :---: | :---: |\r\n| \\[:alnum:\\] | 任意字符和数字(\\[a-zA-Z0-9\\]) |\r\n| \\[:alpha:\\] | 任意字符(\\[a-zA-Z\\]) |\r\n| \\[:blank:\\] | 空格和制表符(\\[\\\\t\\]) |\r\n| \\[:cntrl:\\] | ASCII控制字符(ASCII 0到31和127) |\r\n| \\[:digit:\\] | 任意数字(\\[0-9\\]) |\r\n| \\[:graph:\\] | 与\\[:print:\\]相同,但不包括空格 |\r\n| \\[:lower:\\] | 任意小写字母(\\[a-z\\]) |\r\n| \\[:print:\\] | 任意可打印字符 |\r\n| \\[:punct:\\] | 不在\\[:alnum:\\]和\\[:cntrl:\\]的任意字符 |\r\n| \\[:space:\\] | 包括空格在内的任意空白字符(\\[\\\\\\\\f\\\\\\\\n\\\\\\\\r\\\\\\\\t\\\\\\\\v\\]) |\r\n| \\[:upper:\\] | 任意大写字母\\[A-Z\\] |\r\n| \\[:xdigit:\\] | 任意16进制数字(\\[a-fA-F0-9\\]) |\r\n\r\n| 元字符 | 说明 |\r\n| :---: | :---: |\r\n| * | 0或者多个匹配 |\r\n| + | 1或者多个匹配{1,}|\r\n| ？| 0或者1个匹配{0, 1}|\r\n| {n} | 指定数目的匹配 |\r\n| {n,} | 不少于指定数目的匹配 |\r\n| {n, m} | 匹配数目的范围(m<255)|\r\n| ^ | 文本的开始 |\r\n| $ | 文本的结束 | \r\n| \\[\\[:<:\\]\\] | 词的开始 |\r\n| \\[\\[:>:\\]\\] | 词的结尾 |\r\n\r\n## GROUP BY 分组\r\n\r\n> 通过分组将不同列的分组整合筛选做分类\r\n\r\n规定：\r\n\r\n* GROUP BY子句可以包含任意数目的列, 这使得能对分组进行嵌套. 为数据分组提供更加精细的控制\r\n* 如果在子句中嵌套了分组, 数据将在最后规定的分组上进行汇总\r\n* GROUP BY列出的每个列都必须是检索列或者有效的表达式(但不能是聚集函数)。如果在SELECT中使用表达式, 则必须在GROUP BY子句中指定相同的表达式。不能使用别名\r\n* 除聚集语句外, SELECT语句中的每个列都必须在GROUP BY中给出\r\n* GROUP BY必须出现在WHERE子句之后, ORDER BY子句之前\r\n\r\n## WITH ROLLUP 统计\r\n\r\n> 可以得到每个分组一级每个分组汇总级别(针对每个分组的值)需要在ORDER BY之前\r\n\r\n## HAVING 过滤\r\n\r\n> 在有了组的概念以后, WHERE过滤的是行, 而对于分组的过滤则需要交给HAVING, 即没有分组前使用WHERE进行过滤, 分组后使用HAVING关键字过滤\r\n\r\n## ORDER BY 排序\r\n\r\n* 单列排序：SELECT ($COLUMN_NAME | $COLUMN_NAMES) FROM $TABLE ORDER BY $COLUMN_NAME;\r\n* 多列排序：SELECT ... ORDER BY ...;\r\n* 排序方向: SLECT ... ORDER BY ... (DESC(降序) | ASC(升序--默认))\r\n* 组合排序：SELECT prod_id, prod_price, prod_name FROM products ORDER BY prod_price DESC, prod_name;\r\n \r\n> 非选择列排序：ORDER BY可以使用非检索显示所选择的列，用非检索的列排序数据是完全合法的\r\n\r\n> ORDER BY子句的位置应位于LIMIT之后\r\n\r\n## LIMIT 限制\r\n\r\n* 限制结果：SELECT ... LIMIT $NUMBER;\r\n* 某行开始: \r\n    * SELECT ... LIMIT $START, $NUMBER;\r\n    * SELECT ... $NUMBER OFFSET $START;\r\n\r\n## UNION 组合\r\n\r\n> 用于将不同的SQL语句组成起来, 看起来像是一种合并(union的行为)\r\n\r\n规则：\r\n\r\n* UNION必须由两条或者两条以上的SELECT语句组成, 语句之间用关键字UNION分割(n条查询语句就需要n-1个union关键字)\r\n* UNION的每个查询必须包含相同的列、表达式或者聚集函数(但不需要相同的次序)\r\n* 列数据类型必须兼容, 类型不必完全相同, 但必须是可以隐式转换的\r\n* UNION默认会去重, 如果不需要可以使用UNION ALL\r\n* 组合查询对于排序结果只能在最后一条SQL语句中指定\r\n\r\n## 子句顺序\r\n\r\n| 子句  | 说明 | 必须使用 |\r\n| :---: | :---: | :---: |\r\n| SELECT | 要返回的列或者表达式 | 是 |\r\n| FROM | 从中检索数据的表 | 仅在从表中检索数据时使用 |\r\n| WHERE | 行级过滤 | 否 |\r\n| GROUP BY | 分组说明 | 尽在按组计算聚集时使用 |\r\n| HAVING | 组级过滤 | 否 |\r\n| ORDER BY | 输出排序顺序 | 否 |\r\n| LIMIT | 限制检索行数 | 否 |\r\n\r\n## 附加\r\n\r\n::: tip 说明\r\n\r\n* 子句：SQL语句由子句构成，有些子句是必须得，有的是可选的。一个子句通常由一个关键字和所提供的数据组成。\r\n* 完全限定名：SELECT prodicts.prod_name FROM prodcucts; SELECT products.prod_name FROM crashcourse\r\n\r\n:::\r\n\r\n::: warning 注意\r\n\r\n* 当心逗号: 多个列时注意列名间加上逗号，最后一个列名不加\r\n* 使用通配符：除非你确实需要每个列，否则不要使用，检索不需要的列通常会降低检索和应用程序的性能，但同时存在一个优点可以检索到未知列\r\n* 行0：检索出来的第一行为0，而不是为行1，因此如果LIMIT 1,1将检索出的是第二行而不是第一行\r\n* 行数不够时：如果没有足够的行，MySQL将只返回它能返回的行\r\n* 何时使用引号：单引号用来限定字符串，如果将值与串类型的列进行比较则需要，数值进行比较的值不需要\r\n* MyISAM和InnoDB为最常使用的两个数据库引擎, InnoDB不支持全文本搜索, MyISAM支持\r\n\r\n:::', '{}', '内容标题', '[{\"tag\":\"h1\",\"title\":\"关键词\",\"href\":\"%E5%85%B3%E9%94%AE%E8%AF%8D\"},{\"tag\":\"h2\",\"title\":\"SELECT 检索\",\"href\":\"select-%E6%A3%80%E7%B4%A2\"},{\"tag\":\"h2\",\"title\":\"INSERT 插入\",\"href\":\"insert-%E6%8F%92%E5%85%A5\"},{\"tag\":\"h2\",\"title\":\"UPDATE 更新\",\"href\":\"update-%E6%9B%B4%E6%96%B0\"},{\"tag\":\"h2\",\"title\":\"DELETE 删除\",\"href\":\"delete-%E5%88%A0%E9%99%A4\"},{\"tag\":\"h2\",\"title\":\"FROM 来自\",\"href\":\"from-%E6%9D%A5%E8%87%AA\"},{\"tag\":\"h3\",\"title\":\"INNER JOIN 联结\",\"href\":\"inner-join-%E8%81%94%E7%BB%93\"},{\"tag\":\"h3\",\"title\":\"ON 条件\",\"href\":\"on-%E6%9D%A1%E4%BB%B6\"},{\"tag\":\"h2\",\"title\":\"AS 别名\",\"href\":\"as-%E5%88%AB%E5%90%8D\"},{\"tag\":\"h2\",\"title\":\"WHERE 筛选\",\"href\":\"where-%E7%AD%9B%E9%80%89\"},{\"tag\":\"h3\",\"title\":\"计算次序\",\"href\":\"%E8%AE%A1%E7%AE%97%E6%AC%A1%E5%BA%8F\"},{\"tag\":\"h3\",\"title\":\"AND 并且\",\"href\":\"and-%E5%B9%B6%E4%B8%94\"},{\"tag\":\"h3\",\"title\":\"OR 或者\",\"href\":\"or-%E6%88%96%E8%80%85\"},{\"tag\":\"h3\",\"title\":\"IN 包含\",\"href\":\"in-%E5%8C%85%E5%90%AB\"},{\"tag\":\"h3\",\"title\":\"NOT 否定\",\"href\":\"not-%E5%90%A6%E5%AE%9A\"},{\"tag\":\"h3\",\"title\":\"LIKE 结构\",\"href\":\"like-%E7%BB%93%E6%9E%84\"},{\"tag\":\"h3\",\"title\":\"REGEXP 正则\",\"href\":\"regexp-%E6%AD%A3%E5%88%99\"},{\"tag\":\"h2\",\"title\":\"GROUP BY 分组\",\"href\":\"group-by-%E5%88%86%E7%BB%84\"},{\"tag\":\"h2\",\"title\":\"WITH ROLLUP 统计\",\"href\":\"with-rollup-%E7%BB%9F%E8%AE%A1\"},{\"tag\":\"h2\",\"title\":\"HAVING 过滤\",\"href\":\"having-%E8%BF%87%E6%BB%A4\"},{\"tag\":\"h2\",\"title\":\"ORDER BY 排序\",\"href\":\"order-by-%E6%8E%92%E5%BA%8F\"},{\"tag\":\"h2\",\"title\":\"LIMIT 限制\",\"href\":\"limit-%E9%99%90%E5%88%B6\"},{\"tag\":\"h2\",\"title\":\"UNION 组合\",\"href\":\"union-%E7%BB%84%E5%90%88\"},{\"tag\":\"h2\",\"title\":\"子句顺序\",\"href\":\"%E5%AD%90%E5%8F%A5%E9%A1%BA%E5%BA%8F\"},{\"tag\":\"h2\",\"title\":\"附加\",\"href\":\"%E9%99%84%E5%8A%A0\"}]', '2018-12-18 11:24:13', null, null);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `alias` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户昵称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户地址',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户头像',
  `phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `birthday` date DEFAULT NULL COMMENT '用户年龄',
  `created_at` datetime DEFAULT NULL COMMENT '账号创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'utaware', '深圳市宝安区金港华庭G-27C', '/public/upload/avatar/7d7f2f16-e8df-3fd7-96c3-df06810e0096.jpg', '18285115398', '2019-01-17', '2018-12-21 15:50:22', '2019-01-04 16:55:28', null);
INSERT INTO `user_info` VALUES ('11', 'test2', null, null, null, null, '2018-12-25 18:18:40', '2018-12-25 18:18:40', null);
INSERT INTO `user_info` VALUES ('12', 'test3', null, null, null, null, '2018-12-26 17:54:18', '2018-12-26 17:54:18', null);
INSERT INTO `user_info` VALUES ('13', 'test4', null, null, null, null, '2018-12-26 18:22:38', '2018-12-26 18:22:38', null);
INSERT INTO `user_info` VALUES ('14', 'test5', null, null, null, null, '2018-12-29 11:22:55', '2018-12-29 11:22:55', null);
INSERT INTO `user_info` VALUES ('15', 'test6', null, null, null, null, '2018-12-29 11:25:53', '2018-12-29 11:25:53', null);
INSERT INTO `user_info` VALUES ('18', 'utaware', null, null, null, null, '2018-12-29 14:39:41', '2018-12-29 14:39:41', null);
INSERT INTO `user_info` VALUES ('19', 'test7', null, null, null, null, '2018-12-29 15:13:27', '2018-12-29 15:13:27', null);
INSERT INTO `user_info` VALUES ('21', 'test9', null, null, null, null, '2018-12-29 16:12:18', '2018-12-29 16:12:18', null);
INSERT INTO `user_info` VALUES ('22', 'test10', null, null, null, null, '2018-12-29 16:16:03', '2018-12-29 16:16:03', null);
INSERT INTO `user_info` VALUES ('23', 'test11', null, null, null, null, '2018-12-29 17:01:13', '2018-12-29 17:01:13', null);

-- ----------------------------
-- Table structure for user_list
-- ----------------------------
DROP TABLE IF EXISTS `user_list`;
CREATE TABLE `user_list` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'bcrypt加密后的hash值',
  `email` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  `privilege` int(11) NOT NULL DEFAULT '1',
  `role` int(11) NOT NULL DEFAULT '1',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `created_at` datetime DEFAULT NULL COMMENT '账号创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '用户信息修改时间',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_list
-- ----------------------------
INSERT INTO `user_list` VALUES ('1', 'akane', '$2b$10$Hep2.syaPqmt6km66yXq0O09kuAm9gZeiZ1GJjEtpDN/4dBLX7mmq', '1264051408@qq.com', '4', '2', '2019-01-07 09:27:51', '2018-12-03 15:42:34', '2019-01-07 09:27:51', null);
INSERT INTO `user_list` VALUES ('11', 'test2', '$2b$10$tHbzPawpoZwR.FEFd98moOg3vGsU8s9E5.PK0.QsSmgIV4c9WDSii', 'test2@qq.com', '1', '1', null, '2018-12-25 18:18:40', '2018-12-25 18:18:40', null);
INSERT INTO `user_list` VALUES ('12', 'test3', '$2b$10$BrX8lIpM1l36cVjWymxl7.ArKcyy8rpEzxoxU79Zn1d1w6w9DAHcG', 'test3@qq.com', '2', '2', null, '2018-12-26 17:54:18', '2018-12-26 17:54:18', '2018-12-29 10:51:17');
INSERT INTO `user_list` VALUES ('13', 'test4', '$2b$10$GGc2IEAWT.XAAwINchDAHOEvDXGPut8J1.yPFtBp6jgxX8C5LK3Du', 'test4@qq.com', '1', '1', null, '2018-12-26 18:22:37', '2018-12-26 18:22:37', null);
INSERT INTO `user_list` VALUES ('14', 'test5', '$2b$10$MoLrWPhCALX3Lc6KPIwLr.ch2ay4Ym9H8.KTs8uU.5TBfGKhdrWwe', 'test5@qq.com', '2', '1', null, '2018-12-29 11:22:55', '2018-12-29 11:22:55', null);
INSERT INTO `user_list` VALUES ('15', 'test6', '$2b$10$ZkcE6jgq9kv874mZ3pRZ5.8KwBlTQPOxtcBRMwn.eNOnPGLNUJ9Fa', 'test6@qq.com', '1', '1', null, '2018-12-29 11:25:53', '2018-12-29 11:25:53', null);
INSERT INTO `user_list` VALUES ('18', 'utaware', '$2b$10$wC9B4UOOfdWgMmQjoXmIRO04qYqbWmChN/OiSYAo5jvC22dyQAXZG', '1606567685@qq.com', '1', '1', null, '2018-12-29 14:39:41', '2018-12-29 14:39:41', null);
INSERT INTO `user_list` VALUES ('19', 'test7', '$2b$10$3YlKm.af6IALbcrg/9WcPeH8CXkZrlzTPps0H82b18m0PGrbh5C0y', 'test7@qq.com', '1', '1', '2018-12-29 15:20:56', '2018-12-29 15:13:27', '2018-12-29 15:20:56', null);
INSERT INTO `user_list` VALUES ('20', 'test8', '$2b$10$r4a2C4w5pfWSeD1Gh0vRuOa1p6SPqKkrRk/sGmNRCDBS6AI2GxBgy', 'test8@qq.com', '1', '1', null, '2018-12-29 15:27:37', '2018-12-29 15:27:37', null);
INSERT INTO `user_list` VALUES ('21', 'test9', '$2b$10$3YADH9aj.nPiiscW.if0peZcFeYikEHuaZAWaf.iTOuk8nGP2nInK', 'test9@qq.com', '1', '1', null, '2018-12-29 16:12:18', '2018-12-29 16:12:18', null);
INSERT INTO `user_list` VALUES ('22', 'test10', '$2b$10$fHJbI0KH/Zj0dmn90Pgofe7Ju05mMTpZPCDRSyKBZX3jW.CPmxWpm', 'test10@qq.com', '1', '1', null, '2018-12-29 16:16:03', '2018-12-29 16:16:03', null);
INSERT INTO `user_list` VALUES ('23', 'test11', '$2b$10$f7EVrE/vn9phNLx6CErTMOStbwcVYJxs4gHPkyYLGxQ.DyAA7yAlS', 'test11@qq.com', '1', '1', null, '2018-12-29 17:01:13', '2018-12-29 17:01:13', null);

-- ----------------------------
-- Table structure for visit_log
-- ----------------------------
DROP TABLE IF EXISTS `visit_log`;
CREATE TABLE `visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL COMMENT '访问ip',
  `url` varchar(255) NOT NULL COMMENT '请求地址',
  `method` varchar(255) NOT NULL COMMENT '访问方法',
  `type` varchar(255) NOT NULL COMMENT '请求content-type',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户请求头信息',
  `host` varchar(255) NOT NULL,
  `protocol` varchar(255) NOT NULL COMMENT '请求协议',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visit_log
-- ----------------------------
INSERT INTO `visit_log` VALUES ('1', '::1', '/api/user/getBreifInfo', 'GET', 'application/x-www-form-urlencoded', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '2019-01-07 16:39:18', '2019-01-07 16:39:18', null);
INSERT INTO `visit_log` VALUES ('2', '::1', '/api/user/getBreifInfo', 'GET', 'application/x-www-form-urlencoded', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '2019-01-07 16:39:48', '2019-01-07 16:39:48', null);
