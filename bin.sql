/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.34 : Database - bin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bin` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bin`;

/*Table structure for table `_comment` */

DROP TABLE IF EXISTS `_comment`;

CREATE TABLE `_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `score` tinyint(4) NOT NULL COMMENT '评价等级，上限5，下线0，取整',
  `gid` int(11) NOT NULL COMMENT '商品id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `content` varchar(200) DEFAULT NULL COMMENT '评价内容',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `oid` int(11) NOT NULL COMMENT '订单id',
  `gpid` int(11) NOT NULL COMMENT '商品属性id',
  `isAnonymous` tinyint(4) NOT NULL DEFAULT '1' COMMENT '匿名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `_comment` */

insert  into `_comment`(`id`,`score`,`gid`,`uid`,`content`,`createTime`,`oid`,`gpid`,`isAnonymous`) values (1,4,6,2,'fwef','2017-02-05 15:41:53',11,18,2),(2,2,6,2,'qrwr','2017-02-05 15:41:53',11,19,2),(3,4,6,2,'fsfsd','2017-02-05 15:48:50',11,18,1),(4,2,6,2,'ew','2017-02-05 15:48:50',11,19,1),(5,3,6,2,'fwe','2017-02-05 18:45:29',11,18,2),(6,2,6,2,'tewtrewq','2017-02-05 18:45:29',11,19,2),(7,2,6,2,'发放','2017-02-06 10:15:44',11,18,2),(8,4,6,2,'方法是','2017-02-06 10:15:44',11,19,2),(9,3,6,2,'根深蒂固','2017-02-06 10:25:34',11,18,1),(10,3,6,2,'根深蒂固','2017-02-06 10:25:34',11,19,1),(11,5,9,2,'不错','2017-03-05 14:03:42',13,26,2),(12,3,9,2,'一般般','2017-03-05 21:48:13',14,25,1),(13,1,9,2,'很渣','2017-03-05 22:01:52',15,26,2),(14,4,9,2,'挺好的','2017-03-05 22:06:02',17,26,1),(15,5,9,2,'挺好的','2017-03-05 22:12:47',18,26,1),(16,4,9,2,'挺不错的','2017-03-05 22:29:12',19,26,1),(17,5,9,2,'挺好的','2017-03-05 22:33:52',20,25,1);

/*Table structure for table `_order` */

DROP TABLE IF EXISTS `_order`;

CREATE TABLE `_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `aid` int(11) NOT NULL COMMENT '收货地址id',
  `_no` varchar(30) NOT NULL COMMENT '订单号',
  `_status` tinyint(4) NOT NULL COMMENT '状态，1-代付款，2-已取消，3-待收货，4-待评价，5-已完成',
  `payWay` tinyint(4) NOT NULL COMMENT '支付方式，1-在线支付，2-货到付款',
  `payTime` datetime DEFAULT NULL COMMENT '付款时间',
  `totalValue` decimal(10,0) DEFAULT NULL COMMENT '商品总额',
  `receiptName` varchar(30) DEFAULT NULL COMMENT '发票抬头',
  `receiptContent` varchar(100) DEFAULT NULL COMMENT '发票内容',
  `outTime` datetime DEFAULT NULL COMMENT '发货时间',
  `confirmTime` datetime DEFAULT NULL COMMENT '完成时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `score` int(11) DEFAULT NULL COMMENT '成长值',
  `_disable` tinyint(4) DEFAULT NULL COMMENT '逻辑删除位',
  `finishTime` datetime DEFAULT NULL COMMENT '完成时间',
  `eid` int(11) DEFAULT NULL COMMENT '快递公司id',
  `expressName` varchar(20) DEFAULT NULL COMMENT '快递公司名称',
  `expressNo` varchar(30) DEFAULT NULL COMMENT '快递单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `_no` (`_no`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `_order` */

insert  into `_order`(`id`,`uid`,`aid`,`_no`,`_status`,`payWay`,`payTime`,`totalValue`,`receiptName`,`receiptContent`,`outTime`,`confirmTime`,`createTime`,`score`,`_disable`,`finishTime`,`eid`,`expressName`,`expressNo`) values (2,2,2,'201701202302082',1,1,NULL,'53','fds','1',NULL,NULL,'2017-01-20 23:02:08',53,1,NULL,NULL,NULL,NULL),(3,2,2,'201701202310262',2,1,NULL,'53','fds','1',NULL,NULL,'2016-01-20 23:10:26',53,1,NULL,NULL,NULL,NULL),(4,2,2,'201701202313122',3,1,NULL,'53','32','1',NULL,NULL,'2015-01-20 23:13:12',53,1,NULL,NULL,NULL,NULL),(5,2,2,'201701202343402',5,1,'2017-01-20 23:45:22','19','43','1',NULL,'2017-02-06 10:17:45','2014-01-20 23:43:41',19,1,NULL,NULL,NULL,NULL),(6,2,2,'201701211423192',4,2,NULL,'19','2','1',NULL,'2017-02-06 10:22:33','2013-01-21 14:23:10',19,1,NULL,NULL,NULL,NULL),(11,2,2,'201701211534562',6,1,'2017-01-21 15:35:22','19','发的是','1','2017-01-21 15:35:22','2017-02-06 10:25:08','2017-01-21 15:34:56',19,1,'2017-02-06 10:25:34',4,'顺丰速运','3232'),(12,2,2,'201703051341262',1,1,'2017-03-05 13:41:30','16953','lala','1',NULL,NULL,'2017-03-05 13:41:27',16953,1,NULL,NULL,NULL,NULL),(13,2,2,'201703051346362',6,1,'2017-03-05 13:46:38','3388','fsd','1','2017-03-05 13:50:32','2017-03-05 13:55:19','2017-03-05 13:46:36',3388,1,'2017-03-05 14:03:42',4,'顺丰速运','121324343'),(14,2,16,'201703052146412',6,1,'2017-03-05 21:46:47','3388','随便','1','2017-03-05 21:47:25','2017-03-05 21:47:47','2017-03-05 21:46:41',3388,1,'2017-03-05 21:48:13',4,'顺丰速运','34235346'),(15,2,17,'201703052201042',6,1,'2017-03-05 22:01:06','3388','随便','1','2017-03-05 22:01:27','2017-03-05 22:01:34','2017-03-05 22:01:04',3388,1,'2017-03-05 22:01:52',4,'顺丰速运','3245345'),(16,2,2,'201703052203352',3,1,'2017-03-05 22:03:38','3388','随便','1',NULL,NULL,'2017-03-05 22:03:36',3388,1,NULL,NULL,NULL,NULL),(17,2,2,'201703052205262',6,1,'2017-03-05 22:05:28','3388','随便','1','2017-03-05 22:05:42','2017-03-05 22:05:50','2017-03-05 22:05:26',3388,1,'2017-03-05 22:06:02',4,'顺丰速运','4324'),(18,2,2,'201703052212092',6,1,'2017-03-05 22:12:12','3388','随便','1','2017-03-05 22:12:25','2017-03-05 22:12:34','2017-03-05 22:12:10',3388,1,'2017-03-05 22:12:47',4,'顺丰速运','342542'),(19,2,16,'201703052228362',6,1,'2017-03-05 22:28:38','3388','随便','1','2017-03-05 22:28:51','2017-03-05 22:28:59','2017-03-05 22:28:37',3388,1,'2017-03-05 22:29:12',4,'顺丰速运','123'),(20,2,2,'201703052233162',6,1,'2017-03-05 22:33:18','3388','随便','1','2017-03-05 22:33:29','2017-03-05 22:33:38','2017-03-05 22:33:16',3388,1,'2017-03-05 22:33:52',4,'顺丰速运','123');

/*Table structure for table `_owner` */

DROP TABLE IF EXISTS `_owner`;

CREATE TABLE `_owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `_name` varchar(100) NOT NULL COMMENT '名称',
  `logo` varchar(100) NOT NULL COMMENT '图片地址',
  `_type` tinyint(4) NOT NULL COMMENT '商家类型，1-自营，2-第三方',
  `score` double NOT NULL DEFAULT '5' COMMENT '评分',
  `_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1-审核中，2-审核通过,3-撤离',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `passTime` datetime DEFAULT NULL COMMENT '审核通过时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `_owner` */

insert  into `_owner`(`id`,`_name`,`logo`,`_type`,`score`,`_status`,`createTime`,`passTime`) values (1,'BIN自营','huawei.jpg',1,5,1,'2016-12-21 13:34:51','2016-12-21 13:34:51');

/*Table structure for table `_user` */

DROP TABLE IF EXISTS `_user`;

CREATE TABLE `_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(30) NOT NULL COMMENT '账户，邮箱或手机号',
  `pwd` varchar(40) NOT NULL COMMENT '密码',
  `_name` varchar(30) DEFAULT NULL COMMENT '名称',
  `score` int(11) DEFAULT '0' COMMENT '积分，默认0',
  `gender` tinyint(4) DEFAULT '3' COMMENT '性别，1-男性，2-女性，3-保密',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `balance` decimal(10,0) DEFAULT '0' COMMENT '账户余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `_user` */

insert  into `_user`(`id`,`account`,`pwd`,`_name`,`score`,`gender`,`birthday`,`createTime`,`balance`) values (2,'23@qq.com','202cb962ac59075b964b07152d234b70','22311',0,2,'1996-09-26 00:00:00','2016-12-20 14:00:08','12'),(3,'12@qq.com','202cb962ac59075b964b07152d234b70',NULL,0,1,NULL,'2016-12-20 14:00:50','0'),(5,'14@qq.com','202cb962ac59075b964b07152d234b70',NULL,0,3,NULL,'2016-12-20 14:31:39','0'),(6,'154@qq.com','202cb962ac59075b964b07152d234b70',NULL,0,3,NULL,'2016-12-20 14:32:49','0'),(7,'3213@qq.com','202cb962ac59075b964b07152d234b70',NULL,0,3,NULL,'2016-12-20 18:25:57','0'),(8,'328@qq.com','202cb962ac59075b964b07152d234b70',NULL,0,3,NULL,'2016-12-20 18:38:59','0');

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `_name` varchar(30) NOT NULL COMMENT '收货人姓名',
  `province` varchar(30) NOT NULL COMMENT '省份',
  `city` varchar(30) NOT NULL COMMENT '城市',
  `county` varchar(30) NOT NULL COMMENT '县区',
  `address` varchar(100) NOT NULL COMMENT '详细地址',
  `tel` varchar(20) NOT NULL COMMENT '详细地址',
  `isDefault` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否为默认地址,1-否，2-是',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `_disable` tinyint(4) NOT NULL COMMENT '逻辑删除位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`id`,`uid`,`_name`,`province`,`city`,`county`,`address`,`tel`,`isDefault`,`createTime`,`_disable`) values (2,2,'翁勇城','广东省','深圳市','福田区','发送到1212','87777328',2,'2017-01-18 21:01:44',1),(3,2,'收代理费','江苏省','常州市','溧阳市','房价都死了','1278372',1,'2017-01-18 23:26:45',2),(4,2,'收代理费','江苏省','常州市','溧阳市','房价都死了','1278372',1,'2017-01-18 23:26:45',2),(5,2,'发送到','江苏省','常州市','溧阳市','反倒是','15625430518',1,'2017-01-18 23:38:02',2),(6,2,'发送到','江苏省','常州市','溧阳市','反倒是','15625430518',1,'2017-01-18 23:38:02',2),(7,2,'广发多了','重庆市','重庆市','渝中区','粉红色','123',1,'2017-01-19 13:07:39',2),(8,2,'发送到','江苏省','常州市','溧阳市','12','15625437',1,'2017-01-19 13:09:45',2),(9,2,'发送到','江苏省','常州市','溧阳市','12','15625437',1,'2017-01-19 13:09:45',2),(10,2,'321','江苏省','常州市','溧阳市','21','12',1,'2017-01-19 14:44:30',2),(11,2,'1','江苏省','常州市','溧阳市','1','15625430518',1,'2017-01-19 14:52:05',2),(12,2,'1','江苏省','常州市','溧阳市','1','15625430518',1,'2017-01-19 14:52:05',2),(13,2,'翁勇城','广西壮族自治区','桂林市','灵川县','发的时空裂缝','13528373737',1,'2017-01-19 20:41:48',2),(14,2,'翁勇城','广西壮族自治区','桂林市','灵川县','发的时空裂缝','13528373737',1,'2017-01-19 20:41:48',2),(15,2,'翁勇城','北京市','北京市','朝阳区','发大水了','15625430518',1,'2017-01-19 20:42:39',2),(16,2,'翁勇城','北京市','北京市','朝阳区','发大水了','15625430518',1,'2017-01-19 20:42:39',1),(17,2,'翁勇城','江苏省','常州市','溧阳市','发大水了','15625439182',1,'2017-01-19 20:45:39',1),(18,2,'翁勇城','江苏省','常州市','溧阳市','发大水了','15625439182',1,'2017-01-19 20:45:39',2),(19,2,'2','江苏省','常州市','溧阳市','2','23456789',1,'2017-01-19 20:50:38',2),(20,2,'2','江苏省','常州市','溧阳市','2','23456789',1,'2017-01-19 20:50:39',2),(21,2,'3','江苏省','常州市','溧阳市','3','12345678',1,'2017-01-19 20:52:08',2),(22,2,'哈哈','江苏省','常州市','溧阳市','1','12345678',1,'2017-01-19 20:58:28',2),(23,2,'哈哈','江苏省','常州市','溧阳市','风刀霜剑','12334556',1,'2017-01-19 21:01:20',2),(24,2,'新测试','安徽省','芜湖市','三山区','13','26183728',1,'2017-01-19 23:23:10',2),(25,2,'fds','安徽省','宿州市','埇桥区','fds','22333344',1,'2017-01-26 11:40:46',2),(26,2,'1','江苏省','常州市','溧阳市','2','13543536433',1,'2017-02-25 14:23:38',2);

/*Table structure for table `backup_user` */

DROP TABLE IF EXISTS `backup_user`;

CREATE TABLE `backup_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `pwd` varchar(40) NOT NULL COMMENT '密码',
  `role` tinyint(4) NOT NULL COMMENT '角色，1-开发者，2-管理员，3-商户',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(30) NOT NULL COMMENT '创建者',
  `oid` int(11) DEFAULT NULL COMMENT '用户所属商家id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `backup_user` */

insert  into `backup_user`(`id`,`username`,`pwd`,`role`,`createTime`,`creator`,`oid`) values (1,'admin','202cb962ac59075b964b07152d234b70',1,'2016-12-21 09:22:09','admin',1);

/*Table structure for table `brand` */

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键字',
  `brand` varchar(100) NOT NULL COMMENT '品牌',
  `_code` varchar(100) DEFAULT NULL COMMENT '代码',
  `creator` varchar(30) NOT NULL COMMENT '创建者',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `brand` */

insert  into `brand`(`id`,`keyword`,`brand`,`_code`,`creator`,`createTime`) values (1,'手机,phone','小米','1','admin','2016-12-29 16:55:08'),(3,'手机,phone','华为','','admin','2016-12-29 16:59:40'),(5,'手机,phone','联想','','admin','2016-12-29 17:02:11'),(7,'手机,phone','一加','','admin','2016-12-29 17:07:15'),(8,'手机,phone','乐视','','admin','2016-12-29 17:08:46'),(10,'手机,phone','酷派','','admin','2016-12-29 18:24:28'),(12,'手机,phone','魅族','','admin','2016-12-29 18:25:24'),(14,'手机,phone','中兴','','admin','2016-12-29 18:36:41'),(16,'手机,phone','OPPO','','admin','2016-12-29 19:22:48'),(18,'手机,phone','vivo','','admin','2016-12-29 19:46:38'),(20,'手机,phone','努比亚','','admin','2016-12-29 20:48:01'),(21,'1','1','1','admin','2017-01-30 20:22:13');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `gid` int(11) NOT NULL COMMENT '商品id',
  `num` int(11) NOT NULL COMMENT '数量',
  `gpId` int(11) NOT NULL COMMENT '商品特性',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cart` */

/*Table structure for table `exception_log` */

DROP TABLE IF EXISTS `exception_log`;

CREATE TABLE `exception_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `_name` varchar(200) NOT NULL COMMENT '异常代码',
  `method` varchar(100) NOT NULL COMMENT '方法名',
  `params` varchar(1000) NOT NULL COMMENT '参数',
  `detail` varchar(1000) NOT NULL COMMENT '详情',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `exception_log` */

insert  into `exception_log`(`id`,`username`,`_name`,`method`,`params`,`detail`,`description`,`createTime`) values (1,'admin','org.hibernate.TransientObjectException','com.bin.controller.GoodController-update()','Good [id=null, name=1, no=null, oid=null, status=null, msg=1, soldNum=null, brand=1, attr=null, scope=1, type=1, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=null, removeTime=null, grossWeight=null, netWeight=null];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@1e8fa083, com.bin.model.GoodProperties@67730821]];','The given object has a null identifier: com.bin.model.Good','','2016-12-25 11:56:36'),(2,'admin','org.hibernate.exception.ConstraintViolationException','com.bin.controller.GoodController-update()','Good [id=3, name=1, no=null, oid=null, status=null, msg=12, soldNum=null, brand=1, attr=null, scope=3, type=1, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=null, removeTime=null, grossWeight=null, netWeight=null];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@33d31753, com.bin.model.GoodProperties@67a064b9]];','could not execute statement','','2016-12-25 11:58:11'),(3,'admin','org.hibernate.exception.ConstraintViolationException','com.bin.controller.GoodController-update()','Good [id=3, name=1, no=null, oid=null, status=null, msg=12, soldNum=null, brand=1, attr=null, scope=3, type=1, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=null, removeTime=null, grossWeight=null, netWeight=null];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@27109eb3, com.bin.model.GoodProperties@34230dce]];','could not execute statement','','2016-12-25 11:58:18'),(4,'admin','org.hibernate.QueryException','com.bin.controller.GoodController-update()','Good [id=3, name=1, no=null, oid=null, status=null, msg=12, soldNum=null, brand=1, attr=null, scope=3, type=1, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=null, removeTime=null, grossWeight=null, netWeight=null];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@4cc06a15, com.bin.model.GoodProperties@6c74b010]];','unexpected char: \';\' [update com.bin.model.GoodProperties set private java.lang.Integer com.bin.model.GoodProperties.gid = ?,private java.lang.String com.bin.model.GoodProperties.name = ?,private java.lang.Double com.bin.model.GoodProperties.price = ?,private java.lang.Integer com.bin.model.GoodProperties.num = ?,private java.lang.Integer com.bin.model.GoodProperties.isDefault = ?,private java.util.Date com.bin.model.GoodProperties.createTime = ? where id = ?;]','','2016-12-25 12:00:26'),(5,'admin','org.hibernate.exception.SQLGrammarException','com.bin.controller.GoodController-update()','Good [id=3, name=1, no=null, oid=null, status=null, msg=12, soldNum=null, brand=1, attr=null, scope=4, type=1, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=null, removeTime=null, grossWeight=null, netWeight=null];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@109a7206, com.bin.model.GoodProperties@bb3f06e]];','could not execute statement','','2016-12-25 13:06:52'),(6,'admin','org.hibernate.exception.ConstraintViolationException','com.bin.controller.GoodController-update()','Good [id=3, name=1, no=null, oid=null, status=null, msg=11, soldNum=null, brand=1, attr=null, scope=4, type=1, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=null, removeTime=null, grossWeight=null, netWeight=null];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@50e7ac8f, com.bin.model.GoodProperties@19f209c8]];','could not execute statement','','2016-12-25 13:08:15'),(7,'admin','org.hibernate.exception.SQLGrammarException','com.bin.controller.GoodController-update()','Good [id=3, name=1, no=null, oid=null, status=null, msg=12, soldNum=null, brand=1, attr=null, scope=1, type=1, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=null, removeTime=null, grossWeight=null, netWeight=null];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@24dd9d04, com.bin.model.GoodProperties@516f8484]];','could not execute statement','','2016-12-25 13:49:01'),(8,'admin','org.hibernate.exception.SQLGrammarException','com.bin.controller.GoodController-update()','Good [id=3, name=1, no=null, oid=null, status=null, msg=12, soldNum=null, brand=1, attr=null, scope=5, type=1, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=null, removeTime=null, grossWeight=null, netWeight=null];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@27698887, com.bin.model.GoodProperties@1826b48]];','could not execute statement','','2016-12-25 13:53:02'),(9,'admin','org.hibernate.exception.GenericJDBCException','com.bin.controller.GoodController-update()','Good [id=3, name=1, no=201612231536061, oid=null, status=1, msg=1, soldNum=null, brand=1, attr=null, scope=1, type=1, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Fri Dec 23 15:36:06 CST 2016, removeTime=null, grossWeight=null, netWeight=null];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@7e21c289]];','could not prepare statement','','2016-12-25 14:43:47'),(10,'admin','org.hibernate.exception.ConstraintViolationException','com.bin.controller.GoodController-update()','Good [id=4, name=2, no=201612251455501, oid=1, status=1, msg=2, soldNum=null, brand=2, attr=null, scope=2, type=2, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Sun Dec 25 14:55:50 CST 2016, removeTime=null, grossWeight=2.0, netWeight=2.0];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@5f84f43d, com.bin.model.GoodProperties@11bf01c9, com.bin.model.GoodProperties@130e3c39]];','could not execute statement','','2016-12-25 15:55:13'),(11,'admin','org.hibernate.exception.ConstraintViolationException','com.bin.controller.GoodController-update()','Good [id=4, name=2, no=201612251455501, oid=1, status=1, msg=2, soldNum=null, brand=2, attr=null, scope=2, type=2, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Sun Dec 25 14:55:50 CST 2016, removeTime=null, grossWeight=2.0, netWeight=2.0];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@2aa13682, com.bin.model.GoodProperties@3e01a6ab, com.bin.model.GoodProperties@5e65445a]];','could not execute statement','','2016-12-25 15:55:14'),(12,'admin','org.hibernate.exception.ConstraintViolationException','com.bin.controller.GoodController-update()','Good [id=4, name=2, no=201612251455501, oid=1, status=1, msg=2, soldNum=null, brand=2, attr=null, scope=2, type=2, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Sun Dec 25 14:55:50 CST 2016, removeTime=null, grossWeight=2.0, netWeight=2.0];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@62485f, com.bin.model.GoodProperties@347d552b, com.bin.model.GoodProperties@106294f9]];','could not execute statement','','2016-12-25 15:55:14'),(13,'admin','org.hibernate.exception.ConstraintViolationException','com.bin.controller.GoodController-update()','Good [id=4, name=2, no=201612251455501, oid=1, status=1, msg=2, soldNum=null, brand=2, attr=null, scope=3, type=2, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Sun Dec 25 14:55:50 CST 2016, removeTime=null, grossWeight=2.0, netWeight=2.0];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@71911921, com.bin.model.GoodProperties@6d08ffc6]];','could not execute statement','','2016-12-25 15:56:31'),(14,'admin','org.hibernate.exception.ConstraintViolationException','com.bin.controller.GoodController-update()','Good [id=4, name=2, no=201612251455501, oid=1, status=1, msg=2, soldNum=null, brand=2, attr=null, scope=2, type=2, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Sun Dec 25 14:55:50 CST 2016, removeTime=null, grossWeight=2.0, netWeight=2.0];GoodPropertiesListForm [goodProperties=[com.bin.model.GoodProperties@609c6e28, com.bin.model.GoodProperties@3e0435a5, com.bin.model.GoodProperties@65e0372]];','could not execute statement','','2016-12-25 15:57:08'),(15,'admin','org.hibernate.hql.internal.ast.QuerySyntaxException','com.bin.controller.BrandController-searchgrid()','','brand is not mapped [from brand where 1=1]','','2016-12-29 16:49:39'),(16,'admin','org.hibernate.exception.ConstraintViolationException','com.bin.controller.BrandController-save()','Brand [id=null, keyword=手机, brand=null, code=, creator=admin, createTime=Thu Dec 29 16:54:39 CST 2016];','could not execute statement','','2016-12-29 16:54:40'),(17,'admin','org.hibernate.exception.ConstraintViolationException','com.bin.controller.BrandController-save()','Brand [id=null, keyword=手机, brand=null, code=, creator=admin, createTime=Thu Dec 29 16:54:39 CST 2016];','could not execute statement','','2016-12-29 16:54:40'),(18,'admin','java.lang.IllegalArgumentException','com.bin.admin.controller.AdminRacController-deliverGood()',';4;null;','id to load is required for loading','','2017-02-08 15:20:56'),(19,'admin','java.lang.IllegalArgumentException','com.bin.admin.controller.AdminRacController-deliverGood()',';4;null;','id to load is required for loading','','2017-02-08 15:20:56'),(20,'admin','java.lang.IllegalArgumentException','com.bin.admin.controller.AdminRacController-deliverGood()',';4;null;','id to load is required for loading','','2017-02-08 15:20:56'),(21,'admin','java.lang.IllegalArgumentException','com.bin.admin.controller.AdminRacController-deliverGood()',';4;null;','id to load is required for loading','','2017-02-08 15:20:56'),(22,'admin','java.lang.IllegalArgumentException','com.bin.admin.controller.AdminRacController-deliverGood()',';4;null;','id to load is required for loading','','2017-02-08 20:01:40'),(23,'admin','org.hibernate.exception.SQLGrammarException','com.bin.admin.controller.AdminGoodController-update()','Good [id=6, name=手机, no=201612291939031, oid=1, status=1, msg=61, soldNum=20, brand=6, attr=null, scope=3, type=6, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Thu Dec 29 19:39:04 CST 2016, removeTime=null, grossWeight=6.0, netWeight=6.0, commentNum=null, price=67];GoodPropertiesListForm [goodProperties=[GoodProperty [id=18, gid=null, name=60M/s, price=6, num=3, isDefault=null, createTime=null]]];','could not execute statement','','2017-02-09 22:27:54'),(24,'admin','org.hibernate.exception.SQLGrammarException','com.bin.admin.controller.AdminGoodController-update()','Good [id=6, name=手机, no=201612291939031, oid=1, status=1, msg=612, soldNum=20, brand=6, attr=null, scope=3, type=6, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Thu Dec 29 19:39:04 CST 2016, removeTime=null, grossWeight=6.0, netWeight=6.0, commentNum=null, price=67];GoodPropertiesListForm [goodProperties=[GoodProperty [id=18, gid=null, name=60M/s, price=6, num=3, isDefault=null, createTime=null]]];','could not execute statement','','2017-02-09 22:29:41'),(25,'admin','org.hibernate.exception.SQLGrammarException','com.bin.admin.controller.AdminGoodController-update()','Good [id=6, name=手机, no=201612291939031, oid=1, status=1, msg=612, soldNum=20, brand=6, attr=null, scope=3, type=6, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Thu Dec 29 19:39:04 CST 2016, removeTime=null, grossWeight=6.0, netWeight=6.0, commentNum=null, price=67];GoodPropertiesListForm [goodProperties=[GoodProperty [id=18, gid=null, name=60M/s, price=6, num=3, isDefault=null, createTime=null]]];','could not execute statement','','2017-02-09 22:34:16'),(26,'admin','org.hibernate.exception.SQLGrammarException','com.bin.admin.controller.AdminGoodController-update()','Good [id=5, name=手机3, no=201612291937391, oid=1, status=1, msg=31, soldNum=0, brand=3, attr=null, scope=4, type=3, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Thu Dec 29 19:37:39 CST 2016, removeTime=null, grossWeight=3.0, netWeight=3.0, commentNum=null, price=2];GoodPropertiesListForm [goodProperties=[GoodProperty [id=17, gid=null, name=4, price=4, num=4, isDefault=null, createTime=null]]];','could not execute statement','','2017-02-09 22:35:46'),(27,'admin','org.hibernate.exception.SQLGrammarException','com.bin.admin.controller.AdminGoodController-update()','Good [id=5, name=手机3, no=201612291937391, oid=1, status=1, msg=312, soldNum=0, brand=3, attr=null, scope=4, type=3, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Thu Dec 29 19:37:39 CST 2016, removeTime=null, grossWeight=3.0, netWeight=3.0, commentNum=null, price=2];GoodPropertiesListForm [goodProperties=[GoodProperty [id=17, gid=null, name=4, price=4, num=4, isDefault=null, createTime=null]]];','could not execute statement','','2017-02-09 22:37:04'),(28,'admin','org.hibernate.exception.SQLGrammarException','com.bin.admin.controller.AdminGoodController-update()','Good [id=5, name=手机3, no=201612291937391, oid=1, status=1, msg=3123, soldNum=0, brand=3, attr=null, scope=4, type=3, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Thu Dec 29 19:37:39 CST 2016, removeTime=null, grossWeight=3.0, netWeight=3.0, commentNum=null, price=2];GoodPropertiesListForm [goodProperties=[GoodProperty [id=17, gid=null, name=4, price=4, num=4, isDefault=null, createTime=null]]];','could not execute statement','','2017-02-09 22:38:42'),(29,'admin','org.hibernate.exception.SQLGrammarException','com.bin.admin.controller.AdminGoodController-update()','Good [id=6, name=手机, no=201612291939031, oid=1, status=1, msg=612, soldNum=20, brand=6, attr=null, scope=3, type=6, picMid=null, seriesSm=null, seriesLg=null, picSm=null, createTime=Thu Dec 29 19:39:04 CST 2016, removeTime=null, grossWeight=6.0, netWeight=6.0, commentNum=null, price=67];GoodPropertiesListForm [goodProperties=[GoodProperty [id=20, gid=null, name=100M/s, price=8, num=10, isDefault=null, createTime=null], GoodProperty [id=19, gid=null, name=80M/s, price=7, num=4, isDefault=null, createTime=null], GoodProperty [id=18, gid=null, name=60M/s, price=6, num=3, isDefault=null, createTime=null]]];','could not execute statement','','2017-02-09 22:39:46'),(30,'admin','java.lang.ArithmeticException','com.bin.home.controller.GoodController-detail()','8;','/ by zero','','2017-02-26 14:41:13');

/*Table structure for table `express` */

DROP TABLE IF EXISTS `express`;

CREATE TABLE `express` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `_name` varchar(20) NOT NULL COMMENT '快递公司名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序字段',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `express` */

insert  into `express`(`id`,`_name`,`sort`,`createTime`) values (4,'顺丰速运',1,'2017-02-03 23:23:23'),(5,'韵达快递',2,'2017-02-03 23:23:23'),(6,'申通快递',3,'2017-02-03 23:23:23');

/*Table structure for table `good` */

DROP TABLE IF EXISTS `good`;

CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `_name` varchar(100) NOT NULL COMMENT '商品名称',
  `_no` varchar(30) NOT NULL COMMENT '商品编号',
  `oid` int(11) NOT NULL COMMENT '商家id',
  `_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态,1-已上架，2-已下架，默认1',
  `msg` varchar(200) NOT NULL COMMENT '信息',
  `soldNum` int(11) DEFAULT '0' COMMENT '已售数量，默认0',
  `brand` varchar(100) NOT NULL COMMENT '品牌',
  `attr` varchar(1000) DEFAULT NULL COMMENT '属性',
  `scope` tinyint(4) NOT NULL COMMENT '大类别',
  `_type` varchar(20) NOT NULL COMMENT '小类别',
  `picMid` varchar(100) DEFAULT NULL COMMENT '列表页图片',
  `seriesSm` varchar(1000) DEFAULT NULL COMMENT '详情页系列小图',
  `seriesLg` varchar(1000) DEFAULT NULL COMMENT '详情页系类大图',
  `picSm` varchar(100) DEFAULT NULL COMMENT '订单等页面商品小图',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上架时间',
  `removeTime` datetime DEFAULT NULL COMMENT '下架时间',
  `grossWeight` double DEFAULT NULL COMMENT '毛重',
  `netWeight` double DEFAULT NULL COMMENT '净重',
  `commentNum` int(11) DEFAULT NULL COMMENT '评论数',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`),
  UNIQUE KEY `_no` (`_no`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `good` */

insert  into `good`(`id`,`_name`,`_no`,`oid`,`_status`,`msg`,`soldNum`,`brand`,`attr`,`scope`,`_type`,`picMid`,`seriesSm`,`seriesLg`,`picSm`,`createTime`,`removeTime`,`grossWeight`,`netWeight`,`commentNum`,`price`) values (3,'华为 MATE8 手机','201612231536061',1,2,'1',NULL,'苹果',NULL,1,'1','mate8.jpg',NULL,NULL,'201702261507461-sm.jpg','2016-12-23 15:36:06',NULL,NULL,NULL,2,'12'),(4,'华为 P8 手机','201612251455501',1,2,'2',NULL,'魅族',NULL,7,'2','p8.jpg','201612251455501-series-sm-0.jpg;201612251455501-series-sm-1.jpg;201612251455501-series-sm-2.jpg;201612251455501-series-sm-3.jpg',NULL,'201702261507461-sm.jpg','2016-12-25 14:55:50','2016-12-28 18:55:07',2,2,3,'15'),(5,'华为 MATE9 PRO 手机','201612291937391',1,1,'3123',0,'小米',NULL,4,'3','mate9pro.jpg',NULL,NULL,'201702261507461-sm.jpg','2016-12-29 19:37:39',NULL,3,3,NULL,'2'),(6,'华为 MATE9 手机','201612291939031',1,1,'612',20,'华为',NULL,3,'6','201702261507461-mid.jpg','201612251455501-series-sm-0.jpg;201612251455501-series-sm-1.jpg;201612251455501-series-sm-2.jpg;201612251455501-series-sm-3.jpg',NULL,'201702261507461-sm.jpg','2016-12-29 19:39:04',NULL,6,6,10,'67'),(7,'华为 P9','201702091833591',1,2,'科学类书籍',0,'书籍',NULL,1,'书籍','201702261507461-mid.jpg',NULL,NULL,'201702261507461-sm.jpg','2017-02-09 18:34:00','2017-02-09 18:38:57',3,3,NULL,'10'),(9,'华为 P9 手机','201702261507461',1,2,'全网通 4GB+64GB版 陶瓷白 移动联通电信4G手机 双卡双待',7,'华为',NULL,3,'手机','201702261507461-mid.jpg','201702261507461-series-sm-0.jpg;201702261507461-series-sm-1.jpg;201702261507461-series-sm-2.jpg;201702261507461-series-sm-3.jpg','201702261507461-lg-0.jpg;201702261507461-lg-1.jpg;201702261507461-lg-2.jpg;201702261507461-lg-3.jpg','201702261507461-sm.jpg','2017-02-26 15:07:47',NULL,1,1,7,'3388'),(12,'手机 魅族 魅蓝 note3','201703052222161',1,2,'移动定制版',0,'魅族',NULL,3,'手机','201703052222161-mid.jpg','201703052222161-series-sm-0.jpg;201703052222161-series-sm-1.jpg;201703052222161-series-sm-2.jpg;201703052222161-series-sm-3.jpg;201703052222161-series-sm-4.jpg','201703052222161-lg-0.jpg;201703052222161-lg-1.jpg;201703052222161-lg-2.jpg;201703052222161-lg-3.jpg;201703052222161-lg-4.jpg','201703052222161-sm.jpg','2017-03-05 22:22:16',NULL,1,1,NULL,'829'),(13,'手机 华为畅玩 5A','201703052236351',1,2,'全网通',0,'华为',NULL,3,'手机','201703052236351-mid.jpg','201703052236351-series-sm-0.jpg;201703052236351-series-sm-1.jpg;201703052236351-series-sm-2.jpg;201703052236351-series-sm-3.jpg;201703052236351-series-sm-4.jpg','201703052236351-lg-0.jpg;201703052236351-lg-1.jpg;201703052236351-lg-2.jpg;201703052236351-lg-3.jpg;201703052236351-lg-4.jpg','201703052236351-sm.jpg','2017-03-05 22:36:35',NULL,1,1,NULL,'2499');

/*Table structure for table `good_property` */

DROP TABLE IF EXISTS `good_property`;

CREATE TABLE `good_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gid` int(11) NOT NULL COMMENT '商品id',
  `_name` varchar(100) NOT NULL COMMENT '属性名',
  `price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '价格',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `isDefault` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否为默认属性,1-否，2-是',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `good_property` */

insert  into `good_property`(`id`,`gid`,`_name`,`price`,`num`,`isDefault`,`createTime`) values (1,3,'1','2',1,1,'2016-12-23 15:36:06'),(13,4,'3','3',3,1,'2016-12-25 14:55:50'),(15,4,'4','4',4,1,'2016-12-25 16:06:40'),(16,5,'3','3',3,1,'2016-12-29 19:37:39'),(17,5,'4','4',4,1,'2016-12-29 19:37:39'),(18,6,'60M/s','6',2,1,'2016-12-29 19:39:04'),(19,6,'80M/s','7',3,1,'2017-01-17 10:03:06'),(20,6,'100M/s','8',10,1,'2017-01-17 10:04:14'),(21,7,'珍藏版','20',20,1,'2017-02-09 18:34:00'),(22,7,'精装版','10',10,1,'2017-02-09 18:34:00'),(23,8,'琥珀金','3388',100,1,'2017-02-26 14:36:34'),(24,8,'陶瓷白','3388',24,1,'2017-02-26 14:36:34'),(25,9,'琥珀金','3388',15,1,'2017-02-26 15:07:47'),(26,9,'陶瓷白','3388',8,1,'2017-02-26 15:07:47'),(31,12,'金色','829',12,1,'2017-03-05 22:22:16'),(32,12,'银色','829',12,1,'2017-03-05 22:22:16'),(33,13,'银色','2499',12,1,'2017-03-05 22:36:35'),(34,13,'金色','2499',12,1,'2017-03-05 22:36:35');

/*Table structure for table `good_scope` */

DROP TABLE IF EXISTS `good_scope`;

CREATE TABLE `good_scope` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `_name` varchar(20) NOT NULL COMMENT '名称',
  `_value` tinyint(4) NOT NULL COMMENT '类型值',
  `sort` tinyint(4) NOT NULL COMMENT '排序值',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `good_scope` */

insert  into `good_scope`(`id`,`_name`,`_value`,`sort`,`createTime`) values (1,'书籍',1,1,'2016-12-21 14:49:23'),(2,'电器',2,2,'2016-12-21 14:49:36'),(3,'手机',3,3,'2016-12-21 14:49:47'),(4,'电脑',4,4,'2016-12-21 14:49:59'),(5,'服装',5,5,'2016-12-21 14:50:06'),(6,'家居',6,6,'2016-12-21 14:50:17'),(7,'化妆品',7,7,'2016-12-21 14:50:25'),(8,'运动',8,8,'2016-12-21 14:50:32'),(9,'母婴',9,9,'2016-12-21 14:50:42'),(10,'医药',10,10,'2016-12-21 14:50:53'),(11,'汽车',11,11,'2016-12-21 14:51:03'),(12,'食品',12,12,'2016-12-21 14:51:11'),(13,'彩票',13,13,'2016-12-21 14:51:20');

/*Table structure for table `growth_value` */

DROP TABLE IF EXISTS `growth_value`;

CREATE TABLE `growth_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `_value` int(11) NOT NULL COMMENT '成长值',
  `source` tinyint(4) NOT NULL COMMENT '来源，1-登录，2-购物，3-评价，4-退货',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发放/减扣时间',
  `detail` varchar(50) NOT NULL COMMENT '来源详情',
  `_uid` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `growth_value` */

/*Table structure for table `images` */

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contentType` varchar(255) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `newFilename` varchar(255) DEFAULT NULL,
  `size_` bigint(20) DEFAULT NULL,
  `thumbnailFilename` varchar(255) DEFAULT NULL,
  `thumbnailSize` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `images` */

insert  into `images`(`id`,`contentType`,`dateCreated`,`lastUpdated`,`name`,`newFilename`,`size_`,`thumbnailFilename`,`thumbnailSize`) values (1,'image/jpeg',NULL,NULL,'01_mid.jpg','3d36504d-f3bf-4271-af56-8cb8cbe1f00201_mid.jpg',19505,'3d36504d-f3bf-4271-af56-8cb8cbe1f002-thumbnail.png',NULL),(2,'image/jpeg',NULL,NULL,'02.jpg','28ec1f7e-5496-43f0-91f0-b863d832078902.jpg',373544,'28ec1f7e-5496-43f0-91f0-b863d8320789-thumbnail.png',NULL),(3,'image/jpeg',NULL,NULL,'01.jpg','5bde7fad-5f20-4745-9a90-5f79dd2c31d401.jpg',122401,'5bde7fad-5f20-4745-9a90-5f79dd2c31d4-thumbnail.png',NULL),(4,'image/jpeg',NULL,NULL,'01_mid.jpg','b5e19c8a-8c32-4796-b490-bd398800e83e01_mid.jpg',19505,'b5e19c8a-8c32-4796-b490-bd398800e83e-thumbnail.png',NULL),(5,'image/jpeg',NULL,NULL,'01.jpg','8df5b2a6-b44e-42df-9a62-b8b35498d35d01.jpg',122401,'8df5b2a6-b44e-42df-9a62-b8b35498d35d-thumbnail.png',139012),(10,'application/octet-stream',NULL,NULL,'01.jpg','3ad04298-57c9-4092-983a-01d25d3d38da01.jpg',122401,'3ad04298-57c9-4092-983a-01d25d3d38da-thumbnail.png',139012),(11,'application/octet-stream',NULL,NULL,'56b165d8N8d7b386d.jpg','486723f8-200d-472f-a266-caa1e50849a256b165d8N8d7b386d.jpg',1143,'486723f8-200d-472f-a266-caa1e50849a2-thumbnail.png',62860),(12,'application/octet-stream',NULL,NULL,'01.jpg','35ac4a19-6d69-4db4-8501-0ca63ce1be0801.jpg',122401,'35ac4a19-6d69-4db4-8501-0ca63ce1be08-thumbnail.png',139012),(13,'application/octet-stream',NULL,NULL,'01_mid.jpg','bbc9fd1c-5874-4837-83ae-8a6683eeca2101_mid.jpg',19505,'bbc9fd1c-5874-4837-83ae-8a6683eeca21-thumbnail.png',120217),(14,'application/octet-stream',NULL,NULL,'01_small.jpg','27b18f1d-efe3-473d-9926-9c96ec60dab001_small.jpg',1028,'27b18f1d-efe3-473d-9926-9c96ec60dab0-thumbnail.png',117636),(15,'application/octet-stream',NULL,NULL,'02_mid.jpg','27844e92-87a7-44ac-a85f-492d46b25bf202_mid.jpg',67333,'27844e92-87a7-44ac-a85f-492d46b25bf2-thumbnail.png',138405),(16,'application/octet-stream',NULL,NULL,'01.jpg','08c72864-e42a-4ce4-b00d-437b9582d35e01.jpg',122401,'08c72864-e42a-4ce4-b00d-437b9582d35e-thumbnail.png',139012),(17,'application/octet-stream',NULL,NULL,'02_mid.jpg','68e2ac94-3280-4535-8ada-f4643cacd8f702_mid.jpg',67333,'68e2ac94-3280-4535-8ada-f4643cacd8f7-thumbnail.png',138405),(18,'application/octet-stream',NULL,NULL,'02_small.jpg','3661c3ba-c8d5-4169-956b-a43cd0b7486102_small.jpg',2093,'3661c3ba-c8d5-4169-956b-a43cd0b74861-thumbnail.png',113239),(19,'application/octet-stream',NULL,NULL,'01_mid.jpg','489845eb-4f90-4e87-855f-0c97507ab85601_mid.jpg',19505,'489845eb-4f90-4e87-855f-0c97507ab856-thumbnail.png',120217),(20,'application/octet-stream',NULL,NULL,'01.jpg','823e6c80-aa5e-4960-ad73-896eca67c57501.jpg',122401,'823e6c80-aa5e-4960-ad73-896eca67c575-thumbnail.png',139012),(21,'application/octet-stream',NULL,NULL,'02_mid.jpg','91e9038c-c34a-4045-bd3e-3604c81a706502_mid.jpg',67333,'91e9038c-c34a-4045-bd3e-3604c81a7065-thumbnail.png',138405),(22,'application/octet-stream',NULL,NULL,'04.jpg','418a29e7-db0a-410e-80ab-dab625c7052c04.jpg',455530,'418a29e7-db0a-410e-80ab-dab625c7052c-thumbnail.png',183547),(23,'application/octet-stream',NULL,NULL,'3b87e950352ac65c1b6a0042f9f2b21193138a97.jpg','c8254dc9-38b7-4e2c-8ebe-69294f2f49bb3b87e950352ac65c1b6a0042f9f2b21193138a97.jpg',1250193,'c8254dc9-38b7-4e2c-8ebe-69294f2f49bb-thumbnail.png',144858),(24,'application/octet-stream',NULL,NULL,'3b87e950352ac65c1b6a0042f9f2b21193138a97.jpg','c4e562cd-0ba6-49b1-8c2d-e3dc376168f63b87e950352ac65c1b6a0042f9f2b21193138a97.jpg',1250193,'c4e562cd-0ba6-49b1-8c2d-e3dc376168f6-thumbnail.png',144858),(25,'application/octet-stream',NULL,NULL,'3b87e950352ac65c1b6a0042f9f2b21193138a97.jpg','49a71504-2567-4e3e-b240-0dc089d170633b87e950352ac65c1b6a0042f9f2b21193138a97.jpg',1250193,'49a71504-2567-4e3e-b240-0dc089d17063-thumbnail.png',144858),(26,'application/octet-stream',NULL,NULL,'01.jpg','83d81716-d2a6-4773-a459-af32805e83aa01.jpg',122401,'83d81716-d2a6-4773-a459-af32805e83aa-thumbnail.png',139012),(27,'application/octet-stream',NULL,NULL,'04.jpg','19795bb5-4d9f-476c-8be3-2583986bd1fa04.jpg',455530,'19795bb5-4d9f-476c-8be3-2583986bd1fa-thumbnail.png',183547),(28,'application/octet-stream',NULL,NULL,'01_mid.jpg','5bd7dfb2-4f4a-42c2-834a-7130d88fca1301_mid.jpg',19505,'5bd7dfb2-4f4a-42c2-834a-7130d88fca13-thumbnail.png',120217),(29,'application/octet-stream',NULL,NULL,'02.jpg','99fff8e9-8a17-420b-b999-555c5441735c02.jpg',373544,'99fff8e9-8a17-420b-b999-555c5441735c-thumbnail.png',140090);

/*Table structure for table `login_log` */

DROP TABLE IF EXISTS `login_log`;

CREATE TABLE `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(30) NOT NULL COMMENT '登陆者',
  `ip` varchar(20) NOT NULL COMMENT '登录的ip',
  `logoutTime` datetime DEFAULT NULL COMMENT '退出登录的时间',
  `loginTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `login_log` */

/*Table structure for table `order_good` */

DROP TABLE IF EXISTS `order_good`;

CREATE TABLE `order_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `oid` int(11) NOT NULL COMMENT '订单id',
  `gid` int(11) NOT NULL COMMENT '商品id',
  `price` decimal(10,0) NOT NULL COMMENT '商品价格',
  `num` int(11) NOT NULL COMMENT '数量',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gpid` int(11) NOT NULL COMMENT '商品属性id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `order_good` */

insert  into `order_good`(`id`,`oid`,`gid`,`price`,`num`,`createTime`,`gpid`) values (1,2,6,'6',3,'2017-02-20 23:02:08',18),(2,2,6,'7',5,'2017-02-20 23:02:08',19),(3,3,6,'6',3,'2016-01-20 23:10:26',18),(4,3,6,'7',5,'2016-01-19 23:10:26',19),(5,4,6,'6',3,'2016-02-20 23:13:12',18),(6,4,6,'7',5,'2016-03-20 23:13:12',19),(7,5,6,'6',2,'2016-04-20 23:43:41',18),(8,5,6,'7',1,'2016-01-28 23:43:41',19),(9,6,6,'6',2,'2016-01-05 14:23:19',18),(10,6,6,'7',1,'2016-01-10 14:23:19',19),(11,11,6,'6',2,'2016-07-21 15:34:56',18),(12,11,6,'7',1,'2016-01-01 15:34:56',19),(13,12,9,'3388',4,'2017-03-05 13:41:27',25),(14,12,9,'3388',1,'2017-03-05 13:41:27',25),(15,12,6,'6',1,'2017-03-05 13:41:27',18),(16,12,6,'7',1,'2017-03-05 13:41:27',19),(17,13,9,'3388',1,'2017-03-05 13:46:36',26),(18,14,9,'3388',1,'2017-03-05 21:46:41',25),(19,15,9,'3388',1,'2017-03-05 22:01:04',26),(20,16,9,'3388',1,'2017-03-05 22:03:36',25),(21,17,9,'3388',1,'2017-03-05 22:05:26',26),(22,18,9,'3388',1,'2017-03-05 22:12:10',26),(23,19,9,'3388',1,'2017-03-05 22:28:37',26),(24,20,9,'3388',1,'2017-03-05 22:33:16',25);

/*Table structure for table `return_and_change` */

DROP TABLE IF EXISTS `return_and_change`;

CREATE TABLE `return_and_change` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `oid` int(11) NOT NULL COMMENT '订单id',
  `gNo` varchar(30) NOT NULL COMMENT '商品编号',
  `applyTime` datetime NOT NULL COMMENT '申请时间',
  `_status` tinyint(4) NOT NULL COMMENT '状态，1-处理中，2-已完成',
  `_type` tinyint(4) NOT NULL COMMENT '类型，1-退货，2-换货',
  `description` varchar(100) NOT NULL COMMENT '问题描述',
  `dealWay` tinyint(4) DEFAULT NULL COMMENT '商品处理方式，1-退货，2-换货',
  `returnMoneyWay` tinyint(4) DEFAULT NULL COMMENT '退款方式,1-返回余额',
  `receiver` varchar(30) NOT NULL COMMENT '收货人',
  `tel` varchar(30) NOT NULL COMMENT '联系电话',
  `deliveryFare` decimal(10,0) DEFAULT NULL COMMENT '运费',
  `expressName` varchar(20) DEFAULT NULL COMMENT '快递公司',
  `expressNo` varchar(30) DEFAULT NULL COMMENT '快递单号',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `rechangeMsg` varchar(100) DEFAULT NULL COMMENT '换货信息',
  `resendTime` datetime DEFAULT NULL COMMENT '重新寄送时间',
  `passTime` datetime DEFAULT NULL COMMENT '审核通过时间',
  `receiveTime` datetime DEFAULT NULL COMMENT '卖家收到货物时间',
  `finishTime` datetime DEFAULT NULL COMMENT '完成时间',
  `address` varchar(100) DEFAULT NULL COMMENT '收货详细地址',
  `city` varchar(30) DEFAULT NULL COMMENT '收货地址城市',
  `county` varchar(30) DEFAULT NULL COMMENT '收货地址县区',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `province` varchar(30) DEFAULT NULL COMMENT '收货地址省份',
  `no` varchar(100) DEFAULT NULL COMMENT '编号',
  `returnMoney` decimal(19,2) DEFAULT NULL COMMENT '返还金额',
  `ogid` int(11) DEFAULT NULL COMMENT '订单商品从表id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `eid` int(11) DEFAULT NULL COMMENT '快递公司id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `return_and_change` */

insert  into `return_and_change`(`id`,`oid`,`gNo`,`applyTime`,`_status`,`_type`,`description`,`dealWay`,`returnMoneyWay`,`receiver`,`tel`,`deliveryFare`,`expressName`,`expressNo`,`createTime`,`rechangeMsg`,`resendTime`,`passTime`,`receiveTime`,`finishTime`,`address`,`city`,`county`,`num`,`province`,`no`,`returnMoney`,`ogid`,`uid`,`eid`) values (1,11,'201612291939031','2017-01-24 19:19:50',1,1,'反倒是',NULL,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-01-24 19:19:50','反倒是',NULL,NULL,NULL,NULL,'发送到121','深圳市','福田区',1,'广东省','20170124191950-2-11',NULL,11,2,NULL),(2,11,'201612291939031','2017-01-24 19:27:04',1,1,'方式',NULL,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-01-24 19:27:04','反倒是',NULL,NULL,NULL,NULL,'发送到121','深圳市','福田区',2,'广东省','20170124192703-2-11',NULL,11,2,NULL),(3,11,'201612291939031','2017-01-24 19:29:05',1,1,'方式',NULL,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-01-24 19:29:05','反倒是',NULL,NULL,NULL,NULL,'发送到121','深圳市','福田区',2,'广东省','20170124192904-2-11',NULL,11,2,NULL),(4,11,'201612291939031','2017-01-24 19:36:44',1,2,'范德萨',NULL,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-01-24 19:36:44','',NULL,NULL,NULL,NULL,'发送到121','深圳市','福田区',2,'广东省','20170124193643-2-11',NULL,11,2,NULL),(5,11,'201612291939031','2017-01-24 20:26:33',1,1,'双方都',NULL,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-01-24 20:26:33','违反',NULL,NULL,NULL,NULL,'发送到121','深圳市','福田区',2,'广东省','20170124202633-2-11',NULL,11,2,NULL),(6,11,'201612291939031','2017-01-24 20:31:11',1,1,'fs',NULL,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-01-24 20:31:11','fsd',NULL,NULL,NULL,NULL,'发送到121','深圳市','福田区',2,'广东省','20170124203111-2-11',NULL,11,2,NULL),(7,11,'201612291939031','2017-01-24 21:51:38',1,1,'fdsc',NULL,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-01-24 21:51:38','fds',NULL,NULL,NULL,NULL,'发送到121','深圳市','福田区',2,'广东省','20170124215138-2-11',NULL,11,2,NULL),(8,11,'201612291939031','2017-01-24 22:34:33',1,1,'fs',NULL,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-01-24 22:34:33','gfdshg',NULL,NULL,NULL,NULL,'发送到121','深圳市','福田区',2,'广东省','20170124223433-2-11',NULL,11,2,NULL),(9,11,'201612291939031','2017-01-24 22:35:49',2,1,'fs',1,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-01-24 22:35:49','gfdshg',NULL,'2017-02-08 21:03:38',NULL,NULL,'发送到121','深圳市','福田区',2,'广东省','20170124223549-2-11',NULL,11,2,NULL),(10,11,'201612291939031','2017-01-24 22:37:31',2,1,'fds',1,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-01-24 22:37:31','fds',NULL,'2017-02-08 20:34:29',NULL,NULL,'发送到121','深圳市','福田区',2,'广东省','20170124223731-2-11',NULL,11,2,NULL),(11,11,'201612291939031','2017-01-24 22:47:43',3,1,'fsd',1,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-01-24 22:47:43','gfdsz',NULL,'2017-02-08 20:34:24',NULL,NULL,'发送到121','深圳市','福田区',2,'广东省','20170124224742-2-11',NULL,11,2,NULL),(12,11,'201612291939031','2017-01-24 22:55:56',4,2,'ds',2,NULL,'翁勇城','87777328',NULL,'顺丰速运','','2017-01-24 22:55:56','','2017-02-08 20:06:04','2017-02-08 14:11:26',NULL,NULL,'发送到121','深圳市','福田区',1,'广东省','20170124225555-2-11',NULL,11,2,4),(13,11,'201612291939031','2017-02-07 22:38:17',5,1,'fs',1,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-02-07 22:38:17','fs',NULL,'2017-02-08 13:57:32',NULL,NULL,'发送到1212','深圳市','福田区',2,'广东省','20170207223816-2-11','12.00',11,2,NULL),(14,13,'201702261507461','2017-03-05 14:04:40',1,1,'损坏',NULL,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-03-05 14:04:40','原样即可',NULL,NULL,NULL,NULL,'发送到1212','深圳市','福田区',1,'广东省','20170305140439-2-17',NULL,17,2,NULL),(15,13,'201702261507461','2017-03-05 14:11:07',1,1,'损坏',NULL,NULL,'翁勇城','87777328',NULL,NULL,NULL,'2017-03-05 14:11:07','原样即可',NULL,NULL,NULL,NULL,'发送到1212','深圳市','福田区',1,'广东省','20170305141107-2-17',NULL,17,2,NULL),(16,13,'201702261507461','2017-03-05 14:12:34',4,2,'损坏',2,NULL,'翁勇城','87777328',NULL,'顺丰速运','3232','2017-03-05 14:12:34','原样即可','2017-03-05 14:13:09','2017-03-05 14:12:55',NULL,NULL,'发送到1212','深圳市','福田区',1,'广东省','20170305141234-2-17',NULL,17,2,4),(17,14,'201702261507461','2017-03-05 21:49:15',4,2,'想换货',2,NULL,'翁勇城','15625430518',NULL,'韵达快递','5325324','2017-03-05 21:49:15','换一部一样的','2017-03-05 21:50:00','2017-03-05 21:49:37',NULL,NULL,'发大水了','北京市','朝阳区',1,'北京市','20170305214914-2-18',NULL,18,2,5),(18,17,'201702261507461','2017-03-05 22:06:42',4,2,'辅导教师',2,NULL,'翁勇城','87777328',NULL,'顺丰速运','4325','2017-03-05 22:06:42','二维','2017-03-05 22:07:05','2017-03-05 22:06:55',NULL,NULL,'发送到1212','深圳市','福田区',1,'广东省','20170305220642-2-21',NULL,21,2,4),(19,18,'201702261507461','2017-03-05 22:13:30',4,2,'发动机四',2,NULL,'翁勇城','87777328',NULL,'顺丰速运','4325','2017-03-05 22:13:30','非叫我IE','2017-03-05 22:13:50','2017-03-05 22:13:41',NULL,NULL,'发送到1212','深圳市','福田区',1,'广东省','20170305221330-2-22',NULL,22,2,4),(20,20,'201702261507461','2017-03-05 22:35:06',4,2,'方式',2,NULL,'翁勇城','87777328',NULL,'顺丰速运','242345','2017-03-05 22:35:06','方式','2017-03-05 22:35:22','2017-03-05 22:35:14',NULL,NULL,'发送到1212','深圳市','福田区',1,'广东省','20170305223505-2-24',NULL,24,2,4);

/*Table structure for table `return_and_change_log` */

DROP TABLE IF EXISTS `return_and_change_log`;

CREATE TABLE `return_and_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rid` int(11) NOT NULL COMMENT '退货/换货id',
  `msg` varchar(100) NOT NULL COMMENT '信息',
  `operator` varchar(30) NOT NULL COMMENT '操作人',
  `oeprateTime` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `return_and_change_log` */

insert  into `return_and_change_log`(`id`,`rid`,`msg`,`operator`,`oeprateTime`) values (1,10,'您已提交申请，请等待商家审核','系统','2017-01-24 22:37:31'),(2,11,'您已提交申请，请等待商家审核','系统','2017-01-24 22:47:43'),(3,12,'您已提交申请，请等待商家审核','系统','2017-01-24 22:55:56'),(4,13,'您已提交申请，请等待商家审核','系统','2017-02-07 22:38:17'),(5,13,'审核通过','admin','2017-02-08 13:57:32'),(6,13,'卖家已收货','admin','2017-02-08 14:11:20'),(7,12,'审核通过','admin','2017-02-08 14:11:26'),(8,12,'卖家已收货','admin','2017-02-08 14:11:36'),(9,12,'卖家已重新发货,快递公司：【顺丰速运】，快递单号：【】','admin','2017-02-08 20:06:04'),(10,13,'卖家已退款，退款金额：【12.0】','admin','2017-02-08 20:34:15'),(11,11,'审核通过','admin','2017-02-08 20:34:24'),(12,10,'审核通过','admin','2017-02-08 20:34:29'),(13,11,'卖家已收货','admin','2017-02-08 20:34:33'),(14,9,'审核通过','admin','2017-02-08 21:03:38'),(15,14,'您已提交申请，请等待商家审核','系统','2017-03-05 14:04:40'),(16,15,'您已提交申请，请等待商家审核','系统','2017-03-05 14:11:07'),(17,16,'您已提交申请，请等待商家审核','系统','2017-03-05 14:12:34'),(18,16,'审核通过','admin','2017-03-05 14:12:55'),(19,16,'卖家已收货','admin','2017-03-05 14:13:00'),(20,16,'卖家已重新发货,快递公司：【顺丰速运】，快递单号：【3232】','admin','2017-03-05 14:13:09'),(21,17,'您已提交申请，请等待商家审核','系统','2017-03-05 21:49:15'),(22,17,'审核通过','admin','2017-03-05 21:49:37'),(23,17,'卖家已收货','admin','2017-03-05 21:49:51'),(24,17,'卖家已重新发货,快递公司：【韵达快递】，快递单号：【5325324】','admin','2017-03-05 21:50:00'),(25,18,'您已提交申请，请等待商家审核','系统','2017-03-05 22:06:42'),(26,18,'审核通过','admin','2017-03-05 22:06:55'),(27,18,'卖家已收货','admin','2017-03-05 22:06:59'),(28,18,'卖家已重新发货,快递公司：【顺丰速运】，快递单号：【4325】','admin','2017-03-05 22:07:05'),(29,19,'您已提交申请，请等待商家审核','系统','2017-03-05 22:13:30'),(30,19,'审核通过','admin','2017-03-05 22:13:41'),(31,19,'卖家已收货','admin','2017-03-05 22:13:45'),(32,19,'卖家已重新发货,快递公司：【顺丰速运】，快递单号：【4325】','admin','2017-03-05 22:13:50'),(33,20,'您已提交申请，请等待商家审核','系统','2017-03-05 22:35:06'),(34,20,'审核通过','admin','2017-03-05 22:35:14'),(35,20,'卖家已收货','admin','2017-03-05 22:35:17'),(36,20,'卖家已重新发货,快递公司：【顺丰速运】，快递单号：【242345】','admin','2017-03-05 22:35:22');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
