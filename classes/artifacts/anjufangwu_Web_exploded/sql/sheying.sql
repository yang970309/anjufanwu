/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.0.24-community-nt : Database - anjufangwu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`anjufangwu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `anjufangwu`;

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `price` double default NULL,
  `img` varchar(255) default NULL,
  `uid` int(11) default NULL,
  `stime` varchar(30) default NULL,
  `etime` varchar(30) default NULL,
  `status` varchar(10) default NULL,
  `amount` int(11) default NULL,
  `snum` int(11) default NULL,
  `note` text,
  `pubtime` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`id`,`name`,`price`,`img`,`uid`,`stime`,`etime`,`status`,`amount`,`snum`,`note`,`pubtime`) values (1,'摄影作品1',260,'u=4127759356,287275308&fm=26&gp=0.jpg',3,NULL,NULL,'待预约',18,3,'内容如下','2020-02-24 10:46:47'),(2,'摄影作品33',680,'u=3755119925,772141881&fm=26&gp=0.jpg',6,NULL,NULL,'待预约',35,1,'ddd','2020-02-24 10:46:47'),(3,'摄影99',520,'u=2470755585,4203760428&fm=26&gp=0.jpg',10,NULL,NULL,'待预约',NULL,0,'介绍如下；','2020-02-25 16:14:20');

/*Table structure for table `forder` */

DROP TABLE IF EXISTS `forder`;

CREATE TABLE `forder` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `fid` int(11) default NULL,
  `status` varchar(30) default NULL,
  `pj` varchar(255) default NULL,
  `stime` varchar(50) default NULL,
  `etime` varchar(50) default NULL,
  `amount` int(11) default NULL,
  `isdel` varchar(50) default NULL,
  `pubtime` varchar(50) default NULL,
  `zprice` double default NULL,
  `ono` varchar(255) default NULL,
  `btype` varchar(30) default NULL,
  `jid` int(11) default NULL,
  `scope` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_keep` (`fid`),
  CONSTRAINT `FK_keep` FOREIGN KEY (`fid`) REFERENCES `goods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `forder` */

insert  into `forder`(`id`,`uid`,`fid`,`status`,`pj`,`stime`,`etime`,`amount`,`isdel`,`pubtime`,`zprice`,`ono`,`btype`,`jid`,`scope`) values (7,4,1,'已评价','内容如下','2020-02-24 10:36:27',NULL,1,'1','2020-02-24',125,'20200214232004126702','3',3,8),(8,4,2,'已支付',NULL,'2020-02-24 10:36:27',NULL,1,'1','2020-02-24',30,'20200214232004126702','2',3,0),(10,5,1,'已评价','讲的不错！','2020-02-24 10:36:27',NULL,1,'1','2020-02-24',125,'20200215122647147825','3',3,9),(11,5,3,'已支付',NULL,'2020-02-24 10:36:27',NULL,1,'1','2020-02-24',30,'20200215122647147825','2',3,0),(12,4,1,'已评价','评价内容11','2020-02-24 10:36:27',NULL,1,'1','2020-02-24',20,'20200224102649155419','1',7,8),(13,4,2,'已评价','评价内容','2020-02-24 10:39:43',NULL,1,'1','2020-02-24',5,'20200224102649155419','1',7,8),(14,4,2,'已支付',NULL,'2020-02-24 10:26:49',NULL,1,'1','2020-02-24',68,'20200224102649155419','3',6,0),(15,4,4,'已支付',NULL,'2020-02-24 10:46:47',NULL,1,'1','2020-02-24',14,'20200224104647709524','1',7,NULL),(16,8,1,'已评价','评价的内容111','2020-02-25 16:04:05',NULL,1,'1','2020-02-25',260,'20200225160221199755','3',3,7),(17,8,1,'已评价','评价的内容11','2020-02-25 16:03:23',NULL,1,'1','2020-02-25',20,'20200225160221199755','1',7,10);

/*Table structure for table `fshop` */

DROP TABLE IF EXISTS `fshop`;

CREATE TABLE `fshop` (
  `id` int(11) NOT NULL auto_increment,
  `fid` int(11) default NULL,
  `num` int(11) default NULL,
  `uid` int(11) default NULL,
  `pubtime` varchar(30) default NULL,
  `status` varchar(10) default NULL,
  `oid` varchar(255) default NULL,
  `btype` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fshop` */

insert  into `fshop`(`id`,`fid`,`num`,`uid`,`pubtime`,`status`,`oid`,`btype`) values (6,7,3,2,'2020-02-24 10:46:45','购物车',NULL,'1'),(7,6,1,2,'2020-02-24 10:46:45','购物车',NULL,'1'),(8,7,1,4,'2020-02-24 10:46:45','已支付','20200214164006190848','1'),(9,7,1,4,'2020-02-24 10:46:45','已支付','20200214232004126702','1'),(10,1,1,4,'2020-02-24 10:46:45','已支付','20200214232004126702','3'),(11,2,1,4,'2020-02-24 10:46:45','已支付','20200214232004126702','2'),(12,5,2,5,'2020-02-24 10:46:45','已支付','20200215122647147825','1'),(13,1,1,5,'2020-02-24 10:46:45','已支付','20200215122647147825','3'),(14,3,1,5,'2020-02-24 10:46:45','已支付','20200215122647147825','2'),(15,1,1,4,'2020-02-24 10:25:02','已支付','20200224102649155419','1'),(16,2,1,4,'2020-02-24 10:26:14','已支付','20200224102649155419','1'),(17,2,1,4,'2020-02-24 10:26:33','已支付','20200224102649155419','3'),(18,4,1,4,'2020-02-24 10:46:45','已支付','20200224104647709524','1'),(19,1,1,8,'2020-02-25 16:01:48','已支付','20200225160221199755','3'),(20,1,1,8,'2020-02-25 16:02:06','已支付','20200225160221199755','1');

/*Table structure for table `ftype` */

DROP TABLE IF EXISTS `ftype`;

CREATE TABLE `ftype` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `isdel` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ftype` */

insert  into `ftype`(`id`,`name`,`isdel`) values (1,'分类1','1'),(2,'分类2','1'),(3,'分类3','1'),(4,'分类4','1'),(5,'分类88','1');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL auto_increment,
  `fid` varchar(50) default NULL,
  `mark` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  `name` varchar(200) default NULL,
  `note` text,
  `price` double default NULL,
  `pubtime` varchar(50) default NULL,
  `isdel` varchar(20) default NULL,
  `uid` varchar(20) default NULL,
  `kcnum` int(11) default NULL,
  `xnum` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_flower` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`fid`,`mark`,`img`,`name`,`note`,`price`,`pubtime`,`isdel`,`uid`,`kcnum`,`xnum`) values (1,'1','','u=3781570433,1340505645&fm=26&gp=0.jpg','作品1','作品介绍',20,'2020-02-24 10:46:47','1','7',99,4),(2,'3','','u=3912678148,3881545006&fm=15&gp=0.jpg','作品3','如下说明',500,'2020-02-24 10:46:47','1','7',99,2),(3,'1','','u=2861939911,2963460683&fm=15&gp=0.jpg','作品2','介绍如下',100,'2020-02-24 10:46:47','1','7',99,2),(4,'1','','u=2230747632,503939067&fm=15&gp=0.jpg','作品4','说明如下',140,'2020-02-24 10:46:47','1','7',99,3),(5,'1','','u=679985884,3985630581&fm=15&gp=0.jpg','作品5','说明如下',200,'2020-02-24 10:46:47','1','7',99,3),(6,'1','','u=2861939911,2963460683&fm=15&gp=0.jpg','作品6','说明如下',20,'2020-02-24 10:46:47','1','7',99,0),(7,'4','','u=3413825497,2489693908&fm=15&gp=0.jpg','作品66','<p>\r\n	说明如下\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',10,'2020-02-24 10:46:47','1','7',99,2),(8,'1',NULL,'u=4265219776,3043439202&fm=15&gp=0.jpg','作品1','ddd',260,'2020-02-24 10:46:47','1','7',99,0),(9,'3',NULL,'u=679985884,3985630581&fm=15&gp=0.jpg','作品22','说明11<img src=\"/anjufangwu/attached/image/20200215/20200215124018_53.jpg\" width=\"400\" height=\"273\" alt=\"\" />',360,'2020-02-24 10:46:47','1','7',99,0),(10,'5',NULL,'u=2844047339,1563032073&fm=15&gp=0.jpg','设计88','<p>\r\n	介绍如下：\r\n</p>\r\n<p>\r\n	<img src=\"/anjufangwu/attached/image/20200225/20200225161226_647.jpg\" alt=\"\" /> \r\n</p>',358,'2020-02-25 16:12:35','1','9',99,0);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL auto_increment,
  `img` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `note` text,
  `pubtime` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`img`,`name`,`note`,`pubtime`) values (1,'u=3929104836,2674579619&fm=11&gp=0.jpg','新闻33','<p>\r\n	<span><span style=\"font-size:14px;background-color:#FFFFFF;\"><b>新闻55555</b></span></span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','2020-02-24 10:46:47'),(2,'u=3453819907,3340188686&fm=26&gp=0.jpg','新闻1','<pre id=\"best-content-1528017373\" class=\"best-text mb-10\">新闻内容</pre>','2020-02-24 10:46:47'),(3,'u=2695593974,3714592025&fm=26&gp=0.jpg','新闻33','说明','2020-02-24 10:46:47'),(5,'u=109503399,354578315&fm=26&gp=0.jpg','新闻888','说明如下','2020-02-24 10:46:47'),(6,'u=109503399,354578315&fm=26&gp=0.jpg','新闻88','3333','2020-02-25 16:13:42');

/*Table structure for table `sysuser` */

DROP TABLE IF EXISTS `sysuser`;

CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL auto_increment,
  `uname` varchar(20) default NULL,
  `sex` varchar(10) default NULL,
  `address` varchar(100) default NULL,
  `pwd` varchar(20) default NULL,
  `utype` varchar(30) default '会员',
  `tel` varchar(20) default NULL,
  `age` varchar(10) default NULL,
  `mbanswer` varchar(30) default NULL,
  `question` varchar(30) default NULL,
  `email` varchar(30) default NULL,
  `pubtime` varchar(30) default NULL,
  `tname` varchar(50) default NULL,
  `money` double default '0',
  `isdel` varchar(10) default NULL,
  `img` varchar(255) default NULL,
  `note` text,
  `scope` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sysuser` */

insert  into `sysuser`(`id`,`uname`,`sex`,`address`,`pwd`,`utype`,`tel`,`age`,`mbanswer`,`question`,`email`,`pubtime`,`tname`,`money`,`isdel`,`img`,`note`,`scope`) values (1,'admin',NULL,NULL,'123','管理员',NULL,NULL,NULL,NULL,NULL,NULL,'管理员',0,'在用',NULL,NULL,NULL),(2,'lisi','男','武汉128号','123','会员','13556214786','23','我是谁？','lisi',NULL,'2020-02-24 10:46:47','李四',150,'在用',NULL,NULL,NULL),(3,'zhangsan','男','武汉128号','123456','摄影师','13556214786','23','我是谁？','zhangsan',NULL,'2020-02-24 10:46:47','张三',62,'在用','u=2470755585,4203760428&fm=26&gp=0.jpg','2222',8.33),(4,'test01','男','武汉343号','123456','会员','14584845288','','我是谁？','test01','21521515@qq.com','2020-02-24 10:46:47','测试用户',18,NULL,'u=2844047339,1563032073&fm=15&gp=0 (1).jpg','',0),(5,'test02','男','地区1','123456','会员','14584845214','','我是谁？','test02','21521515@qq.com','2020-02-24 10:46:47','测试用户2',6,NULL,'u=3413825497,2489693908&fm=15&gp=0.jpg','',0),(6,'jl02','男','地址1','123456','摄影师','15336989875','35',NULL,NULL,NULL,'2020-02-24 10:46:47','王五',NULL,NULL,'u=3177982443,1636976179&fm=11&gp=0.jpg','说明如下',0),(7,'hy01','女','地址11','123456','设计师','15632147896','30',NULL,NULL,NULL,'2020-02-24 10:46:47','设计1',NULL,NULL,'u=745780945,614035767&fm=26&gp=0.jpg','<p>\r\n	介绍如下\r\n</p>\r\n<p>\r\n	上班时间：\r\n</p>',8.6),(8,'test','男','地区1','123456','会员','14584845214',NULL,'我是谁？','test','21521515@qq.com','2020-02-25 16:01:17.834','测试用户',820,'1','u=4265219776,3043439202&fm=15&gp=0.jpg',NULL,NULL),(9,'jz05','女','地址1','123456','设计师','15639874653','26',NULL,NULL,NULL,'2020-02-25 16:06:19','王小姐',NULL,'1','u=2844047339,1563032073&fm=15&gp=0.jpg','<p>\r\n	上班时间：\r\n</p>\r\n<p>\r\n	下班时间：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	介绍如下：\r\n</p>',0),(10,'sy001','男','地址2','123456','摄影师','15987632523','29',NULL,NULL,NULL,'2020-02-25 16:07:50','摄影88',NULL,'1','u=2470755585,4203760428&fm=26&gp=0.jpg','<p>\r\n	上班时间；\r\n</p>\r\n<p>\r\n	介绍如下：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
