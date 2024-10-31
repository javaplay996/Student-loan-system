/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - dk-ssmj
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dk-ssmj` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dk-ssmj`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/gz-ssmj/upload/1613996294045.jpg'),(2,'picture2','http://localhost:8080/gz-ssmj/upload/1613996299955.jpg'),(3,'picture3','http://localhost:8080/gz-ssmj/upload/1613996305267.jpg'),(4,'picture4','http://localhost:8080/gz-ssmj/upload/1613996316492.jpg');

/*Table structure for table `daikuan` */

DROP TABLE IF EXISTS `daikuan`;

CREATE TABLE `daikuan` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '贷款名称 Search',
  `money` int(10) DEFAULT NULL COMMENT '贷款金额',
  `accrual` varchar(200) DEFAULT NULL COMMENT '利息',
  `notice_content` varchar(200) DEFAULT NULL COMMENT '具体内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='贷款项目表';

/*Data for the table `daikuan` */

insert  into `daikuan`(`id`,`name`,`money`,`accrual`,`notice_content`,`create_time`) values (1,'贷款名称1',100111,'4.35%','贷款内容1\r\n','2021-02-26 14:19:06'),(2,'贷款名称2',20000,'5.96%','贷款内容2\r\n','2021-02-26 15:11:15'),(3,'贷款名称3',30000,'2.35%','贷款内容3\r\n','2021-02-26 15:11:29'),(4,'贷款名称4',40000,'8.88%','贷款内容4\r\n','2021-02-26 15:30:18');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别',2,'男',NULL,'2021-01-25 11:41:54'),(2,'sex_types','性别',1,'女',NULL,'2021-01-25 11:41:54'),(3,'jd_types','申请进度',1,'已申请',NULL,'2021-01-25 11:41:54'),(4,'jd_types','申请进度',2,'学校负责人已同意',NULL,'2021-01-25 11:41:54'),(6,'jd_types','申请进度',3,'成功贷款',NULL,'2021-01-25 11:41:54'),(7,'jd_types','申请进度',4,'已拒绝',NULL,'2021-03-06 18:51:45');

/*Table structure for table `liuyanxinxi` */

DROP TABLE IF EXISTS `liuyanxinxi`;

CREATE TABLE `liuyanxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `note` varchar(255) DEFAULT NULL COMMENT '留言信息',
  `yhnote` varchar(11) DEFAULT NULL COMMENT '留言人',
  `note_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '留言时间 Search',
  `reply` varchar(255) DEFAULT NULL COMMENT '回复',
  `glreply` varchar(11) DEFAULT NULL COMMENT '回复人',
  `reply_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '回复时间 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `liuyanxinxi` */

insert  into `liuyanxinxi`(`id`,`note`,`yhnote`,`note_time`,`reply`,`glreply`,`reply_time`) values (4,'1231111','admin','2021-02-26 15:31:33','管理员、学校负责人、银行负责人 都可以回复','admin','2021-02-26 15:31:33'),(6,'123123','小札','2021-02-03 17:27:53',NULL,NULL,NULL),(7,'12331321','小札','2021-02-26 15:32:44',NULL,NULL,NULL);

/*Table structure for table `shenqing` */

DROP TABLE IF EXISTS `shenqing`;

CREATE TABLE `shenqing` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dk_types` tinyint(4) DEFAULT NULL COMMENT '贷款项目 Search',
  `xs_types` tinyint(4) DEFAULT NULL COMMENT '申请人',
  `jd_types` tinyint(4) DEFAULT NULL COMMENT '申请进度 Search',
  `prove_file` varchar(255) DEFAULT NULL COMMENT '资料上传',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='贷款申请表';

/*Data for the table `shenqing` */

insert  into `shenqing`(`id`,`dk_types`,`xs_types`,`jd_types`,`prove_file`,`create_time`) values (3,4,1,3,NULL,'2021-02-26 15:32:27'),(4,3,1,3,NULL,'2021-02-26 15:35:15'),(5,4,1,4,NULL,'2021-03-06 18:49:23'),(6,1,1,1,'http://localhost:8080/dk-ssmj/file/download?fileName=1615033219975.xls','2021-03-06 20:20:22');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','e1we75pvor4udax0iopw950347fet0qb','2021-02-22 17:46:59','2021-03-06 19:47:26'),(8,1,'小札','users','学生','htsmglati7ribg25x6xq1z8kwsaeagzq','2021-02-26 15:18:37','2021-03-06 21:17:29'),(9,1,'学校负责人1','users','学校负责人','f90mkguo3dfoygyb6rndpf1xg92nb1ir','2021-02-26 15:19:01','2021-03-06 19:52:46'),(10,1,'银行负责人1','users','银行负责人','v0ofihxxxmvf96vgk0ccyhahpu949em4','2021-02-26 15:23:43','2021-03-06 19:50:11');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) NOT NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-01-28 18:04:51');

/*Table structure for table `xitonggonggao` */

DROP TABLE IF EXISTS `xitonggonggao`;

CREATE TABLE `xitonggonggao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题 Search',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `neirong` longtext COMMENT '内容',
  `riqi` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统公告';

/*Data for the table `xitonggonggao` */

insert  into `xitonggonggao`(`id`,`addtime`,`biaoti`,`leixing`,`neirong`,`riqi`) values (1,'2021-02-25 17:35:20','日常公告标题','日常公告','公告信息','2021-02-25 17:35:20'),(2,'2021-02-25 17:35:20','紧急公告标题','紧急公告','公告信息','2021-02-25 17:35:20'),(3,'2021-02-25 17:35:20','其他公告标题','其他公告','公告信息','2021-02-25 17:35:20');

/*Table structure for table `xuesheng` */

DROP TABLE IF EXISTS `xuesheng`;

CREATE TABLE `xuesheng` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名称 Search',
  `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `sex_types` tinyint(255) DEFAULT NULL COMMENT '性别',
  `role` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `xuesheng` */

insert  into `xuesheng`(`id`,`name`,`account`,`password`,`img_photo`,`sex_types`,`role`) values (1,'小札','111','111','http://localhost:8080/dk-ssmj/file/download?fileName=1614323412199.jpg',1,'学生'),(2,'小站','222','222','http://localhost:8080/dk-ssmj/file/download?fileName=1614323405434.jpg',2,'学生');

/*Table structure for table `xuexiao` */

DROP TABLE IF EXISTS `xuexiao`;

CREATE TABLE `xuexiao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名称 Search',
  `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `sex_types` tinyint(255) DEFAULT NULL COMMENT '性别',
  `role` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `xuexiao` */

insert  into `xuexiao`(`id`,`name`,`account`,`password`,`img_photo`,`sex_types`,`role`) values (1,'学校负责人1','111','111','http://localhost:8080/dk-ssmj/file/download?fileName=1614323430923.jpg',1,'学校负责人'),(2,'学校负责人2','222','222','http://localhost:8080/dk-ssmj/file/download?fileName=1614323424366.jpg',2,'学校负责人');

/*Table structure for table `yinhang` */

DROP TABLE IF EXISTS `yinhang`;

CREATE TABLE `yinhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名称 Search',
  `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `sex_types` tinyint(255) DEFAULT NULL COMMENT '性别',
  `role` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `yinhang` */

insert  into `yinhang`(`id`,`name`,`account`,`password`,`img_photo`,`sex_types`,`role`) values (1,'银行负责人1','111','111','http://localhost:8080/dk-ssmj/file/download?fileName=1614323444616.jpg',1,'银行负责人'),(2,'银行负责人2','222','222','http://localhost:8080/dk-ssmj/file/download?fileName=1614323438332.jpg',2,'银行负责人');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
