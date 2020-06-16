/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.0.22-community-nt : Database - anjufangwu
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
  KEY `FK_keep` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `forder` */

insert  into `forder`(`id`,`uid`,`fid`,`status`,`pj`,`stime`,`etime`,`amount`,`isdel`,`pubtime`,`zprice`,`ono`,`btype`,`jid`,`scope`) values (1,2,3,'已评价','11111','2020-03-29 20:27:41',NULL,1,'1','2020-03-29',200,'20200329201604115465','1',7,10),(2,2,7,'收藏中',NULL,NULL,NULL,NULL,'1','2020-03-29 21:03:58',NULL,NULL,'收藏',NULL,NULL),(3,2,2,'已评价','11111','2020-03-29 21:09:42',NULL,1,'1','2020-03-29',150,'20200329210933128071','1',7,8),(4,10,1,'已评价','非常好！','2020-03-29 21:14:06',NULL,1,'1','2020-03-29',150,'20200329211336101728','1',7,10),(5,10,7,'收藏中',NULL,NULL,NULL,NULL,'1','2020-03-29 21:13:42',NULL,NULL,'收藏',NULL,NULL),(6,10,4,'已评价','内容11','2020-03-29 21:18:31',NULL,1,'1','2020-03-29',160,'20200329211819154956','1',9,9);

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

insert  into `fshop`(`id`,`fid`,`num`,`uid`,`pubtime`,`status`,`oid`,`btype`) values (1,3,1,2,'2020-03-29 20:15:49','已支付','20200329201604115465','1'),(2,2,1,2,'2020-03-29 21:09:24','已支付','20200329210933128071','1'),(3,1,1,10,'2020-03-29 21:13:10','已支付','20200329211336101728','1'),(4,4,1,10,'2020-03-29 21:18:07','已支付','20200329211819154956','1');

/*Table structure for table `ftype` */

DROP TABLE IF EXISTS `ftype`;

CREATE TABLE `ftype` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `isdel` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ftype` */

insert  into `ftype`(`id`,`name`,`isdel`) values (1,'分类1','1'),(2,'分类2','1'),(3,'分类3','1'),(4,'分类4','1'),(5,'分类88','1'),(6,'分类5','1');

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

insert  into `goods`(`id`,`fid`,`mark`,`img`,`name`,`note`,`price`,`pubtime`,`isdel`,`uid`,`kcnum`,`xnum`) values (1,'2',NULL,'4.jpg','作品11','<p>\r\n	作品说明111\r\n</p>\r\n<p>\r\n	<img src=\"/anjufangwu/attached/image/20200329/20200329201331_72.jpg\" alt=\"\" />\r\n</p>',150,'2020-03-29 20:13:35','1','7',99,1),(2,'1',NULL,'6.jpg','作品2','作品如下说明111',150,'2020-03-29 20:14:10','1','7',99,1),(3,'3',NULL,'8.jpg','作品3','设计如下说明11',200,'2020-03-29 20:14:36','1','7',99,1),(4,'6',NULL,'8.jpg','作品21','<p>\r\n	作品的介绍\r\n</p>\r\n<p>\r\n	<img src=\"/anjufangwu/attached/image/20200329/20200329211717_793.jpg\" alt=\"\" />\r\n</p>',160,'2020-03-29 21:17:18','1','9',99,1);

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

insert  into `news`(`id`,`img`,`name`,`note`,`pubtime`) values (1,'5.jpg','新闻1','<img src=\"/anjufangwu/attached/image/20200329/20200329200852_879.jpg\" alt=\"\" />','2020-03-29 20:08:54'),(2,'6.jpg','新闻2','新闻的内容11','2020-03-29 20:09:13'),(3,'7.jpg','新闻3','新闻内容22111333','2020-03-29 20:09:34'),(4,'lv02.jpg','新闻88','<p>\r\n	介绍\r\n</p>\r\n<p>\r\n	<img src=\"/anjufangwu/attached/image/20200329/20200329211606_507.jpg\" alt=\"\" />\r\n</p>','2020-03-29 21:16:08');

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

insert  into `sysuser`(`id`,`uname`,`sex`,`address`,`pwd`,`utype`,`tel`,`age`,`mbanswer`,`question`,`email`,`pubtime`,`tname`,`money`,`isdel`,`img`,`note`,`scope`) values (1,'admin','女','地址1','123','管理员','15623654561','25',NULL,NULL,NULL,'2020-03-25 16:06:19','管理员',0,'在用','20170915112724145.jpg','1111',NULL),(2,'lisi','女','武汉128号','123','会员','13556214786','23','我是谁？','lisi',NULL,'2020-03-25 16:06:19','李四',0,'在用','20170915112433524.jpg','',NULL),(7,'sj01','女','地址11','123456','设计师','15632147896','30',NULL,NULL,NULL,'2020-03-25 16:06:19','设计师1',NULL,NULL,'20180716022205817.jpg','<p>\r\n	介绍如下\r\n</p>\r\n<p>\r\n	上班时间：\r\n</p>',9.33),(9,'sj02','女','地址1','123456','设计师','15639874653','26',NULL,NULL,NULL,'2020-03-25 16:06:19','王小姐',NULL,'1','20170915113845579.jpg','<p>\r\n	上班时间：\r\n</p>\r\n<p>\r\n	下班时间：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	介绍如下：\r\n</p>',9.25),(10,'test','女','地址11','123456','会员','17556212399',NULL,'我是谁？','test','115431678@qq.com','2020-03-29 21:12:42.626','测试用户',91,'1','20170910095708668.jpg',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
