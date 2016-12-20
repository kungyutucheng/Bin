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
  `star` tinyint(4) NOT NULL COMMENT '评价等级，上限5，下线0，取整',
  `gid` int(11) NOT NULL COMMENT '商品id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `content` varchar(200) DEFAULT NULL COMMENT '评价内容',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `_comment` */

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `_no` (`_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `_order` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `_owner` */

/*Table structure for table `_user` */

DROP TABLE IF EXISTS `_user`;

CREATE TABLE `_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(30) NOT NULL COMMENT '账户，邮箱或手机号',
  `pwd` varchar(40) NOT NULL COMMENT '密码',
  `_name` varchar(30) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分，默认0',
  `gender` tinyint(4) DEFAULT '3' COMMENT '性别，1-男性，2-女性，3-保密',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `balance` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '账户余额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `_user` */

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `_name` varchar(30) NOT NULL,
  `province` varchar(30) NOT NULL COMMENT '省份',
  `city` varchar(30) NOT NULL COMMENT '城市',
  `county` varchar(30) NOT NULL COMMENT '县区',
  `address` varchar(100) NOT NULL COMMENT '详细地址',
  `tel` varchar(20) NOT NULL COMMENT '详细地址',
  `isDefault` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否为默认地址,1-否，2-是',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `_disable` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `address` */

/*Table structure for table `backup_user` */

DROP TABLE IF EXISTS `backup_user`;

CREATE TABLE `backup_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `pwd` varchar(30) NOT NULL COMMENT '密码',
  `role` tinyint(4) NOT NULL COMMENT '角色，1-开发者，2-管理员，3-商户',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `creator` varchar(30) NOT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `backup_user` */

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `gid` int(11) NOT NULL COMMENT '商品id',
  `num` int(11) NOT NULL COMMENT '数量',
  `properties` varchar(100) DEFAULT NULL COMMENT '商品特性',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exception_log` */

/*Table structure for table `good` */

DROP TABLE IF EXISTS `good`;

CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `_name` varchar(100) NOT NULL COMMENT '商品名称',
  `_no` varchar(30) NOT NULL COMMENT '商品编号',
  `price` decimal(10,0) NOT NULL COMMENT '商品价格',
  `oid` int(11) NOT NULL COMMENT '商家id',
  `_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态,1-已上架，2-已下架，默认1',
  `msg` varchar(200) DEFAULT NULL COMMENT '信息',
  `soldNum` int(11) DEFAULT '0' COMMENT '已售数量，默认0',
  `brand` varchar(100) DEFAULT NULL COMMENT '品牌',
  `attr` varchar(1000) DEFAULT NULL COMMENT '属性',
  `scope` tinyint(4) NOT NULL COMMENT '大类别',
  `type` varchar(20) NOT NULL COMMENT '小类别',
  `picMid` varchar(100) NOT NULL COMMENT '列表页图片',
  `seriesSm` varchar(100) NOT NULL COMMENT '详情页系列小图',
  `seriesLg` varchar(100) NOT NULL COMMENT '详情页系类大图',
  `picSm` varchar(100) NOT NULL COMMENT '订单等页面商品小图',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上架时间',
  `removeTime` datetime DEFAULT NULL COMMENT '下架时间',
  `_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `_no` (`_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `good` */

/*Table structure for table `growth_value` */

DROP TABLE IF EXISTS `growth_value`;

CREATE TABLE `growth_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `_value` int(11) NOT NULL COMMENT '成长值',
  `source` tinyint(4) NOT NULL COMMENT '来源，1-登录，2-购物，3-评价，4-退货',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发放/减扣时间',
  `detail` varchar(50) NOT NULL COMMENT '来源详情',
  `_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `growth_value` */

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

/*Table structure for table `order_goods` */

DROP TABLE IF EXISTS `order_goods`;

CREATE TABLE `order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `oid` int(11) NOT NULL COMMENT '订单id',
  `gid` int(11) NOT NULL COMMENT '商品id',
  `price` decimal(10,0) NOT NULL COMMENT '商品价格',
  `num` int(11) NOT NULL COMMENT '数量',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_goods` */

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
  `resendAddr` varchar(100) NOT NULL COMMENT '寄送地址',
  `receiver` varchar(30) NOT NULL COMMENT '收货人',
  `tel` varchar(30) NOT NULL COMMENT '联系电话',
  `deliveryFare` decimal(10,0) DEFAULT NULL COMMENT '运费',
  `express` varchar(20) DEFAULT NULL COMMENT '快递公司',
  `expressNo` varchar(30) DEFAULT NULL COMMENT '快递单号',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `rechangeMsg` varchar(100) DEFAULT NULL COMMENT '换货信息',
  `resendTime` datetime DEFAULT NULL COMMENT '重新寄送时间',
  `passTime` datetime DEFAULT NULL COMMENT '审核通过时间',
  `receiveTime` datetime DEFAULT NULL COMMENT '卖家收到货物时间',
  `finishTime` datetime DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `return_and_change` */

/*Table structure for table `return_and_change_log` */

DROP TABLE IF EXISTS `return_and_change_log`;

CREATE TABLE `return_and_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rid` int(11) NOT NULL COMMENT '退货/换货id',
  `msg` varchar(100) NOT NULL COMMENT '信息',
  `operator` varchar(30) NOT NULL COMMENT '操作人',
  `operateTime` datetime NOT NULL COMMENT '操作时间',
  `oeprateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `return_and_change_log` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
