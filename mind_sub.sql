/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : mind_sub

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-12-12 13:21:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `admin_name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '用于登录的管理员账户',
  `admin_pwd` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '用于登录的密码',
  `name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员姓名',
  `sex` int(1) DEFAULT NULL COMMENT '0女，1男',
  `age` int(3) DEFAULT NULL COMMENT '管理员年龄',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员电话',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员电子邮件',
  `is_active` int(1) DEFAULT NULL COMMENT '管理员账户状态  0停用，1激活',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'root', 'root', '管理员', '1', '22', '18596666666', 'root@qq.com', '1');

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `announcement_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `title` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '公告标题',
  `context` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '公告的内容',
  `creater_id` int(9) DEFAULT NULL COMMENT '公告的创建者id',
  `create_time` datetime DEFAULT NULL COMMENT '公告发布时间',
  `is_active` int(1) DEFAULT NULL COMMENT '0 不显示，1显示',
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公告面板，发布通知';

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('6', '猫头鹰源码优惠了', '猫头鹰源码优惠了，12月12日，之后涨价...', '1', '2019-12-11 10:27:22', '1');
INSERT INTO `announcement` VALUES ('7', '双12，猫头鹰优惠', '双12，猫头鹰源码优惠，进入www.maotouyingcc.com', '1', '2019-12-12 07:02:55', '1');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `client_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '来访者的id主键',
  `client_name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '来访者登录的普通账户',
  `client_pwd` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '来访者登录的密码',
  `name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '来访者姓名',
  `sex` int(1) DEFAULT NULL COMMENT '0女，1男',
  `age` int(3) DEFAULT NULL COMMENT '来访者年龄',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '来访者电话',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '来访者电子邮件',
  `is_active` int(1) DEFAULT NULL COMMENT '来访者账户状态  0停用，1激活',
  `region_time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='来访者，普通需要咨询的人';

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('4', '15222222233', '123456', '李云', null, null, '15222222233', '123456@qq.com', '1', '2019-12-10 21:00:09');
INSERT INTO `client` VALUES ('5', '18596859685', '123456', '李四', null, null, '18596859685', '222@qq.com', '1', '2019-12-11 11:29:18');
INSERT INTO `client` VALUES ('8', '15263636363', '123456', '刘芸', null, null, '15263636363', '123@qq.com', '1', '2019-12-12 07:04:29');

-- ----------------------------
-- Table structure for client_archive
-- ----------------------------
DROP TABLE IF EXISTS `client_archive`;
CREATE TABLE `client_archive` (
  `archives_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '咨询者的一次咨询记录',
  `client_id` int(9) NOT NULL COMMENT '本次咨询的，来访者的id',
  `doctor_id` int(9) NOT NULL COMMENT '本次咨询的，咨询师的id',
  `client_description` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '无' COMMENT '申请人的主观描述',
  `question_context` varchar(5000) COLLATE utf8_bin NOT NULL DEFAULT '未填写' COMMENT '申请人做的问卷 内容 ',
  `level` int(3) NOT NULL DEFAULT '0' COMMENT '等级分数',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `expect_place` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '未填写' COMMENT '申请人期望的咨询地点，最终只是一个参考',
  `expect_time` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '未填写' COMMENT '申请人期望的咨询时间，最终只是一个参考',
  `start_datetime` datetime DEFAULT NULL COMMENT '咨询开始时间，几月几日几时',
  `end_datetime` datetime DEFAULT NULL COMMENT '咨询结束时间，几月几日几时',
  `sub_place` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '未填写' COMMENT '咨询具体地点',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '-1 失败，0 申请中，1 通过申请但未完成，2完成咨询但未完善资料,3全部完成',
  `doc_path` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '一次咨询的记录文档，命名：日期_来访者id_咨询师id.xxx',
  `second_question_context` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '未回访' COMMENT '回访记录内容',
  `is_second_do` int(1) NOT NULL DEFAULT '0' COMMENT '是否回访,0否，1是',
  PRIMARY KEY (`archives_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='来访者的一次咨询的档案';

-- ----------------------------
-- Records of client_archive
-- ----------------------------
INSERT INTO `client_archive` VALUES ('43', '4', '27', '12', '{\"question11\":{\"context\":\"1.你觉得自己是否是一个开朗的人？\",\"answer_yes_score\":\"10\",\"answer_no_score\":\"0\",\"clientSelected\":\"10\"}}', '10', '2019-12-12 06:44:29', '12', '12', '2019-12-12 06:45:00', '2019-12-13 06:45:00', '12', '1', '', '', '0');
INSERT INTO `client_archive` VALUES ('44', '4', '27', '4', '{\"question11\":{\"context\":\"1.你觉得自己是否是一个开朗的人？\",\"answer_yes_score\":\"10\",\"answer_no_score\":\"0\",\"clientSelected\":\"10\"}}', '10', '2019-12-12 06:44:40', '3', '3', '2019-12-12 06:45:00', '2019-12-13 06:45:00', '1245', '3', '2019121206470447449736749176832166718.docx', '很好。', '1');
INSERT INTO `client_archive` VALUES ('45', '8', '29', '我最近心情不好......', '{\"question11\":{\"context\":\"1.你觉得自己是否是一个开朗的人？\",\"answer_yes_score\":\"10\",\"answer_no_score\":\"0\",\"clientSelected\":\"10\"},\"question12\":{\"context\":\"2.你最新心情好吗？\",\"answer_yes_score\":\"5\",\"answer_no_score\":\"0\",\"clientSelected\":\"0\"}}', '10', '2019-12-12 07:07:12', '微信语音', '2019年12月12日下午5点', '2019-12-12 07:09:50', '2019-12-13 07:09:50', '微信语音', '3', '20191212071510151065590375538436697532.docx', '很好', '1');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `doctor_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `doctor_name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师登录的普通账户',
  `doctor_pwd` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '用于登录的密码',
  `name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师姓名',
  `sex` int(1) DEFAULT NULL COMMENT '0女，1男',
  `age` int(3) DEFAULT NULL COMMENT '咨询师年龄',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师电话',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师电子邮件',
  `is_active` int(1) DEFAULT NULL COMMENT '咨询师账户状态  0停用，1激活',
  `level` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师等级（一级、二级 等）',
  `skill` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师擅长方向（家庭、亲密关系，挫折等）',
  `img` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '展示给来访者的 个人照片',
  `place` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师 的咨询地点',
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='心理咨询师用户表';

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('27', '178arsKgN', '123456', '猫头鹰咨询师', '1', '22', '15252525252', '1@qq.com', '1', '一级咨询师', '心理', '2019121110051851866193217795154816787.png', '北京市');
INSERT INTO `doctor` VALUES ('28', 'Ts0RUzKpr', '123456', '张三', '0', '23', '18596666666', '123@qq.com', '0', '二级级咨询师', '心理', '20191211101925192597565054596797346086.jpg', '郑州');
INSERT INTO `doctor` VALUES ('29', 'NKiESMvpH', '123456', '猫头鹰', '1', '25', '18525252522', '123@qq.com', '1', '一级咨询师', '心理', '20191212065947594765791161507256693411.jpg', '网上预约');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(9) NOT NULL AUTO_INCREMENT,
  `sender` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '发送者身份，admin 管理员，doctor 咨询师，client 咨询者',
  `sender_id` int(9) NOT NULL COMMENT '发送者的id',
  `sender_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '发送者名字',
  `receiver` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '接受者身份，admin 管理员，doctor 咨询师，client 咨询者',
  `receiver_id` int(9) NOT NULL COMMENT '接受者id',
  `receiver_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '接受者名字',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `is_read` int(1) DEFAULT NULL COMMENT '是否已经读过了，0 未读，1 已读',
  `context` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '消息内容',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('102', 'admin', '3', '系统(请勿回复)', 'client', '4', '接受系统消息方', '2019-12-12 06:45:14', '1', '咨询师：猫头鹰咨询师，为您安排了咨询，请在\"我的预约\"中查看详情，如有疑问请与其联系;(邮箱:1@qq.com,电话：15252525252)');
INSERT INTO `message` VALUES ('103', 'admin', '3', '系统(请勿回复)', 'client', '4', '接受系统消息方', '2019-12-12 06:45:25', '1', '咨询师：猫头鹰咨询师，为您安排了咨询，请在\"我的预约\"中查看详情，如有疑问请与其联系;(邮箱:1@qq.com,电话：15252525252)');
INSERT INTO `message` VALUES ('104', 'admin', '3', '系统(请勿回复)', 'client', '4', '接受系统消息方', '2019-12-12 06:47:10', '1', '您与：咨询师猫头鹰咨询师的咨询已经完成,如有疑问请与其联系;(邮箱:1@qq.com,电话：15252525252)');
INSERT INTO `message` VALUES ('105', 'client', '8', '刘芸', 'doctor', '29', '猫头鹰', '2019-12-12 07:07:34', '1', '你好');
INSERT INTO `message` VALUES ('106', 'admin', '3', '系统(请勿回复)', 'client', '8', '接受系统消息方', '2019-12-12 07:10:12', '1', '咨询师：猫头鹰，为您安排了咨询，请在\"我的预约\"中查看详情，如有疑问请与其联系;(邮箱:123@qq.com,电话：18525252522)');
INSERT INTO `message` VALUES ('107', 'admin', '3', '系统(请勿回复)', 'client', '8', '接受系统消息方', '2019-12-12 07:15:59', '1', '您与：咨询师猫头鹰的咨询已经完成,如有疑问请与其联系;(邮箱:123@qq.com,电话：18525252522)');

-- ----------------------------
-- Table structure for message_board
-- ----------------------------
DROP TABLE IF EXISTS `message_board`;
CREATE TABLE `message_board` (
  `board_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '留言主键id',
  `context` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '留言的内容',
  `creater_id` int(9) DEFAULT NULL COMMENT '留言的创建者id',
  `create_time` datetime DEFAULT NULL COMMENT '留言时间',
  `is_active` int(1) DEFAULT NULL COMMENT '0 不显示，1显示',
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message_board
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '一个问卷题目id',
  `question_num` int(5) NOT NULL COMMENT '题目题号，按照题号排列题目',
  `context` varchar(1000) COLLATE utf8_bin NOT NULL COMMENT '题目内容',
  `answer_yes_score` int(1) NOT NULL COMMENT '回答是的分值',
  `answer_no_score` int(1) NOT NULL COMMENT '回答否的分值',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('11', '1', '你觉得自己是否是一个开朗的人？', '10', '0');
INSERT INTO `question` VALUES ('12', '2', '你最新心情好吗？', '5', '0');
