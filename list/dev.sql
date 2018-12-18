/*
Navicat MySQL Data Transfer

Source Server         : utaware
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : dev

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2018-12-18 18:42:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for email_list
-- ----------------------------
DROP TABLE IF EXISTS `email_list`;
CREATE TABLE `email_list` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '邮件对应id',
  `messageId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件id',
  `sender` varchar(24) NOT NULL COMMENT '邮件发送人',
  `receiver` varchar(24) NOT NULL COMMENT '邮件接收人',
  `text` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件发送内容',
  `create_time` datetime NOT NULL COMMENT '邮件创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email_list
-- ----------------------------
INSERT INTO `email_list` VALUES ('1', '<5543a4e9-45fb-df7d-ae92-d22b9713220d@qq.com>', '1175272135@qq.com', '1264051408@qq.com', 'VJxE', '2018-12-10 14:27:09');
INSERT INTO `email_list` VALUES ('2', '<ef5df309-e0ff-41e6-602e-e5e484f8fff5@qq.com>', '1175272135@qq.com', '1264051408@qq.com', 'Wbq5', '2018-12-10 16:19:47');

-- ----------------------------
-- Table structure for image_list
-- ----------------------------
DROP TABLE IF EXISTS `image_list`;
CREATE TABLE `image_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单张图片id',
  `user_id` int(11) NOT NULL COMMENT '图片上传人id',
  `path` varchar(128) NOT NULL COMMENT '图片路径',
  `name` varchar(64) NOT NULL COMMENT '原始图片名',
  `size` varchar(24) NOT NULL COMMENT '图片大小',
  `type` varchar(24) NOT NULL COMMENT '图片格式',
  `src` varchar(128) NOT NULL COMMENT '外链地址',
  `create_time` datetime DEFAULT NULL COMMENT '图片上传时间',
  `update_time` datetime DEFAULT NULL COMMENT '图片相关信息被修改时间',
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
  `role` varchar(24) NOT NULL,
  `remark` varchar(24) NOT NULL,
  `level` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege_list
-- ----------------------------
INSERT INTO `privilege_list` VALUES ('1', 'tourist', '游客', '0', '2018-12-18 18:17:18', null);
INSERT INTO `privilege_list` VALUES ('2', 'ordinary', '普通成员', '1', '2018-12-18 18:22:45', null);
INSERT INTO `privilege_list` VALUES ('3', 'chargeman', '组长', '2', '2018-12-18 18:26:42', null);
INSERT INTO `privilege_list` VALUES ('4', 'headman', '负责人', '3', '2018-12-18 18:27:27', null);
INSERT INTO `privilege_list` VALUES ('5', 'root', '管理员', '4', '2018-12-18 18:27:42', null);

-- ----------------------------
-- Table structure for role_list
-- ----------------------------
DROP TABLE IF EXISTS `role_list`;
CREATE TABLE `role_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位类型id',
  `type` varchar(24) NOT NULL,
  `remark` varchar(24) NOT NULL,
  `group` enum('0','1','2','3','4') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0-待分组 1-前端开发 2-后端开发 3-非开发人员 4-管理人员',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_list
-- ----------------------------
INSERT INTO `role_list` VALUES ('1', 'web', 'web前端开发', '1', '2018-12-18 16:01:25', null);
INSERT INTO `role_list` VALUES ('2', 'java', 'java后端开发', '2', '2018-12-18 16:02:45', null);
INSERT INTO `role_list` VALUES ('3', 'ios', 'ios开发', '1', '2018-12-18 16:03:16', null);
INSERT INTO `role_list` VALUES ('4', 'android', 'android开发', '1', '2018-12-18 16:03:27', null);
INSERT INTO `role_list` VALUES ('5', 'test', '测试', '3', '2018-12-18 16:04:18', null);
INSERT INTO `role_list` VALUES ('6', 'product', '产品', '3', '2018-12-18 16:05:26', null);
INSERT INTO `role_list` VALUES ('7', 'operator', '运营', '3', '2018-12-18 16:07:46', null);
INSERT INTO `role_list` VALUES ('8', 'UI', 'UI设计', '3', '2018-12-18 16:07:59', null);
INSERT INTO `role_list` VALUES ('9', 'finance', '财务', '3', '2018-12-18 16:08:15', null);
INSERT INTO `role_list` VALUES ('10', 'spread', '推广', '3', '2018-12-18 16:09:09', null);
INSERT INTO `role_list` VALUES ('11', 'C_plus', 'C++开发', '2', '2018-12-18 16:09:35', null);
INSERT INTO `role_list` VALUES ('12', 'manage', '负责人', '4', '2018-12-18 16:09:59', null);
INSERT INTO `role_list` VALUES ('13', 'tourist', '游客', '0', '2018-12-18 18:40:26', null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload_docs
-- ----------------------------
INSERT INTO `upload_docs` VALUES ('8', '6', '0', 'E:\\project\\segi-blog\\app\\public\\upload\\upload_3d660d560df62aad60607ea456c14472.md', '1.md', '2846', '<hr>\n<h2 id=\"title%3A-\'mysql%E5%86%85%E5%AE%B9%E7%AE%80%E4%BB%8B\'\"><a class=\"header-anchor\" href=\"#title%3A-\'mysql%E5%86%85%E5%AE%B9%E7%AE%80%E4%BB%8B\'\" aria-hidden=\"true\">#</a> title: \'mysql内容简介\'</h2>\n<div class=\"tip custom-block\"><p class=\"custom-block-title\">主要概念</p>\n<p>数据库(dataBase)：保存有组织数据的容器</p>\n<p>表(table)：某种特定类型数据的结构化清单</p>\n<p>模式(schema)：关于数据库和表的布局及特性的信息</p>\n<p>列(column)：表中的一个字段，所有表都是由一个列或者多个列组成的</p>\n<p>数据类型(datatype)：所容许的数据的类型，每个表列都有相应的数据类型，限制该列中存储的数据</p>\n<p>行(row)：表中的一个记录</p>\n<p>主键(primary key)：一列(或一组列)，其值能够唯一区分表中每个行</p>\n<p>数据库软件(DBMS)：通常用来访问操作数据库的管理软件(基于文件共享系统或客户机-服务器)</p>\n<p>字段(field): 基本上与列的意思相同，数据库内称列，数据库外作为字段</p>\n</div>\n<h2 id=\"points\"><a class=\"header-anchor\" href=\"#points\" aria-hidden=\"true\">#</a> points</h2>\n<ul>\n<li>正确地将数据分解为多个列极为重要</li>\n<li>应该总是定义主键 =&gt; 便于以后的数据操纵和管理</li>\n<li>主键值规则(多列作为主键组合值必须唯一,单列可以不唯一)\n<ul>\n<li>任意两行都不具备有相同的主键值</li>\n<li>每个航都必须具备有一个主键值(不允许为Null)</li>\n</ul>\n</li>\n<li>主键的最好习惯\n<ul>\n<li>不更新主键列中的值</li>\n<li>不重用主键列中的值</li>\n<li>不在逐渐列中使用可能会更改的值</li>\n</ul>\n</li>\n</ul>\n<h2 id=\"sql\"><a class=\"header-anchor\" href=\"#sql\" aria-hidden=\"true\">#</a> SQL</h2>\n<blockquote>\n<p>SQL是结构化查询语言(Structured Query Language) =&gt; 一种从数据中读写数据的简单有效的方法</p>\n</blockquote>\n<p>优点：</p>\n<ul>\n<li>SQL不是某个特定数据库供应商专有的语言。几乎所有重要的DBMS都支持SQL，所以，学习次语言使你几乎能与所有数据库打交道</li>\n<li>SQL简单易学。他的语句全都是由描述性很强的英语单词组成，而且这些单词的数据不多</li>\n<li>SQL尽管看上去很简单，但它实际上是一种强有力的语言，灵活使用其语言元素，可以进行非常复杂和高级的数据库操作</li>\n</ul>\n<h2 id=\"%E5%91%BD%E4%BB%A4\"><a class=\"header-anchor\" href=\"#%E5%91%BD%E4%BB%A4\" aria-hidden=\"true\">#</a> 命令</h2>\n<h3 id=\"show\"><a class=\"header-anchor\" href=\"#show\" aria-hidden=\"true\">#</a> SHOW</h3>\n<blockquote>\n<p>help show =&gt; learn more;</p>\n</blockquote>\n<ul>\n<li>\n<p>SHOW DATABASES: 返回可用数据库的一个列表(包含MySQL内部使用的)</p>\n</li>\n<li>\n<p>SHOW TABLES: 返回当前选择的数据库内可用表的列表</p>\n</li>\n<li>\n<p>SHOW COLUMNS FROM $table_name：返回表设计的详细信息</p>\n</li>\n<li>\n<p>SHOW STATUS: 显示广泛的服务器状态信息</p>\n</li>\n<li>\n<p>SHOW CREATE (DATABASE | TABLE) $name: 用来显示创建特定数据表或者表的SQL语句</p>\n</li>\n<li>\n<p>SHOW GRANTS: 用来显示授权用户的安全权限</p>\n</li>\n<li>\n<p>SHOW (ERROS | WARNINGS)：用来显示服务器错误或者警告信息</p>\n</li>\n<li>\n<p>链接数据库: mysql -u $user -p $password;</p>\n</li>\n<li>\n<p>创建数据库: create database $name;</p>\n</li>\n</ul>\n<h2 id=\"%E5%85%B6%E4%BB%96\"><a class=\"header-anchor\" href=\"#%E5%85%B6%E4%BB%96\" aria-hidden=\"true\">#</a> 其他</h2>\n<div class=\"tip custom-block\"><p class=\"custom-block-title\">补充</p>\n<p>自动增量：在每个行添加到表中时，MySQL可以自动的为每个行分配下一个可用编号，而不是手动分配唯一值的功能</p>\n<p>结束SQL语句：多条SQL语句必须以分号(;)分隔</p>\n<p>大小写：SQL语句不区分大小写</p>\n</div>\n', '---\r\ntitle: \'mysql内容简介\'\r\n---\r\n\r\n::: tip 主要概念\r\n\r\n数据库(dataBase)：保存有组织数据的容器\r\n\r\n表(table)：某种特定类型数据的结构化清单\r\n\r\n模式(schema)：关于数据库和表的布局及特性的信息\r\n\r\n列(column)：表中的一个字段，所有表都是由一个列或者多个列组成的\r\n\r\n数据类型(datatype)：所容许的数据的类型，每个表列都有相应的数据类型，限制该列中存储的数据\r\n\r\n行(row)：表中的一个记录\r\n\r\n主键(primary key)：一列(或一组列)，其值能够唯一区分表中每个行\r\n\r\n数据库软件(DBMS)：通常用来访问操作数据库的管理软件(基于文件共享系统或客户机-服务器)\r\n\r\n字段(field): 基本上与列的意思相同，数据库内称列，数据库外作为字段\r\n\r\n:::\r\n\r\n\r\n## points\r\n\r\n- 正确地将数据分解为多个列极为重要\r\n- 应该总是定义主键 => 便于以后的数据操纵和管理\r\n- 主键值规则(多列作为主键组合值必须唯一,单列可以不唯一) \r\n    - 任意两行都不具备有相同的主键值\r\n    - 每个航都必须具备有一个主键值(不允许为Null)\r\n- 主键的最好习惯\r\n    - 不更新主键列中的值\r\n    - 不重用主键列中的值\r\n    - 不在逐渐列中使用可能会更改的值\r\n\r\n## SQL\r\n\r\n> SQL是结构化查询语言(Structured Query Language) => 一种从数据中读写数据的简单有效的方法\r\n\r\n优点：\r\n\r\n* SQL不是某个特定数据库供应商专有的语言。几乎所有重要的DBMS都支持SQL，所以，学习次语言使你几乎能与所有数据库打交道\r\n* SQL简单易学。他的语句全都是由描述性很强的英语单词组成，而且这些单词的数据不多\r\n* SQL尽管看上去很简单，但它实际上是一种强有力的语言，灵活使用其语言元素，可以进行非常复杂和高级的数据库操作\r\n\r\n## 命令\r\n\r\n### SHOW \r\n\r\n> help show => learn more;\r\n\r\n* SHOW DATABASES: 返回可用数据库的一个列表(包含MySQL内部使用的)\r\n* SHOW TABLES: 返回当前选择的数据库内可用表的列表\r\n* SHOW COLUMNS FROM $table_name：返回表设计的详细信息\r\n* SHOW STATUS: 显示广泛的服务器状态信息\r\n* SHOW CREATE (DATABASE | TABLE) $name: 用来显示创建特定数据表或者表的SQL语句\r\n* SHOW GRANTS: 用来显示授权用户的安全权限\r\n* SHOW (ERROS | WARNINGS)：用来显示服务器错误或者警告信息  \r\n\r\n* 链接数据库: mysql -u $user -p $password;\r\n* 创建数据库: create database $name;\r\n\r\n## 其他\r\n\r\n::: tip 补充\r\n\r\n自动增量：在每个行添加到表中时，MySQL可以自动的为每个行分配下一个可用编号，而不是手动分配唯一值的功能\r\n\r\n结束SQL语句：多条SQL语句必须以分号(;)分隔\r\n\r\n大小写：SQL语句不区分大小写\r\n\r\n:::\r\n', '{\"title\":\"mysql内容简介\"}', '内容标题', '[{\"tag\":\"h2\",\"title\":\"title: \'mysql内容简介\'\",\"href\":\"title%3A-\'mysql%E5%86%85%E5%AE%B9%E7%AE%80%E4%BB%8B\'\"},{\"tag\":\"h2\",\"title\":\"points\",\"href\":\"points\"},{\"tag\":\"h2\",\"title\":\"SQL\",\"href\":\"sql\"},{\"tag\":\"h2\",\"title\":\"命令\",\"href\":\"%E5%91%BD%E4%BB%A4\"},{\"tag\":\"h3\",\"title\":\"SHOW\",\"href\":\"show\"},{\"tag\":\"h2\",\"title\":\"其他\",\"href\":\"%E5%85%B6%E4%BB%96\"}]', '2018-12-18 11:10:55', null);
INSERT INTO `upload_docs` VALUES ('9', '6', '0', 'E:\\project\\segi-blog\\app\\public\\upload\\upload_8d6180cb33bd07e615afaad401fd1d01.md', '2.md', '9513', '<h1 id=\"%E5%85%B3%E9%94%AE%E8%AF%8D\"><a class=\"header-anchor\" href=\"#%E5%85%B3%E9%94%AE%E8%AF%8D\" aria-hidden=\"true\">#</a> 关键词</h1>\n<h2 id=\"select-%E6%A3%80%E7%B4%A2\"><a class=\"header-anchor\" href=\"#select-%E6%A3%80%E7%B4%A2\" aria-hidden=\"true\">#</a> SELECT 检索</h2>\n<ul>\n<li>检索单个列: SELECT $COLUMN_NAME FROM $TABLE_NAME;</li>\n<li>检索多个列: SELECT [$COLUMN_NAMES] FROM $TABLE_NAME;</li>\n<li>检索所有列: SELECT * FROM $TABLE_NAME;</li>\n<li>检索不同行: SELECT DISTINCT ...;</li>\n</ul>\n<blockquote>\n<p>DISTINCT: 筛选相同行，DISTINCT应用于所有列而不是前置它的列，如果指定的列有多个，除非都不同，否则所有行都将被检索出来</p>\n</blockquote>\n<h2 id=\"insert-%E6%8F%92%E5%85%A5\"><a class=\"header-anchor\" href=\"#insert-%E6%8F%92%E5%85%A5\" aria-hidden=\"true\">#</a> INSERT 插入</h2>\n<blockquote>\n<p>对于自增类型或者没有值给与Null</p>\n</blockquote>\n<ul>\n<li>INSERT INTO $table_name VALUES (对应值) ... =&gt; 不安全, 依赖次序, 弱迁移, 自增NULL</li>\n<li>INSERT INTO $table_name(字段) VALUES (对应值) ... =&gt; 安全, 不依赖次序, 强迁移, 自增忽略</li>\n</ul>\n<p>如果数据检索是最重要的, 可以通过在INSET INTO之间添加关键字<strong>LOW_PRIORITY</strong>, 指示MYSQ降低INSET语句的优先级。因为INSET操作可能更耗时, 并且降低等待处理SELECT语句的性能, 使用单挑语句插入多个值比使用多条语句依次插入更快。以此提高INSERT性能</p>\n<p>INSERT也可以插入一条SELECT语句的结果形成所谓的INSERT SELECT</p>\n<h2 id=\"update-%E6%9B%B4%E6%96%B0\"><a class=\"header-anchor\" href=\"#update-%E6%9B%B4%E6%96%B0\" aria-hidden=\"true\">#</a> UPDATE 更新</h2>\n<blockquote>\n<p>以表名开始 ,以WHERE子句结束, 在多条更新其中一处发生错误时, 有无IGNORE决定是否继续。为了删除某个列的值, 可以设置它为NULL(表定义上允许)</p>\n</blockquote>\n<ul>\n<li>UPDATE [IGNORE] $table_name SET \'$update...\' WHERE ....</li>\n</ul>\n<h2 id=\"delete-%E5%88%A0%E9%99%A4\"><a class=\"header-anchor\" href=\"#delete-%E5%88%A0%E9%99%A4\" aria-hidden=\"true\">#</a> DELETE 删除</h2>\n<blockquote>\n<p>DELETE是为了删除行而不是列, 如果是为了删除列使用UPDATE语句.如果想从表中删除所有行，不要使用DELETE 可以使用TRUNCATE TABLE(删除原表新建一张表)语句。</p>\n</blockquote>\n<ul>\n<li>DELETE $table_name WHERE ...</li>\n</ul>\n<h2 id=\"from-%E6%9D%A5%E8%87%AA\"><a class=\"header-anchor\" href=\"#from-%E6%9D%A5%E8%87%AA\" aria-hidden=\"true\">#</a> FROM 来自</h2>\n<blockquote>\n<p>对应确定选择的表名</p>\n</blockquote>\n<h3 id=\"inner-join-%E8%81%94%E7%BB%93\"><a class=\"header-anchor\" href=\"#inner-join-%E8%81%94%E7%BB%93\" aria-hidden=\"true\">#</a> INNER JOIN 联结</h3>\n<blockquote>\n<p>在 FROM 后设置表的链接关系, 通过传递给ON的实际条件做匹配, 优先级相对WHERE条件使用更优先, 因为这样有明显的联结关系使用也更加规范, 有时候也能影响性能 =&gt; 不要联结不必要的表, 联结表越多性能下降越多</p>\n</blockquote>\n<h3 id=\"on-%E6%9D%A1%E4%BB%B6\"><a class=\"header-anchor\" href=\"#on-%E6%9D%A1%E4%BB%B6\" aria-hidden=\"true\">#</a> ON 条件</h3>\n<blockquote>\n<p>联结表所需匹配的条件</p>\n</blockquote>\n<h2 id=\"as-%E5%88%AB%E5%90%8D\"><a class=\"header-anchor\" href=\"#as-%E5%88%AB%E5%90%8D\" aria-hidden=\"true\">#</a> AS 别名</h2>\n<blockquote>\n<p>对展示列或者返回数据起别名(alias)</p>\n</blockquote>\n<p>对应的表也同样可以取别名, 但是与列不同表别人不返回客户端, 并且表别名可以用于SELECT、ORDER BY、WHERE等子句</p>\n<h2 id=\"where-%E7%AD%9B%E9%80%89\"><a class=\"header-anchor\" href=\"#where-%E7%AD%9B%E9%80%89\" aria-hidden=\"true\">#</a> WHERE 筛选</h2>\n<blockquote>\n<p>操作符：用来联结或者改变WHERE子句中的子句的关键字,也称为逻辑操作符</p>\n</blockquote>\n<ul>\n<li>筛选：... WHERE $CONDITION;</li>\n</ul>\n<p>操作符：</p>\n<table>\n<thead>\n<tr>\n<th style=\"text-align:center\">操作符</th>\n<th style=\"text-align:center\">说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:center\">=</td>\n<td style=\"text-align:center\">等于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">&lt;&gt;</td>\n<td style=\"text-align:center\">不等于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">!=</td>\n<td style=\"text-align:center\">不等于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">&lt;</td>\n<td style=\"text-align:center\">小于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">&lt;=</td>\n<td style=\"text-align:center\">小于等于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">&gt;</td>\n<td style=\"text-align:center\">大于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">&gt;=</td>\n<td style=\"text-align:center\">大于等于</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">BETWEEN</td>\n<td style=\"text-align:center\">在指定的两个值之间</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">IS NULL</td>\n<td style=\"text-align:center\">空值检查</td>\n</tr>\n</tbody>\n</table>\n<blockquote>\n<p>范围值检索：BETWEN START AND END</p>\n</blockquote>\n<h3 id=\"%E8%AE%A1%E7%AE%97%E6%AC%A1%E5%BA%8F\"><a class=\"header-anchor\" href=\"#%E8%AE%A1%E7%AE%97%E6%AC%A1%E5%BA%8F\" aria-hidden=\"true\">#</a> 计算次序</h3>\n<p>WHERE可包含任意数目的AND和OR操作符, 允许两者结合以进行复杂和高级的过滤, 此时需要注意相关的优先级或者使用圆括号明确地分组相应的操作符, 并尽量使用原括号分组消除歧义而不是依赖默认计算次序</p>\n<p><strong>... WHERE A OR B AND C = ... WHERE A OR (B AND C)</strong></p>\n<blockquote>\n<p>() &gt; AND &gt; OR</p>\n</blockquote>\n<h3 id=\"and-%E5%B9%B6%E4%B8%94\"><a class=\"header-anchor\" href=\"#and-%E5%B9%B6%E4%B8%94\" aria-hidden=\"true\">#</a> AND 并且</h3>\n<blockquote>\n<p>指示检索满足所有给定条件的行</p>\n</blockquote>\n<h3 id=\"or-%E6%88%96%E8%80%85\"><a class=\"header-anchor\" href=\"#or-%E6%88%96%E8%80%85\" aria-hidden=\"true\">#</a> OR 或者</h3>\n<blockquote>\n<p>只是检索匹配满足任一条件的行</p>\n</blockquote>\n<h3 id=\"in-%E5%8C%85%E5%90%AB\"><a class=\"header-anchor\" href=\"#in-%E5%8C%85%E5%90%AB\" aria-hidden=\"true\">#</a> IN 包含</h3>\n<blockquote>\n<p>IN(..) 指定条件范围中每个条件都可以匹配的清单</p>\n</blockquote>\n<p>优点：</p>\n<ul>\n<li>在使用长的合法选项清单时, IN操作符的语法更清楚且更直观</li>\n<li>在使用IN时, 计算的次序更容易管理(因为使用的操作符更少)</li>\n<li>IN操作符一般比OR操作符清单执行更快</li>\n<li>IN的最大优点是可以包含其他SELECT语句, 是的能够更加动态的建立WHERE子句</li>\n</ul>\n<h3 id=\"not-%E5%90%A6%E5%AE%9A\"><a class=\"header-anchor\" href=\"#not-%E5%90%A6%E5%AE%9A\" aria-hidden=\"true\">#</a> NOT 否定</h3>\n<blockquote>\n<p>否定后跟条件的关键字 ... NOT IN (1002, 1003)</p>\n</blockquote>\n<h3 id=\"like-%E7%BB%93%E6%9E%84\"><a class=\"header-anchor\" href=\"#like-%E7%BB%93%E6%9E%84\" aria-hidden=\"true\">#</a> LIKE 结构</h3>\n<blockquote>\n<p>WHERE ... LIKE (通配符和字面量组合)</p>\n</blockquote>\n<ul>\n<li>百分号(%) =&gt; 表示任何字符出现任意次数 !不能匹配NULL</li>\n<li>下划线(_) =&gt; 只匹配单个字符</li>\n</ul>\n<p>通配符的处理一般比其他搜索花费时间更长</p>\n<p>技巧：</p>\n<ul>\n<li>不要过度使用通配符</li>\n<li>尽量不要把通配符作为搜索模式的开始</li>\n<li>自习注意通配符的位置</li>\n</ul>\n<h3 id=\"regexp-%E6%AD%A3%E5%88%99\"><a class=\"header-anchor\" href=\"#regexp-%E6%AD%A3%E5%88%99\" aria-hidden=\"true\">#</a> REGEXP 正则</h3>\n<blockquote>\n<p>... WHERE ... REGEXP $CONDITION;</p>\n</blockquote>\n<p>BINARY关键字在正则匹配中区分大小写</p>\n<blockquote>\n<p>区分大小写：... WHERE ... REGEXP BINARY $CONDITION</p>\n</blockquote>\n<p>LIKE针对列值整体匹配, REGEXP针对列值包含(部分)匹配</p>\n<ul>\n<li>\'string\': 包含该字符串</li>\n<li>. : 任意一个字符</li>\n<li>A | B : 并行条件</li>\n<li>[0-9] : 集合</li>\n<li>^...$ : 开头结尾</li>\n<li>\\\\[.-|]: 特殊字符</li>\n</ul>\n<p>多数正则表达式实现使用单个反斜杠转义特殊字符, 但MYSQL需要使用两个(正则解释一个,MYSQL解释另一个)</p>\n<table>\n<thead>\n<tr>\n<th style=\"text-align:center\">字符类</th>\n<th style=\"text-align:center\">说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:center\">[:alnum:]</td>\n<td style=\"text-align:center\">任意字符和数字([a-zA-Z0-9])</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:alpha:]</td>\n<td style=\"text-align:center\">任意字符([a-zA-Z])</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:blank:]</td>\n<td style=\"text-align:center\">空格和制表符([\\t])</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:cntrl:]</td>\n<td style=\"text-align:center\">ASCII控制字符(ASCII 0到31和127)</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:digit:]</td>\n<td style=\"text-align:center\">任意数字([0-9])</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:graph:]</td>\n<td style=\"text-align:center\">与[:print:]相同,但不包括空格</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:lower:]</td>\n<td style=\"text-align:center\">任意小写字母([a-z])</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:print:]</td>\n<td style=\"text-align:center\">任意可打印字符</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:punct:]</td>\n<td style=\"text-align:center\">不在[:alnum:]和[:cntrl:]的任意字符</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:space:]</td>\n<td style=\"text-align:center\">包括空格在内的任意空白字符([\\\\f\\\\n\\\\r\\\\t\\\\v])</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:upper:]</td>\n<td style=\"text-align:center\">任意大写字母[A-Z]</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[:xdigit:]</td>\n<td style=\"text-align:center\">任意16进制数字([a-fA-F0-9])</td>\n</tr>\n</tbody>\n</table>\n<table>\n<thead>\n<tr>\n<th style=\"text-align:center\">元字符</th>\n<th style=\"text-align:center\">说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:center\">*</td>\n<td style=\"text-align:center\">0或者多个匹配</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">+</td>\n<td style=\"text-align:center\">1或者多个匹配{1,}</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">？</td>\n<td style=\"text-align:center\">0或者1个匹配{0, 1}</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">{n}</td>\n<td style=\"text-align:center\">指定数目的匹配</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">{n,}</td>\n<td style=\"text-align:center\">不少于指定数目的匹配</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">{n, m}</td>\n<td style=\"text-align:center\">匹配数目的范围(m&lt;255)</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">^</td>\n<td style=\"text-align:center\">文本的开始</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">$</td>\n<td style=\"text-align:center\">文本的结束</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[[:&lt;:]]</td>\n<td style=\"text-align:center\">词的开始</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">[[:&gt;:]]</td>\n<td style=\"text-align:center\">词的结尾</td>\n</tr>\n</tbody>\n</table>\n<h2 id=\"group-by-%E5%88%86%E7%BB%84\"><a class=\"header-anchor\" href=\"#group-by-%E5%88%86%E7%BB%84\" aria-hidden=\"true\">#</a> GROUP BY 分组</h2>\n<blockquote>\n<p>通过分组将不同列的分组整合筛选做分类</p>\n</blockquote>\n<p>规定：</p>\n<ul>\n<li>GROUP BY子句可以包含任意数目的列, 这使得能对分组进行嵌套. 为数据分组提供更加精细的控制</li>\n<li>如果在子句中嵌套了分组, 数据将在最后规定的分组上进行汇总</li>\n<li>GROUP BY列出的每个列都必须是检索列或者有效的表达式(但不能是聚集函数)。如果在SELECT中使用表达式, 则必须在GROUP BY子句中指定相同的表达式。不能使用别名</li>\n<li>除聚集语句外, SELECT语句中的每个列都必须在GROUP BY中给出</li>\n<li>GROUP BY必须出现在WHERE子句之后, ORDER BY子句之前</li>\n</ul>\n<h2 id=\"with-rollup-%E7%BB%9F%E8%AE%A1\"><a class=\"header-anchor\" href=\"#with-rollup-%E7%BB%9F%E8%AE%A1\" aria-hidden=\"true\">#</a> WITH ROLLUP 统计</h2>\n<blockquote>\n<p>可以得到每个分组一级每个分组汇总级别(针对每个分组的值)需要在ORDER BY之前</p>\n</blockquote>\n<h2 id=\"having-%E8%BF%87%E6%BB%A4\"><a class=\"header-anchor\" href=\"#having-%E8%BF%87%E6%BB%A4\" aria-hidden=\"true\">#</a> HAVING 过滤</h2>\n<blockquote>\n<p>在有了组的概念以后, WHERE过滤的是行, 而对于分组的过滤则需要交给HAVING, 即没有分组前使用WHERE进行过滤, 分组后使用HAVING关键字过滤</p>\n</blockquote>\n<h2 id=\"order-by-%E6%8E%92%E5%BA%8F\"><a class=\"header-anchor\" href=\"#order-by-%E6%8E%92%E5%BA%8F\" aria-hidden=\"true\">#</a> ORDER BY 排序</h2>\n<ul>\n<li>单列排序：SELECT ($COLUMN_NAME | $COLUMN_NAMES) FROM $TABLE ORDER BY $COLUMN_NAME;</li>\n<li>多列排序：SELECT ... ORDER BY ...;</li>\n<li>排序方向: SLECT ... ORDER BY ... (DESC(降序) | ASC(升序--默认))</li>\n<li>组合排序：SELECT prod_id, prod_price, prod_name FROM products ORDER BY prod_price DESC, prod_name;</li>\n</ul>\n<blockquote>\n<p>非选择列排序：ORDER BY可以使用非检索显示所选择的列，用非检索的列排序数据是完全合法的</p>\n</blockquote>\n<blockquote>\n<p>ORDER BY子句的位置应位于LIMIT之后</p>\n</blockquote>\n<h2 id=\"limit-%E9%99%90%E5%88%B6\"><a class=\"header-anchor\" href=\"#limit-%E9%99%90%E5%88%B6\" aria-hidden=\"true\">#</a> LIMIT 限制</h2>\n<ul>\n<li>限制结果：SELECT ... LIMIT $NUMBER;</li>\n<li>某行开始:\n<ul>\n<li>SELECT ... LIMIT $START, $NUMBER;</li>\n<li>SELECT ... $NUMBER OFFSET $START;</li>\n</ul>\n</li>\n</ul>\n<h2 id=\"union-%E7%BB%84%E5%90%88\"><a class=\"header-anchor\" href=\"#union-%E7%BB%84%E5%90%88\" aria-hidden=\"true\">#</a> UNION 组合</h2>\n<blockquote>\n<p>用于将不同的SQL语句组成起来, 看起来像是一种合并(union的行为)</p>\n</blockquote>\n<p>规则：</p>\n<ul>\n<li>UNION必须由两条或者两条以上的SELECT语句组成, 语句之间用关键字UNION分割(n条查询语句就需要n-1个union关键字)</li>\n<li>UNION的每个查询必须包含相同的列、表达式或者聚集函数(但不需要相同的次序)</li>\n<li>列数据类型必须兼容, 类型不必完全相同, 但必须是可以隐式转换的</li>\n<li>UNION默认会去重, 如果不需要可以使用UNION ALL</li>\n<li>组合查询对于排序结果只能在最后一条SQL语句中指定</li>\n</ul>\n<h2 id=\"%E5%AD%90%E5%8F%A5%E9%A1%BA%E5%BA%8F\"><a class=\"header-anchor\" href=\"#%E5%AD%90%E5%8F%A5%E9%A1%BA%E5%BA%8F\" aria-hidden=\"true\">#</a> 子句顺序</h2>\n<table>\n<thead>\n<tr>\n<th style=\"text-align:center\">子句</th>\n<th style=\"text-align:center\">说明</th>\n<th style=\"text-align:center\">必须使用</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:center\">SELECT</td>\n<td style=\"text-align:center\">要返回的列或者表达式</td>\n<td style=\"text-align:center\">是</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">FROM</td>\n<td style=\"text-align:center\">从中检索数据的表</td>\n<td style=\"text-align:center\">仅在从表中检索数据时使用</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">WHERE</td>\n<td style=\"text-align:center\">行级过滤</td>\n<td style=\"text-align:center\">否</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">GROUP BY</td>\n<td style=\"text-align:center\">分组说明</td>\n<td style=\"text-align:center\">尽在按组计算聚集时使用</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">HAVING</td>\n<td style=\"text-align:center\">组级过滤</td>\n<td style=\"text-align:center\">否</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">ORDER BY</td>\n<td style=\"text-align:center\">输出排序顺序</td>\n<td style=\"text-align:center\">否</td>\n</tr>\n<tr>\n<td style=\"text-align:center\">LIMIT</td>\n<td style=\"text-align:center\">限制检索行数</td>\n<td style=\"text-align:center\">否</td>\n</tr>\n</tbody>\n</table>\n<h2 id=\"%E9%99%84%E5%8A%A0\"><a class=\"header-anchor\" href=\"#%E9%99%84%E5%8A%A0\" aria-hidden=\"true\">#</a> 附加</h2>\n<div class=\"tip custom-block\"><p class=\"custom-block-title\">说明</p>\n<ul>\n<li>子句：SQL语句由子句构成，有些子句是必须得，有的是可选的。一个子句通常由一个关键字和所提供的数据组成。</li>\n<li>完全限定名：SELECT prodicts.prod_name FROM prodcucts; SELECT products.prod_name FROM crashcourse</li>\n</ul>\n</div>\n<div class=\"warning custom-block\"><p class=\"custom-block-title\">注意</p>\n<ul>\n<li>当心逗号: 多个列时注意列名间加上逗号，最后一个列名不加</li>\n<li>使用通配符：除非你确实需要每个列，否则不要使用，检索不需要的列通常会降低检索和应用程序的性能，但同时存在一个优点可以检索到未知列</li>\n<li>行0：检索出来的第一行为0，而不是为行1，因此如果LIMIT 1,1将检索出的是第二行而不是第一行</li>\n<li>行数不够时：如果没有足够的行，MySQL将只返回它能返回的行</li>\n<li>何时使用引号：单引号用来限定字符串，如果将值与串类型的列进行比较则需要，数值进行比较的值不需要</li>\n<li>MyISAM和InnoDB为最常使用的两个数据库引擎, InnoDB不支持全文本搜索, MyISAM支持</li>\n</ul>\n</div>\n', '# 关键词\r\n\r\n## SELECT 检索\r\n\r\n* 检索单个列: SELECT $COLUMN_NAME FROM $TABLE_NAME;\r\n* 检索多个列: SELECT \\[$COLUMN_NAMES\\] FROM $TABLE_NAME;\r\n* 检索所有列: SELECT * FROM $TABLE_NAME;\r\n* 检索不同行: SELECT DISTINCT ...;\r\n\r\n> DISTINCT: 筛选相同行，DISTINCT应用于所有列而不是前置它的列，如果指定的列有多个，除非都不同，否则所有行都将被检索出来\r\n\r\n## INSERT 插入\r\n\r\n> 对于自增类型或者没有值给与Null\r\n\r\n* INSERT INTO $table_name VALUES (对应值) ... => 不安全, 依赖次序, 弱迁移, 自增NULL\r\n* INSERT INTO $table_name(字段) VALUES (对应值) ... => 安全, 不依赖次序, 强迁移, 自增忽略\r\n\r\n如果数据检索是最重要的, 可以通过在INSET INTO之间添加关键字**LOW_PRIORITY**, 指示MYSQ降低INSET语句的优先级。因为INSET操作可能更耗时, 并且降低等待处理SELECT语句的性能, 使用单挑语句插入多个值比使用多条语句依次插入更快。以此提高INSERT性能\r\n\r\nINSERT也可以插入一条SELECT语句的结果形成所谓的INSERT SELECT\r\n\r\n## UPDATE 更新\r\n\r\n> 以表名开始 ,以WHERE子句结束, 在多条更新其中一处发生错误时, 有无IGNORE决定是否继续。为了删除某个列的值, 可以设置它为NULL(表定义上允许)\r\n\r\n* UPDATE \\[IGNORE\\] $table_name SET \'$update...\' WHERE ....\r\n\r\n## DELETE 删除\r\n\r\n> DELETE是为了删除行而不是列, 如果是为了删除列使用UPDATE语句.如果想从表中删除所有行，不要使用DELETE 可以使用TRUNCATE TABLE(删除原表新建一张表)语句。\r\n\r\n* DELETE $table_name WHERE ...\r\n\r\n## FROM 来自\r\n\r\n> 对应确定选择的表名\r\n\r\n### INNER JOIN 联结\r\n\r\n> 在 FROM 后设置表的链接关系, 通过传递给ON的实际条件做匹配, 优先级相对WHERE条件使用更优先, 因为这样有明显的联结关系使用也更加规范, 有时候也能影响性能 => 不要联结不必要的表, 联结表越多性能下降越多\r\n\r\n### ON 条件\r\n\r\n> 联结表所需匹配的条件\r\n\r\n## AS 别名\r\n\r\n> 对展示列或者返回数据起别名(alias)\r\n\r\n对应的表也同样可以取别名, 但是与列不同表别人不返回客户端, 并且表别名可以用于SELECT、ORDER BY、WHERE等子句\r\n\r\n## WHERE 筛选\r\n\r\n> 操作符：用来联结或者改变WHERE子句中的子句的关键字,也称为逻辑操作符\r\n\r\n* 筛选：... WHERE $CONDITION;\r\n  \r\n操作符：\r\n\r\n| 操作符 | 说明 |\r\n| :---: | :---: |\r\n|  = | 等于 |\r\n| <> | 不等于 |\r\n| != | 不等于 |\r\n| <  | 小于 |\r\n| <= | 小于等于 |\r\n| >  | 大于 |\r\n| >= | 大于等于 |\r\n| BETWEEN | 在指定的两个值之间 |\r\n| IS NULL | 空值检查 |\r\n\r\n> 范围值检索：BETWEN START AND END\r\n\r\n### 计算次序\r\n\r\nWHERE可包含任意数目的AND和OR操作符, 允许两者结合以进行复杂和高级的过滤, 此时需要注意相关的优先级或者使用圆括号明确地分组相应的操作符, 并尽量使用原括号分组消除歧义而不是依赖默认计算次序\r\n\r\n__... WHERE A OR B AND C = ... WHERE A OR (B AND C)__\r\n\r\n> () > AND > OR \r\n\r\n### AND 并且\r\n\r\n> 指示检索满足所有给定条件的行\r\n\r\n### OR 或者\r\n\r\n> 只是检索匹配满足任一条件的行\r\n\r\n### IN 包含\r\n\r\n> IN(..) 指定条件范围中每个条件都可以匹配的清单\r\n\r\n优点：\r\n\r\n* 在使用长的合法选项清单时, IN操作符的语法更清楚且更直观\r\n* 在使用IN时, 计算的次序更容易管理(因为使用的操作符更少)\r\n* IN操作符一般比OR操作符清单执行更快\r\n* IN的最大优点是可以包含其他SELECT语句, 是的能够更加动态的建立WHERE子句\r\n\r\n### NOT 否定\r\n\r\n> 否定后跟条件的关键字 ... NOT IN (1002, 1003)\r\n\r\n### LIKE 结构\r\n\r\n> WHERE ... LIKE (通配符和字面量组合)\r\n\r\n* 百分号(%) => 表示任何字符出现任意次数 !不能匹配NULL\r\n* 下划线(_) => 只匹配单个字符\r\n\r\n通配符的处理一般比其他搜索花费时间更长\r\n\r\n技巧：\r\n\r\n* 不要过度使用通配符\r\n* 尽量不要把通配符作为搜索模式的开始\r\n* 自习注意通配符的位置\r\n\r\n### REGEXP 正则\r\n\r\n> ... WHERE ... REGEXP $CONDITION;\r\n\r\nBINARY关键字在正则匹配中区分大小写\r\n\r\n> 区分大小写：... WHERE ... REGEXP BINARY $CONDITION\r\n\r\nLIKE针对列值整体匹配, REGEXP针对列值包含(部分)匹配\r\n\r\n* \'string\': 包含该字符串\r\n* . : 任意一个字符\r\n* A | B : 并行条件\r\n* \\[0-9\\] : 集合\r\n* ^...$ : 开头结尾\r\n* \\\\\\\\[\\.\\-\\|]: 特殊字符\r\n\r\n多数正则表达式实现使用单个反斜杠转义特殊字符, 但MYSQL需要使用两个(正则解释一个,MYSQL解释另一个)\r\n\r\n| 字符类 | 说明 |\r\n| :---: | :---: |\r\n| \\[:alnum:\\] | 任意字符和数字(\\[a-zA-Z0-9\\]) |\r\n| \\[:alpha:\\] | 任意字符(\\[a-zA-Z\\]) |\r\n| \\[:blank:\\] | 空格和制表符(\\[\\\\t\\]) |\r\n| \\[:cntrl:\\] | ASCII控制字符(ASCII 0到31和127) |\r\n| \\[:digit:\\] | 任意数字(\\[0-9\\]) |\r\n| \\[:graph:\\] | 与\\[:print:\\]相同,但不包括空格 |\r\n| \\[:lower:\\] | 任意小写字母(\\[a-z\\]) |\r\n| \\[:print:\\] | 任意可打印字符 |\r\n| \\[:punct:\\] | 不在\\[:alnum:\\]和\\[:cntrl:\\]的任意字符 |\r\n| \\[:space:\\] | 包括空格在内的任意空白字符(\\[\\\\\\\\f\\\\\\\\n\\\\\\\\r\\\\\\\\t\\\\\\\\v\\]) |\r\n| \\[:upper:\\] | 任意大写字母\\[A-Z\\] |\r\n| \\[:xdigit:\\] | 任意16进制数字(\\[a-fA-F0-9\\]) |\r\n\r\n| 元字符 | 说明 |\r\n| :---: | :---: |\r\n| * | 0或者多个匹配 |\r\n| + | 1或者多个匹配{1,}|\r\n| ？| 0或者1个匹配{0, 1}|\r\n| {n} | 指定数目的匹配 |\r\n| {n,} | 不少于指定数目的匹配 |\r\n| {n, m} | 匹配数目的范围(m<255)|\r\n| ^ | 文本的开始 |\r\n| $ | 文本的结束 | \r\n| \\[\\[:<:\\]\\] | 词的开始 |\r\n| \\[\\[:>:\\]\\] | 词的结尾 |\r\n\r\n## GROUP BY 分组\r\n\r\n> 通过分组将不同列的分组整合筛选做分类\r\n\r\n规定：\r\n\r\n* GROUP BY子句可以包含任意数目的列, 这使得能对分组进行嵌套. 为数据分组提供更加精细的控制\r\n* 如果在子句中嵌套了分组, 数据将在最后规定的分组上进行汇总\r\n* GROUP BY列出的每个列都必须是检索列或者有效的表达式(但不能是聚集函数)。如果在SELECT中使用表达式, 则必须在GROUP BY子句中指定相同的表达式。不能使用别名\r\n* 除聚集语句外, SELECT语句中的每个列都必须在GROUP BY中给出\r\n* GROUP BY必须出现在WHERE子句之后, ORDER BY子句之前\r\n\r\n## WITH ROLLUP 统计\r\n\r\n> 可以得到每个分组一级每个分组汇总级别(针对每个分组的值)需要在ORDER BY之前\r\n\r\n## HAVING 过滤\r\n\r\n> 在有了组的概念以后, WHERE过滤的是行, 而对于分组的过滤则需要交给HAVING, 即没有分组前使用WHERE进行过滤, 分组后使用HAVING关键字过滤\r\n\r\n## ORDER BY 排序\r\n\r\n* 单列排序：SELECT ($COLUMN_NAME | $COLUMN_NAMES) FROM $TABLE ORDER BY $COLUMN_NAME;\r\n* 多列排序：SELECT ... ORDER BY ...;\r\n* 排序方向: SLECT ... ORDER BY ... (DESC(降序) | ASC(升序--默认))\r\n* 组合排序：SELECT prod_id, prod_price, prod_name FROM products ORDER BY prod_price DESC, prod_name;\r\n \r\n> 非选择列排序：ORDER BY可以使用非检索显示所选择的列，用非检索的列排序数据是完全合法的\r\n\r\n> ORDER BY子句的位置应位于LIMIT之后\r\n\r\n## LIMIT 限制\r\n\r\n* 限制结果：SELECT ... LIMIT $NUMBER;\r\n* 某行开始: \r\n    * SELECT ... LIMIT $START, $NUMBER;\r\n    * SELECT ... $NUMBER OFFSET $START;\r\n\r\n## UNION 组合\r\n\r\n> 用于将不同的SQL语句组成起来, 看起来像是一种合并(union的行为)\r\n\r\n规则：\r\n\r\n* UNION必须由两条或者两条以上的SELECT语句组成, 语句之间用关键字UNION分割(n条查询语句就需要n-1个union关键字)\r\n* UNION的每个查询必须包含相同的列、表达式或者聚集函数(但不需要相同的次序)\r\n* 列数据类型必须兼容, 类型不必完全相同, 但必须是可以隐式转换的\r\n* UNION默认会去重, 如果不需要可以使用UNION ALL\r\n* 组合查询对于排序结果只能在最后一条SQL语句中指定\r\n\r\n## 子句顺序\r\n\r\n| 子句  | 说明 | 必须使用 |\r\n| :---: | :---: | :---: |\r\n| SELECT | 要返回的列或者表达式 | 是 |\r\n| FROM | 从中检索数据的表 | 仅在从表中检索数据时使用 |\r\n| WHERE | 行级过滤 | 否 |\r\n| GROUP BY | 分组说明 | 尽在按组计算聚集时使用 |\r\n| HAVING | 组级过滤 | 否 |\r\n| ORDER BY | 输出排序顺序 | 否 |\r\n| LIMIT | 限制检索行数 | 否 |\r\n\r\n## 附加\r\n\r\n::: tip 说明\r\n\r\n* 子句：SQL语句由子句构成，有些子句是必须得，有的是可选的。一个子句通常由一个关键字和所提供的数据组成。\r\n* 完全限定名：SELECT prodicts.prod_name FROM prodcucts; SELECT products.prod_name FROM crashcourse\r\n\r\n:::\r\n\r\n::: warning 注意\r\n\r\n* 当心逗号: 多个列时注意列名间加上逗号，最后一个列名不加\r\n* 使用通配符：除非你确实需要每个列，否则不要使用，检索不需要的列通常会降低检索和应用程序的性能，但同时存在一个优点可以检索到未知列\r\n* 行0：检索出来的第一行为0，而不是为行1，因此如果LIMIT 1,1将检索出的是第二行而不是第一行\r\n* 行数不够时：如果没有足够的行，MySQL将只返回它能返回的行\r\n* 何时使用引号：单引号用来限定字符串，如果将值与串类型的列进行比较则需要，数值进行比较的值不需要\r\n* MyISAM和InnoDB为最常使用的两个数据库引擎, InnoDB不支持全文本搜索, MyISAM支持\r\n\r\n:::', '{}', '内容标题', '[{\"tag\":\"h1\",\"title\":\"关键词\",\"href\":\"%E5%85%B3%E9%94%AE%E8%AF%8D\"},{\"tag\":\"h2\",\"title\":\"SELECT 检索\",\"href\":\"select-%E6%A3%80%E7%B4%A2\"},{\"tag\":\"h2\",\"title\":\"INSERT 插入\",\"href\":\"insert-%E6%8F%92%E5%85%A5\"},{\"tag\":\"h2\",\"title\":\"UPDATE 更新\",\"href\":\"update-%E6%9B%B4%E6%96%B0\"},{\"tag\":\"h2\",\"title\":\"DELETE 删除\",\"href\":\"delete-%E5%88%A0%E9%99%A4\"},{\"tag\":\"h2\",\"title\":\"FROM 来自\",\"href\":\"from-%E6%9D%A5%E8%87%AA\"},{\"tag\":\"h3\",\"title\":\"INNER JOIN 联结\",\"href\":\"inner-join-%E8%81%94%E7%BB%93\"},{\"tag\":\"h3\",\"title\":\"ON 条件\",\"href\":\"on-%E6%9D%A1%E4%BB%B6\"},{\"tag\":\"h2\",\"title\":\"AS 别名\",\"href\":\"as-%E5%88%AB%E5%90%8D\"},{\"tag\":\"h2\",\"title\":\"WHERE 筛选\",\"href\":\"where-%E7%AD%9B%E9%80%89\"},{\"tag\":\"h3\",\"title\":\"计算次序\",\"href\":\"%E8%AE%A1%E7%AE%97%E6%AC%A1%E5%BA%8F\"},{\"tag\":\"h3\",\"title\":\"AND 并且\",\"href\":\"and-%E5%B9%B6%E4%B8%94\"},{\"tag\":\"h3\",\"title\":\"OR 或者\",\"href\":\"or-%E6%88%96%E8%80%85\"},{\"tag\":\"h3\",\"title\":\"IN 包含\",\"href\":\"in-%E5%8C%85%E5%90%AB\"},{\"tag\":\"h3\",\"title\":\"NOT 否定\",\"href\":\"not-%E5%90%A6%E5%AE%9A\"},{\"tag\":\"h3\",\"title\":\"LIKE 结构\",\"href\":\"like-%E7%BB%93%E6%9E%84\"},{\"tag\":\"h3\",\"title\":\"REGEXP 正则\",\"href\":\"regexp-%E6%AD%A3%E5%88%99\"},{\"tag\":\"h2\",\"title\":\"GROUP BY 分组\",\"href\":\"group-by-%E5%88%86%E7%BB%84\"},{\"tag\":\"h2\",\"title\":\"WITH ROLLUP 统计\",\"href\":\"with-rollup-%E7%BB%9F%E8%AE%A1\"},{\"tag\":\"h2\",\"title\":\"HAVING 过滤\",\"href\":\"having-%E8%BF%87%E6%BB%A4\"},{\"tag\":\"h2\",\"title\":\"ORDER BY 排序\",\"href\":\"order-by-%E6%8E%92%E5%BA%8F\"},{\"tag\":\"h2\",\"title\":\"LIMIT 限制\",\"href\":\"limit-%E9%99%90%E5%88%B6\"},{\"tag\":\"h2\",\"title\":\"UNION 组合\",\"href\":\"union-%E7%BB%84%E5%90%88\"},{\"tag\":\"h2\",\"title\":\"子句顺序\",\"href\":\"%E5%AD%90%E5%8F%A5%E9%A1%BA%E5%BA%8F\"},{\"tag\":\"h2\",\"title\":\"附加\",\"href\":\"%E9%99%84%E5%8A%A0\"}]', '2018-12-18 11:24:13', null);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(12) NOT NULL COMMENT '用户id',
  `alias` char(24) NOT NULL COMMENT '用户昵称',
  `birthday` date DEFAULT NULL COMMENT '用户年龄',
  `adress` varchar(32) DEFAULT NULL COMMENT '用户地址',
  `avatar` varchar(64) DEFAULT NULL COMMENT '用户头像',
  `phone` char(12) DEFAULT NULL COMMENT '手机号码',
  `create_time` datetime NOT NULL COMMENT '账号创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('6', 'akane', null, null, null, null, '2018-12-03 15:42:34', null, null);

-- ----------------------------
-- Table structure for user_list
-- ----------------------------
DROP TABLE IF EXISTS `user_list`;
CREATE TABLE `user_list` (
  `user_id` int(12) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `hash` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'bcrypt加密后的hash值',
  `email` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `privilege` enum('4','3','2','1','0') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '0-游客 1-普通成员 2-组长 3-负责人 4-root',
  `role` enum('0','1','2','3','4') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '0-待分配 1-前端 2-测试 3-UI 4-后台',
  `create_time` datetime NOT NULL COMMENT '账号创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `update_time` datetime DEFAULT NULL COMMENT '用户信息修改时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_list
-- ----------------------------
INSERT INTO `user_list` VALUES ('6', 'akane', '$2b$10$PMoZz.iGRKG86qJEUGx.BufsmE7Ey30w6fNNm/1E0o8Zghu3/2rUK', '1264051408@qq.com', '4', '1', '2018-12-03 15:42:34', '2018-12-18 15:07:33', '2018-12-10 16:58:42');
DROP TRIGGER IF EXISTS `increaseUserInfo`;
DELIMITER ;;
CREATE TRIGGER `increaseUserInfo` AFTER INSERT ON `user_list` FOR EACH ROW BEGIN
SET @user_id = new.user_id;
SET @user_name = new.username;
SET @create_time = new.create_time;
INSERT user_info (
    `user_id`, `alias`, `birthday`, `adress`, `avatar`, `phone`, `create_time`, `update_time`
) VALUES(
    @user_id, @user_name, NULL, NULL, NULL, NULL, @create_time, NULL
);
END
;;
DELIMITER ;
