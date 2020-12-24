/*
 Navicat Premium Data Transfer

 Source Server         : 101.200.209.71
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : 101.200.209.71:3306
 Source Schema         : ztgk_check

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 22/12/2020 22:46:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '*/5 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_FIRED_TRIGGERS` VALUES ('RenrenScheduler', 'liyangdeMacBook-Pro.local16086477210201608647721116', 'TASK_2', 'DEFAULT', 'liyangdeMacBook-Pro.local1608647721020', 1608648306426, 1608648310000, 5, 'ACQUIRED', NULL, NULL, '0', '0');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B787074000F6E6F74696365416C61726D5461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001768ACFC6887874000C302030203132202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740000740024E79B91E79DA3E4BBBBE58AA1E8B685E697B6E9A284E8ADA6E58F91E98081E4BFA1E681AF737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'liyangdeMacBook-Pro.local1608647721020', 1608648303370, 15000);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', NULL, 1608648310000, 1608648305000, 5, 'ACQUIRED', 'CRON', 1608646641000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B787074000F6E6F74696365416C61726D5461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001768ACFC5687874000D2A2F35202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740000740024E79B91E79DA3E4BBBBE58AA1E8B685E697B6E9A284E8ADA6E58F91E98081E4BFA1E681AF737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
COMMIT;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` VALUES (2, 'noticeAlarmTask', '', '*/5 * * * * ?', 0, '监督任务超时预警发送信息', '2020-12-22 22:17:21');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-21 21:00:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 16, '2020-12-21 23:00:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-22 09:30:01');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-22 10:00:01');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 3, '2020-12-22 10:30:01');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-22 11:30:01');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-22 13:00:01');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-22 13:30:01');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-22 14:00:01');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-22 15:00:02');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 2, '2020-12-22 15:30:01');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-22 16:00:01');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 3, '2020-12-22 16:30:02');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-22 17:30:01');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 4, '2020-12-22 18:00:03');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-22 20:30:01');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 0, '2020-12-22 21:00:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 1, '2020-12-22 21:30:00');
INSERT INTO `schedule_job_log` VALUES (19, 2, 'noticeAlarmTask', '', 0, NULL, 60, '2020-12-22 22:18:36');
INSERT INTO `schedule_job_log` VALUES (20, 2, 'noticeAlarmTask', '', 0, NULL, 835, '2020-12-22 22:18:40');
INSERT INTO `schedule_job_log` VALUES (21, 2, 'noticeAlarmTask', '', 0, NULL, 24, '2020-12-22 22:18:47');
INSERT INTO `schedule_job_log` VALUES (22, 2, 'noticeAlarmTask', '', 0, NULL, 24, '2020-12-22 22:18:51');
INSERT INTO `schedule_job_log` VALUES (23, 2, 'noticeAlarmTask', '', 0, NULL, 902, '2020-12-22 22:18:55');
INSERT INTO `schedule_job_log` VALUES (24, 2, 'noticeAlarmTask', '', 0, NULL, 38, '2020-12-22 22:19:00');
INSERT INTO `schedule_job_log` VALUES (25, 2, 'noticeAlarmTask', '', 0, NULL, 931, '2020-12-22 22:19:05');
INSERT INTO `schedule_job_log` VALUES (26, 2, 'noticeAlarmTask', '', 0, NULL, 851, '2020-12-22 22:19:10');
INSERT INTO `schedule_job_log` VALUES (27, 2, 'noticeAlarmTask', '', 0, NULL, 836, '2020-12-22 22:19:15');
INSERT INTO `schedule_job_log` VALUES (28, 2, 'noticeAlarmTask', '', 0, NULL, 878, '2020-12-22 22:19:20');
INSERT INTO `schedule_job_log` VALUES (29, 2, 'noticeAlarmTask', '', 0, NULL, 40, '2020-12-22 22:19:26');
INSERT INTO `schedule_job_log` VALUES (30, 2, 'noticeAlarmTask', '', 0, NULL, 830, '2020-12-22 22:19:30');
INSERT INTO `schedule_job_log` VALUES (31, 2, 'noticeAlarmTask', '', 0, NULL, 46, '2020-12-22 22:19:36');
INSERT INTO `schedule_job_log` VALUES (32, 2, 'noticeAlarmTask', '', 0, NULL, 842, '2020-12-22 22:19:40');
INSERT INTO `schedule_job_log` VALUES (33, 2, 'noticeAlarmTask', '', 0, NULL, 855, '2020-12-22 22:19:45');
INSERT INTO `schedule_job_log` VALUES (34, 2, 'noticeAlarmTask', '', 0, NULL, 841, '2020-12-22 22:19:50');
INSERT INTO `schedule_job_log` VALUES (35, 2, 'noticeAlarmTask', '', 0, NULL, 843, '2020-12-22 22:19:55');
INSERT INTO `schedule_job_log` VALUES (36, 2, 'noticeAlarmTask', '', 0, NULL, 39, '2020-12-22 22:20:01');
INSERT INTO `schedule_job_log` VALUES (37, 2, 'noticeAlarmTask', '', 0, NULL, 36, '2020-12-22 22:20:05');
INSERT INTO `schedule_job_log` VALUES (38, 2, 'noticeAlarmTask', '', 0, NULL, 53, '2020-12-22 22:20:11');
INSERT INTO `schedule_job_log` VALUES (39, 2, 'noticeAlarmTask', '', 0, NULL, 855, '2020-12-22 22:20:15');
INSERT INTO `schedule_job_log` VALUES (40, 2, 'noticeAlarmTask', '', 0, NULL, 38, '2020-12-22 22:20:21');
INSERT INTO `schedule_job_log` VALUES (41, 2, 'noticeAlarmTask', '', 0, NULL, 835, '2020-12-22 22:20:25');
INSERT INTO `schedule_job_log` VALUES (42, 2, 'noticeAlarmTask', '', 0, NULL, 918, '2020-12-22 22:20:30');
INSERT INTO `schedule_job_log` VALUES (43, 2, 'noticeAlarmTask', '', 0, NULL, 922, '2020-12-22 22:20:35');
INSERT INTO `schedule_job_log` VALUES (44, 2, 'noticeAlarmTask', '', 0, NULL, 846, '2020-12-22 22:20:40');
INSERT INTO `schedule_job_log` VALUES (45, 2, 'noticeAlarmTask', '', 0, NULL, 828, '2020-12-22 22:20:45');
INSERT INTO `schedule_job_log` VALUES (46, 2, 'noticeAlarmTask', '', 0, NULL, 853, '2020-12-22 22:20:50');
INSERT INTO `schedule_job_log` VALUES (47, 2, 'noticeAlarmTask', '', 0, NULL, 39, '2020-12-22 22:20:56');
INSERT INTO `schedule_job_log` VALUES (48, 2, 'noticeAlarmTask', '', 0, NULL, 859, '2020-12-22 22:21:00');
INSERT INTO `schedule_job_log` VALUES (49, 2, 'noticeAlarmTask', '', 0, NULL, 842, '2020-12-22 22:21:05');
INSERT INTO `schedule_job_log` VALUES (50, 2, 'noticeAlarmTask', '', 0, NULL, 844, '2020-12-22 22:21:10');
INSERT INTO `schedule_job_log` VALUES (51, 2, 'noticeAlarmTask', '', 0, NULL, 52, '2020-12-22 22:21:16');
INSERT INTO `schedule_job_log` VALUES (52, 2, 'noticeAlarmTask', '', 0, NULL, 41, '2020-12-22 22:21:21');
INSERT INTO `schedule_job_log` VALUES (53, 2, 'noticeAlarmTask', '', 0, NULL, 2048, '2020-12-22 22:21:26');
INSERT INTO `schedule_job_log` VALUES (54, 2, 'noticeAlarmTask', '', 0, NULL, 64, '2020-12-22 22:21:31');
INSERT INTO `schedule_job_log` VALUES (55, 2, 'noticeAlarmTask', '', 0, NULL, 39, '2020-12-22 22:21:36');
INSERT INTO `schedule_job_log` VALUES (56, 2, 'noticeAlarmTask', '', 0, NULL, 47, '2020-12-22 22:21:42');
INSERT INTO `schedule_job_log` VALUES (57, 2, 'noticeAlarmTask', '', 0, NULL, 838, '2020-12-22 22:21:45');
INSERT INTO `schedule_job_log` VALUES (58, 2, 'noticeAlarmTask', '', 0, NULL, 849, '2020-12-22 22:21:50');
INSERT INTO `schedule_job_log` VALUES (59, 2, 'noticeAlarmTask', '', 0, NULL, 844, '2020-12-22 22:21:55');
INSERT INTO `schedule_job_log` VALUES (60, 2, 'noticeAlarmTask', '', 0, NULL, 43, '2020-12-22 22:22:01');
INSERT INTO `schedule_job_log` VALUES (61, 2, 'noticeAlarmTask', '', 0, NULL, 39, '2020-12-22 22:22:06');
INSERT INTO `schedule_job_log` VALUES (62, 2, 'noticeAlarmTask', '', 0, NULL, 855, '2020-12-22 22:22:10');
INSERT INTO `schedule_job_log` VALUES (63, 2, 'noticeAlarmTask', '', 0, NULL, 894, '2020-12-22 22:22:15');
INSERT INTO `schedule_job_log` VALUES (64, 2, 'noticeAlarmTask', '', 0, NULL, 915, '2020-12-22 22:22:20');
INSERT INTO `schedule_job_log` VALUES (65, 2, 'noticeAlarmTask', '', 0, NULL, 909, '2020-12-22 22:22:25');
INSERT INTO `schedule_job_log` VALUES (66, 2, 'noticeAlarmTask', '', 0, NULL, 50, '2020-12-22 22:22:31');
INSERT INTO `schedule_job_log` VALUES (67, 2, 'noticeAlarmTask', '', 0, NULL, 835, '2020-12-22 22:22:35');
INSERT INTO `schedule_job_log` VALUES (68, 2, 'noticeAlarmTask', '', 0, NULL, 64, '2020-12-22 22:22:41');
INSERT INTO `schedule_job_log` VALUES (69, 2, 'noticeAlarmTask', '', 0, NULL, 828, '2020-12-22 22:22:45');
INSERT INTO `schedule_job_log` VALUES (70, 2, 'noticeAlarmTask', '', 0, NULL, 895, '2020-12-22 22:22:50');
INSERT INTO `schedule_job_log` VALUES (71, 2, 'noticeAlarmTask', '', 0, NULL, 913, '2020-12-22 22:22:55');
INSERT INTO `schedule_job_log` VALUES (72, 2, 'noticeAlarmTask', '', 0, NULL, 933, '2020-12-22 22:23:00');
INSERT INTO `schedule_job_log` VALUES (73, 2, 'noticeAlarmTask', '', 0, NULL, 43, '2020-12-22 22:23:06');
INSERT INTO `schedule_job_log` VALUES (74, 2, 'noticeAlarmTask', '', 0, NULL, 36, '2020-12-22 22:23:11');
INSERT INTO `schedule_job_log` VALUES (75, 2, 'noticeAlarmTask', '', 0, NULL, 54, '2020-12-22 22:23:16');
INSERT INTO `schedule_job_log` VALUES (76, 2, 'noticeAlarmTask', '', 0, NULL, 52, '2020-12-22 22:23:21');
INSERT INTO `schedule_job_log` VALUES (77, 2, 'noticeAlarmTask', '', 0, NULL, 907, '2020-12-22 22:23:25');
INSERT INTO `schedule_job_log` VALUES (78, 2, 'noticeAlarmTask', '', 0, NULL, 43, '2020-12-22 22:23:31');
INSERT INTO `schedule_job_log` VALUES (79, 2, 'noticeAlarmTask', '', 0, NULL, 859, '2020-12-22 22:23:35');
INSERT INTO `schedule_job_log` VALUES (80, 2, 'noticeAlarmTask', '', 0, NULL, 832, '2020-12-22 22:23:40');
INSERT INTO `schedule_job_log` VALUES (81, 2, 'noticeAlarmTask', '', 0, NULL, 847, '2020-12-22 22:23:45');
INSERT INTO `schedule_job_log` VALUES (82, 2, 'noticeAlarmTask', '', 0, NULL, 917, '2020-12-22 22:23:50');
INSERT INTO `schedule_job_log` VALUES (83, 2, 'noticeAlarmTask', '', 0, NULL, 837, '2020-12-22 22:23:55');
INSERT INTO `schedule_job_log` VALUES (84, 2, 'noticeAlarmTask', '', 0, NULL, 831, '2020-12-22 22:24:00');
INSERT INTO `schedule_job_log` VALUES (85, 2, 'noticeAlarmTask', '', 0, NULL, 856, '2020-12-22 22:24:05');
INSERT INTO `schedule_job_log` VALUES (86, 2, 'noticeAlarmTask', '', 0, NULL, 830, '2020-12-22 22:24:10');
INSERT INTO `schedule_job_log` VALUES (87, 2, 'noticeAlarmTask', '', 0, NULL, 888, '2020-12-22 22:24:15');
INSERT INTO `schedule_job_log` VALUES (88, 2, 'noticeAlarmTask', '', 0, NULL, 54, '2020-12-22 22:24:21');
INSERT INTO `schedule_job_log` VALUES (89, 2, 'noticeAlarmTask', '', 0, NULL, 917, '2020-12-22 22:24:25');
INSERT INTO `schedule_job_log` VALUES (90, 2, 'noticeAlarmTask', '', 0, NULL, 837, '2020-12-22 22:24:30');
INSERT INTO `schedule_job_log` VALUES (91, 2, 'noticeAlarmTask', '', 0, NULL, 39, '2020-12-22 22:24:36');
INSERT INTO `schedule_job_log` VALUES (92, 2, 'noticeAlarmTask', '', 0, NULL, 833, '2020-12-22 22:24:40');
INSERT INTO `schedule_job_log` VALUES (93, 2, 'noticeAlarmTask', '', 0, NULL, 831, '2020-12-22 22:24:45');
INSERT INTO `schedule_job_log` VALUES (94, 2, 'noticeAlarmTask', '', 0, NULL, 39, '2020-12-22 22:24:50');
INSERT INTO `schedule_job_log` VALUES (95, 2, 'noticeAlarmTask', '', 0, NULL, 840, '2020-12-22 22:24:55');
INSERT INTO `schedule_job_log` VALUES (96, 2, 'noticeAlarmTask', '', 0, NULL, 38, '2020-12-22 22:25:00');
INSERT INTO `schedule_job_log` VALUES (97, 2, 'noticeAlarmTask', '', 0, NULL, 37, '2020-12-22 22:25:05');
INSERT INTO `schedule_job_log` VALUES (98, 2, 'noticeAlarmTask', '', 0, NULL, 837, '2020-12-22 22:25:10');
INSERT INTO `schedule_job_log` VALUES (99, 2, 'noticeAlarmTask', '', 0, NULL, 896, '2020-12-22 22:25:15');
INSERT INTO `schedule_job_log` VALUES (100, 2, 'noticeAlarmTask', '', 0, NULL, 922, '2020-12-22 22:25:20');
INSERT INTO `schedule_job_log` VALUES (101, 2, 'noticeAlarmTask', '', 0, NULL, 920, '2020-12-22 22:25:25');
INSERT INTO `schedule_job_log` VALUES (102, 2, 'noticeAlarmTask', '', 0, NULL, 36, '2020-12-22 22:25:31');
INSERT INTO `schedule_job_log` VALUES (103, 2, 'noticeAlarmTask', '', 0, NULL, 869, '2020-12-22 22:25:35');
INSERT INTO `schedule_job_log` VALUES (104, 2, 'noticeAlarmTask', '', 0, NULL, 861, '2020-12-22 22:25:40');
INSERT INTO `schedule_job_log` VALUES (105, 2, 'noticeAlarmTask', '', 0, NULL, 858, '2020-12-22 22:25:45');
INSERT INTO `schedule_job_log` VALUES (106, 2, 'noticeAlarmTask', '', 0, NULL, 39, '2020-12-22 22:25:51');
INSERT INTO `schedule_job_log` VALUES (107, 2, 'noticeAlarmTask', '', 0, NULL, 41, '2020-12-22 22:25:56');
INSERT INTO `schedule_job_log` VALUES (108, 2, 'noticeAlarmTask', '', 0, NULL, 50, '2020-12-22 22:26:01');
INSERT INTO `schedule_job_log` VALUES (109, 2, 'noticeAlarmTask', '', 0, NULL, 844, '2020-12-22 22:26:05');
INSERT INTO `schedule_job_log` VALUES (110, 2, 'noticeAlarmTask', '', 0, NULL, 833, '2020-12-22 22:26:10');
INSERT INTO `schedule_job_log` VALUES (111, 2, 'noticeAlarmTask', '', 0, NULL, 884, '2020-12-22 22:26:15');
INSERT INTO `schedule_job_log` VALUES (112, 2, 'noticeAlarmTask', '', 0, NULL, 831, '2020-12-22 22:26:20');
INSERT INTO `schedule_job_log` VALUES (113, 2, 'noticeAlarmTask', '', 0, NULL, 830, '2020-12-22 22:28:52');
INSERT INTO `schedule_job_log` VALUES (114, 2, 'noticeAlarmTask', '', 0, NULL, 1880, '2020-12-22 22:28:55');
INSERT INTO `schedule_job_log` VALUES (115, 2, 'noticeAlarmTask', '', 0, NULL, 1872, '2020-12-22 22:29:00');
INSERT INTO `schedule_job_log` VALUES (116, 2, 'noticeAlarmTask', '', 0, NULL, 25, '2020-12-22 22:29:06');
INSERT INTO `schedule_job_log` VALUES (117, 2, 'noticeAlarmTask', '', 0, NULL, 834, '2020-12-22 22:29:10');
INSERT INTO `schedule_job_log` VALUES (118, 2, 'noticeAlarmTask', '', 0, NULL, 1834, '2020-12-22 22:29:15');
INSERT INTO `schedule_job_log` VALUES (119, 2, 'noticeAlarmTask', '', 0, NULL, 1842, '2020-12-22 22:29:20');
INSERT INTO `schedule_job_log` VALUES (120, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:29:25');
INSERT INTO `schedule_job_log` VALUES (121, 2, 'noticeAlarmTask', '', 0, NULL, 852, '2020-12-22 22:29:30');
INSERT INTO `schedule_job_log` VALUES (122, 2, 'noticeAlarmTask', '', 0, NULL, 886, '2020-12-22 22:29:35');
INSERT INTO `schedule_job_log` VALUES (123, 2, 'noticeAlarmTask', '', 0, NULL, 1938, '2020-12-22 22:29:40');
INSERT INTO `schedule_job_log` VALUES (124, 2, 'noticeAlarmTask', '', 0, NULL, 41, '2020-12-22 22:29:46');
INSERT INTO `schedule_job_log` VALUES (125, 2, 'noticeAlarmTask', '', 0, NULL, 847, '2020-12-22 22:29:50');
INSERT INTO `schedule_job_log` VALUES (126, 2, 'noticeAlarmTask', '', 0, NULL, 870, '2020-12-22 22:29:55');
INSERT INTO `schedule_job_log` VALUES (127, 2, 'noticeAlarmTask', '', 0, NULL, 875, '2020-12-22 22:30:00');
INSERT INTO `schedule_job_log` VALUES (128, 2, 'noticeAlarmTask', '', 0, NULL, 26, '2020-12-22 22:30:09');
INSERT INTO `schedule_job_log` VALUES (129, 2, 'noticeAlarmTask', '', 0, NULL, 37, '2020-12-22 22:30:11');
INSERT INTO `schedule_job_log` VALUES (130, 2, 'noticeAlarmTask', '', 0, NULL, 40, '2020-12-22 22:30:16');
INSERT INTO `schedule_job_log` VALUES (131, 2, 'noticeAlarmTask', '', 0, NULL, 830, '2020-12-22 22:30:20');
INSERT INTO `schedule_job_log` VALUES (132, 2, 'noticeAlarmTask', '', 0, NULL, 847, '2020-12-22 22:30:25');
INSERT INTO `schedule_job_log` VALUES (133, 2, 'noticeAlarmTask', '', 0, NULL, 1892, '2020-12-22 22:30:30');
INSERT INTO `schedule_job_log` VALUES (134, 2, 'noticeAlarmTask', '', 0, NULL, 827, '2020-12-22 22:30:35');
INSERT INTO `schedule_job_log` VALUES (135, 2, 'noticeAlarmTask', '', 0, NULL, 849, '2020-12-22 22:30:40');
INSERT INTO `schedule_job_log` VALUES (136, 2, 'noticeAlarmTask', '', 0, NULL, 24, '2020-12-22 22:30:46');
INSERT INTO `schedule_job_log` VALUES (137, 2, 'noticeAlarmTask', '', 0, NULL, 848, '2020-12-22 22:30:50');
INSERT INTO `schedule_job_log` VALUES (138, 2, 'noticeAlarmTask', '', 0, NULL, 867, '2020-12-22 22:30:55');
INSERT INTO `schedule_job_log` VALUES (139, 2, 'noticeAlarmTask', '', 0, NULL, 63, '2020-12-22 22:31:02');
INSERT INTO `schedule_job_log` VALUES (140, 2, 'noticeAlarmTask', '', 0, NULL, 830, '2020-12-22 22:31:05');
INSERT INTO `schedule_job_log` VALUES (141, 2, 'noticeAlarmTask', '', 0, NULL, 832, '2020-12-22 22:31:10');
INSERT INTO `schedule_job_log` VALUES (142, 2, 'noticeAlarmTask', '', 0, NULL, 1853, '2020-12-22 22:31:15');
INSERT INTO `schedule_job_log` VALUES (143, 2, 'noticeAlarmTask', '', 0, NULL, 856, '2020-12-22 22:31:20');
INSERT INTO `schedule_job_log` VALUES (144, 2, 'noticeAlarmTask', '', 0, NULL, 38, '2020-12-22 22:31:25');
INSERT INTO `schedule_job_log` VALUES (145, 2, 'noticeAlarmTask', '', 0, NULL, 38, '2020-12-22 22:31:31');
INSERT INTO `schedule_job_log` VALUES (146, 2, 'noticeAlarmTask', '', 0, NULL, 877, '2020-12-22 22:31:35');
INSERT INTO `schedule_job_log` VALUES (147, 2, 'noticeAlarmTask', '', 0, NULL, 832, '2020-12-22 22:31:40');
INSERT INTO `schedule_job_log` VALUES (148, 2, 'noticeAlarmTask', '', 0, NULL, 839, '2020-12-22 22:31:45');
INSERT INTO `schedule_job_log` VALUES (149, 2, 'noticeAlarmTask', '', 0, NULL, 1867, '2020-12-22 22:31:50');
INSERT INTO `schedule_job_log` VALUES (150, 2, 'noticeAlarmTask', '', 0, NULL, 39, '2020-12-22 22:31:56');
INSERT INTO `schedule_job_log` VALUES (151, 2, 'noticeAlarmTask', '', 0, NULL, 895, '2020-12-22 22:32:00');
INSERT INTO `schedule_job_log` VALUES (152, 2, 'noticeAlarmTask', '', 0, NULL, 859, '2020-12-22 22:32:05');
INSERT INTO `schedule_job_log` VALUES (153, 2, 'noticeAlarmTask', '', 0, NULL, 837, '2020-12-22 22:32:10');
INSERT INTO `schedule_job_log` VALUES (154, 2, 'noticeAlarmTask', '', 0, NULL, 25, '2020-12-22 22:32:16');
INSERT INTO `schedule_job_log` VALUES (155, 2, 'noticeAlarmTask', '', 0, NULL, 859, '2020-12-22 22:32:20');
INSERT INTO `schedule_job_log` VALUES (156, 2, 'noticeAlarmTask', '', 0, NULL, 841, '2020-12-22 22:32:25');
INSERT INTO `schedule_job_log` VALUES (157, 2, 'noticeAlarmTask', '', 0, NULL, 888, '2020-12-22 22:32:30');
INSERT INTO `schedule_job_log` VALUES (158, 2, 'noticeAlarmTask', '', 0, NULL, 37, '2020-12-22 22:32:36');
INSERT INTO `schedule_job_log` VALUES (159, 2, 'noticeAlarmTask', '', 0, NULL, 925, '2020-12-22 22:32:40');
INSERT INTO `schedule_job_log` VALUES (160, 2, 'noticeAlarmTask', '', 0, NULL, 36, '2020-12-22 22:32:46');
INSERT INTO `schedule_job_log` VALUES (161, 2, 'noticeAlarmTask', '', 0, NULL, 822, '2020-12-22 22:32:50');
INSERT INTO `schedule_job_log` VALUES (162, 2, 'noticeAlarmTask', '', 0, NULL, 821, '2020-12-22 22:32:55');
INSERT INTO `schedule_job_log` VALUES (163, 2, 'noticeAlarmTask', '', 0, NULL, 888, '2020-12-22 22:33:00');
INSERT INTO `schedule_job_log` VALUES (164, 2, 'noticeAlarmTask', '', 0, NULL, 831, '2020-12-22 22:33:05');
INSERT INTO `schedule_job_log` VALUES (165, 2, 'noticeAlarmTask', '', 0, NULL, 816, '2020-12-22 22:33:10');
INSERT INTO `schedule_job_log` VALUES (166, 2, 'noticeAlarmTask', '', 0, NULL, 21, '2020-12-22 22:33:15');
INSERT INTO `schedule_job_log` VALUES (167, 2, 'noticeAlarmTask', '', 0, NULL, 817, '2020-12-22 22:33:20');
INSERT INTO `schedule_job_log` VALUES (168, 2, 'noticeAlarmTask', '', 0, NULL, 837, '2020-12-22 22:33:25');
INSERT INTO `schedule_job_log` VALUES (169, 2, 'noticeAlarmTask', '', 0, NULL, 884, '2020-12-22 22:33:30');
INSERT INTO `schedule_job_log` VALUES (170, 2, 'noticeAlarmTask', '', 0, NULL, 878, '2020-12-22 22:33:35');
INSERT INTO `schedule_job_log` VALUES (171, 2, 'noticeAlarmTask', '', 0, NULL, 36, '2020-12-22 22:33:41');
INSERT INTO `schedule_job_log` VALUES (172, 2, 'noticeAlarmTask', '', 0, NULL, 837, '2020-12-22 22:33:45');
INSERT INTO `schedule_job_log` VALUES (173, 2, 'noticeAlarmTask', '', 0, NULL, 40, '2020-12-22 22:33:51');
INSERT INTO `schedule_job_log` VALUES (174, 2, 'noticeAlarmTask', '', 0, NULL, 853, '2020-12-22 22:33:55');
INSERT INTO `schedule_job_log` VALUES (175, 2, 'noticeAlarmTask', '', 0, NULL, 47, '2020-12-22 22:34:01');
INSERT INTO `schedule_job_log` VALUES (176, 2, 'noticeAlarmTask', '', 0, NULL, 37, '2020-12-22 22:34:06');
INSERT INTO `schedule_job_log` VALUES (177, 2, 'noticeAlarmTask', '', 0, NULL, 12954, '2020-12-22 22:34:11');
INSERT INTO `schedule_job_log` VALUES (178, 2, 'noticeAlarmTask', '', 0, NULL, 3903, '2020-12-22 22:34:25');
INSERT INTO `schedule_job_log` VALUES (179, 2, 'noticeAlarmTask', '', 0, NULL, 27, '2020-12-22 22:34:31');
INSERT INTO `schedule_job_log` VALUES (180, 2, 'noticeAlarmTask', '', 0, NULL, 868, '2020-12-22 22:34:33');
INSERT INTO `schedule_job_log` VALUES (181, 2, 'noticeAlarmTask', '', 0, NULL, 36, '2020-12-22 22:34:36');
INSERT INTO `schedule_job_log` VALUES (182, 2, 'noticeAlarmTask', '', 0, NULL, 41, '2020-12-22 22:34:38');
INSERT INTO `schedule_job_log` VALUES (183, 2, 'noticeAlarmTask', '', 0, NULL, 992, '2020-12-22 22:36:01');
INSERT INTO `schedule_job_log` VALUES (184, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:36:06');
INSERT INTO `schedule_job_log` VALUES (185, 2, 'noticeAlarmTask', '', 0, NULL, 30, '2020-12-22 22:36:10');
INSERT INTO `schedule_job_log` VALUES (186, 2, 'noticeAlarmTask', '', 0, NULL, 24, '2020-12-22 22:36:15');
INSERT INTO `schedule_job_log` VALUES (187, 2, 'noticeAlarmTask', '', 0, NULL, 24, '2020-12-22 22:36:20');
INSERT INTO `schedule_job_log` VALUES (188, 2, 'noticeAlarmTask', '', 0, NULL, 25, '2020-12-22 22:36:25');
INSERT INTO `schedule_job_log` VALUES (189, 2, 'noticeAlarmTask', '', 0, NULL, 903, '2020-12-22 22:36:30');
INSERT INTO `schedule_job_log` VALUES (190, 2, 'noticeAlarmTask', '', 0, NULL, 25, '2020-12-22 22:36:35');
INSERT INTO `schedule_job_log` VALUES (191, 2, 'noticeAlarmTask', '', 0, NULL, 806, '2020-12-22 22:36:40');
INSERT INTO `schedule_job_log` VALUES (192, 2, 'noticeAlarmTask', '', 0, NULL, 809, '2020-12-22 22:36:45');
INSERT INTO `schedule_job_log` VALUES (193, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:36:51');
INSERT INTO `schedule_job_log` VALUES (194, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:36:56');
INSERT INTO `schedule_job_log` VALUES (195, 2, 'noticeAlarmTask', '', 0, NULL, 879, '2020-12-22 22:37:00');
INSERT INTO `schedule_job_log` VALUES (196, 2, 'noticeAlarmTask', '', 0, NULL, 28, '2020-12-22 22:37:06');
INSERT INTO `schedule_job_log` VALUES (197, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:37:10');
INSERT INTO `schedule_job_log` VALUES (198, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:37:15');
INSERT INTO `schedule_job_log` VALUES (199, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:37:20');
INSERT INTO `schedule_job_log` VALUES (200, 2, 'noticeAlarmTask', '', 0, NULL, 25, '2020-12-22 22:37:25');
INSERT INTO `schedule_job_log` VALUES (201, 2, 'noticeAlarmTask', '', 0, NULL, 1818, '2020-12-22 22:37:30');
INSERT INTO `schedule_job_log` VALUES (202, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:37:35');
INSERT INTO `schedule_job_log` VALUES (203, 2, 'noticeAlarmTask', '', 0, NULL, 24, '2020-12-22 22:37:40');
INSERT INTO `schedule_job_log` VALUES (204, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:37:45');
INSERT INTO `schedule_job_log` VALUES (205, 2, 'noticeAlarmTask', '', 0, NULL, 27, '2020-12-22 22:37:52');
INSERT INTO `schedule_job_log` VALUES (206, 2, 'noticeAlarmTask', '', 0, NULL, 1829, '2020-12-22 22:37:55');
INSERT INTO `schedule_job_log` VALUES (207, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:38:00');
INSERT INTO `schedule_job_log` VALUES (208, 2, 'noticeAlarmTask', '', 0, NULL, 835, '2020-12-22 22:38:05');
INSERT INTO `schedule_job_log` VALUES (209, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:38:10');
INSERT INTO `schedule_job_log` VALUES (210, 2, 'noticeAlarmTask', '', 0, NULL, 874, '2020-12-22 22:38:15');
INSERT INTO `schedule_job_log` VALUES (211, 2, 'noticeAlarmTask', '', 0, NULL, 24, '2020-12-22 22:38:20');
INSERT INTO `schedule_job_log` VALUES (212, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:38:25');
INSERT INTO `schedule_job_log` VALUES (213, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:38:30');
INSERT INTO `schedule_job_log` VALUES (214, 2, 'noticeAlarmTask', '', 0, NULL, 834, '2020-12-22 22:38:35');
INSERT INTO `schedule_job_log` VALUES (215, 2, 'noticeAlarmTask', '', 0, NULL, 853, '2020-12-22 22:38:40');
INSERT INTO `schedule_job_log` VALUES (216, 2, 'noticeAlarmTask', '', 0, NULL, 1808, '2020-12-22 22:38:45');
INSERT INTO `schedule_job_log` VALUES (217, 2, 'noticeAlarmTask', '', 0, NULL, 871, '2020-12-22 22:38:50');
INSERT INTO `schedule_job_log` VALUES (218, 2, 'noticeAlarmTask', '', 0, NULL, 876, '2020-12-22 22:38:55');
INSERT INTO `schedule_job_log` VALUES (219, 2, 'noticeAlarmTask', '', 0, NULL, 21, '2020-12-22 22:39:02');
INSERT INTO `schedule_job_log` VALUES (220, 2, 'noticeAlarmTask', '', 0, NULL, 25, '2020-12-22 22:39:06');
INSERT INTO `schedule_job_log` VALUES (221, 2, 'noticeAlarmTask', '', 0, NULL, 20, '2020-12-22 22:39:10');
INSERT INTO `schedule_job_log` VALUES (222, 2, 'noticeAlarmTask', '', 0, NULL, 19, '2020-12-22 22:39:16');
INSERT INTO `schedule_job_log` VALUES (223, 2, 'noticeAlarmTask', '', 0, NULL, 830, '2020-12-22 22:39:20');
INSERT INTO `schedule_job_log` VALUES (224, 2, 'noticeAlarmTask', '', 0, NULL, 899, '2020-12-22 22:39:25');
INSERT INTO `schedule_job_log` VALUES (225, 2, 'noticeAlarmTask', '', 0, NULL, 26, '2020-12-22 22:39:31');
INSERT INTO `schedule_job_log` VALUES (226, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:39:36');
INSERT INTO `schedule_job_log` VALUES (227, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:39:40');
INSERT INTO `schedule_job_log` VALUES (228, 2, 'noticeAlarmTask', '', 0, NULL, 821, '2020-12-22 22:39:45');
INSERT INTO `schedule_job_log` VALUES (229, 2, 'noticeAlarmTask', '', 0, NULL, 19, '2020-12-22 22:39:50');
INSERT INTO `schedule_job_log` VALUES (230, 2, 'noticeAlarmTask', '', 0, NULL, 885, '2020-12-22 22:39:55');
INSERT INTO `schedule_job_log` VALUES (231, 2, 'noticeAlarmTask', '', 0, NULL, 19, '2020-12-22 22:40:00');
INSERT INTO `schedule_job_log` VALUES (232, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:40:05');
INSERT INTO `schedule_job_log` VALUES (233, 2, 'noticeAlarmTask', '', 0, NULL, 810, '2020-12-22 22:40:10');
INSERT INTO `schedule_job_log` VALUES (234, 2, 'noticeAlarmTask', '', 0, NULL, 21, '2020-12-22 22:40:16');
INSERT INTO `schedule_job_log` VALUES (235, 2, 'noticeAlarmTask', '', 0, NULL, 25, '2020-12-22 22:40:21');
INSERT INTO `schedule_job_log` VALUES (236, 2, 'noticeAlarmTask', '', 0, NULL, 21, '2020-12-22 22:40:26');
INSERT INTO `schedule_job_log` VALUES (237, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:40:30');
INSERT INTO `schedule_job_log` VALUES (238, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:40:35');
INSERT INTO `schedule_job_log` VALUES (239, 2, 'noticeAlarmTask', '', 0, NULL, 872, '2020-12-22 22:40:40');
INSERT INTO `schedule_job_log` VALUES (240, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:40:45');
INSERT INTO `schedule_job_log` VALUES (241, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:40:50');
INSERT INTO `schedule_job_log` VALUES (242, 2, 'noticeAlarmTask', '', 0, NULL, 819, '2020-12-22 22:40:55');
INSERT INTO `schedule_job_log` VALUES (243, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:41:00');
INSERT INTO `schedule_job_log` VALUES (244, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:41:05');
INSERT INTO `schedule_job_log` VALUES (245, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:41:10');
INSERT INTO `schedule_job_log` VALUES (246, 2, 'noticeAlarmTask', '', 0, NULL, 20, '2020-12-22 22:41:16');
INSERT INTO `schedule_job_log` VALUES (247, 2, 'noticeAlarmTask', '', 0, NULL, 840, '2020-12-22 22:41:20');
INSERT INTO `schedule_job_log` VALUES (248, 2, 'noticeAlarmTask', '', 0, NULL, 20, '2020-12-22 22:41:27');
INSERT INTO `schedule_job_log` VALUES (249, 2, 'noticeAlarmTask', '', 0, NULL, 20, '2020-12-22 22:41:31');
INSERT INTO `schedule_job_log` VALUES (250, 2, 'noticeAlarmTask', '', 0, NULL, 78, '2020-12-22 22:41:35');
INSERT INTO `schedule_job_log` VALUES (251, 2, 'noticeAlarmTask', '', 0, NULL, 1842, '2020-12-22 22:41:40');
INSERT INTO `schedule_job_log` VALUES (252, 2, 'noticeAlarmTask', '', 0, NULL, 20, '2020-12-22 22:41:46');
INSERT INTO `schedule_job_log` VALUES (253, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:41:51');
INSERT INTO `schedule_job_log` VALUES (254, 2, 'noticeAlarmTask', '', 0, NULL, 30, '2020-12-22 22:41:55');
INSERT INTO `schedule_job_log` VALUES (255, 2, 'noticeAlarmTask', '', 0, NULL, 824, '2020-12-22 22:42:00');
INSERT INTO `schedule_job_log` VALUES (256, 2, 'noticeAlarmTask', '', 0, NULL, 26, '2020-12-22 22:42:05');
INSERT INTO `schedule_job_log` VALUES (257, 2, 'noticeAlarmTask', '', 0, NULL, 818, '2020-12-22 22:42:10');
INSERT INTO `schedule_job_log` VALUES (258, 2, 'noticeAlarmTask', '', 0, NULL, 1934, '2020-12-22 22:42:15');
INSERT INTO `schedule_job_log` VALUES (259, 2, 'noticeAlarmTask', '', 0, NULL, 21, '2020-12-22 22:42:21');
INSERT INTO `schedule_job_log` VALUES (260, 2, 'noticeAlarmTask', '', 0, NULL, 817, '2020-12-22 22:42:25');
INSERT INTO `schedule_job_log` VALUES (261, 2, 'noticeAlarmTask', '', 0, NULL, 1880, '2020-12-22 22:42:30');
INSERT INTO `schedule_job_log` VALUES (262, 2, 'noticeAlarmTask', '', 0, NULL, 25, '2020-12-22 22:42:36');
INSERT INTO `schedule_job_log` VALUES (263, 2, 'noticeAlarmTask', '', 0, NULL, 856, '2020-12-22 22:42:40');
INSERT INTO `schedule_job_log` VALUES (264, 2, 'noticeAlarmTask', '', 0, NULL, 20, '2020-12-22 22:42:46');
INSERT INTO `schedule_job_log` VALUES (265, 2, 'noticeAlarmTask', '', 0, NULL, 24, '2020-12-22 22:42:51');
INSERT INTO `schedule_job_log` VALUES (266, 2, 'noticeAlarmTask', '', 0, NULL, 834, '2020-12-22 22:42:55');
INSERT INTO `schedule_job_log` VALUES (267, 2, 'noticeAlarmTask', '', 0, NULL, 846, '2020-12-22 22:43:00');
INSERT INTO `schedule_job_log` VALUES (268, 2, 'noticeAlarmTask', '', 0, NULL, 872, '2020-12-22 22:43:05');
INSERT INTO `schedule_job_log` VALUES (269, 2, 'noticeAlarmTask', '', 0, NULL, 823, '2020-12-22 22:43:10');
INSERT INTO `schedule_job_log` VALUES (270, 2, 'noticeAlarmTask', '', 0, NULL, 23, '2020-12-22 22:43:15');
INSERT INTO `schedule_job_log` VALUES (271, 2, 'noticeAlarmTask', '', 0, NULL, 812, '2020-12-22 22:43:20');
INSERT INTO `schedule_job_log` VALUES (272, 2, 'noticeAlarmTask', '', 0, NULL, 24, '2020-12-22 22:43:26');
INSERT INTO `schedule_job_log` VALUES (273, 2, 'noticeAlarmTask', '', 0, NULL, 20, '2020-12-22 22:43:31');
INSERT INTO `schedule_job_log` VALUES (274, 2, 'noticeAlarmTask', '', 0, NULL, 813, '2020-12-22 22:43:35');
INSERT INTO `schedule_job_log` VALUES (275, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:43:40');
INSERT INTO `schedule_job_log` VALUES (276, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:43:45');
INSERT INTO `schedule_job_log` VALUES (277, 2, 'noticeAlarmTask', '', 0, NULL, 824, '2020-12-22 22:43:50');
INSERT INTO `schedule_job_log` VALUES (278, 2, 'noticeAlarmTask', '', 0, NULL, 24, '2020-12-22 22:43:56');
INSERT INTO `schedule_job_log` VALUES (279, 2, 'noticeAlarmTask', '', 0, NULL, 24, '2020-12-22 22:44:00');
INSERT INTO `schedule_job_log` VALUES (280, 2, 'noticeAlarmTask', '', 0, NULL, 816, '2020-12-22 22:44:05');
INSERT INTO `schedule_job_log` VALUES (281, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:44:10');
INSERT INTO `schedule_job_log` VALUES (282, 2, 'noticeAlarmTask', '', 0, NULL, 811, '2020-12-22 22:44:15');
INSERT INTO `schedule_job_log` VALUES (283, 2, 'noticeAlarmTask', '', 0, NULL, 812, '2020-12-22 22:44:20');
INSERT INTO `schedule_job_log` VALUES (284, 2, 'noticeAlarmTask', '', 0, NULL, 22, '2020-12-22 22:44:25');
INSERT INTO `schedule_job_log` VALUES (285, 2, 'noticeAlarmTask', '', 0, NULL, 822, '2020-12-22 22:44:30');
INSERT INTO `schedule_job_log` VALUES (286, 2, 'noticeAlarmTask', '', 0, NULL, 880, '2020-12-22 22:44:35');
INSERT INTO `schedule_job_log` VALUES (287, 2, 'noticeAlarmTask', '', 0, NULL, 26, '2020-12-22 22:44:40');
INSERT INTO `schedule_job_log` VALUES (288, 2, 'noticeAlarmTask', '', 0, NULL, 816, '2020-12-22 22:44:46');
INSERT INTO `schedule_job_log` VALUES (289, 2, 'noticeAlarmTask', '', 0, NULL, 28, '2020-12-22 22:44:51');
INSERT INTO `schedule_job_log` VALUES (290, 2, 'noticeAlarmTask', '', 0, NULL, 31, '2020-12-22 22:44:55');
INSERT INTO `schedule_job_log` VALUES (291, 2, 'noticeAlarmTask', '', 0, NULL, 822, '2020-12-22 22:45:00');
INSERT INTO `schedule_job_log` VALUES (292, 2, 'noticeAlarmTask', '', 0, NULL, 887, '2020-12-22 22:45:05');
COMMIT;

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
BEGIN;
INSERT INTO `sys_captcha` VALUES ('07061a3d-00a5-4e79-862b-5b177935cf21', 'anea7', '2020-12-21 20:55:20');
INSERT INTO `sys_captcha` VALUES ('14863925-8f4c-4fca-87e5-8b08cf491d16', '6nb2f', '2020-12-22 21:29:45');
INSERT INTO `sys_captcha` VALUES ('24e2b940-63d5-4c85-8e41-aa7281c3b5d9', '2aa8x', '2020-12-22 22:34:54');
INSERT INTO `sys_captcha` VALUES ('2c9eabcd-801a-45f5-8691-318568015ee3', 'm75dm', '2020-12-21 23:43:28');
INSERT INTO `sys_captcha` VALUES ('356a3dc1-df5e-4572-8c49-cbc36797e7a6', '78f5y', '2020-12-22 22:33:38');
INSERT INTO `sys_captcha` VALUES ('373c1f6b-9c83-467c-8335-c82f5b3c9c7b', 'pw528', '2020-12-22 22:35:18');
INSERT INTO `sys_captcha` VALUES ('3efd0543-8acd-4519-81d9-e58fa61c0e90', '5g68n', '2020-12-22 20:35:56');
INSERT INTO `sys_captcha` VALUES ('56db360a-1857-4630-88cd-a29980be5a62', '5bpya', '2020-12-21 20:54:59');
INSERT INTO `sys_captcha` VALUES ('61f1432d-3165-4a6b-8e9d-7794b40380ab', '2n7wy', '2020-12-21 20:51:46');
INSERT INTO `sys_captcha` VALUES ('72baf603-36d2-4695-8a75-d3eb96084eb2', '63cc5', '2020-12-21 23:52:38');
INSERT INTO `sys_captcha` VALUES ('8aa4d2b4-a541-4e7f-8d57-d2b17f4e0816', '58nyy', '2020-12-21 23:55:37');
INSERT INTO `sys_captcha` VALUES ('91882dc5-a022-4ec3-8c03-2616dee0e290', 'mgyxw', '2020-12-21 23:55:37');
INSERT INTO `sys_captcha` VALUES ('b4f48976-2187-43c2-81d1-3863747f83b2', 'bw4yc', '2020-12-22 22:35:15');
INSERT INTO `sys_captcha` VALUES ('ff225018-e36e-46da-808c-c86e31fc6ed4', 'cg7bn', '2020-12-22 22:37:51');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8_bin DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `dept_type` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `approve_leader` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '审批负责人',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '', '中天高科', 0, '-1', NULL, NULL, '0', '0', '', NULL, '', NULL);
INSERT INTO `sys_dept` VALUES (101, 0, '0,101', '纪检部门1', 0, '1', '1', NULL, '0', '0', '', NULL, '', NULL);
INSERT INTO `sys_dept` VALUES (102, 0, '0,102', '纪检部门1', 0, '1', '1', NULL, '0', '0', '', NULL, '', NULL);
INSERT INTO `sys_dept` VALUES (103, 0, '0,103', '办事处1', 0, '2', '3', NULL, '0', '0', '', NULL, '', NULL);
INSERT INTO `sys_dept` VALUES (104, 0, '0,104', '办事处2', 0, '2', '3', NULL, '0', '0', '', NULL, '', NULL);
INSERT INTO `sys_dept` VALUES (105, 0, '0,105', '办事处3', 0, '2', '3', NULL, '0', '0', '', NULL, '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"项目管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"tubiao\",\"orderNum\":0}]', 52, '0:0:0:0:0:0:0:1', '2020-12-21 21:10:44');
INSERT INTO `sys_log` VALUES (2, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"计收管理\",\"url\":\"projec\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', 860, '0:0:0:0:0:0:0:1', '2020-12-21 21:12:29');
INSERT INTO `sys_log` VALUES (3, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"计收管理\",\"url\":\"project/check\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', 67, '0:0:0:0:0:0:0:1', '2020-12-21 21:12:46');
INSERT INTO `sys_log` VALUES (4, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"计收管理\",\"url\":\"project/check\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 74, '0:0:0:0:0:0:0:1', '2020-12-21 21:14:40');
INSERT INTO `sys_log` VALUES (5, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"纪检监督角色\",\"remark\":\"下发任务\",\"createUserId\":1,\"menuIdList\":[31,32,-666666],\"createTime\":\"Dec 22, 2020 1:52:50 PM\"}]', 3012, '0:0:0:0:0:0:0:1', '2020-12-22 13:52:52');
INSERT INTO `sys_log` VALUES (6, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"监督角色\",\"remark\":\"接受完成任务\",\"createUserId\":1,\"menuIdList\":[31,32,-666666],\"createTime\":\"Dec 22, 2020 1:53:35 PM\"}]', 2115, '0:0:0:0:0:0:0:1', '2020-12-22 13:53:37');
INSERT INTO `sys_log` VALUES (7, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"test\",\"password\":\"12d52712d3bc917e75ba457ce7485ee9fc81d4199e81912848ff8bbeed5fd784\",\"salt\":\"9cUJqVR4vCLPjBfmliJx\",\"email\":\"8765423@qq.com\",\"mobile\":\"18723456543\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Dec 22, 2020 1:54:10 PM\"}]', 2001, '0:0:0:0:0:0:0:1', '2020-12-22 13:54:11');
INSERT INTO `sys_log` VALUES (8, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"test2\",\"password\":\"2a74ff6161727aa1c800de77f89451a95d80aa72adfd50d69126c49ca88cddcc\",\"salt\":\"fRUMUBmdDnHm1jOEa1OL\",\"email\":\"88888@qq.com\",\"mobile\":\"17623456754\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Dec 22, 2020 1:54:42 PM\"}]', 1954, '0:0:0:0:0:0:0:1', '2020-12-22 13:54:44');
INSERT INTO `sys_log` VALUES (9, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":32,\"name\":\"新增\",\"url\":\"\",\"perms\":\"project:monitor:add\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 913, '0:0:0:0:0:0:0:1', '2020-12-22 16:20:22');
INSERT INTO `sys_log` VALUES (10, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"批量删除\",\"url\":\"\",\"perms\":\"project:monitor:batch\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 922, '0:0:0:0:0:0:0:1', '2020-12-22 16:21:06');
INSERT INTO `sys_log` VALUES (11, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":32,\"name\":\"查看详情\",\"url\":\"\",\"perms\":\"project:monitor:detail\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 904, '0:0:0:0:0:0:0:1', '2020-12-22 16:21:37');
INSERT INTO `sys_log` VALUES (12, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":32,\"name\":\"删除\",\"url\":\"\",\"perms\":\"project:monitor:del\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 2019, '0:0:0:0:0:0:0:1', '2020-12-22 16:22:06');
INSERT INTO `sys_log` VALUES (13, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":32,\"name\":\"任务反馈\",\"url\":\"\",\"perms\":\"project:monitor:feedback\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 96, '0:0:0:0:0:0:0:1', '2020-12-22 16:22:24');
INSERT INTO `sys_log` VALUES (14, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"纪检监督角色\",\"remark\":\"下发任务\",\"createUserId\":1,\"menuIdList\":[33,34,35,36,-666666,31,32]}]', 3969, '0:0:0:0:0:0:0:1', '2020-12-22 16:22:54');
INSERT INTO `sys_log` VALUES (15, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"监督角色\",\"remark\":\"接受完成任务\",\"createUserId\":1,\"menuIdList\":[37,-666666,31,32]}]', 2098, '0:0:0:0:0:0:0:1', '2020-12-22 16:23:15');
INSERT INTO `sys_log` VALUES (16, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":31,\"name\":\"消息中心\",\"url\":\"project/notice\",\"perms\":\"\",\"type\":1,\"icon\":\"pinglun\",\"orderNum\":0}]', 893, '0:0:0:0:0:0:0:1', '2020-12-22 17:39:42');
INSERT INTO `sys_log` VALUES (17, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"纪检监督角色\",\"remark\":\"下发任务\",\"createUserId\":1,\"menuIdList\":[33,34,35,36,38,-666666,31,32]}]', 4078, '0:0:0:0:0:0:0:1', '2020-12-22 17:47:47');
INSERT INTO `sys_log` VALUES (18, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"监督角色\",\"remark\":\"接受完成任务\",\"createUserId\":1,\"menuIdList\":[37,38,-666666,31,32]}]', 2996, '0:0:0:0:0:0:0:1', '2020-12-22 17:48:03');
INSERT INTO `sys_log` VALUES (19, 'admin', '保存定时任务', 'io.renren.modules.job.controller.ScheduleJobController.save()', '[{\"jobId\":2,\"beanName\":\"noticeAlarmTask\",\"params\":\"\",\"cronExpression\":\"0 0 12 * * ?\",\"status\":0,\"remark\":\"监督任务超时预警发送信息\",\"createTime\":\"Dec 22, 2020 10:17:21 PM\"}]', 2059, '0:0:0:0:0:0:0:1', '2020-12-22 22:17:22');
INSERT INTO `sys_log` VALUES (20, 'admin', '修改定时任务', 'io.renren.modules.job.controller.ScheduleJobController.update()', '[{\"jobId\":2,\"beanName\":\"noticeAlarmTask\",\"params\":\"\",\"cronExpression\":\"*/5 * * * * ?\",\"status\":0,\"remark\":\"监督任务超时预警发送信息\"}]', 2043, '0:0:0:0:0:0:0:1', '2020-12-22 22:18:31');
INSERT INTO `sys_log` VALUES (21, 'admin', '删除定时任务', 'io.renren.modules.job.controller.ScheduleJobController.delete()', '[[1]]', 3015, '0:0:0:0:0:0:0:1', '2020-12-22 22:20:28');
INSERT INTO `sys_log` VALUES (22, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"监督管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"tubiao\",\"orderNum\":0}]', 47, '0:0:0:0:0:0:0:1', '2020-12-22 22:24:27');
INSERT INTO `sys_log` VALUES (23, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"下发任务\",\"url\":\"project/check\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 67, '0:0:0:0:0:0:0:1', '2020-12-22 22:24:51');
INSERT INTO `sys_log` VALUES (24, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[5]', 0, '0:0:0:0:0:0:0:1', '2020-12-22 22:25:11');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (31, 0, '监督管理', '', '', 0, 'tubiao', 0);
INSERT INTO `sys_menu` VALUES (32, 31, '下发任务', 'project/check', '', 1, 'log', 0);
INSERT INTO `sys_menu` VALUES (33, 32, '新增', '', 'project:monitor:add', 2, '', 0);
INSERT INTO `sys_menu` VALUES (34, 32, '批量删除', '', 'project:monitor:batch', 2, '', 0);
INSERT INTO `sys_menu` VALUES (35, 32, '查看详情', '', 'project:monitor:detail', 2, '', 0);
INSERT INTO `sys_menu` VALUES (36, 32, '删除', '', 'project:monitor:del', 2, '', 0);
INSERT INTO `sys_menu` VALUES (37, 32, '任务反馈', '', 'project:monitor:feedback', 2, '', 0);
INSERT INTO `sys_menu` VALUES (38, 31, '消息中心', 'project/notice', '', 1, 'pinglun', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_monitor_check
-- ----------------------------
DROP TABLE IF EXISTS `sys_monitor_check`;
CREATE TABLE `sys_monitor_check` (
  `monitor_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `monitor_title` varchar(100) DEFAULT NULL COMMENT '监督标题',
  `monitor_task` text COMMENT '监督任务',
  `dept_id` varchar(10) DEFAULT NULL COMMENT '下发组织ID',
  `dept_name` varchar(255) DEFAULT NULL,
  `monitor_feed_back` text COMMENT '任务反馈',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_staff` int(11) DEFAULT NULL COMMENT '创建人',
  `create_staff_name` varchar(255) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `finish_staff` int(11) DEFAULT NULL COMMENT '完成人',
  `finish_staff_name` varchar(255) DEFAULT NULL,
  `monitor_state` varchar(10) DEFAULT NULL COMMENT '监督任务状态 0 未完成 1完成 2 超时',
  `state` varchar(10) DEFAULT NULL COMMENT '监督任务状态 A 有效 X 删除',
  PRIMARY KEY (`monitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='监督任务管理';

-- ----------------------------
-- Records of sys_monitor_check
-- ----------------------------
BEGIN;
INSERT INTO `sys_monitor_check` VALUES (11, '开展专项督导检查、专项治理', '<p style=\";text-align: center;font-family: 等线;font-size: 14px;white-space: normal\"><strong><span style=\"font-family: 宋体;font-size: 35px\"><span style=\"font-family:宋体\">十种监督形式</span></span></strong></p><p style=\";text-align: center;font-family: 等线;font-size: 14px;white-space: normal\"><span style=\"font-family: 宋体;font-size: 35px\">&nbsp;</span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">一、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">开展谈心谈话、座谈走访。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">二、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">听取专题汇报、参加民主生活会等重要会议。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">三、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">分析研判政治生态。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">四、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">开展专项督导检查、专项治理。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">五、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">建立完善党员领导干部廉政档案。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">六、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">把好党风廉政意见回复关。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">七、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">受理检举控告、处置问题线索。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">八、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">督促巡察整改落实。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">九、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">督促以案促改。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">十、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">提出纪检监察建议。</span></span></p><p><br/></p>', '103', '办事处1', '<p style=\";text-align: center;font-family: Calibri;font-size: 14px;white-space: normal\"><strong><span style=\"font-family: 宋体;font-size: 29px\"><span style=\"font-family:宋体\">民主监督</span></span></strong></p><p style=\";text-align: center;font-family: Calibri;font-size: 14px;white-space: normal\"><span style=\"font-family: 宋体;font-size: 29px\">&nbsp;</span></p><p style=\";font-family: Calibri;font-size: 14px;white-space: normal\"><span style=\"font-family: 仿宋;font-size: 21px\">&nbsp;&nbsp;&nbsp;&nbsp;1、成立职工委员会：选拔基层员工骨干组建职工监督管理委员会，参与企业管理，对各项重大事项及权力运行进行民主监督，保障公司重大决策阳光透明、科学合理、合乎民意</span></p><p style=\";font-family: Calibri;font-size: 14px;white-space: normal\"><span style=\"font-family: 仿宋;font-size: 21px\">&nbsp;&nbsp;&nbsp;&nbsp;2、深化企务公开：设立了党务政务公开栏，涉及党务、政务、财务、工程进度、工会等内容，使得办事流程更加清晰，部门职责更加明确，各项工作更加公开化、透明化，促进公司各项工作健康有序发展。</span></p><p style=\";font-family: Calibri;font-size: 14px;white-space: normal\"><span style=\"font-family: 仿宋;font-size: 21px\">&nbsp;&nbsp;&nbsp;&nbsp;3、畅通举报方式：设立纪检监察举报信箱，公开举报邮箱、电话等，进一步畅通信访举报渠道，规范信访举报办理流程，切实维护职工利益。</span></p><p><br/></p>', '2020-12-22 21:41:30', 2, 'test', '2020-12-22 21:43:17', 3, 'test2', '1', 'A');
INSERT INTO `sys_monitor_check` VALUES (12, '落实《党委会议事规则》，确立党组织讨论作为董事会、经理层决策重大问题的前置程序，会议记录规范完整', '<p style=\";text-align: justify;font-family: Calibri;font-size: 14px;white-space: normal\"><span style=\"font-family: 仿宋;font-size: 19px\">1、党委中心组学习每两个月不少于1次，全年不少于6次，其中意识形态学习不少于两次。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">2、领导班子把意识形态工作作为向党委会报告工作的重要内容，作为民主生活会和述职述廉报告的重要内容。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">3、党委书记作为第一责任人，带头抓意识形态工作，重要工作亲自部署，重大事件亲自处置。每年组织召开党委会会议专题研究意识形态工作不少于2次。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">4、班子成员负责分管部门和联系单位的意识形态工作，每年深入分管部门和联系单位不少于2次，开展意识形态专题教育，结合业务工作安排部署意识形态工作，听取意识形态工作汇报，检查意识形态工作开展情况。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">5、党群部门（宣信）加强对出版物、报告会、讲座等意识形态阵地的管理，确保导向正确。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">6、向各支部下发并学习贯彻《河南省党委（党组）网络意识形态工作责任制实施细则》，牢牢把握意识形体主动权。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">7、每年至少举办一次意识形态专题培训班，加强意识形态教育。8、排查本公司内意见领袖、网络大V、敏感人物等重点任务，梳理名单，重点教育引导，对各种错误思潮和言论敢于发声，依纪依规依法严肃处理</span></p><p><br/></p>', '104', '办事处2', NULL, '2020-12-15 21:44:11', 2, 'test', NULL, 0, NULL, '2', 'A');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8_bin NOT NULL COMMENT '公告类型',
  `notice_content` longtext COLLATE utf8_bin COMMENT '公告内容',
  `receive_staff` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES (15, '温馨提醒:你收到一条任务信息，请及时处理!', '0', '<p style=\";text-align: center;font-family: 等线;font-size: 14px;white-space: normal\"><strong><span style=\"font-family: 宋体;font-size: 35px\"><span style=\"font-family:宋体\">十种监督形式</span></span></strong></p><p style=\";text-align: center;font-family: 等线;font-size: 14px;white-space: normal\"><span style=\"font-family: 宋体;font-size: 35px\">&nbsp;</span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">一、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">开展谈心谈话、座谈走访。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">二、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">听取专题汇报、参加民主生活会等重要会议。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">三、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">分析研判政治生态。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">四、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">开展专项督导检查、专项治理。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">五、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">建立完善党员领导干部廉政档案。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">六、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">把好党风廉政意见回复关。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">七、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">受理检举控告、处置问题线索。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">八、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">督促巡察整改落实。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">九、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">督促以案促改。</span></span></p><p style=\"font-size: medium;white-space: normal;margin-left: 48px\"><span style=\"font-family: 仿宋;font-size: 21px\">十、&nbsp;</span><span style=\"font-family: 仿宋;font-size: 21px\"><span style=\"font-family:仿宋\">提出纪检监察建议。</span></span></p><p><br/></p>', '3', '1', NULL, '2020-12-22 21:41:30');
INSERT INTO `sys_notice` VALUES (16, '温馨提醒:你收到一条任务信息，请及时处理!', '0', '<p style=\";text-align: justify;font-family: Calibri;font-size: 14px;white-space: normal\"><span style=\"font-family: 仿宋;font-size: 19px\">1、党委中心组学习每两个月不少于1次，全年不少于6次，其中意识形态学习不少于两次。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">2、领导班子把意识形态工作作为向党委会报告工作的重要内容，作为民主生活会和述职述廉报告的重要内容。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">3、党委书记作为第一责任人，带头抓意识形态工作，重要工作亲自部署，重大事件亲自处置。每年组织召开党委会会议专题研究意识形态工作不少于2次。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">4、班子成员负责分管部门和联系单位的意识形态工作，每年深入分管部门和联系单位不少于2次，开展意识形态专题教育，结合业务工作安排部署意识形态工作，听取意识形态工作汇报，检查意识形态工作开展情况。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">5、党群部门（宣信）加强对出版物、报告会、讲座等意识形态阵地的管理，确保导向正确。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">6、向各支部下发并学习贯彻《河南省党委（党组）网络意识形态工作责任制实施细则》，牢牢把握意识形体主动权。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">7、每年至少举办一次意识形态专题培训班，加强意识形态教育。8、排查本公司内意见领袖、网络大V、敏感人物等重点任务，梳理名单，重点教育引导，对各种错误思潮和言论敢于发声，依纪依规依法严肃处理</span></p><p><br/></p>', '3', '1', NULL, '2020-12-22 21:44:11');
INSERT INTO `sys_notice` VALUES (17, '预警通知:你收到一条任务信息即将超时，请及时处理!', '1', '<p style=\";text-align: justify;font-family: Calibri;font-size: 14px;white-space: normal\"><span style=\"font-family: 仿宋;font-size: 19px\">1、党委中心组学习每两个月不少于1次，全年不少于6次，其中意识形态学习不少于两次。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">2、领导班子把意识形态工作作为向党委会报告工作的重要内容，作为民主生活会和述职述廉报告的重要内容。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">3、党委书记作为第一责任人，带头抓意识形态工作，重要工作亲自部署，重大事件亲自处置。每年组织召开党委会会议专题研究意识形态工作不少于2次。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">4、班子成员负责分管部门和联系单位的意识形态工作，每年深入分管部门和联系单位不少于2次，开展意识形态专题教育，结合业务工作安排部署意识形态工作，听取意识形态工作汇报，检查意识形态工作开展情况。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">5、党群部门（宣信）加强对出版物、报告会、讲座等意识形态阵地的管理，确保导向正确。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">6、向各支部下发并学习贯彻《河南省党委（党组）网络意识形态工作责任制实施细则》，牢牢把握意识形体主动权。</span><span style=\"font-family: 仿宋;font-size: 19px\"><br/></span><span style=\"font-family: 仿宋;font-size: 19px\">7、每年至少举办一次意识形态专题培训班，加强意识形态教育。8、排查本公司内意见领袖、网络大V、敏感人物等重点任务，梳理名单，重点教育引导，对各种错误思潮和言论敢于发声，依纪依规依法严肃处理</span></p><p><br/></p>', '3', '0', NULL, '2020-12-22 22:36:01');
COMMIT;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '纪检监督角色', '下发任务', 1, '2020-12-22 13:52:50');
INSERT INTO `sys_role` VALUES (2, '监督角色', '接受完成任务', 1, '2020-12-22 13:53:35');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (18, 1, 33);
INSERT INTO `sys_role_menu` VALUES (19, 1, 34);
INSERT INTO `sys_role_menu` VALUES (20, 1, 35);
INSERT INTO `sys_role_menu` VALUES (21, 1, 36);
INSERT INTO `sys_role_menu` VALUES (22, 1, 38);
INSERT INTO `sys_role_menu` VALUES (23, 1, -666666);
INSERT INTO `sys_role_menu` VALUES (24, 1, 31);
INSERT INTO `sys_role_menu` VALUES (25, 1, 32);
INSERT INTO `sys_role_menu` VALUES (26, 2, 37);
INSERT INTO `sys_role_menu` VALUES (27, 2, 38);
INSERT INTO `sys_role_menu` VALUES (28, 2, -666666);
INSERT INTO `sys_role_menu` VALUES (29, 2, 31);
INSERT INTO `sys_role_menu` VALUES (30, 2, 32);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (2, 'test', '12d52712d3bc917e75ba457ce7485ee9fc81d4199e81912848ff8bbeed5fd784', '9cUJqVR4vCLPjBfmliJx', '8765423@qq.com', '18723456543', 1, 1, '2020-12-22 13:54:10');
INSERT INTO `sys_user` VALUES (3, 'test2', '2a74ff6161727aa1c800de77f89451a95d80aa72adfd50d69126c49ca88cddcc', 'fRUMUBmdDnHm1jOEa1OL', '88888@qq.com', '17623456754', 1, 1, '2020-12-22 13:54:42');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 2, 1);
INSERT INTO `sys_user_role` VALUES (2, 3, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_token` VALUES (1, 'a1cd50542426db6981d3274f95f46779', '2020-12-23 10:35:42', '2020-12-22 22:35:42');
INSERT INTO `sys_user_token` VALUES (2, 'a86bc264c953dde419a3f52e5cc60556', '2020-12-23 09:38:49', '2020-12-22 21:38:49');
INSERT INTO `sys_user_token` VALUES (3, '34d262cbf7085e58aa0f0efa4cebc2a1', '2020-12-23 09:26:20', '2020-12-22 21:26:20');
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
