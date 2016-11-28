DROP DATABASE bar;

CREATE DATABASE bar;

USE bar;

DROP TABLE IF EXISTS systems; /*系统参数*/
CREATE TABLE systems (
  sid bigint(20) unsigned NOT NULL auto_increment,/*自动编号*/
  sitename varchar(255) not null default '小型酒吧在线管理系统',
  description varchar(255) not null default '小型酒吧在线管理系统',
  keywords varchar(255) not null default '酒吧,管理,系统,在线',
  author varchar(255) not null default '张飞',  /*负责人*/
  email char(50) NOT NULL default '',
  tel varchar(255) NOT NULL default '',
  PRIMARY KEY  (sid)
) TYPE=MyISAM;

INSERT INTO systems VALUES (1,'小型酒吧在线管理系统','小型酒吧在线管理系统','酒吧,管理,系统,在线','张飞','xx@qq.com','11111111111')



DROP TABLE IF EXISTS users; /*会员表*/
CREATE TABLE users (
  userid bigint(20) unsigned not null auto_increment ,/*自动编号*/
  uname char(36) NOT NULL default '',
  name char(50) NOT NULL default '',/*真实姓名*/
  pwd char(32) NOT NULL default '',
  spwd char(32) NOT NULL default '',
  sex enum('男','女','保密') NOT NULL default '保密',
  email char(50) NOT NULL default '',
  address varchar(255) NOT NULL default '',
  tel varchar(255) NOT NULL default '',
  birth  date default '0000-00-00',
  post char(50) NOT NULL default '',
  safequestion char(50) NOT NULL default '',/*安全问题*/
  safeanswer char(50) NOT NULL default '',/*答案*/
  role enum('0','1','2') NOT NULL default '0',/*1为会员2为管理员3为员工*/
  money char(50) NOT NULL default '0',
  createtime  timestamp   NOT   NULL   default   CURRENT_TIMESTAMP,
  PRIMARY KEY  (userid),
  UNIQUE KEY userid (userid)
) TYPE=MyISAM;
INSERT INTO users(uname,name,pwd,spwd,sex,email,address,tel,birth,post,safequestion,safeanswer,role) VALUES ( 'admin', '管理员', '21232F297A57A5A743894A0E4A801FC3','admin','男','514337551@qq.com','云南师大商学院',
'15825254472','1987-10-18','650106','我是管理员吗？','是的','2');
INSERT INTO users(uname,name,sex,email,address,tel,birth,knowledge,post,safequestion,safeanswer,role) VALUES ( 'king2088', '张飞','男','514337551@qq.com','云南师大商学院',
'15825254472','1987-10-18','本科','650106','我是管理员吗？','是的','2');


DROP TABLE IF EXISTS myusers; /*供应商表*/
CREATE TABLE myusers (
myuserid bigint(20) unsigned not null auto_increment ,/*自动编号*/
myuname char(36) NOT NULL default '',/*供应者名字*/
sex enum('男','女') NOT NULL default '男',
pname char(50) NOT NULL default '',/*啤酒名称*/
address varchar(255) NOT NULL default '', /*供应商地址*/
email char(50) NOT NULL default '',/*供应商email*/
tel varchar(255) NOT NULL default '',/*供应商联系电话*/
  PRIMARY KEY  (myuserid),
  UNIQUE KEY myuserid (myuserid)
) TYPE=MyISAM;

INSERT INTO myusers VALUES ( '1', '张飞','男','大理啤酒','昆明市高新区海豚路99号','514337551@qq.com','15928282822');




DROP TABLE IF EXISTS articles; /*文章表*/
CREATE TABLE articles (
  articleid bigint(20) NOT NULL auto_increment,/*文章ID*/
  title varchar(100) default NULL,/*文章标题*/
  content mediumtext,/*文章内容*/
  userid bigint(20) default '0',/*文章发布者*/
  readcount int(11) default '0',/*文章阅读次数*/
  recount int(11) default '0',/*文章回复数*/
  typeid enum('1','2','3') NOT NULL default '1',/*1是新闻2是公告3是活动*/
  createtime timestamp   NOT   NULL   default   CURRENT_TIMESTAMP, /*文章发布时间*/
  PRIMARY KEY  (articleid),
  UNIQUE KEY articleid (articleid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS type; /*文章类型表*/
CREATE TABLE type (
typeid bigint(20) NOT NULL auto_increment,/*类型ID*/
typename varchar(100) default  null,
PRIMARY KEY  (typeid),
UNIQUE KEY articleid (typename)
) TYPE=MyISAM;



INSERT INTO type VALUES ( 1, '酒吧新闻');
INSERT INTO type VALUES ( 2, '酒吧公告');
INSERT INTO type VALUES ( 3, '酒吧活动');






DROP TABLE IF EXISTS goods; /*订单表*/
CREATE TABLE goods (
  goodsid bigint(20) NOT NULL auto_increment,/*ID*/
  buynumber bigint(20) default '1',/*购买商品的数量*/
  userid bigint(20) NOT NULL default '0',/*用户索引号*/
  price float(20,3) default NULL,/*付款费用*/
  goodinfoid bigint(20) NOT NULL default '0',/*商品索引号*/
  createtime timestamp   NOT   NULL   default   CURRENT_TIMESTAMP,/*订购时间*/
  PRIMARY KEY  (goodsid),
  UNIQUE KEY goodsid (goodsid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS goodinfo; /*商品信息表*/
CREATE TABLE goodinfo (
  goodinfoid bigint(20) NOT NULL auto_increment,
  goodinfoname varchar(100) default NULL,/*商品名称*/
  company varchar(100) default NULL,/*生产厂家*/
  addr varchar(50) default NULL,/*产地*/
  price float(20,3) default NULL,/*价格*/
  picurl varchar(30) default NULL,/*商品对应的图片名*/
  intro mediumtext,/*商品介绍*/
  num varchar(100) default NULL,/*产品件数*/
  createtime timestamp   NOT   NULL   default   CURRENT_TIMESTAMP,/*商品信息提交时间*/
  PRIMARY KEY  (goodinfoid),
  UNIQUE KEY goodinfoid (goodinfoid)
) TYPE=MyISAM;





DROP TABLE IF EXISTS ku; 
CREATE TABLE ku ( /*库存信息表*/
  kuid bigint(20) NOT NULL auto_increment,
  goodname varchar(200) NOT NULL default '',
  num varchar(100) default NULL,/*产品件数*/
  PRIMARY KEY  (kuid),
  UNIQUE KEY kuid (kuid)
) TYPE=MyISAM;

INSERT INTO ku VALUES ( 1, '大理啤酒','100');
INSERT INTO ku VALUES ( 2, '雪花啤酒','100');
INSERT INTO ku VALUES ( 3, '燕京啤酒','100');
INSERT INTO ku VALUES ( 4, '金星啤酒','100');



DROP TABLE IF EXISTS talk; 
CREATE TABLE talk ( /*用户留言版*/
  talkid bigint(20) NOT NULL auto_increment,
  content mediumtext,
  userid bigint(20) NOT NULL default '0',
  createtime timestamp   NOT   NULL   default   CURRENT_TIMESTAMP,
  PRIMARY KEY  (talkid),
  UNIQUE KEY talkid (talkid)
) TYPE=MyISAM;



DROP TABLE IF EXISTS email; 
CREATE TABLE email (
  emailid bigint(20) NOT NULL auto_increment,
  subject varchar(200) default NULL,/*邮件标题*/
  content mediumtext,/*邮件内容*/
  sender varchar(50) NOT NULL default '',/*发信人*/
  receiver varchar(50) NOT NULL default '',/*收件人*/
  createtime timestamp   NOT   NULL   default   CURRENT_TIMESTAMP,/*发送时间*/
  tag tinyint(1) default '0',/*邮件标记*/
  PRIMARY KEY  (EmailID)
) TYPE=MyISAM;



DROP TABLE IF EXISTS music; 
CREATE TABLE music (
musicid bigint(20) not null auto_increment,
musicname text,
musicurl text,
userid bigint(20) NOT NULL default '0',
PRIMARY KEY  (musicid)
) TYPE=MyISAM;