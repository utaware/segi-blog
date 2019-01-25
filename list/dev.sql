/*
Navicat MySQL Data Transfer

Source Server         : utaware
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : dev

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2019-01-25 18:24:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment_table
-- ----------------------------
DROP TABLE IF EXISTS `comment_table`;
CREATE TABLE `comment_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docs_id` int(11) NOT NULL COMMENT '文档关联id',
  `user_id` int(11) NOT NULL COMMENT '发起评论的人',
  `user_name` varchar(24) NOT NULL COMMENT '发布人名字',
  `replier_id` int(11) NOT NULL COMMENT '回复人',
  `replier_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `floor` int(11) NOT NULL DEFAULT '0' COMMENT '评论楼层',
  `content` varchar(255) NOT NULL COMMENT '评论内容',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_table
-- ----------------------------
INSERT INTO `comment_table` VALUES ('1', '1', '1', 'akane', '22', 'test10', '1', 'hello test10', '2019-01-24 14:55:53', '2019-01-24 14:55:53', '2019-01-24 18:01:25');
INSERT INTO `comment_table` VALUES ('2', '1', '1', 'akane', '22', 'test10', '2', 'hello test10', '2019-01-24 14:59:22', '2019-01-24 14:59:22', null);
INSERT INTO `comment_table` VALUES ('3', '1', '1', 'akane', '22', 'test10', '3', 'hello test10', '2019-01-24 15:10:35', '2019-01-24 15:10:35', null);
INSERT INTO `comment_table` VALUES ('4', '1', '1', 'akane', '22', 'test10', '4', 'hello test10', '2019-01-24 15:12:07', '2019-01-24 15:12:07', null);
INSERT INTO `comment_table` VALUES ('5', '1', '1', 'akane', '22', 'test10', '5', '最新的评论', '2019-01-24 17:43:03', '2019-01-24 17:43:03', null);
INSERT INTO `comment_table` VALUES ('6', '1', '1', 'akane', '22', 'test10', '6', '最新的评论', '2019-01-24 17:55:46', '2019-01-24 17:55:46', null);
INSERT INTO `comment_table` VALUES ('7', '1', '1', 'akane', '22', 'test10', '7', '最新的评论', '2019-01-24 18:15:47', '2019-01-24 18:15:47', null);
INSERT INTO `comment_table` VALUES ('8', '1', '1', 'akane', '22', 'test10', '8', '最新的评论', '2019-01-24 18:16:46', '2019-01-24 18:16:46', null);
INSERT INTO `comment_table` VALUES ('9', '1', '1', 'akane', '22', 'test10', '9', '最新的评论', '2019-01-24 18:16:58', '2019-01-24 18:16:58', null);

-- ----------------------------
-- Table structure for docs_table
-- ----------------------------
DROP TABLE IF EXISTS `docs_table`;
CREATE TABLE `docs_table` (
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
-- Records of docs_table
-- ----------------------------
INSERT INTO `docs_table` VALUES ('1', '12', 'test3', '0', '1', 'md', 'hello', '++下划线++\n\n# 一级标题\n\n*斜体*\n\n**粗体**\n\n^上角标^\n\n~下角标~\n', '<p><ins>下划线</ins></p>\n<h1><a id=\"_2\"></a>一级标题</h1>\n<p><em>斜体</em></p>\n<p><strong>粗体</strong></p>\n<p><sup>上角标</sup></p>\n<p><sub>下角标</sub></p>\n', '2018-12-27 18:14:31', '2018-12-28 15:19:25', '2018-12-28 15:49:54');
INSERT INTO `docs_table` VALUES ('2', '12', 'test3', '0', '1', 'md', 'HTML 5 文档规范', '# segi-blog\n\nnone\n\n## QuickStart\n\n<!-- add docs here for user -->\n\nsee [egg docs][egg] for more detail.\n\n### Development\n\n```bash\n$ npm i\n$ npm run dev\n$ open http://localhost:7001/\n```\n\n### Deploy\n\n```bash\n$ npm start\n$ npm stop\n```\n\n### npm scripts\n\n- Use `npm run lint` to check code style.\n- Use `npm test` to run unit test.\n- Use `npm run autod` to auto detect dependencies upgrade, see [autod](https://www.npmjs.com/package/autod) for more detail.\n', '<h1><a id=\"segiblog_0\"></a>segi-blog</h1>\n<p>none</p>\n<h2><a id=\"QuickStart_4\"></a>QuickStart</h2>\n<!-- add docs here for user -->\n<p>see [egg docs][egg] for more detail.</p>\n<h3><a id=\"Development_10\"></a>Development</h3>\n<pre><div class=\"hljs\"><code class=\"lang-bash\">$ npm i\n$ npm run dev\n$ open http://localhost:7001/\n</code></div></pre>\n<h3><a id=\"Deploy_18\"></a>Deploy</h3>\n<pre><div class=\"hljs\"><code class=\"lang-bash\">$ npm start\n$ npm stop\n</code></div></pre>\n<h3><a id=\"npm_scripts_25\"></a>npm scripts</h3>\n<ul>\n<li>Use <code>npm run lint</code> to check code style.</li>\n<li>Use <code>npm test</code> to run unit test.</li>\n<li>Use <code>npm run autod</code> to auto detect dependencies upgrade, see <a href=\"https://www.npmjs.com/package/autod\" target=\"_blank\">autod</a> for more detail.</li>\n</ul>\n', '2018-12-27 18:18:07', '2018-12-27 18:18:07', null);
INSERT INTO `docs_table` VALUES ('3', '12', 'test3', '0', '1', 'md', '文档测试', '\n# 代码示范\n\n**粗体**\n\n```js\nconsole.log(\'hello world\')\n```', '<h1><a id=\"_1\"></a>代码示范</h1>\n<p><strong>粗体</strong></p>\n<pre><div class=\"hljs\"><code class=\"lang-js\"><span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'hello world\'</span>)\n</code></div></pre>\n', '2018-12-28 11:10:26', '2018-12-28 11:10:26', null);

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
-- Table structure for email_table
-- ----------------------------
DROP TABLE IF EXISTS `email_table`;
CREATE TABLE `email_table` (
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
-- Records of email_table
-- ----------------------------
INSERT INTO `email_table` VALUES ('1', '<5543a4e9-45fb-df7d-ae92-d22b9713220d@qq.com>', '1175272135@qq.com', '1264051408@qq.com', 'VJxE', '1222', '2018-12-10 14:27:09', null, null);
INSERT INTO `email_table` VALUES ('2', '<ef5df309-e0ff-41e6-602e-e5e484f8fff5@qq.com>', '1175272135@qq.com', '1264051408@qq.com', 'Wbq5', '1234', '2018-12-10 16:19:47', null, null);
INSERT INTO `email_table` VALUES ('3', '<8584b278-6c7e-d8e0-d597-8ba2a38ff57b@qq.com>', '1175272135@qq.com', '1175272135@qq.com', '<h3 title=\"nVj6\">您的验证码为</h3><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"150\" height=\"50\"><rect width=\"100%\" height=\"100%\" fill=\"#fff\"/><path fill=\"#eaa289\" d=\"M115.44 29.14L115.38 29.08L115.34 29.04Q113.68 29.09 112.44 30.52L112.38 30.46L112.26 30.33Q111.21 31.95 111.02 33.85L110.97 33.81L110.97 33.80Q110.62 35.74 111.71 36.71L111.69 36.69L111.82 36.83Q112.82 37.71 114.92 37.60L115.03 37.71L115.05 37.74Q117.03 37.47 118.13 36.78L118.12 36.77L118.23 36.88Q119.36 35.76 119.36 34.20L119.22 34.06L119.34 34.18Q119.29 33.75 119.21 33.37L119.29 33.44L119.28 33.44Q119.23 31.64 118.13 30.29L118.14 30.30L118.13 30.28Q117.07 28.98 115.39 29.09ZM115.04 40.28L115.05 40.28L115.04 40.28Q110.54 40.15 109.13 39.39L109.23 39.49L109.15 39.41Q108.13 38.65 107.94 36.94L107.91 36.92L107.94 36.94Q107.99 36.34 108.02 35.62L107.95 35.54L107.91 35.50Q108.05 34.54 108.05 34.09L108.11 34.14L108.13 34.16Q108.59 31.31 108.74 30.62L108.64 30.52L108.75 30.63Q109.23 28.71 110.06 27.30L109.93 27.17L110.07 27.31Q112.74 22.94 118.68 16.58L118.70 16.60L118.53 16.43Q121.28 16.21 123.49 15.41L123.56 15.48L123.56 15.48Q116.54 22.78 113.34 27.01L113.49 27.15L113.36 27.02Q114.52 26.70 115.81 26.70L115.75 26.63L115.69 26.57Q118.95 26.52 120.48 28.47L120.56 28.55L120.57 28.56Q121.85 30.14 122.19 33.68L122.18 33.68L122.29 33.78Q122.35 34.49 122.35 35.10L122.39 35.13L122.32 35.07Q122.33 38.20 120.13 39.27L120.11 39.25L120.07 39.21Q118.83 39.80 114.94 40.18ZM117.32 42.67L117.36 42.71L117.25 42.60Q118.52 42.53 120.50 42.61L120.59 42.70L120.45 42.56Q122.26 42.81 123.82 42.08L123.82 42.09L123.69 41.95Q124.92 41.28 124.92 39.49L124.94 39.51L124.77 39.35Q124.91 38.99 124.73 38.00L124.72 37.99L124.58 37.85Q124.60 37.05 124.60 36.59L124.53 36.52L124.42 36.40Q123.65 31.80 122.05 29.89L121.94 29.78L122.11 29.94Q121.88 29.68 121.72 29.45L121.80 29.52L121.46 29.26L121.44 29.28L121.39 29.23Q121.18 28.87 120.57 27.92L120.42 27.76L120.49 27.84Q119.48 26.78 117.50 26.33L117.65 26.48L117.66 26.49Q118.73 24.74 121.70 21.05L121.79 21.14L125.98 15.81L126.03 15.86Q124.51 16.78 122.12 17.54L121.97 17.40L122.03 17.46Q122.89 16.41 124.68 14.43L124.82 14.58L124.66 14.42Q122.41 15.63 118.52 16.20L118.36 16.03L118.51 16.18Q112.80 22.08 109.83 27.03L109.83 27.03L109.82 27.02Q108.27 29.51 107.70 35.75L107.67 35.72L107.66 35.72Q107.52 36.22 107.60 37.17L107.67 37.24L107.62 37.20Q107.80 39.05 108.90 39.96L108.96 40.02L108.77 39.83Q109.19 40.02 109.15 40.05L109.15 40.06L109.29 40.20Q109.63 41.07 110.43 41.49L110.38 41.44L110.41 41.47Q111.75 42.05 113.70 42.24L113.77 42.31L113.78 42.33Q113.72 42.27 117.22 42.57ZM117.08 31.42L117.01 31.36L116.95 31.30Q117.65 31.31 118.60 31.80L118.61 31.82L118.53 31.74Q118.93 32.74 118.93 33.39L118.94 33.40L118.86 33.33Q119.07 35.21 118.12 36.20L118.08 36.15L118.13 36.21Q117.15 37.01 115.05 37.32L114.97 37.23L114.92 37.19Q113.54 37.25 113.01 36.99L113.02 37.00L112.98 36.96Q112.73 36.44 112.73 36.14L112.85 36.26L112.80 36.21Q112.52 32.88 115.45 31.59L115.47 31.60L115.52 31.66Q116.36 31.39 117.12 31.47Z\"/><path fill=\"#90bce8\" d=\"M56.35 40.12L56.50 40.27L53.93 33.25L53.99 33.31Q49.61 20.70 43.67 14.31L43.74 14.37L43.80 14.44Q45.75 15.43 48.34 16.04L48.36 16.06L48.39 16.10Q53.49 22.34 57.83 35.09L57.86 35.12L57.79 35.05Q60.75 26.85 61.43 25.25L61.48 25.30L61.59 25.41Q63.91 19.73 66.72 16.42L66.81 16.50L66.79 16.49Q68.84 16.10 71.47 15.22L71.33 15.09L71.44 15.20Q66.90 19.83 63.85 27.06L63.71 26.93L63.89 27.11Q62.44 30.71 58.75 40.23L58.80 40.28L58.77 40.26Q58.13 40.19 57.56 40.15L57.49 40.08L57.61 40.20Q57.06 40.22 56.49 40.26ZM61.51 42.69L61.48 42.66L61.42 42.60Q64.18 32.57 65.75 28.54L65.87 28.67L65.75 28.54Q68.84 20.93 73.25 16.06L73.12 15.93L73.29 16.10Q72.13 16.34 70.03 17.07L70.03 17.07L71.31 15.87L71.18 15.74Q71.78 15.08 72.39 14.43L72.49 14.53L72.37 14.42Q69.69 15.54 66.68 16.11L66.57 16.00L66.57 16.00Q62.30 21.44 58.42 32.90L58.40 32.88L58.41 32.89Q54.59 22.60 51.39 18.22L51.40 18.23L51.43 18.26Q51.10 18.23 50.22 18.08L50.30 18.16L50.30 18.15Q49.93 17.63 48.33 15.58L48.32 15.56L48.46 15.71Q45.35 14.85 42.65 13.44L42.80 13.59L42.67 13.46Q49.34 20.59 53.72 33.38L53.75 33.41L53.67 33.33Q54.92 37.02 56.10 40.60L56.11 40.60L56.03 40.52Q56.58 40.77 57.42 40.65L57.28 40.52L57.32 40.56Q57.63 41.20 58.31 42.54L58.41 42.63L58.28 42.51Q59.15 42.46 59.87 42.54L59.86 42.53L59.97 42.63Q60.64 42.58 61.40 42.58Z\"/><path d=\"M13 4 C78 45,55 15,147 26\" stroke=\"#e773ad\" fill=\"none\"/><path fill=\"#56db77\" d=\"M30.94 30.95L30.82 30.82L30.95 30.96Q30.80 29.71 28.86 28.98L28.90 29.02L28.80 28.92Q28.44 28.86 27.91 28.86L27.81 28.77L27.79 28.74Q26.48 28.81 25.42 29.38L25.40 29.36L25.35 29.32Q24.07 30.13 24.18 31.35L24.19 31.35L24.15 31.31Q24.50 34.14 24.35 36.38L24.24 36.28L24.22 36.26Q24.22 38.85 23.50 41.36L23.52 41.38L23.36 41.22Q21.34 41.83 20.16 42.25L20.17 42.25L20.16 42.24Q21.73 38.60 21.73 34.60L21.78 34.65L21.71 34.59Q21.76 29.19 19.17 24.73L19.12 24.68L19.10 24.66Q20.33 25.17 22.72 25.89L22.72 25.88L22.71 25.87Q23.15 26.73 23.53 28.26L23.44 28.17L23.40 28.13Q24.86 26.16 28.74 26.23L28.64 26.13L28.57 26.06Q30.16 26.20 30.96 26.32L30.97 26.33L31.03 26.39Q33.92 26.69 34.00 28.71L33.99 28.71L34.02 28.73Q34.00 29.59 33.81 30.62L33.92 30.73L33.77 30.58Q33.46 33.23 33.65 36.24L33.65 36.25L33.49 36.09Q33.63 38.93 34.62 41.48L34.75 41.61L34.75 41.61Q32.95 41.11 31.24 40.95L31.36 41.08L31.18 40.89Q30.77 38.58 30.70 35.92L30.72 35.94L30.80 36.02Q30.62 33.17 30.85 30.85ZM30.88 41.32L30.98 41.42L30.85 41.29Q31.70 41.34 32.99 41.56L33.01 41.58L33.46 42.72L33.35 42.61Q33.46 43.03 33.69 43.56L33.87 43.74L33.80 43.66Q36.00 44.00 38.70 45.18L38.87 45.35L38.68 45.16Q36.34 42.05 35.65 38.25L35.71 38.31L35.65 38.25Q35.42 36.23 35.54 32.54L35.51 32.51L35.44 32.43Q35.41 32.11 35.45 31.31L35.61 31.47L35.50 31.35Q35.68 30.85 35.60 30.36L35.47 30.22L35.48 30.23Q35.36 28.55 34.25 28.05L34.34 28.14L34.27 28.07Q34.18 27.30 33.42 26.69L33.45 26.72L33.50 26.77Q31.67 25.62 28.62 25.70L28.58 25.65L28.57 25.65Q26.82 25.80 25.98 25.99L25.95 25.96L25.97 25.97Q24.47 26.26 23.51 27.17L23.58 27.24L23.53 27.19Q23.41 26.65 23.03 25.62L22.99 25.59L22.99 25.58Q20.25 24.98 18.42 23.99L18.33 23.90L18.43 23.99Q21.36 28.75 21.36 34.50L21.52 34.66L21.37 34.51Q21.51 39.03 19.61 42.88L19.47 42.73L19.45 42.72Q20.16 42.44 21.46 42.06L21.44 42.04L21.57 42.17Q21.08 43.43 20.55 44.42L20.50 44.37L20.57 44.45Q21.95 43.97 25.50 43.39L25.36 43.26L25.36 43.26Q26.44 38.21 26.32 33.37L26.24 33.29L26.31 33.35Q26.26 32.50 27.44 31.78L27.49 31.83L27.51 31.86Q28.50 31.17 29.60 31.06L29.65 31.10L29.58 31.04Q30.00 30.96 30.42 31.15L30.51 31.24L30.56 31.29Q30.28 33.72 30.32 36.27L30.45 36.39L30.28 36.23Q30.30 38.72 30.80 41.24Z\"/><path fill=\"#db5bdb\" d=\"M79.81 47.15L79.68 47.02L79.79 47.13Q78.86 47.35 76.96 47.65L76.98 47.67L76.84 47.53Q78.15 45.38 79.18 44.09L79.25 44.15L79.15 44.05Q81.04 44.50 81.19 44.50L81.04 44.34L81.05 44.36Q81.33 44.41 81.86 44.29L81.97 44.40L81.97 44.40Q82.71 44.38 82.90 44.38L82.87 44.35L82.92 44.40Q85.37 44.03 85.29 41.86L85.34 41.91L85.35 41.92Q85.31 40.43 85.19 34.18L85.11 34.10L85.17 34.17Q85.11 30.60 85.18 26.45L85.12 26.39L86.65 26.31L86.64 26.30Q87.33 26.23 88.01 26.00L87.98 25.97L87.96 25.95Q87.76 30.40 87.80 34.77L87.68 34.66L87.76 34.73Q87.82 39.14 88.35 43.51L88.33 43.49L88.34 43.50Q88.45 43.83 88.45 44.10L88.47 44.12L88.29 43.94Q88.29 45.58 86.61 45.96L86.72 46.06L86.69 46.03Q83.65 46.50 79.81 47.15ZM86.42 22.77L84.47 19.83L84.35 19.71Q85.31 18.24 87.14 15.46L87.17 15.49L87.17 15.49Q87.91 16.45 89.24 18.28L89.34 18.38L86.45 22.80ZM89.60 49.55L89.60 49.56L89.54 49.50Q90.01 49.47 90.77 49.13L90.87 49.22L90.89 49.24Q91.18 48.51 91.18 48.05L91.25 48.12L91.17 48.04Q91.22 47.75 91.11 47.14L90.94 46.98L90.97 47.01Q89.62 40.59 89.62 32.67L89.73 32.78L89.65 32.70Q89.73 29.93 89.88 27.04L89.84 26.99L89.85 27.00Q89.20 27.07 88.06 27.38L88.23 27.55L88.20 27.52Q88.19 27.02 88.23 26.49L88.29 26.54L88.27 25.35L88.37 25.45Q86.67 26.11 84.88 26.15L84.87 26.13L84.81 26.08Q84.71 30.35 84.75 33.93L84.78 33.96L85.00 41.91L84.85 41.76Q85.02 43.84 82.85 43.95L82.92 44.02L82.73 43.82Q82.54 43.86 82.02 43.92L82.14 44.04L82.01 43.90Q81.47 43.94 81.20 43.94L81.27 44.01L81.30 44.04Q80.78 43.97 79.21 43.55L79.22 43.56L79.31 43.65Q78.87 44.27 77.77 45.94L77.76 45.94L76.07 48.09L76.10 48.13Q76.98 47.94 78.62 47.56L78.60 47.54L78.21 48.33L77.73 49.03L77.62 48.92Q80.06 48.93 81.40 49.00L81.23 48.84L81.32 48.93Q83.50 48.98 89.44 49.40ZM86.49 23.61L86.49 23.61L86.90 23.14L86.87 23.10Q87.16 23.47 88.11 25.07L88.06 25.03L88.20 25.16Q89.75 22.07 91.31 18.98L91.27 18.94L91.27 18.95Q90.20 17.26 89.25 15.97L89.25 15.97L89.29 16.01Q89.20 16.34 88.86 16.87L88.74 16.75L88.78 16.80Q88.42 16.21 87.43 14.91L87.34 14.82L87.38 14.86Q86.17 16.43 83.85 19.78L83.80 19.74L83.92 19.86Q84.71 20.95 86.42 23.54Z\"/></svg>', 'nVj6', '2018-12-20 11:07:25', '2018-12-20 11:07:25', null);
INSERT INTO `email_table` VALUES ('4', '<1c4a13a2-737d-c4b3-943f-bd1773f813d6@qq.com>', '1175272135@qq.com', '1264051408@qq.com', '<h3 title=\"plpg\">您的验证码为</h3><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"150\" height=\"50\"><rect width=\"100%\" height=\"100%\" fill=\"#fff\"/><path d=\"M10 36 C59 27,95 8,148 14\" stroke=\"#6faae5\" fill=\"none\"/><path fill=\"#3bdc8c\" d=\"M28.56 29.82L28.58 29.85L28.64 29.90Q26.13 29.79 24.79 31.00L24.72 30.93L24.72 30.93Q23.35 32.11 23.65 34.62L23.83 34.80L23.66 34.63Q24.03 37.21 25.25 38.46L25.22 38.44L25.28 38.49Q26.40 39.89 28.54 39.81L28.43 39.70L28.48 39.76Q29.10 39.80 29.29 39.80L29.25 39.77L29.18 39.69Q32.83 39.19 32.94 34.59L32.87 34.52L32.96 34.61Q32.96 32.17 32.28 31.37L32.22 31.31L32.33 31.42Q31.15 30.01 28.60 29.86ZM31.88 41.55L31.89 41.57L32.00 41.67Q30.59 42.17 29.03 42.10L29.07 42.14L28.97 42.04Q25.28 42.38 23.99 39.79L23.90 39.71L23.97 39.77Q23.75 45.08 22.42 49.34L22.52 49.44L22.36 49.28Q20.61 49.82 18.98 50.54L18.96 50.53L19.06 50.62Q21.51 44.55 21.25 37.58L21.21 37.55L21.22 37.56Q21.13 30.88 18.24 24.83L18.09 24.68L18.10 24.69Q20.17 26.00 21.88 26.46L21.81 26.38L22.27 27.80L22.35 27.88Q22.41 28.17 22.68 29.27L22.67 29.26L22.62 29.22Q23.70 27.21 27.28 27.02L27.28 27.02L27.40 27.14Q28.22 27.05 29.10 27.05L29.07 27.02L29.54 27.00L29.51 26.97Q29.76 27.10 29.95 27.14L29.84 27.03L30.23 27.11L30.16 27.05Q32.30 27.40 33.03 27.63L33.02 27.62L32.92 27.52Q34.43 28.00 35.31 28.96L35.27 28.92L35.33 28.97Q36.21 30.20 36.17 31.61L36.09 31.53L36.24 31.68Q36.09 34.38 35.29 37.05L35.31 37.07L35.26 37.01Q34.27 40.55 31.90 41.58ZM36.16 42.18L36.19 42.17L36.20 42.18Q37.37 40.27 37.68 36.16L37.63 36.11L37.62 36.10Q37.72 34.30 37.72 33.04L37.85 33.17L37.79 33.12Q37.77 31.57 37.01 30.16L37.09 30.24L36.98 30.14Q36.67 29.79 36.18 29.41L36.13 29.36L35.87 28.99L35.83 28.83L35.72 28.60L35.78 28.66Q33.96 26.54 29.62 26.54L29.65 26.58L29.14 26.67L29.05 26.58Q24.40 26.58 22.77 28.18L22.71 28.12L22.72 28.13Q22.54 27.61 22.39 27.12L22.37 27.10L22.22 26.14L22.15 26.08Q19.63 25.42 17.42 23.94L17.53 24.05L17.52 24.04Q20.65 30.21 20.95 37.45L21.07 37.56L21.13 37.62Q21.37 44.83 18.52 51.30L18.37 51.15L20.37 50.30L20.51 50.44Q20.27 51.19 19.59 52.75L19.55 52.72L19.48 52.64Q22.30 51.69 24.62 51.35L24.48 51.21L24.63 51.36Q25.69 46.48 25.84 42.75L25.82 42.73L25.84 42.75Q27.19 44.17 30.80 44.40L30.90 44.49L30.86 44.45Q34.85 44.75 36.30 42.32L36.22 42.24ZM30.48 32.08L30.57 32.18L30.56 32.16Q31.14 32.02 32.25 32.37L32.33 32.45L32.25 32.37Q32.49 33.34 32.45 34.52L32.44 34.50L32.46 34.52Q32.49 35.47 32.30 36.12L32.43 36.25L32.43 36.24Q31.53 38.96 29.02 39.27L29.09 39.33L29.30 39.43L29.23 39.37Q29.23 39.44 29.11 39.48L29.13 39.49L28.51 39.41L28.46 39.36Q27.26 39.34 26.27 38.84L26.38 38.95L25.99 36.85L25.94 36.80Q25.80 34.48 27.09 33.45L27.22 33.59L27.14 33.50Q28.18 32.45 30.58 32.18Z\"/><path fill=\"#71ee90\" d=\"M87.76 29.82L87.85 29.92L87.89 29.95Q85.35 29.81 84.01 31.03L83.93 30.94L83.91 30.92Q82.69 32.25 83.00 34.77L82.91 34.68L82.93 34.70Q83.27 37.25 84.49 38.50L84.55 38.57L84.56 38.57Q85.58 39.86 87.71 39.79L87.77 39.84L87.74 39.81Q88.13 39.64 88.32 39.64L88.35 39.66L88.48 39.79Q92.00 39.16 92.11 34.55L91.99 34.43L92.00 34.45Q92.12 32.13 91.44 31.33L91.41 31.30L91.44 31.33Q90.36 30.03 87.81 29.88ZM91.08 41.56L91.11 41.59L91.08 41.55Q89.75 42.13 88.19 42.05L88.18 42.05L88.25 42.12Q84.56 42.46 83.26 39.87L83.13 39.73L83.10 39.71Q82.92 45.05 81.59 49.31L81.74 49.46L81.67 49.39Q79.82 49.83 78.18 50.55L78.30 50.67L78.19 50.55Q80.86 44.70 80.59 37.73L80.42 37.55L80.55 37.69Q80.22 30.77 77.33 24.72L77.42 24.81L77.47 24.86Q79.34 25.97 81.05 26.43L81.09 26.46L81.51 27.84L81.60 27.93Q81.65 28.21 81.92 29.31L81.97 29.36L81.87 29.27Q82.99 27.30 86.57 27.11L86.50 27.04L86.46 27.00Q87.47 27.09 88.34 27.09L88.33 27.08L88.82 27.07L88.74 27.00Q88.88 27.02 89.07 27.06L88.99 26.97L89.34 27.02L89.35 27.04Q91.53 27.43 92.26 27.66L92.15 27.55L92.18 27.58Q93.70 28.08 94.58 29.03L94.57 29.02L94.46 28.91Q95.36 30.16 95.33 31.56L95.28 31.51L95.38 31.62Q95.31 34.40 94.51 37.06L94.63 37.19L94.47 37.02Q93.58 40.67 91.22 41.70ZM95.49 42.31L95.51 42.29L95.52 42.30Q96.49 40.19 96.79 36.08L96.90 36.18L96.76 36.05Q97.05 34.43 97.05 33.17L96.91 33.03L96.94 33.06Q97.06 31.67 96.30 30.26L96.28 30.23L96.29 30.24Q95.86 29.78 95.37 29.40L95.34 29.37L95.19 29.11L94.92 28.72L95.02 28.71L94.85 28.54Q93.22 26.61 88.88 26.61L88.86 26.58L88.28 26.61L88.26 26.60Q83.63 26.61 81.99 28.20L81.98 28.19L81.93 28.15Q81.85 27.72 81.70 27.22L81.64 27.17L81.47 26.19L81.36 26.09Q79.00 25.59 76.79 24.10L76.67 23.99L76.74 24.05Q79.96 30.32 80.26 37.55L80.23 37.52L80.19 37.48Q80.56 44.82 77.70 51.29L77.71 51.30L79.57 50.30L79.57 50.30Q79.36 51.08 78.68 52.64L78.67 52.63L78.67 52.64Q81.45 51.65 83.78 51.31L83.78 51.32L83.66 51.19Q84.85 46.44 85.00 42.71L85.01 42.72L85.02 42.73Q86.34 44.13 89.96 44.36L90.03 44.43L89.97 44.36Q93.91 44.61 95.35 42.18L95.39 42.21ZM89.78 32.19L89.76 32.16L89.85 32.25Q90.44 32.12 91.55 32.47L91.57 32.49L91.44 32.36Q91.79 33.43 91.75 34.61L91.76 34.62L91.73 34.60Q91.78 35.55 91.58 36.20L91.46 36.07L91.53 36.15Q90.92 39.15 88.40 39.45L88.32 39.37L88.49 39.43L88.47 39.40Q88.33 39.34 88.21 39.38L88.33 39.49L87.76 39.46L87.74 39.43Q86.60 39.47 85.61 38.98L85.60 38.97L85.15 36.80L85.11 36.77Q84.98 34.46 86.27 33.43L86.38 33.54L86.25 33.41Q87.37 32.45 89.77 32.18Z\"/><path fill=\"#e362c3\" d=\"M54.11 14.08L54.07 14.05L54.05 14.03Q54.99 16.03 56.67 16.38L56.66 16.36L56.61 16.32Q57.18 16.47 57.86 16.28L57.88 16.29L57.83 16.24Q57.73 22.28 57.66 28.14L57.61 28.10L57.55 28.03Q57.70 34.01 57.93 39.94L57.93 39.94L57.89 39.90Q57.66 39.90 57.35 39.90L57.34 39.89L57.35 39.90Q55.73 39.84 54.43 41.67L54.32 41.55L54.34 41.58Q55.03 34.65 54.99 27.80L55.10 27.90L55.10 27.90Q55.02 21.01 54.18 14.16ZM53.92 42.71L54.05 42.84L54.05 42.85Q54.97 40.87 56.04 40.42L56.17 40.54L56.04 40.42Q56.03 41.51 56.03 42.50L56.11 42.58L55.98 42.45Q56.80 42.17 57.60 42.28L57.65 42.33L57.59 42.28Q59.52 42.49 60.74 45.19L60.78 45.23L60.70 45.16Q59.62 37.71 59.62 30.25L59.57 30.20L59.60 30.23Q59.55 22.46 60.39 15.15L60.39 15.15L60.43 15.19Q59.37 17.03 58.23 17.64L58.36 17.76L58.35 17.76Q58.41 16.78 58.48 15.72L58.43 15.66L58.37 15.61Q57.51 16.04 56.75 15.88L56.86 16.00L56.78 15.91Q54.69 15.62 53.70 12.77L53.64 12.70L53.68 12.74Q54.75 20.29 54.83 27.82L54.75 27.75L54.76 27.75Q54.95 35.33 54.07 42.87Z\"/><path fill=\"#629ed9\" d=\"M115.30 29.80L115.14 29.64L115.23 29.73Q111.00 29.50 110.43 32.55L110.43 32.55L110.49 32.60Q110.25 33.62 110.44 34.50L110.48 34.53L110.46 34.52Q110.51 35.33 110.97 36.74L110.97 36.74L110.98 36.74Q111.93 39.79 115.24 39.64L115.43 39.82L115.32 39.72Q117.42 39.88 118.76 38.32L118.73 38.29L118.61 38.17Q119.90 36.76 119.90 34.70L119.96 34.77L119.93 34.73Q119.98 34.06 119.83 33.00L119.93 33.10L119.82 32.98Q119.92 32.25 119.50 31.56L119.38 31.44L119.36 31.42Q117.82 29.85 115.23 29.73ZM120.03 48.16L120.16 48.29L120.01 48.14Q118.31 48.84 110.24 49.22L110.08 49.05L110.21 49.19Q108.41 49.14 106.77 48.30L106.78 48.31L106.82 48.34Q107.69 47.43 109.52 45.64L109.43 45.56L109.41 45.54Q111.93 46.68 114.03 46.49L113.91 46.38L113.92 46.39Q116.86 46.17 117.70 45.90L117.76 45.96L117.69 45.90Q120.00 45.28 120.00 43.49L120.05 43.53L119.91 43.40Q119.94 43.19 119.86 42.96L119.89 43.00L119.88 41.50L119.90 41.52Q119.71 40.57 119.71 39.77L119.84 39.89L119.76 39.82Q118.34 42.02 114.96 42.02L115.03 42.10L115.01 42.07Q111.05 41.99 109.41 39.79L109.46 39.83L109.60 39.97Q108.45 38.41 107.65 33.99L107.66 34.00L107.65 33.99Q107.24 32.36 107.24 30.96L107.34 31.05L107.24 30.95Q107.26 29.18 108.17 28.19L108.31 28.33L108.12 28.14Q109.90 26.84 114.55 26.84L114.44 26.73L116.35 27.08L116.37 27.10Q119.39 27.27 120.73 29.21L120.81 29.30L120.83 29.32Q120.99 28.45 121.41 26.81L121.52 26.92L121.42 26.82Q123.20 26.39 124.95 25.67L124.99 25.71L124.99 25.71Q122.31 31.78 122.31 39.01L122.35 39.05L122.26 38.97Q122.24 41.61 122.62 44.24L122.75 44.37L122.72 44.34Q122.89 45.00 122.81 45.68L122.82 45.70L122.84 45.71Q122.56 47.00 121.35 47.76L121.33 47.74L121.51 47.92Q120.96 48.13 120.12 48.25ZM123.03 51.12L123.00 51.09L123.01 51.10Q124.61 51.29 125.37 50.34L125.36 50.32L125.27 50.24Q125.68 49.35 125.57 48.63L125.45 48.52L125.45 48.52Q125.52 48.05 125.33 47.29L125.23 47.19L125.30 47.26Q124.05 42.01 124.39 36.76L124.38 36.75L124.41 36.78Q124.68 31.26 126.81 26.42L126.80 26.41L124.73 27.39L124.70 27.36Q124.94 26.76 125.17 26.19L125.25 26.27L125.62 25.01L125.62 25.00Q123.31 26.01 121.10 26.43L121.14 26.47L121.11 26.44Q120.84 27.35 120.69 28.37L120.65 28.34L120.72 28.41Q118.59 26.47 114.56 26.47L114.46 26.37L112.82 26.48L112.68 26.34Q109.46 26.36 107.79 27.77L107.80 27.79L107.82 27.80Q106.99 28.87 107.03 30.78L107.02 30.77L106.87 30.62Q107.03 33.22 108.06 37.48L108.06 37.48L108.04 37.46Q108.59 39.46 109.81 40.87L109.78 40.84L110.10 41.16L110.10 41.16L110.13 41.19Q111.15 43.39 113.74 43.92L113.72 43.91L113.78 43.96Q115.21 44.29 116.66 44.33L116.75 44.42L116.65 44.32Q118.48 44.44 119.55 44.06L119.54 44.05L119.48 43.99Q118.88 45.56 116.22 45.91L116.27 45.96L116.25 45.94Q115.09 46.00 114.40 46.00L114.50 46.09L114.12 46.10L114.12 46.09Q111.28 46.07 109.61 45.12L109.54 45.06L107.88 46.82L107.82 46.76Q107.11 47.72 106.27 48.67L106.20 48.60L106.13 48.54Q107.28 49.23 108.27 49.42L108.27 49.42L107.23 50.13L107.34 50.24Q110.10 51.36 115.73 51.36L115.73 51.36L115.95 51.35L115.93 51.33Q119.57 51.35 123.14 51.23ZM117.07 31.98L117.13 32.05L117.09 32.01Q118.42 31.96 119.33 32.38L119.29 32.35L119.41 32.46Q119.52 32.88 119.60 33.56L119.68 33.65L119.63 33.60Q119.67 33.91 119.64 34.82L119.51 34.69L119.69 34.87Q119.54 36.70 118.44 38.00L118.47 38.04L118.50 38.06Q117.32 39.47 115.42 39.43L115.24 39.26L115.39 39.41Q113.81 39.20 112.97 38.78L113.07 38.88L113.04 38.85Q112.75 37.79 112.71 36.76L112.67 36.72L112.57 36.63Q112.55 32.38 117.15 32.07Z\"/></svg>', 'plpg', '2018-12-20 11:08:17', '2018-12-20 11:08:17', null);

-- ----------------------------
-- Table structure for image_table
-- ----------------------------
DROP TABLE IF EXISTS `image_table`;
CREATE TABLE `image_table` (
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
-- Records of image_table
-- ----------------------------

-- ----------------------------
-- Table structure for privilege_table
-- ----------------------------
DROP TABLE IF EXISTS `privilege_table`;
CREATE TABLE `privilege_table` (
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
-- Records of privilege_table
-- ----------------------------
INSERT INTO `privilege_table` VALUES ('1', 'tourist', '无权限', '0', '0', '0', '0', '0', '2018-12-18 18:17:18', null, null);
INSERT INTO `privilege_table` VALUES ('2', 'ordinary', '普通成员', '1', '0', '0', '0', '0', '2018-12-18 18:22:45', null, null);
INSERT INTO `privilege_table` VALUES ('3', 'chargeman', '组长', '2', '1', '1', '0', '0', '2018-12-18 18:26:42', null, null);
INSERT INTO `privilege_table` VALUES ('4', 'headman', '负责人', '3', '1', '1', '1', '1', '2018-12-18 18:27:27', null, null);
INSERT INTO `privilege_table` VALUES ('5', 'root', '管理员', '4', '1', '1', '1', '1', '2018-12-18 18:27:42', null, null);
INSERT INTO `privilege_table` VALUES ('7', 'test', '测试', '3', '0', '0', '0', '0', '2019-01-03 17:36:59', '2019-01-03 17:37:10', '2019-01-03 17:37:27');

-- ----------------------------
-- Table structure for role_table
-- ----------------------------
DROP TABLE IF EXISTS `role_table`;
CREATE TABLE `role_table` (
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
-- Records of role_table
-- ----------------------------
INSERT INTO `role_table` VALUES ('1', 'tourist', '游客', '0', '2018-12-18 18:40:26', null, null);
INSERT INTO `role_table` VALUES ('2', 'web', 'web前端开发', '1', '2018-12-18 16:01:25', null, null);
INSERT INTO `role_table` VALUES ('3', 'java', 'java后端开发', '2', '2018-12-18 16:02:45', null, null);
INSERT INTO `role_table` VALUES ('4', 'ios', 'ios开发', '1', '2018-12-18 16:03:16', null, null);
INSERT INTO `role_table` VALUES ('5', 'android', 'android开发', '1', '2018-12-18 16:03:27', null, null);
INSERT INTO `role_table` VALUES ('6', 'test', '测试', '3', '2018-12-18 16:04:18', null, null);
INSERT INTO `role_table` VALUES ('7', 'product', '产品', '3', '2018-12-18 16:05:26', null, null);
INSERT INTO `role_table` VALUES ('8', 'operator', '运营', '3', '2018-12-18 16:07:46', '2019-01-03 16:10:36', null);
INSERT INTO `role_table` VALUES ('9', 'UI', 'UI设计', '3', '2018-12-18 16:07:59', null, null);
INSERT INTO `role_table` VALUES ('10', 'finance', '财务', '3', '2018-12-18 16:08:15', null, null);
INSERT INTO `role_table` VALUES ('11', 'spread', '推广', '3', '2018-12-18 16:09:09', null, null);
INSERT INTO `role_table` VALUES ('12', 'C_plus', 'C++开发', '2', '2018-12-18 16:09:35', null, null);
INSERT INTO `role_table` VALUES ('13', 'manage', '负责人', '4', '2018-12-18 16:09:59', null, null);
INSERT INTO `role_table` VALUES ('16', 'tests', '测试类型', '2', '2019-01-03 16:08:20', '2019-01-03 16:08:38', '2019-01-03 16:09:39');

-- ----------------------------
-- Table structure for share_table
-- ----------------------------
DROP TABLE IF EXISTS `share_table`;
CREATE TABLE `share_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传文件相关id',
  `user_id` int(11) NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_id` int(11) NOT NULL COMMENT '文件上传id',
  `day` varchar(24) NOT NULL,
  `cycle` varchar(255) NOT NULL COMMENT '期数',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `descript` longtext NOT NULL COMMENT '文档描述',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share_table
-- ----------------------------
INSERT INTO `share_table` VALUES ('1', '1', 'akane', '18', '2018/12/31', '1', '测试标题1', '测试描述1', '2019-01-09 18:34:46', '2019-01-09 18:34:46', null);
INSERT INTO `share_table` VALUES ('2', '1', 'akane', '18', '2019/01/07', '2', '测试标题2', '测试描述2', '2019-01-09 18:36:10', '2019-01-09 18:36:10', null);

-- ----------------------------
-- Table structure for total_table
-- ----------------------------
DROP TABLE IF EXISTS `total_table`;
CREATE TABLE `total_table` (
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
-- Records of total_table
-- ----------------------------
INSERT INTO `total_table` VALUES ('1', 'user', '7', '用户', '2018-12-29 11:02:03', '2019-01-25 11:43:59', null);
INSERT INTO `total_table` VALUES ('2', 'share', '0', '分享', '2018-12-29 16:49:06', null, null);
INSERT INTO `total_table` VALUES ('3', 'comment', '0', '评论', '2018-12-29 16:49:22', null, null);
INSERT INTO `total_table` VALUES ('4', 'docs', '0', '文档', '2018-12-29 16:50:57', null, null);
INSERT INTO `total_table` VALUES ('5', 'picture', '0', '图片', '2018-12-29 16:51:25', null, null);

-- ----------------------------
-- Table structure for upload_table
-- ----------------------------
DROP TABLE IF EXISTS `upload_table`;
CREATE TABLE `upload_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类',
  `filename` varchar(255) NOT NULL COMMENT '原始文件名',
  `mimeType` varchar(255) NOT NULL COMMENT '文件mime',
  `encoding` varchar(255) NOT NULL COMMENT '文件编码类型',
  `size` int(11) NOT NULL COMMENT '文件大小',
  `resource` varchar(255) NOT NULL COMMENT '文件路径',
  `relname` varchar(255) NOT NULL COMMENT 'uuid后真是存储的文件名',
  `src` varchar(255) NOT NULL COMMENT '文件相对资源请求地址',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`relname`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload_table
-- ----------------------------
INSERT INTO `upload_table` VALUES ('1', '1', 'share', 'render.md', 'application/octet-stream', '7bit', '5801', 'E:\\project\\segi-blog\\app\\public\\upload\\share\\3fdb0737-78a8-3b3c-b0ef-32ddb0cbd052.md', '3fdb0737-78a8-3b3c-b0ef-32ddb0cbd052.md', '/public/upload/share/3fdb0737-78a8-3b3c-b0ef-32ddb0cbd052.md', '2019-01-09 15:22:52', '2019-01-09 15:22:52', null);
INSERT INTO `upload_table` VALUES ('2', '1', 'avatar', 'QQ图片20181031175706.jpg', 'image/jpeg', '7bit', '40972', 'E:\\project\\segi-blog\\app\\public\\upload\\avatar\\d360d02c-4f3b-30a9-b2c4-49a8d970397f.jpg', 'd360d02c-4f3b-30a9-b2c4-49a8d970397f.jpg', '/public/upload/avatar/d360d02c-4f3b-30a9-b2c4-49a8d970397f.jpg', '2019-01-09 15:33:13', '2019-01-09 15:33:13', null);
INSERT INTO `upload_table` VALUES ('6', '1', 'share', 'share.md', 'application/octet-stream', '7bit', '5107', 'E:\\project\\segi-blog\\app\\public\\upload\\share\\75a89087-85dc-3e8c-b295-60d60bc3584c.md', '75a89087-85dc-3e8c-b295-60d60bc3584c.md', '/public/upload/share/75a89087-85dc-3e8c-b295-60d60bc3584c.md', '2019-01-09 16:37:54', '2019-01-09 16:37:54', null);
INSERT INTO `upload_table` VALUES ('18', '1', 'share', 'readme.md', 'application/octet-stream', '7bit', '2496', 'E:\\project\\segi-blog\\app\\public\\upload\\share\\dca9f720-e00d-31fd-af20-3dd58f528841.md', 'dca9f720-e00d-31fd-af20-3dd58f528841.md', '/public/upload/share/dca9f720-e00d-31fd-af20-3dd58f528841.md', '2019-01-09 18:02:57', '2019-01-09 18:02:57', null);

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
INSERT INTO `user_info` VALUES ('1', 'utaware', '深圳市宝安区金港华庭G-27C', '/public/upload/avatar/d360d02c-4f3b-30a9-b2c4-49a8d970397f.jpg', '18285115398', '2019-01-17', '2018-12-21 15:50:22', '2019-01-09 11:22:55', null);
INSERT INTO `user_info` VALUES ('19', 'test7', null, null, null, null, '2018-12-29 15:13:27', '2018-12-29 15:13:27', null);
INSERT INTO `user_info` VALUES ('21', 'test9', null, null, null, null, '2018-12-29 16:12:18', '2018-12-29 16:12:18', null);
INSERT INTO `user_info` VALUES ('22', 'test10', null, null, null, null, '2018-12-29 16:16:03', '2018-12-29 16:16:03', null);
INSERT INTO `user_info` VALUES ('23', 'test11', null, null, null, null, '2018-12-29 17:01:13', '2018-12-29 17:01:13', null);
INSERT INTO `user_info` VALUES ('24', 'test12', null, null, null, null, '2019-01-21 14:51:44', '2019-01-21 14:51:44', null);
INSERT INTO `user_info` VALUES ('25', 'utaware', null, null, null, null, '2019-01-25 11:43:59', '2019-01-25 11:43:59', null);

-- ----------------------------
-- Table structure for user_table
-- ----------------------------
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'bcrypt加密后的hash值',
  `email` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  `privilege_id` int(11) DEFAULT '1',
  `role_id` int(11) DEFAULT '1',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `created_at` datetime DEFAULT NULL COMMENT '账号创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '用户信息修改时间',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_table
-- ----------------------------
INSERT INTO `user_table` VALUES ('1', 'akane', '$2b$10$yCKR3XzGHeBLZJZsYLNXpeL.falOCeW2cE5Sz6.muIbuBh5.Xfh0u', '1264051408@qq.com', '4', '2', '2019-01-21 11:55:19', '2018-12-03 15:42:34', '2019-01-25 14:39:24', null);
INSERT INTO `user_table` VALUES ('19', 'test7', '$2b$10$3YlKm.af6IALbcrg/9WcPeH8CXkZrlzTPps0H82b18m0PGrbh5C0y', 'test7@qq.com', '1', '1', '2018-12-29 15:20:56', '2018-12-29 15:13:27', '2018-12-29 15:20:56', null);
INSERT INTO `user_table` VALUES ('21', 'test9', '$2b$10$3YADH9aj.nPiiscW.if0peZcFeYikEHuaZAWaf.iTOuk8nGP2nInK', 'test9@qq.com', '1', '1', null, '2018-12-29 16:12:18', '2018-12-29 16:12:18', null);
INSERT INTO `user_table` VALUES ('22', 'test10', '$2b$10$fHJbI0KH/Zj0dmn90Pgofe7Ju05mMTpZPCDRSyKBZX3jW.CPmxWpm', 'test10@qq.com', '1', '1', null, '2018-12-29 16:16:03', '2018-12-29 16:16:03', null);
INSERT INTO `user_table` VALUES ('23', 'test11', '$2b$10$f7EVrE/vn9phNLx6CErTMOStbwcVYJxs4gHPkyYLGxQ.DyAA7yAlS', 'test11@qq.com', '1', '1', null, '2018-12-29 17:01:13', '2018-12-29 17:01:13', null);
INSERT INTO `user_table` VALUES ('24', 'test12', '$2b$10$R7103GQFllgYAjCCxDp75OWxO7/5IeHCBifgaOd3CwQjaQ49Jqjxu', 'test12@qq.com', '1', '1', null, '2019-01-21 14:51:44', '2019-01-21 14:51:44', null);
INSERT INTO `user_table` VALUES ('25', 'utaware', '$2b$10$z0/qhngRmTC4DkfCDoUwTelVImKu/iDrQJacsCvzH51Du4JSaufFa', 'test13@qq.com', '1', '1', '2019-01-25 16:54:51', '2019-01-25 11:43:59', '2019-01-25 16:54:51', null);

-- ----------------------------
-- Table structure for visit_table
-- ----------------------------
DROP TABLE IF EXISTS `visit_table`;
CREATE TABLE `visit_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL COMMENT '访问ip',
  `url` varchar(255) NOT NULL COMMENT '请求地址',
  `method` varchar(255) NOT NULL COMMENT '访问方法',
  `type` varchar(255) NOT NULL COMMENT '请求content-type',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户请求头信息',
  `host` varchar(255) NOT NULL,
  `protocol` varchar(255) NOT NULL COMMENT '请求协议',
  `status` int(11) NOT NULL COMMENT '响应状态码',
  `code` tinyint(1) NOT NULL COMMENT '响应code',
  `message` varchar(255) NOT NULL COMMENT '响应信息',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=513 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visit_table
-- ----------------------------
INSERT INTO `visit_table` VALUES ('1', '::1', '/api/test', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', 'success', '2019-01-09 16:56:43', '2019-01-09 16:56:43', null);
INSERT INTO `visit_table` VALUES ('2', '127.0.0.1', '/api/upload/share', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享成功', '2019-01-09 17:01:57', '2019-01-09 17:01:57', null);
INSERT INTO `visit_table` VALUES ('3', '127.0.0.1', '/api/upload/share', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享成功', '2019-01-09 17:03:55', '2019-01-09 17:03:55', null);
INSERT INTO `visit_table` VALUES ('4', '127.0.0.1', '/api/upload/share', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享成功', '2019-01-09 17:04:33', '2019-01-09 17:04:33', null);
INSERT INTO `visit_table` VALUES ('5', '127.0.0.1', '/api/upload/share', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享成功', '2019-01-09 17:35:44', '2019-01-09 17:35:44', null);
INSERT INTO `visit_table` VALUES ('6', '127.0.0.1', '/api/upload/share', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享成功', '2019-01-09 17:36:23', '2019-01-09 17:36:23', null);
INSERT INTO `visit_table` VALUES ('7', '127.0.0.1', '/api/user/getList', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '获取角色权限列表成功', '2019-01-09 17:54:12', '2019-01-09 17:54:12', null);
INSERT INTO `visit_table` VALUES ('8', '127.0.0.1', '/api/upload/share', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享成功', '2019-01-09 17:54:48', '2019-01-09 17:54:48', null);
INSERT INTO `visit_table` VALUES ('9', '127.0.0.1', '/api/upload/share', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享成功', '2019-01-09 18:02:57', '2019-01-09 18:02:57', null);
INSERT INTO `visit_table` VALUES ('10', '127.0.0.1', '/api/share/create', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '新增成功', '2019-01-09 18:03:08', '2019-01-09 18:03:08', null);
INSERT INTO `visit_table` VALUES ('11', '127.0.0.1', '/api/share/create', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '新增成功', '2019-01-09 18:15:13', '2019-01-09 18:15:13', null);
INSERT INTO `visit_table` VALUES ('12', '127.0.0.1', '/api/share/create', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '新增成功', '2019-01-09 18:16:47', '2019-01-09 18:16:47', null);
INSERT INTO `visit_table` VALUES ('13', '127.0.0.1', '/api/share/create', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '新增成功', '2019-01-09 18:19:44', '2019-01-09 18:19:44', null);
INSERT INTO `visit_table` VALUES ('14', '::1', '/api/test', 'DELETE', '', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '404', '0', 'fail create', '2019-01-09 18:30:32', '2019-01-09 18:30:32', null);
INSERT INTO `visit_table` VALUES ('15', '::1', '/api/database/truncate', 'DELETE', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '重置表成功', '2019-01-09 18:30:56', '2019-01-09 18:30:56', null);
INSERT INTO `visit_table` VALUES ('16', '127.0.0.1', '/api/share/create', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '0', '新增失败', '2019-01-09 18:32:00', '2019-01-09 18:32:00', null);
INSERT INTO `visit_table` VALUES ('17', '127.0.0.1', '/api/share/create', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '0', '新增失败', '2019-01-09 18:32:32', '2019-01-09 18:32:32', null);
INSERT INTO `visit_table` VALUES ('18', '127.0.0.1', '/api/share/create', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '0', '新增失败', '2019-01-09 18:33:04', '2019-01-09 18:33:04', null);
INSERT INTO `visit_table` VALUES ('19', '127.0.0.1', '/api/share/create', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '0', '新增失败', '2019-01-09 18:33:55', '2019-01-09 18:33:55', null);
INSERT INTO `visit_table` VALUES ('20', '127.0.0.1', '/api/share/create', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '新增成功', '2019-01-09 18:34:46', '2019-01-09 18:34:46', null);
INSERT INTO `visit_table` VALUES ('21', '127.0.0.1', '/api/share/create', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '新增成功', '2019-01-09 18:36:10', '2019-01-09 18:36:10', null);
INSERT INTO `visit_table` VALUES ('22', '127.0.0.1', '/api/user/login', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '登录成功', '2019-01-12 10:33:17', '2019-01-12 10:33:17', null);
INSERT INTO `visit_table` VALUES ('23', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', 'fail', '2019-01-12 10:40:31', '2019-01-12 10:40:31', null);
INSERT INTO `visit_table` VALUES ('24', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', 'fail', '2019-01-12 10:41:14', '2019-01-12 10:41:14', null);
INSERT INTO `visit_table` VALUES ('25', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 10:46:30', '2019-01-12 10:46:30', null);
INSERT INTO `visit_table` VALUES ('26', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:00:30', '2019-01-12 11:00:30', null);
INSERT INTO `visit_table` VALUES ('27', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:03:20', '2019-01-12 11:03:20', null);
INSERT INTO `visit_table` VALUES ('28', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:03:37', '2019-01-12 11:03:37', null);
INSERT INTO `visit_table` VALUES ('29', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:03:59', '2019-01-12 11:03:59', null);
INSERT INTO `visit_table` VALUES ('30', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:04:53', '2019-01-12 11:04:53', null);
INSERT INTO `visit_table` VALUES ('31', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:04:54', '2019-01-12 11:04:54', null);
INSERT INTO `visit_table` VALUES ('32', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:05:36', '2019-01-12 11:05:36', null);
INSERT INTO `visit_table` VALUES ('33', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:05:38', '2019-01-12 11:05:38', null);
INSERT INTO `visit_table` VALUES ('34', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:05:55', '2019-01-12 11:05:55', null);
INSERT INTO `visit_table` VALUES ('35', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:05:55', '2019-01-12 11:05:55', null);
INSERT INTO `visit_table` VALUES ('36', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:15:08', '2019-01-12 11:15:08', null);
INSERT INTO `visit_table` VALUES ('37', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '查询分量成功', '2019-01-12 11:17:33', '2019-01-12 11:17:33', null);
INSERT INTO `visit_table` VALUES ('38', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '查询分量成功', '2019-01-12 11:18:05', '2019-01-12 11:18:05', null);
INSERT INTO `visit_table` VALUES ('39', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:18:31', '2019-01-12 11:18:31', null);
INSERT INTO `visit_table` VALUES ('40', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 11:22:17', '2019-01-12 11:22:17', null);
INSERT INTO `visit_table` VALUES ('41', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '查询分量成功', '2019-01-12 11:25:32', '2019-01-12 11:25:32', null);
INSERT INTO `visit_table` VALUES ('42', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '查询分量成功', '2019-01-12 11:26:03', '2019-01-12 11:26:03', null);
INSERT INTO `visit_table` VALUES ('43', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '查询分量成功', '2019-01-12 11:26:05', '2019-01-12 11:26:05', null);
INSERT INTO `visit_table` VALUES ('44', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '分享期数查询失败', '2019-01-12 13:59:34', '2019-01-12 13:59:34', null);
INSERT INTO `visit_table` VALUES ('45', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '分享期数查询失败', '2019-01-12 14:00:23', '2019-01-12 14:00:23', null);
INSERT INTO `visit_table` VALUES ('46', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '分享期数查询失败', '2019-01-12 14:00:44', '2019-01-12 14:00:44', null);
INSERT INTO `visit_table` VALUES ('47', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 14:00:59', '2019-01-12 14:00:59', null);
INSERT INTO `visit_table` VALUES ('48', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 14:04:26', '2019-01-12 14:04:26', null);
INSERT INTO `visit_table` VALUES ('49', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 14:05:36', '2019-01-12 14:05:36', null);
INSERT INTO `visit_table` VALUES ('50', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 14:14:00', '2019-01-12 14:14:00', null);
INSERT INTO `visit_table` VALUES ('51', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 14:15:47', '2019-01-12 14:15:47', null);
INSERT INTO `visit_table` VALUES ('52', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '分享期数查询失败', '2019-01-12 14:18:37', '2019-01-12 14:18:37', null);
INSERT INTO `visit_table` VALUES ('53', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '分享期数查询失败', '2019-01-12 14:19:02', '2019-01-12 14:19:02', null);
INSERT INTO `visit_table` VALUES ('54', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '分享期数查询失败', '2019-01-12 14:19:17', '2019-01-12 14:19:17', null);
INSERT INTO `visit_table` VALUES ('55', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '分享期数查询失败', '2019-01-12 14:19:19', '2019-01-12 14:19:19', null);
INSERT INTO `visit_table` VALUES ('56', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '分享期数查询失败', '2019-01-12 14:20:20', '2019-01-12 14:20:20', null);
INSERT INTO `visit_table` VALUES ('57', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 14:20:23', '2019-01-12 14:20:23', null);
INSERT INTO `visit_table` VALUES ('58', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 14:24:59', '2019-01-12 14:24:59', null);
INSERT INTO `visit_table` VALUES ('59', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 14:39:03', '2019-01-12 14:39:03', null);
INSERT INTO `visit_table` VALUES ('60', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 14:40:24', '2019-01-12 14:40:24', null);
INSERT INTO `visit_table` VALUES ('61', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '0', '查询分享失败', '2019-01-12 14:41:21', '2019-01-12 14:41:21', null);
INSERT INTO `visit_table` VALUES ('62', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 14:44:01', '2019-01-12 14:44:01', null);
INSERT INTO `visit_table` VALUES ('63', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 14:44:25', '2019-01-12 14:44:25', null);
INSERT INTO `visit_table` VALUES ('64', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 15:15:34', '2019-01-12 15:15:34', null);
INSERT INTO `visit_table` VALUES ('65', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 15:18:27', '2019-01-12 15:18:27', null);
INSERT INTO `visit_table` VALUES ('66', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 15:19:04', '2019-01-12 15:19:04', null);
INSERT INTO `visit_table` VALUES ('67', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 15:21:00', '2019-01-12 15:21:00', null);
INSERT INTO `visit_table` VALUES ('68', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 15:28:30', '2019-01-12 15:28:30', null);
INSERT INTO `visit_table` VALUES ('69', '127.0.0.1', '/api/share/remove', 'DELETE', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '404', '0', 'fail create', '2019-01-12 15:33:34', '2019-01-12 15:33:34', null);
INSERT INTO `visit_table` VALUES ('70', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 15:33:46', '2019-01-12 15:33:46', null);
INSERT INTO `visit_table` VALUES ('71', '127.0.0.1', '/api/share/remove', 'DELETE', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '404', '0', 'fail create', '2019-01-12 15:33:49', '2019-01-12 15:33:49', null);
INSERT INTO `visit_table` VALUES ('72', '127.0.0.1', '/api/share/remove', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '删除分享成功', '2019-01-12 15:34:35', '2019-01-12 15:34:35', null);
INSERT INTO `visit_table` VALUES ('73', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 15:34:37', '2019-01-12 15:34:37', null);
INSERT INTO `visit_table` VALUES ('74', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 15:40:16', '2019-01-12 15:40:16', null);
INSERT INTO `visit_table` VALUES ('75', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=10', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 15:46:53', '2019-01-12 15:46:53', null);
INSERT INTO `visit_table` VALUES ('76', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=10', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 15:47:04', '2019-01-12 15:47:04', null);
INSERT INTO `visit_table` VALUES ('77', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=10', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 15:47:13', '2019-01-12 15:47:13', null);
INSERT INTO `visit_table` VALUES ('78', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:49:00', '2019-01-12 15:49:00', null);
INSERT INTO `visit_table` VALUES ('79', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=10', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 15:49:34', '2019-01-12 15:49:34', null);
INSERT INTO `visit_table` VALUES ('80', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:50:32', '2019-01-12 15:50:32', null);
INSERT INTO `visit_table` VALUES ('81', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:50:37', '2019-01-12 15:50:37', null);
INSERT INTO `visit_table` VALUES ('82', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:51:34', '2019-01-12 15:51:34', null);
INSERT INTO `visit_table` VALUES ('83', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:51:37', '2019-01-12 15:51:37', null);
INSERT INTO `visit_table` VALUES ('84', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '分享期数查询失败', '2019-01-12 15:53:45', '2019-01-12 15:53:45', null);
INSERT INTO `visit_table` VALUES ('85', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '分享期数查询失败', '2019-01-12 15:54:00', '2019-01-12 15:54:00', null);
INSERT INTO `visit_table` VALUES ('86', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:54:03', '2019-01-12 15:54:03', null);
INSERT INTO `visit_table` VALUES ('87', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:57:08', '2019-01-12 15:57:08', null);
INSERT INTO `visit_table` VALUES ('88', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:57:09', '2019-01-12 15:57:09', null);
INSERT INTO `visit_table` VALUES ('89', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:58:12', '2019-01-12 15:58:12', null);
INSERT INTO `visit_table` VALUES ('90', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:58:39', '2019-01-12 15:58:39', null);
INSERT INTO `visit_table` VALUES ('91', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:58:41', '2019-01-12 15:58:41', null);
INSERT INTO `visit_table` VALUES ('92', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:58:44', '2019-01-12 15:58:44', null);
INSERT INTO `visit_table` VALUES ('93', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:59:11', '2019-01-12 15:59:11', null);
INSERT INTO `visit_table` VALUES ('94', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 15:59:12', '2019-01-12 15:59:12', null);
INSERT INTO `visit_table` VALUES ('95', '::1', '/api/share/cycle', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:04:46', '2019-01-12 16:04:46', null);
INSERT INTO `visit_table` VALUES ('96', '127.0.0.1', '/api/share/cycle?pageNo=1&pageSize=10', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:09:45', '2019-01-12 16:09:45', null);
INSERT INTO `visit_table` VALUES ('97', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:17:59', '2019-01-12 16:17:59', null);
INSERT INTO `visit_table` VALUES ('98', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:18:11', '2019-01-12 16:18:11', null);
INSERT INTO `visit_table` VALUES ('99', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:18:41', '2019-01-12 16:18:41', null);
INSERT INTO `visit_table` VALUES ('100', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:19:14', '2019-01-12 16:19:14', null);
INSERT INTO `visit_table` VALUES ('101', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:19:56', '2019-01-12 16:19:56', null);
INSERT INTO `visit_table` VALUES ('102', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 16:30:32', '2019-01-12 16:30:32', null);
INSERT INTO `visit_table` VALUES ('103', '::1', '/api/share/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 16:31:43', '2019-01-12 16:31:43', null);
INSERT INTO `visit_table` VALUES ('104', '::1', '/api/share/query?cycle=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 16:32:05', '2019-01-12 16:32:05', null);
INSERT INTO `visit_table` VALUES ('105', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:33:28', '2019-01-12 16:33:28', null);
INSERT INTO `visit_table` VALUES ('106', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:34:00', '2019-01-12 16:34:00', null);
INSERT INTO `visit_table` VALUES ('107', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:34:24', '2019-01-12 16:34:24', null);
INSERT INTO `visit_table` VALUES ('108', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:35:45', '2019-01-12 16:35:45', null);
INSERT INTO `visit_table` VALUES ('109', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:37:27', '2019-01-12 16:37:27', null);
INSERT INTO `visit_table` VALUES ('110', '127.0.0.1', '/api/share/query?cycle=1', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 16:47:08', '2019-01-12 16:47:08', null);
INSERT INTO `visit_table` VALUES ('111', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:47:08', '2019-01-12 16:47:08', null);
INSERT INTO `visit_table` VALUES ('112', '127.0.0.1', '/api/share/query?cycle=1', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 16:48:38', '2019-01-12 16:48:38', null);
INSERT INTO `visit_table` VALUES ('113', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:48:38', '2019-01-12 16:48:38', null);
INSERT INTO `visit_table` VALUES ('114', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 16:50:31', '2019-01-12 16:50:31', null);
INSERT INTO `visit_table` VALUES ('115', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-12 17:03:14', '2019-01-12 17:03:14', null);
INSERT INTO `visit_table` VALUES ('116', '127.0.0.1', '/api/share/query?cycle=2', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 17:05:45', '2019-01-12 17:05:45', null);
INSERT INTO `visit_table` VALUES ('117', '127.0.0.1', '/api/share/query?cycle=1', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-12 17:05:48', '2019-01-12 17:05:48', null);
INSERT INTO `visit_table` VALUES ('118', '127.0.0.1', '/api/user/login', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '登录成功', '2019-01-17 11:22:11', '2019-01-17 11:22:11', null);
INSERT INTO `visit_table` VALUES ('119', '127.0.0.1', '/api/docs', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '文档查询成功', '2019-01-17 11:24:12', '2019-01-17 11:24:12', null);
INSERT INTO `visit_table` VALUES ('120', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 11:24:39', '2019-01-17 11:24:39', null);
INSERT INTO `visit_table` VALUES ('121', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 11:24:42', '2019-01-17 11:24:42', null);
INSERT INTO `visit_table` VALUES ('122', '127.0.0.1', '/api/docs', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '文档查询成功', '2019-01-17 11:24:42', '2019-01-17 11:24:42', null);
INSERT INTO `visit_table` VALUES ('123', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 11:24:46', '2019-01-17 11:24:46', null);
INSERT INTO `visit_table` VALUES ('124', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 11:24:48', '2019-01-17 11:24:48', null);
INSERT INTO `visit_table` VALUES ('125', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-17 11:30:04', '2019-01-17 11:30:04', null);
INSERT INTO `visit_table` VALUES ('126', '127.0.0.1', '/api/share/query?cycle=1', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 11:30:08', '2019-01-17 11:30:08', null);
INSERT INTO `visit_table` VALUES ('127', '127.0.0.1', '/api/share/query?cycle=2', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 11:30:17', '2019-01-17 11:30:17', null);
INSERT INTO `visit_table` VALUES ('128', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 11:34:05', '2019-01-17 11:34:05', null);
INSERT INTO `visit_table` VALUES ('129', '127.0.0.1', '/api/docs', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '文档查询成功', '2019-01-17 16:43:13', '2019-01-17 16:43:13', null);
INSERT INTO `visit_table` VALUES ('130', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 16:43:14', '2019-01-17 16:43:14', null);
INSERT INTO `visit_table` VALUES ('131', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 16:49:20', '2019-01-17 16:49:20', null);
INSERT INTO `visit_table` VALUES ('132', '127.0.0.1', '/api/share/remove', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '删除分享成功', '2019-01-17 16:49:31', '2019-01-17 16:49:31', null);
INSERT INTO `visit_table` VALUES ('133', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 16:49:32', '2019-01-17 16:49:32', null);
INSERT INTO `visit_table` VALUES ('134', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 16:50:03', '2019-01-17 16:50:03', null);
INSERT INTO `visit_table` VALUES ('135', '127.0.0.1', '/api/share/cycle', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '分享期数查询成功', '2019-01-17 16:50:50', '2019-01-17 16:50:50', null);
INSERT INTO `visit_table` VALUES ('136', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 16:51:04', '2019-01-17 16:51:04', null);
INSERT INTO `visit_table` VALUES ('137', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 16:51:13', '2019-01-17 16:51:13', null);
INSERT INTO `visit_table` VALUES ('138', '127.0.0.1', '/api/share/query?pageNo=1&pageSize=15', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '查询分享成功', '2019-01-17 16:52:44', '2019-01-17 16:52:44', null);
INSERT INTO `visit_table` VALUES ('139', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户信息查询出错', '2019-01-18 10:26:10', '2019-01-18 10:26:10', null);
INSERT INTO `visit_table` VALUES ('140', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户信息查询出错', '2019-01-18 10:26:28', '2019-01-18 10:26:28', null);
INSERT INTO `visit_table` VALUES ('141', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '登录成功', '2019-01-18 10:26:38', '2019-01-18 10:26:38', null);
INSERT INTO `visit_table` VALUES ('142', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '登录成功', '2019-01-18 10:27:33', '2019-01-18 10:27:33', null);
INSERT INTO `visit_table` VALUES ('143', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '登录成功', '2019-01-18 10:27:34', '2019-01-18 10:27:34', null);
INSERT INTO `visit_table` VALUES ('144', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户信息查询出错', '2019-01-18 10:31:22', '2019-01-18 10:31:22', null);
INSERT INTO `visit_table` VALUES ('145', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户信息查询出错', '2019-01-18 10:31:24', '2019-01-18 10:31:24', null);
INSERT INTO `visit_table` VALUES ('146', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户信息查询出错', '2019-01-18 10:31:25', '2019-01-18 10:31:25', null);
INSERT INTO `visit_table` VALUES ('147', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '登录成功', '2019-01-18 10:31:46', '2019-01-18 10:31:46', null);
INSERT INTO `visit_table` VALUES ('148', '::1', '/api/user/login', 'GET', '', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '404', '0', 'fail create', '2019-01-18 15:19:05', '2019-01-18 15:19:05', null);
INSERT INTO `visit_table` VALUES ('149', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '登录成功', '2019-01-18 15:19:13', '2019-01-18 15:19:13', null);
INSERT INTO `visit_table` VALUES ('150', '::1', '/api/user/query', 'POST', '', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '404', '0', 'fail create', '2019-01-18 15:20:03', '2019-01-18 15:20:03', null);
INSERT INTO `visit_table` VALUES ('151', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:20:08', '2019-01-18 15:20:08', null);
INSERT INTO `visit_table` VALUES ('152', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:21:16', '2019-01-18 15:21:16', null);
INSERT INTO `visit_table` VALUES ('153', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:21:44', '2019-01-18 15:21:44', null);
INSERT INTO `visit_table` VALUES ('154', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:21:45', '2019-01-18 15:21:45', null);
INSERT INTO `visit_table` VALUES ('155', '127.0.0.1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:26:35', '2019-01-18 15:26:35', null);
INSERT INTO `visit_table` VALUES ('156', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:26:43', '2019-01-18 15:26:43', null);
INSERT INTO `visit_table` VALUES ('157', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:27:29', '2019-01-18 15:27:29', null);
INSERT INTO `visit_table` VALUES ('158', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:27:31', '2019-01-18 15:27:31', null);
INSERT INTO `visit_table` VALUES ('159', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:27:32', '2019-01-18 15:27:32', null);
INSERT INTO `visit_table` VALUES ('160', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:27:33', '2019-01-18 15:27:33', null);
INSERT INTO `visit_table` VALUES ('161', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:27:33', '2019-01-18 15:27:33', null);
INSERT INTO `visit_table` VALUES ('162', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:28:21', '2019-01-18 15:28:21', null);
INSERT INTO `visit_table` VALUES ('163', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:28:23', '2019-01-18 15:28:23', null);
INSERT INTO `visit_table` VALUES ('164', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:28:24', '2019-01-18 15:28:24', null);
INSERT INTO `visit_table` VALUES ('165', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:28:24', '2019-01-18 15:28:24', null);
INSERT INTO `visit_table` VALUES ('166', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:28:25', '2019-01-18 15:28:25', null);
INSERT INTO `visit_table` VALUES ('167', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:32:51', '2019-01-18 15:32:51', null);
INSERT INTO `visit_table` VALUES ('168', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:32:53', '2019-01-18 15:32:53', null);
INSERT INTO `visit_table` VALUES ('169', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:32:54', '2019-01-18 15:32:54', null);
INSERT INTO `visit_table` VALUES ('170', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:00', '2019-01-18 15:33:00', null);
INSERT INTO `visit_table` VALUES ('171', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:00', '2019-01-18 15:33:00', null);
INSERT INTO `visit_table` VALUES ('172', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:01', '2019-01-18 15:33:01', null);
INSERT INTO `visit_table` VALUES ('173', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:02', '2019-01-18 15:33:02', null);
INSERT INTO `visit_table` VALUES ('174', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:02', '2019-01-18 15:33:02', null);
INSERT INTO `visit_table` VALUES ('175', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:02', '2019-01-18 15:33:02', null);
INSERT INTO `visit_table` VALUES ('176', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:03', '2019-01-18 15:33:03', null);
INSERT INTO `visit_table` VALUES ('177', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:04', '2019-01-18 15:33:04', null);
INSERT INTO `visit_table` VALUES ('178', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:04', '2019-01-18 15:33:04', null);
INSERT INTO `visit_table` VALUES ('179', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:05', '2019-01-18 15:33:05', null);
INSERT INTO `visit_table` VALUES ('180', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:05', '2019-01-18 15:33:05', null);
INSERT INTO `visit_table` VALUES ('181', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:06', '2019-01-18 15:33:06', null);
INSERT INTO `visit_table` VALUES ('182', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:06', '2019-01-18 15:33:06', null);
INSERT INTO `visit_table` VALUES ('183', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:10', '2019-01-18 15:33:10', null);
INSERT INTO `visit_table` VALUES ('184', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:33:11', '2019-01-18 15:33:11', null);
INSERT INTO `visit_table` VALUES ('185', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:34:51', '2019-01-18 15:34:51', null);
INSERT INTO `visit_table` VALUES ('186', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:34:52', '2019-01-18 15:34:52', null);
INSERT INTO `visit_table` VALUES ('187', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:34:53', '2019-01-18 15:34:53', null);
INSERT INTO `visit_table` VALUES ('188', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:34:53', '2019-01-18 15:34:53', null);
INSERT INTO `visit_table` VALUES ('189', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:34:54', '2019-01-18 15:34:54', null);
INSERT INTO `visit_table` VALUES ('190', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:34:54', '2019-01-18 15:34:54', null);
INSERT INTO `visit_table` VALUES ('191', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:40:20', '2019-01-18 15:40:20', null);
INSERT INTO `visit_table` VALUES ('192', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:40:24', '2019-01-18 15:40:24', null);
INSERT INTO `visit_table` VALUES ('193', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:40:31', '2019-01-18 15:40:31', null);
INSERT INTO `visit_table` VALUES ('194', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:40:32', '2019-01-18 15:40:32', null);
INSERT INTO `visit_table` VALUES ('195', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:40:33', '2019-01-18 15:40:33', null);
INSERT INTO `visit_table` VALUES ('196', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:40:46', '2019-01-18 15:40:46', null);
INSERT INTO `visit_table` VALUES ('197', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:41:46', '2019-01-18 15:41:46', null);
INSERT INTO `visit_table` VALUES ('198', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:43:38', '2019-01-18 15:43:38', null);
INSERT INTO `visit_table` VALUES ('199', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:44:27', '2019-01-18 15:44:27', null);
INSERT INTO `visit_table` VALUES ('200', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:44:29', '2019-01-18 15:44:29', null);
INSERT INTO `visit_table` VALUES ('201', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:44:30', '2019-01-18 15:44:30', null);
INSERT INTO `visit_table` VALUES ('202', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:44:31', '2019-01-18 15:44:31', null);
INSERT INTO `visit_table` VALUES ('203', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:44:31', '2019-01-18 15:44:31', null);
INSERT INTO `visit_table` VALUES ('204', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:44:35', '2019-01-18 15:44:35', null);
INSERT INTO `visit_table` VALUES ('205', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:46:16', '2019-01-18 15:46:16', null);
INSERT INTO `visit_table` VALUES ('206', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:46:18', '2019-01-18 15:46:18', null);
INSERT INTO `visit_table` VALUES ('207', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:46:19', '2019-01-18 15:46:19', null);
INSERT INTO `visit_table` VALUES ('208', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:46:20', '2019-01-18 15:46:20', null);
INSERT INTO `visit_table` VALUES ('209', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:46:20', '2019-01-18 15:46:20', null);
INSERT INTO `visit_table` VALUES ('210', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:46:21', '2019-01-18 15:46:21', null);
INSERT INTO `visit_table` VALUES ('211', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:49:45', '2019-01-18 15:49:45', null);
INSERT INTO `visit_table` VALUES ('212', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:49:47', '2019-01-18 15:49:47', null);
INSERT INTO `visit_table` VALUES ('213', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:53:13', '2019-01-18 15:53:13', null);
INSERT INTO `visit_table` VALUES ('214', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:53:14', '2019-01-18 15:53:14', null);
INSERT INTO `visit_table` VALUES ('215', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:55:00', '2019-01-18 15:55:00', null);
INSERT INTO `visit_table` VALUES ('216', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:55:06', '2019-01-18 15:55:06', null);
INSERT INTO `visit_table` VALUES ('217', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:55:18', '2019-01-18 15:55:18', null);
INSERT INTO `visit_table` VALUES ('218', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:55:23', '2019-01-18 15:55:23', null);
INSERT INTO `visit_table` VALUES ('219', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 15:55:48', '2019-01-18 15:55:48', null);
INSERT INTO `visit_table` VALUES ('220', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 15:57:10', '2019-01-18 15:57:10', null);
INSERT INTO `visit_table` VALUES ('221', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 16:08:03', '2019-01-18 16:08:03', null);
INSERT INTO `visit_table` VALUES ('222', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:08:28', '2019-01-18 16:08:28', null);
INSERT INTO `visit_table` VALUES ('223', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:08:54', '2019-01-18 16:08:54', null);
INSERT INTO `visit_table` VALUES ('224', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:08:56', '2019-01-18 16:08:56', null);
INSERT INTO `visit_table` VALUES ('225', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:09:02', '2019-01-18 16:09:02', null);
INSERT INTO `visit_table` VALUES ('226', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:09:09', '2019-01-18 16:09:09', null);
INSERT INTO `visit_table` VALUES ('227', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:09:13', '2019-01-18 16:09:13', null);
INSERT INTO `visit_table` VALUES ('228', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:09:14', '2019-01-18 16:09:14', null);
INSERT INTO `visit_table` VALUES ('229', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:09:19', '2019-01-18 16:09:19', null);
INSERT INTO `visit_table` VALUES ('230', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:09:25', '2019-01-18 16:09:25', null);
INSERT INTO `visit_table` VALUES ('231', '127.0.0.1', '/api/user/login', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '0', '用户信息查询出错', '2019-01-18 16:25:10', '2019-01-18 16:25:10', null);
INSERT INTO `visit_table` VALUES ('232', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:29:00', '2019-01-18 16:29:00', null);
INSERT INTO `visit_table` VALUES ('233', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 16:34:23', '2019-01-18 16:34:23', null);
INSERT INTO `visit_table` VALUES ('234', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 16:34:57', '2019-01-18 16:34:57', null);
INSERT INTO `visit_table` VALUES ('235', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 16:35:21', '2019-01-18 16:35:21', null);
INSERT INTO `visit_table` VALUES ('236', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 16:35:22', '2019-01-18 16:35:22', null);
INSERT INTO `visit_table` VALUES ('237', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:35:23', '2019-01-18 16:35:23', null);
INSERT INTO `visit_table` VALUES ('238', '127.0.0.1', '/api/user/login', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '登录成功', '2019-01-18 16:37:09', '2019-01-18 16:37:09', null);
INSERT INTO `visit_table` VALUES ('239', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:37:13', '2019-01-18 16:37:13', null);
INSERT INTO `visit_table` VALUES ('240', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 16:37:59', '2019-01-18 16:37:59', null);
INSERT INTO `visit_table` VALUES ('241', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:38:02', '2019-01-18 16:38:02', null);
INSERT INTO `visit_table` VALUES ('242', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-18 16:39:02', '2019-01-18 16:39:02', null);
INSERT INTO `visit_table` VALUES ('243', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:39:05', '2019-01-18 16:39:05', null);
INSERT INTO `visit_table` VALUES ('244', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-18 16:39:07', '2019-01-18 16:39:07', null);
INSERT INTO `visit_table` VALUES ('245', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:39:10', '2019-01-18 16:39:10', null);
INSERT INTO `visit_table` VALUES ('246', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 16:42:42', '2019-01-18 16:42:42', null);
INSERT INTO `visit_table` VALUES ('247', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:42:45', '2019-01-18 16:42:45', null);
INSERT INTO `visit_table` VALUES ('248', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-18 16:45:43', '2019-01-18 16:45:43', null);
INSERT INTO `visit_table` VALUES ('249', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:45:46', '2019-01-18 16:45:46', null);
INSERT INTO `visit_table` VALUES ('250', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 16:45:49', '2019-01-18 16:45:49', null);
INSERT INTO `visit_table` VALUES ('251', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:45:52', '2019-01-18 16:45:52', null);
INSERT INTO `visit_table` VALUES ('252', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 16:46:34', '2019-01-18 16:46:34', null);
INSERT INTO `visit_table` VALUES ('253', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:46:37', '2019-01-18 16:46:37', null);
INSERT INTO `visit_table` VALUES ('254', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 16:47:50', '2019-01-18 16:47:50', null);
INSERT INTO `visit_table` VALUES ('255', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:47:53', '2019-01-18 16:47:53', null);
INSERT INTO `visit_table` VALUES ('256', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 16:48:20', '2019-01-18 16:48:20', null);
INSERT INTO `visit_table` VALUES ('257', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:48:23', '2019-01-18 16:48:23', null);
INSERT INTO `visit_table` VALUES ('258', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 16:49:11', '2019-01-18 16:49:11', null);
INSERT INTO `visit_table` VALUES ('259', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:49:14', '2019-01-18 16:49:14', null);
INSERT INTO `visit_table` VALUES ('260', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-18 16:52:16', '2019-01-18 16:52:16', null);
INSERT INTO `visit_table` VALUES ('261', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:52:19', '2019-01-18 16:52:19', null);
INSERT INTO `visit_table` VALUES ('262', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 16:52:21', '2019-01-18 16:52:21', null);
INSERT INTO `visit_table` VALUES ('263', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 16:52:24', '2019-01-18 16:52:24', null);
INSERT INTO `visit_table` VALUES ('264', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:54:10', '2019-01-18 16:54:10', null);
INSERT INTO `visit_table` VALUES ('265', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 16:54:13', '2019-01-18 16:54:13', null);
INSERT INTO `visit_table` VALUES ('266', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 16:54:42', '2019-01-18 16:54:42', null);
INSERT INTO `visit_table` VALUES ('267', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 16:57:46', '2019-01-18 16:57:46', null);
INSERT INTO `visit_table` VALUES ('268', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '信息查询失败', '2019-01-18 16:57:47', '2019-01-18 16:57:47', null);
INSERT INTO `visit_table` VALUES ('269', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-18 17:05:19', '2019-01-18 17:05:19', null);
INSERT INTO `visit_table` VALUES ('270', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-18 17:08:26', '2019-01-18 17:08:26', null);
INSERT INTO `visit_table` VALUES ('271', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:08:29', '2019-01-18 17:08:29', null);
INSERT INTO `visit_table` VALUES ('272', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 17:08:31', '2019-01-18 17:08:31', null);
INSERT INTO `visit_table` VALUES ('273', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:08:34', '2019-01-18 17:08:34', null);
INSERT INTO `visit_table` VALUES ('274', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 17:11:12', '2019-01-18 17:11:12', null);
INSERT INTO `visit_table` VALUES ('275', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:11:15', '2019-01-18 17:11:15', null);
INSERT INTO `visit_table` VALUES ('276', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 17:11:40', '2019-01-18 17:11:40', null);
INSERT INTO `visit_table` VALUES ('277', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:11:43', '2019-01-18 17:11:43', null);
INSERT INTO `visit_table` VALUES ('278', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-18 17:11:51', '2019-01-18 17:11:51', null);
INSERT INTO `visit_table` VALUES ('279', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:11:54', '2019-01-18 17:11:54', null);
INSERT INTO `visit_table` VALUES ('280', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 17:12:10', '2019-01-18 17:12:10', null);
INSERT INTO `visit_table` VALUES ('281', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:12:13', '2019-01-18 17:12:13', null);
INSERT INTO `visit_table` VALUES ('282', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-18 17:12:18', '2019-01-18 17:12:18', null);
INSERT INTO `visit_table` VALUES ('283', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:12:21', '2019-01-18 17:12:21', null);
INSERT INTO `visit_table` VALUES ('284', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 17:12:55', '2019-01-18 17:12:55', null);
INSERT INTO `visit_table` VALUES ('285', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:12:58', '2019-01-18 17:12:58', null);
INSERT INTO `visit_table` VALUES ('286', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-18 17:13:03', '2019-01-18 17:13:03', null);
INSERT INTO `visit_table` VALUES ('287', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:13:06', '2019-01-18 17:13:06', null);
INSERT INTO `visit_table` VALUES ('288', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 17:22:21', '2019-01-18 17:22:21', null);
INSERT INTO `visit_table` VALUES ('289', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:22:24', '2019-01-18 17:22:24', null);
INSERT INTO `visit_table` VALUES ('290', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-18 17:22:55', '2019-01-18 17:22:55', null);
INSERT INTO `visit_table` VALUES ('291', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:22:58', '2019-01-18 17:22:58', null);
INSERT INTO `visit_table` VALUES ('292', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 17:23:05', '2019-01-18 17:23:05', null);
INSERT INTO `visit_table` VALUES ('293', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:23:08', '2019-01-18 17:23:08', null);
INSERT INTO `visit_table` VALUES ('294', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-18 17:23:57', '2019-01-18 17:23:57', null);
INSERT INTO `visit_table` VALUES ('295', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:24:00', '2019-01-18 17:24:00', null);
INSERT INTO `visit_table` VALUES ('296', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-18 17:24:07', '2019-01-18 17:24:07', null);
INSERT INTO `visit_table` VALUES ('297', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:24:10', '2019-01-18 17:24:10', null);
INSERT INTO `visit_table` VALUES ('298', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-18 17:24:45', '2019-01-18 17:24:45', null);
INSERT INTO `visit_table` VALUES ('299', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-18 17:24:48', '2019-01-18 17:24:48', null);
INSERT INTO `visit_table` VALUES ('300', '127.0.0.1', '/api/user/login', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '登录成功', '2019-01-21 10:05:44', '2019-01-21 10:05:44', null);
INSERT INTO `visit_table` VALUES ('301', '127.0.0.1', '/api/user/login', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '登录成功', '2019-01-21 10:05:56', '2019-01-21 10:05:56', null);
INSERT INTO `visit_table` VALUES ('302', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 10:22:49', '2019-01-21 10:22:49', null);
INSERT INTO `visit_table` VALUES ('303', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-21 10:22:56', '2019-01-21 10:22:56', null);
INSERT INTO `visit_table` VALUES ('304', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 10:22:59', '2019-01-21 10:22:59', null);
INSERT INTO `visit_table` VALUES ('305', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-21 10:26:38', '2019-01-21 10:26:38', null);
INSERT INTO `visit_table` VALUES ('306', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 10:26:41', '2019-01-21 10:26:41', null);
INSERT INTO `visit_table` VALUES ('307', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-21 10:26:50', '2019-01-21 10:26:50', null);
INSERT INTO `visit_table` VALUES ('308', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 10:26:53', '2019-01-21 10:26:53', null);
INSERT INTO `visit_table` VALUES ('309', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-21 10:27:53', '2019-01-21 10:27:53', null);
INSERT INTO `visit_table` VALUES ('310', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 10:27:57', '2019-01-21 10:27:57', null);
INSERT INTO `visit_table` VALUES ('311', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-21 10:28:02', '2019-01-21 10:28:02', null);
INSERT INTO `visit_table` VALUES ('312', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 10:28:05', '2019-01-21 10:28:05', null);
INSERT INTO `visit_table` VALUES ('313', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-21 10:31:57', '2019-01-21 10:31:57', null);
INSERT INTO `visit_table` VALUES ('314', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 10:32:00', '2019-01-21 10:32:00', null);
INSERT INTO `visit_table` VALUES ('315', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-21 10:44:17', '2019-01-21 10:44:17', null);
INSERT INTO `visit_table` VALUES ('316', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 10:44:20', '2019-01-21 10:44:20', null);
INSERT INTO `visit_table` VALUES ('317', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-21 10:58:45', '2019-01-21 10:58:45', null);
INSERT INTO `visit_table` VALUES ('318', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 10:58:48', '2019-01-21 10:58:48', null);
INSERT INTO `visit_table` VALUES ('319', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-21 10:58:55', '2019-01-21 10:58:55', null);
INSERT INTO `visit_table` VALUES ('320', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 10:58:58', '2019-01-21 10:58:58', null);
INSERT INTO `visit_table` VALUES ('321', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-21 11:00:57', '2019-01-21 11:00:57', null);
INSERT INTO `visit_table` VALUES ('322', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:01:00', '2019-01-21 11:01:00', null);
INSERT INTO `visit_table` VALUES ('323', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-21 11:01:02', '2019-01-21 11:01:02', null);
INSERT INTO `visit_table` VALUES ('324', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:01:05', '2019-01-21 11:01:05', null);
INSERT INTO `visit_table` VALUES ('325', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-21 11:06:35', '2019-01-21 11:06:35', null);
INSERT INTO `visit_table` VALUES ('326', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:06:38', '2019-01-21 11:06:38', null);
INSERT INTO `visit_table` VALUES ('327', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-21 11:06:42', '2019-01-21 11:06:42', null);
INSERT INTO `visit_table` VALUES ('328', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:06:45', '2019-01-21 11:06:45', null);
INSERT INTO `visit_table` VALUES ('329', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-21 11:08:13', '2019-01-21 11:08:13', null);
INSERT INTO `visit_table` VALUES ('330', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:08:17', '2019-01-21 11:08:17', null);
INSERT INTO `visit_table` VALUES ('331', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-21 11:17:13', '2019-01-21 11:17:13', null);
INSERT INTO `visit_table` VALUES ('332', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:17:16', '2019-01-21 11:17:16', null);
INSERT INTO `visit_table` VALUES ('333', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-21 11:17:54', '2019-01-21 11:17:54', null);
INSERT INTO `visit_table` VALUES ('334', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:17:57', '2019-01-21 11:17:57', null);
INSERT INTO `visit_table` VALUES ('335', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-21 11:18:44', '2019-01-21 11:18:44', null);
INSERT INTO `visit_table` VALUES ('336', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:18:47', '2019-01-21 11:18:47', null);
INSERT INTO `visit_table` VALUES ('337', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-21 11:45:20', '2019-01-21 11:45:20', null);
INSERT INTO `visit_table` VALUES ('338', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:45:23', '2019-01-21 11:45:23', null);
INSERT INTO `visit_table` VALUES ('339', '127.0.0.1', '/api/user/login', 'POST', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '登录成功', '2019-01-21 11:55:19', '2019-01-21 11:55:19', null);
INSERT INTO `visit_table` VALUES ('340', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:55:22', '2019-01-21 11:55:22', null);
INSERT INTO `visit_table` VALUES ('341', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '0', '用户信息恢复失败', '2019-01-21 11:55:24', '2019-01-21 11:55:24', null);
INSERT INTO `visit_table` VALUES ('342', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:55:28', '2019-01-21 11:55:28', null);
INSERT INTO `visit_table` VALUES ('343', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:55:59', '2019-01-21 11:55:59', null);
INSERT INTO `visit_table` VALUES ('344', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '0', '账户注销失败', '2019-01-21 11:56:03', '2019-01-21 11:56:03', null);
INSERT INTO `visit_table` VALUES ('345', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:56:06', '2019-01-21 11:56:06', null);
INSERT INTO `visit_table` VALUES ('346', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '0', '用户信息恢复失败', '2019-01-21 11:56:13', '2019-01-21 11:56:13', null);
INSERT INTO `visit_table` VALUES ('347', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:56:16', '2019-01-21 11:56:16', null);
INSERT INTO `visit_table` VALUES ('348', '127.0.0.1', '/api/user/cancellation', 'DELETE', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '账户注销成功', '2019-01-21 11:57:06', '2019-01-21 11:57:06', null);
INSERT INTO `visit_table` VALUES ('349', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:57:09', '2019-01-21 11:57:09', null);
INSERT INTO `visit_table` VALUES ('350', '127.0.0.1', '/api/user/recovery', 'PUT', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', '用户信息恢复成功', '2019-01-21 11:57:20', '2019-01-21 11:57:20', null);
INSERT INTO `visit_table` VALUES ('351', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 11:57:23', '2019-01-21 11:57:23', null);
INSERT INTO `visit_table` VALUES ('352', '::1', '/api/user/register', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户信息创建失败', '2019-01-21 14:45:59', '2019-01-21 14:45:59', null);
INSERT INTO `visit_table` VALUES ('353', '::1', '/api/user/register', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户信息创建失败', '2019-01-21 14:50:46', '2019-01-21 14:50:46', null);
INSERT INTO `visit_table` VALUES ('354', '::1', '/api/user/register', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息创建成功', '2019-01-21 14:51:44', '2019-01-21 14:51:44', null);
INSERT INTO `visit_table` VALUES ('355', '::1', '/api/user/register', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息创建成功', '2019-01-21 14:52:12', '2019-01-21 14:52:12', null);
INSERT INTO `visit_table` VALUES ('356', '::1', '/api/user/register', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息创建成功', '2019-01-21 14:53:16', '2019-01-21 14:53:16', null);
INSERT INTO `visit_table` VALUES ('357', '::1', '/api/user/register', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户名或邮箱已存在', '2019-01-21 14:53:27', '2019-01-21 14:53:27', null);
INSERT INTO `visit_table` VALUES ('358', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 16:04:37', '2019-01-21 16:04:37', null);
INSERT INTO `visit_table` VALUES ('359', '127.0.0.1', '/api/user/getAll', 'GET', 'application/json', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.67 Safari/537.36', '127.0.0.1:3000', 'http', '200', '1', 'success', '2019-01-21 16:44:55', '2019-01-21 16:44:55', null);
INSERT INTO `visit_table` VALUES ('360', '::1', '/api/comment/getAll?pageNo=1&pageSize=10', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论失败', '2019-01-21 18:06:22', '2019-01-21 18:06:22', null);
INSERT INTO `visit_table` VALUES ('361', '::1', '/api/comment/getAll?pageNo=1&pageSize=10', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论失败', '2019-01-21 18:06:48', '2019-01-21 18:06:48', null);
INSERT INTO `visit_table` VALUES ('362', '::1', '/api/comment/getAll?pageNo=1&pageSize=10', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论失败', '2019-01-21 18:07:04', '2019-01-21 18:07:04', null);
INSERT INTO `visit_table` VALUES ('363', '::1', '/api/comment/getAll?pageNo=1&pageSize=10', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论失败', '2019-01-21 18:07:31', '2019-01-21 18:07:31', null);
INSERT INTO `visit_table` VALUES ('364', '::1', '/api/comment/getAll?pageNo=1&pageSize=10', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论失败', '2019-01-21 18:08:30', '2019-01-21 18:08:30', null);
INSERT INTO `visit_table` VALUES ('365', '::1', '/api/comment/getAll?pageNo=1&pageSize=10', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-21 18:09:42', '2019-01-21 18:09:42', null);
INSERT INTO `visit_table` VALUES ('366', '::1', '/api/comment/getAll?pageNo=1&pageSize=10', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 11:28:37', '2019-01-24 11:28:37', null);
INSERT INTO `visit_table` VALUES ('367', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 14:50:39', '2019-01-24 14:50:39', null);
INSERT INTO `visit_table` VALUES ('368', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 14:51:19', '2019-01-24 14:51:19', null);
INSERT INTO `visit_table` VALUES ('369', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 14:51:22', '2019-01-24 14:51:22', null);
INSERT INTO `visit_table` VALUES ('370', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 14:52:13', '2019-01-24 14:52:13', null);
INSERT INTO `visit_table` VALUES ('371', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 14:52:22', '2019-01-24 14:52:22', null);
INSERT INTO `visit_table` VALUES ('372', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 14:54:29', '2019-01-24 14:54:29', null);
INSERT INTO `visit_table` VALUES ('373', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 14:54:50', '2019-01-24 14:54:50', null);
INSERT INTO `visit_table` VALUES ('374', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '新增评论成功', '2019-01-24 14:55:53', '2019-01-24 14:55:53', null);
INSERT INTO `visit_table` VALUES ('375', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 14:58:33', '2019-01-24 14:58:33', null);
INSERT INTO `visit_table` VALUES ('376', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '新增评论成功', '2019-01-24 14:59:22', '2019-01-24 14:59:22', null);
INSERT INTO `visit_table` VALUES ('377', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 15:00:02', '2019-01-24 15:00:02', null);
INSERT INTO `visit_table` VALUES ('378', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 15:01:09', '2019-01-24 15:01:09', null);
INSERT INTO `visit_table` VALUES ('379', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 15:02:09', '2019-01-24 15:02:09', null);
INSERT INTO `visit_table` VALUES ('380', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 15:03:19', '2019-01-24 15:03:19', null);
INSERT INTO `visit_table` VALUES ('381', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 15:05:37', '2019-01-24 15:05:37', null);
INSERT INTO `visit_table` VALUES ('382', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 15:06:09', '2019-01-24 15:06:09', null);
INSERT INTO `visit_table` VALUES ('383', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 15:06:33', '2019-01-24 15:06:33', null);
INSERT INTO `visit_table` VALUES ('384', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 15:07:52', '2019-01-24 15:07:52', null);
INSERT INTO `visit_table` VALUES ('385', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 15:08:22', '2019-01-24 15:08:22', null);
INSERT INTO `visit_table` VALUES ('386', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新增评论失败', '2019-01-24 15:09:15', '2019-01-24 15:09:15', null);
INSERT INTO `visit_table` VALUES ('387', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '新增评论成功', '2019-01-24 15:10:35', '2019-01-24 15:10:35', null);
INSERT INTO `visit_table` VALUES ('388', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '新增评论成功', '2019-01-24 15:12:07', '2019-01-24 15:12:07', null);
INSERT INTO `visit_table` VALUES ('389', '::1', '/api/comment/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 15:18:01', '2019-01-24 15:18:01', null);
INSERT INTO `visit_table` VALUES ('390', '::1', '/api/comment/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 16:57:11', '2019-01-24 16:57:11', null);
INSERT INTO `visit_table` VALUES ('391', '::1', '/api/comment/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 16:58:22', '2019-01-24 16:58:22', null);
INSERT INTO `visit_table` VALUES ('392', '::1', '/api/comment/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:00:06', '2019-01-24 17:00:06', null);
INSERT INTO `visit_table` VALUES ('393', '::1', '/api/comment/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:00:29', '2019-01-24 17:00:29', null);
INSERT INTO `visit_table` VALUES ('394', '::1', '/api/comment/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:05:03', '2019-01-24 17:05:03', null);
INSERT INTO `visit_table` VALUES ('395', '::1', '/api/comment/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:05:10', '2019-01-24 17:05:10', null);
INSERT INTO `visit_table` VALUES ('396', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:06:54', '2019-01-24 17:06:54', null);
INSERT INTO `visit_table` VALUES ('397', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:07:28', '2019-01-24 17:07:28', null);
INSERT INTO `visit_table` VALUES ('398', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:08:24', '2019-01-24 17:08:24', null);
INSERT INTO `visit_table` VALUES ('399', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:08:27', '2019-01-24 17:08:27', null);
INSERT INTO `visit_table` VALUES ('400', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:08:32', '2019-01-24 17:08:32', null);
INSERT INTO `visit_table` VALUES ('401', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:09:27', '2019-01-24 17:09:27', null);
INSERT INTO `visit_table` VALUES ('402', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:09:29', '2019-01-24 17:09:29', null);
INSERT INTO `visit_table` VALUES ('403', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:09:30', '2019-01-24 17:09:30', null);
INSERT INTO `visit_table` VALUES ('404', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:09:34', '2019-01-24 17:09:34', null);
INSERT INTO `visit_table` VALUES ('405', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:09:34', '2019-01-24 17:09:34', null);
INSERT INTO `visit_table` VALUES ('406', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:09:40', '2019-01-24 17:09:40', null);
INSERT INTO `visit_table` VALUES ('407', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:09:41', '2019-01-24 17:09:41', null);
INSERT INTO `visit_table` VALUES ('408', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:09:53', '2019-01-24 17:09:53', null);
INSERT INTO `visit_table` VALUES ('409', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:10:22', '2019-01-24 17:10:22', null);
INSERT INTO `visit_table` VALUES ('410', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:10:23', '2019-01-24 17:10:23', null);
INSERT INTO `visit_table` VALUES ('411', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:10:24', '2019-01-24 17:10:24', null);
INSERT INTO `visit_table` VALUES ('412', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:10:25', '2019-01-24 17:10:25', null);
INSERT INTO `visit_table` VALUES ('413', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:10:25', '2019-01-24 17:10:25', null);
INSERT INTO `visit_table` VALUES ('414', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:10:25', '2019-01-24 17:10:25', null);
INSERT INTO `visit_table` VALUES ('415', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:10:25', '2019-01-24 17:10:25', null);
INSERT INTO `visit_table` VALUES ('416', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:16:27', '2019-01-24 17:16:27', null);
INSERT INTO `visit_table` VALUES ('417', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:16:28', '2019-01-24 17:16:28', null);
INSERT INTO `visit_table` VALUES ('418', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:16:29', '2019-01-24 17:16:29', null);
INSERT INTO `visit_table` VALUES ('419', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:16:29', '2019-01-24 17:16:29', null);
INSERT INTO `visit_table` VALUES ('420', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:16:30', '2019-01-24 17:16:30', null);
INSERT INTO `visit_table` VALUES ('421', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:16:30', '2019-01-24 17:16:30', null);
INSERT INTO `visit_table` VALUES ('422', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:16:31', '2019-01-24 17:16:31', null);
INSERT INTO `visit_table` VALUES ('423', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:16:31', '2019-01-24 17:16:31', null);
INSERT INTO `visit_table` VALUES ('424', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:16:47', '2019-01-24 17:16:47', null);
INSERT INTO `visit_table` VALUES ('425', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:19:37', '2019-01-24 17:19:37', null);
INSERT INTO `visit_table` VALUES ('426', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:19:45', '2019-01-24 17:19:45', null);
INSERT INTO `visit_table` VALUES ('427', '127.0.0.1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:20:32', '2019-01-24 17:20:32', null);
INSERT INTO `visit_table` VALUES ('428', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:20:44', '2019-01-24 17:20:44', null);
INSERT INTO `visit_table` VALUES ('429', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:20:49', '2019-01-24 17:20:49', null);
INSERT INTO `visit_table` VALUES ('430', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:21:13', '2019-01-24 17:21:13', null);
INSERT INTO `visit_table` VALUES ('431', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:21:30', '2019-01-24 17:21:30', null);
INSERT INTO `visit_table` VALUES ('432', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:22:25', '2019-01-24 17:22:25', null);
INSERT INTO `visit_table` VALUES ('433', '::1', '/api/comment/getAll?docs_id=2', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:22:39', '2019-01-24 17:22:39', null);
INSERT INTO `visit_table` VALUES ('434', '::1', '/api/comment/getAll?docs_id=2', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:24:43', '2019-01-24 17:24:43', null);
INSERT INTO `visit_table` VALUES ('435', '::1', '/api/comment/getAll?docs_id=2', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:25:25', '2019-01-24 17:25:25', null);
INSERT INTO `visit_table` VALUES ('436', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:25:29', '2019-01-24 17:25:29', null);
INSERT INTO `visit_table` VALUES ('437', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 17:25:59', '2019-01-24 17:25:59', null);
INSERT INTO `visit_table` VALUES ('438', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:26:03', '2019-01-24 17:26:03', null);
INSERT INTO `visit_table` VALUES ('439', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:29:17', '2019-01-24 17:29:17', null);
INSERT INTO `visit_table` VALUES ('440', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:30:09', '2019-01-24 17:30:09', null);
INSERT INTO `visit_table` VALUES ('441', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:30:11', '2019-01-24 17:30:11', null);
INSERT INTO `visit_table` VALUES ('442', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:30:12', '2019-01-24 17:30:12', null);
INSERT INTO `visit_table` VALUES ('443', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:30:12', '2019-01-24 17:30:12', null);
INSERT INTO `visit_table` VALUES ('444', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:30:13', '2019-01-24 17:30:13', null);
INSERT INTO `visit_table` VALUES ('445', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:30:14', '2019-01-24 17:30:14', null);
INSERT INTO `visit_table` VALUES ('446', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:30:38', '2019-01-24 17:30:38', null);
INSERT INTO `visit_table` VALUES ('447', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:30:44', '2019-01-24 17:30:44', null);
INSERT INTO `visit_table` VALUES ('448', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:34:58', '2019-01-24 17:34:58', null);
INSERT INTO `visit_table` VALUES ('449', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:35:30', '2019-01-24 17:35:30', null);
INSERT INTO `visit_table` VALUES ('450', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:35:34', '2019-01-24 17:35:34', null);
INSERT INTO `visit_table` VALUES ('451', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:37:23', '2019-01-24 17:37:23', null);
INSERT INTO `visit_table` VALUES ('452', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 17:37:35', '2019-01-24 17:37:35', null);
INSERT INTO `visit_table` VALUES ('453', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '新增评论成功', '2019-01-24 17:43:03', '2019-01-24 17:43:03', null);
INSERT INTO `visit_table` VALUES ('454', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '新增评论成功', '2019-01-24 17:55:46', '2019-01-24 17:55:46', null);
INSERT INTO `visit_table` VALUES ('455', '::1', '/api/comment/destory', 'DELETE', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '评论删除失败', '2019-01-24 17:59:47', '2019-01-24 17:59:47', null);
INSERT INTO `visit_table` VALUES ('456', '::1', '/api/comment/destory', 'DELETE', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '评论删除失败', '2019-01-24 18:00:18', '2019-01-24 18:00:18', null);
INSERT INTO `visit_table` VALUES ('457', '::1', '/api/comment/destory', 'DELETE', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '评论删除失败', '2019-01-24 18:00:41', '2019-01-24 18:00:41', null);
INSERT INTO `visit_table` VALUES ('458', '127.0.0.1', '/api/comment/destory', 'DELETE', '', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '404', '0', 'fail create', '2019-01-24 18:01:19', '2019-01-24 18:01:19', null);
INSERT INTO `visit_table` VALUES ('459', '::1', '/api/comment/destroy', 'DELETE', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '删除评论成功', '2019-01-24 18:01:25', '2019-01-24 18:01:25', null);
INSERT INTO `visit_table` VALUES ('460', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '新增评论成功', '2019-01-24 18:15:47', '2019-01-24 18:15:47', null);
INSERT INTO `visit_table` VALUES ('461', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '新增评论成功', '2019-01-24 18:16:46', '2019-01-24 18:16:46', null);
INSERT INTO `visit_table` VALUES ('462', '::1', '/api/comment/create', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '新增评论成功', '2019-01-24 18:16:58', '2019-01-24 18:16:58', null);
INSERT INTO `visit_table` VALUES ('463', '::1', '/api/comment/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '参数校验未通过', '2019-01-24 18:17:24', '2019-01-24 18:17:24', null);
INSERT INTO `visit_table` VALUES ('464', '::1', '/api/comment/id', 'GET', '', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '404', '0', 'fail create', '2019-01-24 18:17:33', '2019-01-24 18:17:33', null);
INSERT INTO `visit_table` VALUES ('465', '::1', '/api/comment?docs_id=1', 'GET', '', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '404', '0', 'fail create', '2019-01-24 18:17:41', '2019-01-24 18:17:41', null);
INSERT INTO `visit_table` VALUES ('466', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 18:17:48', '2019-01-24 18:17:48', null);
INSERT INTO `visit_table` VALUES ('467', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 18:20:05', '2019-01-24 18:20:05', null);
INSERT INTO `visit_table` VALUES ('468', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 18:20:31', '2019-01-24 18:20:31', null);
INSERT INTO `visit_table` VALUES ('469', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 18:20:33', '2019-01-24 18:20:33', null);
INSERT INTO `visit_table` VALUES ('470', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 18:25:55', '2019-01-24 18:25:55', null);
INSERT INTO `visit_table` VALUES ('471', '::1', '/api/comment/getAll?docs_id=1', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询所有评论成功', '2019-01-24 18:26:09', '2019-01-24 18:26:09', null);
INSERT INTO `visit_table` VALUES ('472', '::1', '/api/user/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', 'success', '2019-01-24 18:28:31', '2019-01-24 18:28:31', null);
INSERT INTO `visit_table` VALUES ('473', '::1', '/api/user/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', 'success', '2019-01-24 18:29:31', '2019-01-24 18:29:31', null);
INSERT INTO `visit_table` VALUES ('474', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:26:35', '2019-01-25 10:26:35', null);
INSERT INTO `visit_table` VALUES ('475', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:31:27', '2019-01-25 10:31:27', null);
INSERT INTO `visit_table` VALUES ('476', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:31:29', '2019-01-25 10:31:29', null);
INSERT INTO `visit_table` VALUES ('477', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:31:35', '2019-01-25 10:31:35', null);
INSERT INTO `visit_table` VALUES ('478', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:31:36', '2019-01-25 10:31:36', null);
INSERT INTO `visit_table` VALUES ('479', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:31:37', '2019-01-25 10:31:37', null);
INSERT INTO `visit_table` VALUES ('480', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:31:38', '2019-01-25 10:31:38', null);
INSERT INTO `visit_table` VALUES ('481', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:31:43', '2019-01-25 10:31:43', null);
INSERT INTO `visit_table` VALUES ('482', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:31:44', '2019-01-25 10:31:44', null);
INSERT INTO `visit_table` VALUES ('483', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:31:57', '2019-01-25 10:31:57', null);
INSERT INTO `visit_table` VALUES ('484', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:32:06', '2019-01-25 10:32:06', null);
INSERT INTO `visit_table` VALUES ('485', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:32:07', '2019-01-25 10:32:07', null);
INSERT INTO `visit_table` VALUES ('486', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:32:08', '2019-01-25 10:32:08', null);
INSERT INTO `visit_table` VALUES ('487', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:32:16', '2019-01-25 10:32:16', null);
INSERT INTO `visit_table` VALUES ('488', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:32:27', '2019-01-25 10:32:27', null);
INSERT INTO `visit_table` VALUES ('489', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:32:32', '2019-01-25 10:32:32', null);
INSERT INTO `visit_table` VALUES ('490', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:32:41', '2019-01-25 10:32:41', null);
INSERT INTO `visit_table` VALUES ('491', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:32:42', '2019-01-25 10:32:42', null);
INSERT INTO `visit_table` VALUES ('492', '::1', '/api/user/query', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息查询成功', '2019-01-25 10:32:43', '2019-01-25 10:32:43', null);
INSERT INTO `visit_table` VALUES ('493', '::1', '/api/user/register', 'POST', '', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '404', '0', 'fail create', '2019-01-25 11:35:20', '2019-01-25 11:35:20', null);
INSERT INTO `visit_table` VALUES ('494', '::1', '/api/user/register', 'POST', '', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '404', '0', 'fail create', '2019-01-25 11:36:04', '2019-01-25 11:36:04', null);
INSERT INTO `visit_table` VALUES ('495', '::1', '/api/user/register', 'POST', '', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '404', '0', 'fail create', '2019-01-25 11:36:05', '2019-01-25 11:36:05', null);
INSERT INTO `visit_table` VALUES ('496', '::1', '/api/user/register', 'POST', '', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '404', '0', 'fail create', '2019-01-25 11:37:59', '2019-01-25 11:37:59', null);
INSERT INTO `visit_table` VALUES ('497', '::1', '/api/user/register', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户信息创建失败', '2019-01-25 11:39:19', '2019-01-25 11:39:19', null);
INSERT INTO `visit_table` VALUES ('498', '::1', '/api/user/register', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户信息创建失败', '2019-01-25 11:41:07', '2019-01-25 11:41:07', null);
INSERT INTO `visit_table` VALUES ('499', '::1', '/api/user/register', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户信息创建失败', '2019-01-25 11:43:05', '2019-01-25 11:43:05', null);
INSERT INTO `visit_table` VALUES ('500', '::1', '/api/user/register', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '用户信息创建成功', '2019-01-25 11:43:59', '2019-01-25 11:43:59', null);
INSERT INTO `visit_table` VALUES ('501', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '登录成功', '2019-01-25 14:10:24', '2019-01-25 14:10:24', null);
INSERT INTO `visit_table` VALUES ('502', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户信息查询出错', '2019-01-25 14:24:17', '2019-01-25 14:24:17', null);
INSERT INTO `visit_table` VALUES ('503', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '用户信息查询出错', '2019-01-25 14:24:44', '2019-01-25 14:24:44', null);
INSERT INTO `visit_table` VALUES ('504', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '登录成功', '2019-01-25 14:25:09', '2019-01-25 14:25:09', null);
INSERT INTO `visit_table` VALUES ('505', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '登录成功', '2019-01-25 14:30:11', '2019-01-25 14:30:11', null);
INSERT INTO `visit_table` VALUES ('506', '::1', '/api/user/modify', 'PUT', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '新密码不能与原密码相同', '2019-01-25 14:39:15', '2019-01-25 14:39:15', null);
INSERT INTO `visit_table` VALUES ('507', '::1', '/api/user/modify', 'PUT', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '密码修改成功', '2019-01-25 14:39:24', '2019-01-25 14:39:24', null);
INSERT INTO `visit_table` VALUES ('508', '::1', '/api/user/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询错误', '2019-01-25 14:59:28', '2019-01-25 14:59:28', null);
INSERT INTO `visit_table` VALUES ('509', '::1', '/api/user/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '0', '查询错误', '2019-01-25 14:59:45', '2019-01-25 14:59:45', null);
INSERT INTO `visit_table` VALUES ('510', '::1', '/api/user/getAll', 'GET', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', 'success', '2019-01-25 15:00:44', '2019-01-25 15:00:44', null);
INSERT INTO `visit_table` VALUES ('511', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '登录成功', '2019-01-25 16:50:48', '2019-01-25 16:50:48', null);
INSERT INTO `visit_table` VALUES ('512', '::1', '/api/user/login', 'POST', 'application/json', 'PostmanRuntime/3.0.9', 'localhost:3000', 'http', '200', '1', '登录成功', '2019-01-25 16:54:51', '2019-01-25 16:54:51', null);
