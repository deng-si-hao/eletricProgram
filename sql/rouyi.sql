/*
 Navicat Premium Data Transfer

 Source Server         : culture
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : rouyi

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 30/10/2020 17:28:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (11, 'sys_asset', '车辆信息表', 'SysAsset', 'crud', 'com.ruoyi.system', 'system', 'asset', '车辆信息', 'd', '0', '/', NULL, 'admin', '2020-10-16 16:44:40', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'sys_device', '数据采集通道表', 'SysDevice', 'crud', 'com.ruoyi.system', 'system', 'device', '数据采集通道', 'd', '0', '/', NULL, 'admin', '2020-10-16 16:44:40', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (13, 'sys_picture', '图片存储表', 'SysPicture', 'crud', 'com.ruoyi.system', 'system', 'picture', '图片存储', 'd', '0', '/', NULL, 'admin', '2020-10-16 16:44:55', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (15, 'sys_report', '文档存储表', 'SysReport', 'crud', 'com.ruoyi.system', 'system', 'report', '文档存储', 'd', '0', '/', NULL, 'admin', '2020-10-16 16:53:46', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (104, '11', 'id', '主键', 'bigint(18)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (105, '11', 'name', '车辆名称', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (106, '11', 'type', '车辆类别', 'varchar(20)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (107, '11', 'additional_info', '车辆详情', 'varchar(255)', 'String', 'additionalInfo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (108, '11', 'tenant_id', '租户id', 'int(18)', 'Long', 'tenantId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (109, '11', 'unit', '所属单位', 'varchar(64)', 'String', 'unit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (110, '11', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (111, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (112, '11', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (113, '11', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (114, '12', 'id', '主键', 'bigint(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (115, '12', 'name', '采集通道名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (116, '12', 'type', '数据类型', 'varchar(10)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (117, '12', 'additional_info', '备注', 'varchar(255)', 'String', 'additionalInfo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (118, '12', 'asset_id', '所属车辆id', 'bigint(11)', 'Long', 'assetId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (119, '12', 'unit', '所属单位', 'varchar(64)', 'String', 'unit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (120, '12', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (121, '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (122, '12', 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (123, '12', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2020-10-16 16:44:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (124, '13', 'id', '主键', 'bigint(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-10-16 16:44:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (125, '13', 'name', '图片名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-10-16 16:44:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (126, '13', 'picture_folder_id', '图片所属文件夹id', 'int(11)', 'Long', 'pictureFolderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-10-16 16:44:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (127, '13', 'picture_path', '图片所属文件夹路径', 'varchar(100)', 'String', 'picturePath', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-10-16 16:44:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (128, '13', 'time', '上传时间', 'datetime', 'Date', 'time', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-10-16 16:44:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (129, '13', 'additional_info', '备注', 'varchar(255)', 'String', 'additionalInfo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-10-16 16:44:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (130, '13', 'asset_id', '所属车辆id', 'bigint(11)', 'Long', 'assetId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-10-16 16:44:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (131, '13', 'unit', '所属单位', 'varchar(64)', 'String', 'unit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-10-16 16:44:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (132, '13', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2020-10-16 16:44:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (133, '13', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2020-10-16 16:44:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (134, '13', 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2020-10-16 16:44:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (135, '13', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2020-10-16 16:44:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (146, '15', 'id', '主键', 'bigint(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-10-16 16:53:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (147, '15', 'name', '文件名称', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-10-16 16:53:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (148, '15', 'report_path', '文件所属路径', 'varchar(100)', 'String', 'reportPath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-10-16 16:53:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (149, '15', 'time', '上传时间', 'datetime', 'Date', 'time', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2020-10-16 16:53:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (150, '15', 'additional_info', '备注', 'varchar(255)', 'String', 'additionalInfo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-10-16 16:53:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (151, '15', 'asset_id', '所属车辆id', 'bigint(11)', 'Long', 'assetId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-10-16 16:53:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (152, '15', 'unit', '所属单位', 'varchar(64)', 'String', 'unit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-10-16 16:53:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (153, '15', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2020-10-16 16:53:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (154, '15', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2020-10-16 16:53:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (155, '15', 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2020-10-16 16:53:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (156, '15', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2020-10-16 16:53:46', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'LAPTOP-SEEH44PH1604043842245', 1604049471001, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1604043850000, -1, 5, 'PAUSED', 'CRON', 1604043842000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1604043855000, -1, 5, 'PAUSED', 'CRON', 1604043842000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1604043860000, -1, 5, 'PAUSED', 'CRON', 1604043842000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_asset
-- ----------------------------
DROP TABLE IF EXISTS `sys_asset`;
CREATE TABLE `sys_asset`  (
  `id` bigint(18) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆类别',
  `additional_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆详情',
  `tenant_id` int(18) NULL DEFAULT NULL COMMENT '租户id',
  `unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属单位',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车辆信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_asset
-- ----------------------------
INSERT INTO `sys_asset` VALUES (20101379698698, '长安福特', '小轿车', '阿斯顿撒法', 100012, '研发部门', NULL, '2020-10-13 15:59:11', NULL, '2020-10-19 15:37:07');
INSERT INTO `sys_asset` VALUES (20101697258869, '大', '1', '啊实打实', 54643, '市场部门', NULL, '2020-10-16 10:25:47', NULL, '2020-10-19 15:52:41');
INSERT INTO `sys_asset` VALUES (20101996454907, '一汽奥迪', '小轿车', '阿松大', 107, '运维部门', NULL, '2020-10-19 16:30:18', NULL, '2020-10-19 16:34:16');
INSERT INTO `sys_asset` VALUES (20102013068400, '长安', '小轿车', '长安汽车', 107, '运维部门', NULL, '2020-10-20 17:34:52', NULL, '2020-10-20 17:35:07');
INSERT INTO `sys_asset` VALUES (20102614345261, '123', '1', '123', 105, '测试部门', NULL, '2020-10-26 17:53:06', NULL, '2020-10-26 17:53:23');

-- ----------------------------
-- Table structure for sys_channel
-- ----------------------------
DROP TABLE IF EXISTS `sys_channel`;
CREATE TABLE `sys_channel`  (
  `channel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '通道id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '一级目录id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `channel_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '通道名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `car_id` bigint(20) NULL DEFAULT NULL COMMENT '所属车辆id',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集通道' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_channel
-- ----------------------------
INSERT INTO `sys_channel` VALUES (202, 0, '0', '电源控制器', 1, NULL, 1, '', '2020-10-20 21:16:35', '', NULL);
INSERT INTO `sys_channel` VALUES (203, 202, '0,202', '抽尘复位状态', 1, NULL, 1, '', NULL, '', NULL);
INSERT INTO `sys_channel` VALUES (204, 202, '0,202', '抽尘过载', 2, NULL, 1, '', NULL, '', NULL);
INSERT INTO `sys_channel` VALUES (205, 202, '0,202', '发电电流', 3, NULL, 1, '', NULL, '', NULL);
INSERT INTO `sys_channel` VALUES (206, 0, '0', '发动机', 2, NULL, 1, '', NULL, '', NULL);
INSERT INTO `sys_channel` VALUES (207, 206, '0,206', '发动机排温', 1, NULL, 1, '', NULL, '', NULL);
INSERT INTO `sys_channel` VALUES (208, 206, '0,206', '冷却水温传感器', 2, NULL, 1, '', NULL, '', NULL);
INSERT INTO `sys_channel` VALUES (209, 206, '0,206', '发动机水温', 3, NULL, 1, '', NULL, '', NULL);
INSERT INTO `sys_channel` VALUES (210, 206, '0,206', '燃油温度', 4, NULL, 1, '', NULL, '', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '创新中心', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_device
-- ----------------------------
DROP TABLE IF EXISTS `sys_device`;
CREATE TABLE `sys_device`  (
  `id` bigint(11) NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采集通道名称',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据类型',
  `additional_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `asset_id` bigint(11) NOT NULL COMMENT '所属车辆id',
  `unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属单位',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `asset_id`(`asset_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据采集通道表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_device
-- ----------------------------
INSERT INTO `sys_device` VALUES (20101407977239, '132', '湿度数据', '123', 20101379698698, '研发部门', 'admin', '2020-10-14 10:43:08', NULL, '2020-10-19 17:48:47');
INSERT INTO `sys_device` VALUES (20101672382216, '椰林整车温湿度5分钟数据7.01-7.11.xlsx', '温度数据', '收到', 20101379698698, '研发部门', NULL, '2020-10-16 10:26:42', NULL, '2020-10-20 17:36:09');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 1, 'SUV', '1', 'sys_asset_type', NULL, NULL, 'N', '0', 'admin', '2020-10-12 17:27:51', '', NULL, '城市越野类型');
INSERT INTO `sys_dict_data` VALUES (30, 2, '小轿车', '小轿车', 'sys_asset_type', NULL, NULL, 'N', '0', 'admin', '2020-10-12 17:28:27', '', NULL, '小轿车');
INSERT INTO `sys_dict_data` VALUES (31, 1, '温度数据', '温度数据', 'sys_device_type', NULL, NULL, 'N', '0', 'admin', '2020-10-14 09:06:25', '', NULL, '检测温度数据');
INSERT INTO `sys_dict_data` VALUES (32, 2, '湿度数据', '湿度数据', 'sys_device_type', NULL, NULL, 'N', '0', 'admin', '2020-10-14 09:06:46', '', NULL, '检测湿度数据');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '车辆类型', 'sys_asset_type', '0', 'admin', '2020-10-12 17:26:56', '', NULL, '车辆类型字典列表');
INSERT INTO `sys_dict_type` VALUES (12, '数据采集类型', 'sys_device_type', '0', 'admin', '2020-10-14 09:05:31', 'admin', '2020-10-14 09:05:53', '数据采集类型列表');

-- ----------------------------
-- Table structure for sys_folder
-- ----------------------------
DROP TABLE IF EXISTS `sys_folder`;
CREATE TABLE `sys_folder`  (
  `id` bigint(11) NOT NULL COMMENT '主键',
  `asset_id` bigint(11) NOT NULL COMMENT '车辆id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件夹名称',
  `additional_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情',
  `tenant_id` int(11) NULL DEFAULT NULL COMMENT '所属租户',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件夹类型',
  `unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属单位',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `asset_id`(`asset_id`) USING BTREE,
  CONSTRAINT `sys_folder_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件储存路径表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_folder
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 343 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-08-11 09:08:48');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-11 09:08:56');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-08-11 09:09:50');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-11 09:14:32');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-08-11 09:17:54');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-11 09:17:59');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-08-11 10:29:37');
INSERT INTO `sys_logininfor` VALUES (107, '财务助理', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-11 10:29:51');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-12 11:02:49');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-12 11:07:24');
INSERT INTO `sys_logininfor` VALUES (110, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-12 11:07:33');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-12 14:28:53');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-10-12 17:00:11');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-12 17:00:16');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-12 17:43:39');
INSERT INTO `sys_logininfor` VALUES (115, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-10-12 17:43:49');
INSERT INTO `sys_logininfor` VALUES (116, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-12 17:43:54');
INSERT INTO `sys_logininfor` VALUES (117, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-12 17:44:15');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-12 17:44:20');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-12 17:45:18');
INSERT INTO `sys_logininfor` VALUES (120, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-12 17:45:27');
INSERT INTO `sys_logininfor` VALUES (121, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-12 17:46:27');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-12 17:46:31');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-12 17:47:57');
INSERT INTO `sys_logininfor` VALUES (124, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-12 17:48:05');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-10-13 08:46:43');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-13 08:46:47');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-13 09:48:41');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-13 13:50:34');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-13 15:57:49');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-13 16:50:18');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-14 08:46:54');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-14 13:45:09');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-14 16:09:18');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-14 17:02:07');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-14 18:07:24');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 08:59:15');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 10:16:21');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 13:53:16');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 15:06:01');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 15:06:07');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:13:40');
INSERT INTO `sys_logininfor` VALUES (142, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:13:49');
INSERT INTO `sys_logininfor` VALUES (143, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:16:34');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:16:38');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:18:17');
INSERT INTO `sys_logininfor` VALUES (146, 'test01', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-10-15 16:18:24');
INSERT INTO `sys_logininfor` VALUES (147, 'test01', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 4', '2020-10-15 16:18:29');
INSERT INTO `sys_logininfor` VALUES (148, 'test01', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 4', '2020-10-15 16:18:33');
INSERT INTO `sys_logininfor` VALUES (149, 'test01', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-10-15 16:18:38');
INSERT INTO `sys_logininfor` VALUES (150, 'test01', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 4', '2020-10-15 16:18:42');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:19:01');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:19:26');
INSERT INTO `sys_logininfor` VALUES (153, 'test01', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 4', '2020-10-15 16:19:35');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:19:55');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:21:39');
INSERT INTO `sys_logininfor` VALUES (156, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:21:48');
INSERT INTO `sys_logininfor` VALUES (157, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:22:56');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:23:00');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:24:02');
INSERT INTO `sys_logininfor` VALUES (160, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:24:11');
INSERT INTO `sys_logininfor` VALUES (161, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:24:26');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:24:30');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:24:48');
INSERT INTO `sys_logininfor` VALUES (164, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:24:57');
INSERT INTO `sys_logininfor` VALUES (165, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:25:34');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:25:37');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:25:51');
INSERT INTO `sys_logininfor` VALUES (168, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:25:59');
INSERT INTO `sys_logininfor` VALUES (169, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:26:53');
INSERT INTO `sys_logininfor` VALUES (170, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:27:02');
INSERT INTO `sys_logininfor` VALUES (171, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:27:14');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:27:23');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:27:36');
INSERT INTO `sys_logininfor` VALUES (174, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:27:45');
INSERT INTO `sys_logininfor` VALUES (175, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-15 16:35:47');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-15 16:35:51');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 08:46:30');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 09:45:26');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 11:19:52');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 11:20:17');
INSERT INTO `sys_logininfor` VALUES (181, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 11:20:25');
INSERT INTO `sys_logininfor` VALUES (182, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 11:30:54');
INSERT INTO `sys_logininfor` VALUES (183, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 11:31:02');
INSERT INTO `sys_logininfor` VALUES (184, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 13:39:27');
INSERT INTO `sys_logininfor` VALUES (185, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 13:44:26');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 13:44:32');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 13:47:38');
INSERT INTO `sys_logininfor` VALUES (188, 'boss', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 13:47:45');
INSERT INTO `sys_logininfor` VALUES (189, 'boss', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:20:45');
INSERT INTO `sys_logininfor` VALUES (190, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:20:53');
INSERT INTO `sys_logininfor` VALUES (191, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:23:32');
INSERT INTO `sys_logininfor` VALUES (192, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:23:42');
INSERT INTO `sys_logininfor` VALUES (193, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:27:25');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:27:29');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:34:35');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:34:39');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:34:52');
INSERT INTO `sys_logininfor` VALUES (198, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:35:03');
INSERT INTO `sys_logininfor` VALUES (199, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:36:47');
INSERT INTO `sys_logininfor` VALUES (200, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:36:58');
INSERT INTO `sys_logininfor` VALUES (201, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:37:19');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:37:23');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:37:56');
INSERT INTO `sys_logininfor` VALUES (204, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:38:04');
INSERT INTO `sys_logininfor` VALUES (205, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:38:49');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:38:57');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:39:38');
INSERT INTO `sys_logininfor` VALUES (208, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:39:46');
INSERT INTO `sys_logininfor` VALUES (209, 'test02', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:41:11');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:41:14');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:41:26');
INSERT INTO `sys_logininfor` VALUES (212, 'test01', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 4', '2020-10-16 14:41:34');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:41:42');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:42:21');
INSERT INTO `sys_logininfor` VALUES (215, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:42:30');
INSERT INTO `sys_logininfor` VALUES (216, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:43:03');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:43:06');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:46:42');
INSERT INTO `sys_logininfor` VALUES (219, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:46:49');
INSERT INTO `sys_logininfor` VALUES (220, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:49:13');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:49:17');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:49:35');
INSERT INTO `sys_logininfor` VALUES (223, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:49:41');
INSERT INTO `sys_logininfor` VALUES (224, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 14:52:19');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 14:52:23');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 15:19:11');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 15:19:14');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 15:19:49');
INSERT INTO `sys_logininfor` VALUES (229, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 15:19:55');
INSERT INTO `sys_logininfor` VALUES (230, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 15:20:49');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 15:20:55');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 15:24:31');
INSERT INTO `sys_logininfor` VALUES (233, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 15:24:37');
INSERT INTO `sys_logininfor` VALUES (234, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 15:25:21');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 15:25:26');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 15:26:26');
INSERT INTO `sys_logininfor` VALUES (237, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 15:26:42');
INSERT INTO `sys_logininfor` VALUES (238, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 15:27:43');
INSERT INTO `sys_logininfor` VALUES (239, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 15:27:50');
INSERT INTO `sys_logininfor` VALUES (240, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 15:28:25');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-10-16 15:28:29');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 15:28:34');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 15:29:50');
INSERT INTO `sys_logininfor` VALUES (244, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 15:29:58');
INSERT INTO `sys_logininfor` VALUES (245, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 15:48:16');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 15:48:20');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 15:49:18');
INSERT INTO `sys_logininfor` VALUES (248, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 15:49:26');
INSERT INTO `sys_logininfor` VALUES (249, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 15:50:46');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 15:50:50');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 16:09:34');
INSERT INTO `sys_logininfor` VALUES (252, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 16:09:40');
INSERT INTO `sys_logininfor` VALUES (253, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 16:10:53');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 16:10:57');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 16:25:16');
INSERT INTO `sys_logininfor` VALUES (256, 'yqgs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 16:25:24');
INSERT INTO `sys_logininfor` VALUES (257, 'yqgs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 16:42:22');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 16:42:26');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 17:52:41');
INSERT INTO `sys_logininfor` VALUES (260, 'yqgs', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-10-16 17:52:50');
INSERT INTO `sys_logininfor` VALUES (261, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 17:52:58');
INSERT INTO `sys_logininfor` VALUES (262, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-16 17:54:03');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-16 17:54:06');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-19 08:58:31');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-19 10:38:38');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-19 13:43:26');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-19 15:48:19');
INSERT INTO `sys_logininfor` VALUES (268, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-19 15:48:27');
INSERT INTO `sys_logininfor` VALUES (269, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-19 15:50:51');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-19 15:50:56');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-19 15:51:08');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-19 15:52:22');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-19 15:52:45');
INSERT INTO `sys_logininfor` VALUES (274, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-19 15:52:53');
INSERT INTO `sys_logininfor` VALUES (275, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-19 15:54:26');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-19 15:54:30');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-19 15:54:51');
INSERT INTO `sys_logininfor` VALUES (278, 'boss', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-19 15:54:56');
INSERT INTO `sys_logininfor` VALUES (279, 'boss', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-19 15:56:24');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-19 15:56:29');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 08:42:47');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 13:48:17');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-20 13:48:30');
INSERT INTO `sys_logininfor` VALUES (284, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 13:48:37');
INSERT INTO `sys_logininfor` VALUES (285, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-20 13:49:28');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 13:49:32');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 15:58:04');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-20 16:32:46');
INSERT INTO `sys_logininfor` VALUES (289, 'xtgly', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-10-20 16:32:57');
INSERT INTO `sys_logininfor` VALUES (290, 'xtgly', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-10-20 16:33:05');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 16:33:13');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-20 16:33:42');
INSERT INTO `sys_logininfor` VALUES (293, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 16:33:48');
INSERT INTO `sys_logininfor` VALUES (294, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-20 16:34:47');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 16:34:51');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-20 16:44:37');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 16:44:40');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 16:53:38');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-20 17:33:44');
INSERT INTO `sys_logininfor` VALUES (300, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 17:33:51');
INSERT INTO `sys_logininfor` VALUES (301, 'aaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-10-20 17:34:04');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 17:34:07');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-21 08:46:05');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-21 10:13:52');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-21 14:45:40');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-21 16:25:54');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-23 09:59:33');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-23 10:40:04');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-23 11:25:13');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-23 14:07:16');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '192.168.50.108', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-23 14:26:19');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '192.168.50.108', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-23 15:26:00');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '192.168.50.108', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-23 17:09:53');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-23 18:01:12');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-26 08:58:48');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-26 09:34:18');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-10-26 11:27:35');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-26 11:27:40');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-26 14:21:01');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-26 15:14:47');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-26 15:55:20');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-26 16:52:34');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-26 17:26:50');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-27 08:48:22');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-27 10:51:14');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-27 14:25:02');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-27 15:03:56');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-27 16:35:55');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-28 08:46:38');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-28 10:25:04');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-28 14:15:45');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-28 15:11:04');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-28 16:27:55');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-28 17:36:19');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-10-29 08:58:36');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-29 08:58:40');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-29 15:39:51');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-29 16:10:14');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-30 10:48:56');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-30 10:55:42');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-30 13:37:33');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-30 15:44:13');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1118 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 'M', '0', '0', '', 'system', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 'M', '0', '0', '', 'monitor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 'M', '0', '0', '', 'tool', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 1, 'M', '0', '0', '', 'log', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', '0', '0', 'system:user:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', '0', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', '0', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', '0', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 'F', '0', '0', 'system:role:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 'F', '0', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 'F', '0', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 'F', '0', '0', 'system:post:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 'F', '0', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 'F', '0', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 'F', '0', '0', 'system:config:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 'F', '0', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 'F', '0', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 1, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 1, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 1, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 114, 2, '#', '', 1, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 1, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 1, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1061, '车辆信息', 3, 1, 'asset', 'system/asset/index', 1, 'C', '0', '0', 'system:asset:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '车辆信息菜单');
INSERT INTO `sys_menu` VALUES (1062, '车辆信息查询', 1061, 1, '#', '', 1, 'F', '0', '0', 'system:asset:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1063, '车辆信息新增', 1061, 2, '#', '', 1, 'F', '0', '0', 'system:asset:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1064, '车辆信息修改', 1061, 3, '#', '', 1, 'F', '0', '0', 'system:asset:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1065, '车辆信息删除', 1061, 4, '#', '', 1, 'F', '0', '0', 'system:asset:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1066, '车辆信息导出', 1061, 5, '#', '', 1, 'F', '0', '0', 'system:asset:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1067, '数据采集通道', 3, 1, 'device', 'system/device/index', 1, 'C', '0', '0', 'system:device:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '数据采集通道菜单');
INSERT INTO `sys_menu` VALUES (1068, '数据采集通道查询', 1067, 1, '#', '', 1, 'F', '0', '0', 'system:device:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1069, '数据采集通道新增', 1067, 2, '#', '', 1, 'F', '0', '0', 'system:device:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1070, '数据采集通道修改', 1067, 3, '#', '', 1, 'F', '0', '0', 'system:device:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1071, '数据采集通道删除', 1067, 4, '#', '', 1, 'F', '0', '0', 'system:device:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1072, '数据采集通道导出', 1067, 5, '#', '', 1, 'F', '0', '0', 'system:device:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1073, '图片存储', 3, 1, 'picture', 'system/picture/index', 1, 'C', '0', '0', 'system:picture:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '图片存储菜单');
INSERT INTO `sys_menu` VALUES (1074, '图片存储查询', 1073, 1, '#', '', 1, 'F', '0', '0', 'system:picture:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1075, '图片存储新增', 1073, 2, '#', '', 1, 'F', '0', '0', 'system:picture:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1076, '图片存储修改', 1073, 3, '#', '', 1, 'F', '0', '0', 'system:picture:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1077, '图片存储删除', 1073, 4, '#', '', 1, 'F', '0', '0', 'system:picture:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1078, '图片存储导出', 1073, 5, '#', '', 1, 'F', '0', '0', 'system:picture:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1079, '文件储存路径', 3, 1, 'folder', 'system/folder/index', 1, 'C', '0', '0', 'system:folder:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '文件储存路径菜单');
INSERT INTO `sys_menu` VALUES (1080, '文件储存路径查询', 1079, 1, '#', '', 1, 'F', '0', '0', 'system:folder:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1081, '文件储存路径新增', 1079, 2, '#', '', 1, 'F', '0', '0', 'system:folder:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1082, '文件储存路径修改', 1079, 3, '#', '', 1, 'F', '0', '0', 'system:folder:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1083, '文件储存路径删除', 1079, 4, '#', '', 1, 'F', '0', '0', 'system:folder:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1084, '文件储存路径导出', 1079, 5, '#', '', 1, 'F', '0', '0', 'system:folder:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1085, '文档存储', 3, 1, 'report', 'system/report/index', 1, 'C', '0', '0', 'system:report:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '文档存储菜单');
INSERT INTO `sys_menu` VALUES (1086, '文档存储查询', 1085, 1, '#', '', 1, 'F', '0', '0', 'system:report:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1087, '文档存储新增', 1085, 2, '#', '', 1, 'F', '0', '0', 'system:report:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1088, '文档存储修改', 1085, 3, '#', '', 1, 'F', '0', '0', 'system:report:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1089, '文档存储删除', 1085, 4, '#', '', 1, 'F', '0', '0', 'system:report:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1090, '文档存储导出', 1085, 5, '#', '', 1, 'F', '0', '0', 'system:report:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1091, '数据管理', 0, 5, 'systems', NULL, 1, 'M', '0', '0', '', 'exit-fullscreen', 'admin', '2020-10-13 14:08:44', 'admin', '2020-10-28 08:52:55', '');
INSERT INTO `sys_menu` VALUES (1092, '车辆管理', 1091, 1, 'asset', 'system/asset/index', 1, 'C', '0', '0', 'system:asset:list', 'dashboard', 'admin', '2020-10-13 14:22:32', 'admin', '2020-10-13 17:38:11', '');
INSERT INTO `sys_menu` VALUES (1093, '车辆查询', 1092, 1, '', NULL, 1, 'F', '0', '0', 'system:asset:query', '#', 'admin', '2020-10-13 14:23:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1094, '车辆删除', 1092, 2, '', NULL, 1, 'F', '0', '0', 'system:asset:remove', '#', 'admin', '2020-10-13 14:24:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1095, '车辆新增', 1092, 3, '', NULL, 1, 'F', '0', '0', 'system:asset:add', '#', 'admin', '2020-10-13 14:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1097, '采集数据', 1091, 2, 'device', 'system/device/index', 1, 'C', '0', '0', 'system:device:list', 'build', 'admin', '2020-10-13 17:21:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1098, '上传报告', 1091, 3, 'report', 'system/report/index', 1, 'C', '0', '0', 'system:report:list', 'zip', 'admin', '2020-10-13 17:22:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1099, '上传图片', 1091, 4, 'picture', 'system/picture/index', 1, 'C', '0', '0', 'system:picture:list', 'chart', 'admin', '2020-10-13 17:23:51', 'admin', '2020-10-13 17:58:29', '');
INSERT INTO `sys_menu` VALUES (1101, '查询', 1097, 1, '', NULL, 1, 'F', '0', '0', 'system:device:query', '#', 'admin', '2020-10-13 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1102, '添加', 1097, 2, '', NULL, 1, 'F', '0', '0', 'system:device:add', '#', 'admin', '2020-10-13 17:56:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1103, '查询', 1098, 1, '', NULL, 1, 'F', '0', '0', 'system:report:query', '#', 'admin', '2020-10-13 17:57:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1104, '查询', 1099, 1, '', NULL, 1, 'F', '0', '0', 'system:picture:query', '#', 'admin', '2020-10-13 17:58:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1106, '添加报告', 1098, 2, '', NULL, 1, 'F', '0', '0', 'system:report:add', '#', 'admin', '2020-10-16 16:07:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1107, '添加图片', 1099, 2, '', NULL, 1, 'F', '0', '0', 'system:picture:add', '#', 'admin', '2020-10-16 16:08:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1108, '车辆下发', 1092, 4, '', NULL, 1, 'F', '0', '0', 'system:asset:issue', '#', 'admin', '2020-10-19 09:20:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1109, '采集数据下发', 1097, 3, '', NULL, 1, 'F', '0', '0', 'system:dvice:issue', '#', 'admin', '2020-10-19 16:55:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1110, '报告下发', 1098, 3, '', NULL, 1, 'F', '0', '0', 'system:report:issue', '#', 'admin', '2020-10-19 16:55:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1111, '图片下发', 1099, 3, '', NULL, 1, 'F', '0', '0', 'system:picture:issue', '#', 'admin', '2020-10-19 16:56:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1112, '详情', 1098, 4, '', NULL, 1, 'F', '0', '0', 'system:report:detail', '#', 'admin', '2020-10-23 14:08:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1114, '详情文件删除', 1098, 5, '', NULL, 1, 'F', '0', '0', 'system:report:detailDel', '#', 'admin', '2020-10-23 16:56:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1115, '数据导入', 1092, 5, '', NULL, 1, 'F', '0', '0', 'system:asset:import', '#', 'admin', '2020-10-26 11:28:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1116, '图片预览', 1099, 4, '', NULL, 1, 'F', '0', '0', 'system:picture:preview', '#', 'admin', '2020-10-27 16:41:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1117, '文件预览', 1098, 6, '', NULL, 1, 'F', '0', '0', 'system:report:preview', '#', 'admin', '2020-10-27 16:55:29', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 496 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13457812452\",\"admin\":false,\"password\":\"$2a$10$vfgyZF/5lr6lHnmg3KIBiO4wIxqK6m9v1bheOUWvoUz/yE0AxazXC\",\"postIds\":[4],\"email\":\"123562525@qq.com\",\"nickName\":\"财务助理\",\"sex\":\"1\",\"deptId\":106,\"params\":{},\"userName\":\"财务助理\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-11 09:46:23');
INSERT INTO `sys_oper_log` VALUES (101, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"5\",\"createBy\":\"admin\",\"roleKey\":\"test\",\"roleName\":\"测试人员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1056,1058,1057,1059,1060,115],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-11 10:19:04');
INSERT INTO `sys_oper_log` VALUES (102, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13256895689\",\"admin\":false,\"password\":\"$2a$10$x4Azx6HLFLpdCYj9xEsP0OtWaTpkgiRp6OOI7XqHe0a6Bs7hUwJ42\",\"postIds\":[3],\"email\":\"132456@163.com\",\"nickName\":\"test\",\"sex\":\"0\",\"deptId\":103,\"params\":{},\"userName\":\"test\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-12 11:07:16');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-12 14:32:08');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-12 15:24:26');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_asset', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-12 15:26:21');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-12 15:26:24');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-12 15:39:58');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-12 15:40:07');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_device', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-12 17:04:59');
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_report,sys_picture', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-12 17:05:14');
INSERT INTO `sys_oper_log` VALUES (111, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"remark\":\"车辆类型字典列表\",\"params\":{},\"dictType\":\"sys_asset_type\",\"createBy\":\"admin\",\"dictName\":\"车辆类型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-12 17:26:56');
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"remark\":\"城市越野类型\",\"params\":{},\"dictType\":\"sys_asset_type\",\"dictLabel\":\"SUV\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-12 17:27:51');
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"小轿车\",\"dictSort\":2,\"remark\":\"小轿车\",\"params\":{},\"dictType\":\"sys_asset_type\",\"dictLabel\":\"小轿车\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-12 17:28:27');
INSERT INTO `sys_oper_log` VALUES (114, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"4\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"5\",\"createTime\":1597112344000,\"roleKey\":\"test\",\"roleName\":\"测试人员\",\"deptIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-12 17:45:08');
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'test', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[100,101,105],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-12 17:48:21');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'test', NULL, '/system/menu/1', '127.0.0.1', '内网IP', '{menuId=1}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-10-12 17:51:43');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-10-13 08:48:34');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/5', '127.0.0.1', '内网IP', '{tableIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 10:11:28');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/4', '127.0.0.1', '内网IP', '{tableIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 10:11:31');
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{tableIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 10:11:33');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 10:11:35');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 10:11:38');
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_asset', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 10:14:18');
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_device', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 10:14:42');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_picture,sys_report', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 10:14:59');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_folder', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 10:15:17');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-13 10:15:49');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-13 10:16:15');
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-13 10:23:51');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-13 10:27:34');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-13 13:59:45');
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-13 13:59:48');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"exit-fullscreen\",\"orderNum\":\"5\",\"menuName\":\"数据管理\",\"params\":{},\"parentId\":0,\"path\":\"system\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 14:08:44');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":\"1\",\"menuName\":\"车辆管理\",\"params\":{},\"parentId\":1091,\"path\":\"asset\",\"component\":\"system/asset/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"system:asset:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 14:22:32');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"车辆查询\",\"params\":{},\"parentId\":1092,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:asset:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 14:23:47');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"车辆删除\",\"params\":{},\"parentId\":1092,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:asset:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 14:24:41');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"车辆新增\",\"params\":{},\"parentId\":1092,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:asset:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 14:25:25');
INSERT INTO `sys_oper_log` VALUES (138, '车辆信息', 1, 'com.ruoyi.web.controller.system.SysAssetController.add()', 'POST', 1, 'admin', NULL, '/system/asset', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"小轿车\",\"createTime\":1602572344680,\"additionalInfo\":\"阿萨大大大\",\"name\":\"长安福特\",\"tenantId\":100012}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.system.mapper.SysAssetMapper.insertSysAsset-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_asset          ( name,             type,             additional_info,             tenant_id,                          create_time )           values ( ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2020-10-13 14:59:04');
INSERT INTO `sys_oper_log` VALUES (139, '车辆信息', 1, 'com.ruoyi.web.controller.system.SysAssetController.add()', 'POST', 1, 'admin', NULL, '/system/asset', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"小轿车\",\"additionalInfo\":\"阿萨大大大\",\"name\":\"长安福特\",\"tenantId\":100012}', 'null', 1, 'For input string: \"8fda02de-7107-4895-95e5-b8dbdc31c681\"', '2020-10-13 15:20:30');
INSERT INTO `sys_oper_log` VALUES (140, '车辆信息', 1, 'com.ruoyi.web.controller.system.SysAssetController.add()', 'POST', 1, 'admin', NULL, '/system/asset', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"小轿车\",\"additionalInfo\":\"阿萨大大大\",\"name\":\"长安福特\",\"tenantId\":100012}', 'null', 1, 'For input string: \"af26c99c-3edd-43fd-9b9b-c9c351cd6f20\"', '2020-10-13 15:20:35');
INSERT INTO `sys_oper_log` VALUES (141, '车辆信息', 1, 'com.ruoyi.web.controller.system.SysAssetController.add()', 'POST', 1, 'admin', NULL, '/system/asset', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"小轿车\",\"additionalInfo\":\"阿萨大大大\",\"name\":\"长安福特\",\"tenantId\":100012}', 'null', 1, 'For input string: \"d76f5770-37b1-4b67-b52e-292ef8d4ca63\"', '2020-10-13 15:20:52');
INSERT INTO `sys_oper_log` VALUES (142, '车辆信息', 1, 'com.ruoyi.web.controller.system.SysAssetController.add()', 'POST', 1, 'admin', NULL, '/system/asset', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"小轿车\",\"additionalInfo\":\"阿萨大大大\",\"name\":\"长安福特\",\"tenantId\":100012}', 'null', 1, 'For input string: \"7ef6c83e-378c-46e6-8bfd-689265ee387f\"', '2020-10-13 15:21:42');
INSERT INTO `sys_oper_log` VALUES (143, '车辆信息', 1, 'com.ruoyi.web.controller.system.SysAssetController.add()', 'POST', 1, 'admin', NULL, '/system/asset', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"小轿车\",\"createTime\":1602573856915,\"additionalInfo\":\"阿萨大大大\",\"name\":\"长安福特\",\"tenantId\":100012,\"id\":20101386289107}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\r\n### The error may involve com.ruoyi.system.mapper.SysAssetMapper.insertSysAsset-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_asset          ( id,             name,             type,             additional_info,             tenant_id,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1', '2020-10-13 15:24:17');
INSERT INTO `sys_oper_log` VALUES (144, '车辆信息', 1, 'com.ruoyi.web.controller.system.SysAssetController.add()', 'POST', 1, 'admin', NULL, '/system/asset', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"小轿车\",\"createTime\":1602575896326,\"additionalInfo\":\"阿斯顿撒法\",\"name\":\"长安福特\",\"tenantId\":100012,\"id\":20101370901732}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\r\n### The error may involve com.ruoyi.system.mapper.SysAssetMapper.insertSysAsset-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_asset          ( id,             name,             type,             additional_info,             tenant_id,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1', '2020-10-13 15:58:16');
INSERT INTO `sys_oper_log` VALUES (145, '车辆信息', 1, 'com.ruoyi.web.controller.system.SysAssetController.add()', 'POST', 1, 'admin', NULL, '/system/asset', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"小轿车\",\"createTime\":1602575951131,\"additionalInfo\":\"阿斯顿撒法\",\"name\":\"长安福特\",\"tenantId\":100012,\"id\":20101379698698}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 15:59:11');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"2\",\"menuName\":\"文件\",\"params\":{},\"parentId\":1091,\"path\":\"system\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 16:07:35');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":\"1\",\"menuName\":\"车辆管理\",\"params\":{},\"parentId\":1091,\"path\":\"asset\",\"component\":\"system/asset/index\",\"children\":[],\"createTime\":1602570152000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1092,\"menuType\":\"C\",\"perms\":\"system:asset:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 16:08:22');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"2\",\"menuName\":\"采集数据\",\"params\":{},\"parentId\":1091,\"path\":\"device\",\"component\":\"system/device/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"system:device:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:21:05');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1096', '127.0.0.1', '内网IP', '{menuId=1096}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:21:20');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"zip\",\"orderNum\":\"3\",\"menuName\":\"上传报告\",\"params\":{},\"parentId\":1091,\"path\":\"report\",\"component\":\"system/report/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"system:report:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:22:17');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"4\",\"menuName\":\"上传图片\",\"params\":{},\"parentId\":1091,\"path\":\"picture\",\"component\":\"system/report/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"system:report:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:23:51');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":\"1\",\"menuName\":\"车辆管理\",\"params\":{},\"parentId\":1091,\"path\":\"asset\",\"component\":\"system/asset/index\",\"children\":[],\"createTime\":1602570152000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1092,\"menuType\":\"C\",\"perms\":\"system:asset:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:31:16');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":\"1\",\"menuName\":\"车辆管理\",\"params\":{},\"parentId\":1091,\"path\":\"asset\",\"component\":\"system/asset/index\",\"children\":[],\"createTime\":1602570152000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1092,\"menuType\":\"C\",\"perms\":\"system:asset:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:38:11');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"5\",\"menuName\":\"存储文件\",\"params\":{},\"parentId\":1091,\"path\":\"folder\",\"component\":\"system/folder/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"system:folder:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:54:32');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"查询\",\"params\":{},\"parentId\":1097,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:device:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:55:59');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"添加\",\"params\":{},\"parentId\":1097,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:device:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:56:37');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"查询\",\"params\":{},\"parentId\":1098,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:report:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:57:41');
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"查询\",\"params\":{},\"parentId\":1099,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:picture:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:58:09');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"4\",\"menuName\":\"上传图片\",\"params\":{},\"parentId\":1091,\"path\":\"picture\",\"component\":\"system/picture/index\",\"children\":[],\"createTime\":1602581031000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1099,\"menuType\":\"C\",\"perms\":\"system:picture:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:58:29');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"查询\",\"params\":{},\"parentId\":1100,\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:folder:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-13 17:58:55');
INSERT INTO `sys_oper_log` VALUES (161, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"params\":{},\"dictType\":\"sys_device_type\",\"createBy\":\"admin\",\"dictName\":\"数据采集类型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-14 09:05:31');
INSERT INTO `sys_oper_log` VALUES (162, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"remark\":\"数据采集类型列表\",\"dictId\":12,\"params\":{},\"dictType\":\"sys_device_type\",\"createBy\":\"admin\",\"createTime\":1602637531000,\"updateBy\":\"admin\",\"dictName\":\"数据采集类型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-14 09:05:53');
INSERT INTO `sys_oper_log` VALUES (163, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"温度数据\",\"dictSort\":1,\"remark\":\"检测温度数据\",\"params\":{},\"dictType\":\"sys_device_type\",\"dictLabel\":\"温度数据\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-14 09:06:25');
INSERT INTO `sys_oper_log` VALUES (164, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"湿度数据\",\"dictSort\":2,\"remark\":\"检测湿度数据\",\"params\":{},\"dictType\":\"sys_device_type\",\"dictLabel\":\"湿度数据\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-14 09:06:46');
INSERT INTO `sys_oper_log` VALUES (165, '数据采集通道', 1, 'com.ruoyi.web.controller.system.SysDeviceController.add()', 'POST', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '123 温度数据 123 20101379698698', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\r\n### The error may involve com.ruoyi.system.mapper.SysDeviceMapper.insertSysDevice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_device          ( id,             name,             type,             additional_info,             asset_id,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1', '2020-10-14 10:18:01');
INSERT INTO `sys_oper_log` VALUES (166, '数据采集通道', 1, 'com.ruoyi.web.controller.system.SysDeviceController.add()', 'POST', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '123 温度数据 123 20101379698698', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'asset_id\' at row 1\r\n### The error may involve com.ruoyi.system.mapper.SysDeviceMapper.insertSysDevice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_device          ( id,             name,             type,             additional_info,             asset_id,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'asset_id\' at row 1\n; Data truncation: Out of range value for column \'asset_id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'asset_id\' at row 1', '2020-10-14 10:22:18');
INSERT INTO `sys_oper_log` VALUES (167, '数据采集通道', 1, 'com.ruoyi.web.controller.system.SysDeviceController.add()', 'POST', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '132 湿度数据 123 20101379698698', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-14 10:43:08');
INSERT INTO `sys_oper_log` VALUES (168, '数据采集通道', 1, 'com.ruoyi.web.controller.system.SysDeviceController.add()', 'POST', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '数据采集测试 湿度数据 image.txt 20101407977239', '{\"msg\":\"上传数据格式错误，请选择.xls(.xlsx)文件\",\"code\":500}', 0, NULL, '2020-10-14 14:21:38');
INSERT INTO `sys_oper_log` VALUES (169, '数据采集通道', 1, 'com.ruoyi.web.controller.system.SysDeviceController.add()', 'POST', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '椰林整车温湿度5分钟数据7.01-7.11.xlsx 温度数据 123 20101407977239', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`rouyi`.`sys_device`, CONSTRAINT `sys_device_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)\r\n### The error may involve com.ruoyi.system.mapper.SysDeviceMapper.insertSysDevice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_device          ( id,             name,             type,             additional_info,             asset_id,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`rouyi`.`sys_device`, CONSTRAINT `sys_device_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`rouyi`.`sys_device`, CONSTRAINT `sys_device_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`rouyi`.`sys_device`, CONSTRAINT `sys_device_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)', '2020-10-14 14:33:07');
INSERT INTO `sys_oper_log` VALUES (170, '数据采集通道', 1, 'com.ruoyi.web.controller.system.SysDeviceController.add()', 'POST', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '椰林整车温湿度5分钟数据7.01-7.11.xlsx 温度数据 123 20101407977239', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`rouyi`.`sys_device`, CONSTRAINT `sys_device_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)\r\n### The error may involve com.ruoyi.system.mapper.SysDeviceMapper.insertSysDevice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_device          ( id,             name,             type,             additional_info,             asset_id,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`rouyi`.`sys_device`, CONSTRAINT `sys_device_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`rouyi`.`sys_device`, CONSTRAINT `sys_device_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`rouyi`.`sys_device`, CONSTRAINT `sys_device_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)', '2020-10-14 14:33:19');
INSERT INTO `sys_oper_log` VALUES (171, '数据采集通道', 1, 'com.ruoyi.web.controller.system.SysDeviceController.add()', 'POST', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '椰林整车温湿度5分钟数据7.01-7.11.xlsx 温度数据 123 20101407977239', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-14 14:35:20');
INSERT INTO `sys_oper_log` VALUES (172, '数据采集通道', 2, 'com.ruoyi.web.controller.system.SysDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '{\"updateTime\":1602657395874,\"params\":{},\"type\":\"温度数据\",\"createTime\":1602657321000,\"assetId\":20101379698698,\"additionalInfo\":\"123\",\"name\":\"椰林整车温湿度5分钟数据7.01-7.11.xlsx\",\"id\":20101443802087}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-14 14:36:35');
INSERT INTO `sys_oper_log` VALUES (173, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '多文件上传 test Thu Oct 15 00:00:00 CST 2020 123 20101379698698 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:17:38');
INSERT INTO `sys_oper_log` VALUES (174, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '多文件上传 test Thu Oct 15 00:00:00 CST 2020 123 20101379698698 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:20:09');
INSERT INTO `sys_oper_log` VALUES (175, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '多文件上传 test Thu Oct 15 00:00:00 CST 2020 123 20101379698698 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:25:20');
INSERT INTO `sys_oper_log` VALUES (176, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '多文件上传 test Thu Oct 15 00:00:00 CST 2020 123 20101379698698 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:50:42');
INSERT INTO `sys_oper_log` VALUES (177, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '是否 发 Mon Oct 05 00:00:00 CST 2020 生巅峰 20210265165 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:51:56');
INSERT INTO `sys_oper_log` VALUES (178, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '是否 发 Mon Oct 05 00:00:00 CST 2020 生巅峰 20210265165 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:51:56');
INSERT INTO `sys_oper_log` VALUES (179, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '是否 发 Mon Oct 05 00:00:00 CST 2020 生巅峰 20210265165 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:52:38');
INSERT INTO `sys_oper_log` VALUES (180, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '从v出现 份过 Mon Oct 05 00:00:00 CST 2020 发g 4151515 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:54:50');
INSERT INTO `sys_oper_log` VALUES (181, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '从v出现 份过 Mon Oct 05 00:00:00 CST 2020 发g 4151515 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:55:47');
INSERT INTO `sys_oper_log` VALUES (182, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '从v出现 份过 Mon Oct 05 00:00:00 CST 2020 发g 4151515 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:55:48');
INSERT INTO `sys_oper_log` VALUES (183, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '阿松大 安顺 Tue Oct 13 00:00:00 CST 2020 阿松大 3453 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:56:51');
INSERT INTO `sys_oper_log` VALUES (184, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '阿松大 安顺 Tue Oct 13 00:00:00 CST 2020 阿松大 3453 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:57:42');
INSERT INTO `sys_oper_log` VALUES (185, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '生巅峰 第三方 Mon Oct 26 00:00:00 CST 2020 生巅峰 5151 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:58:34');
INSERT INTO `sys_oper_log` VALUES (186, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '大师傅似的 第三方 Tue Oct 13 00:00:00 CST 2020 生巅峰 345343 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 14:59:43');
INSERT INTO `sys_oper_log` VALUES (187, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '高点 的风格 Mon Oct 12 00:00:00 CST 2020 的风格 4535 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:05:45');
INSERT INTO `sys_oper_log` VALUES (188, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '发 生巅峰 Tue Oct 20 00:00:00 CST 2020 生巅峰 535 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:06:42');
INSERT INTO `sys_oper_log` VALUES (189, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '返回给 发v Wed Sep 30 00:00:00 CST 2020 字符 56461 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:08:32');
INSERT INTO `sys_oper_log` VALUES (190, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '的说法是 是否 Tue Oct 06 00:00:00 CST 2020 上给 535353 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:10:15');
INSERT INTO `sys_oper_log` VALUES (191, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '的说法是 是否 Tue Oct 06 00:00:00 CST 2020 上给 535353 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:10:39');
INSERT INTO `sys_oper_log` VALUES (192, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '我去饿 企鹅 Tue Oct 13 00:00:00 CST 2020 企鹅 32424 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:16:36');
INSERT INTO `sys_oper_log` VALUES (193, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '阿瑟 大 Thu Oct 15 00:00:00 CST 2020 安的 1231 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:18:17');
INSERT INTO `sys_oper_log` VALUES (194, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '多文件上 test Thu Oct 15 00:00:00 CST 2020 123 20101379698698 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:27:45');
INSERT INTO `sys_oper_log` VALUES (195, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '多文件上 test Thu Oct 15 00:00:00 CST 2020 123 20101379698698 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:28:50');
INSERT INTO `sys_oper_log` VALUES (196, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '多文件上 test Thu Oct 15 00:00:00 CST 2020 123 20101379698698 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:31:06');
INSERT INTO `sys_oper_log` VALUES (197, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '多文件上 test Thu Oct 15 00:00:00 CST 2020 123 20101379698698 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:31:27');
INSERT INTO `sys_oper_log` VALUES (198, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '多文件上柴 test Thu Oct 15 00:00:00 CST 2020 123 20101379698698 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:34:55');
INSERT INTO `sys_oper_log` VALUES (199, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '多文件上传 test Thu Oct 15 00:00:00 CST 2020 请问 20101379698698 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:40:40');
INSERT INTO `sys_oper_log` VALUES (200, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '多文件上传 test Thu Oct 15 00:00:00 CST 2020 撒旦 20101379896698 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:42:14');
INSERT INTO `sys_oper_log` VALUES (201, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '多文件上传 test Thu Oct 15 00:00:00 CST 2020 安的 20101379698698 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@bccc03f, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@21a63fad, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@776a45f0]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-15 15:50:20');
INSERT INTO `sys_oper_log` VALUES (202, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@32ad99ee[\r\n  userId=103\r\n  deptId=108\r\n  userName=test01\r\n  nickName=test01\r\n  email=4567@12.com\r\n  phonenumber=13645678658\r\n  sex=0\r\n  avatar=<null>\r\n  password=$2a$10$2gSV8kapaWe2mmIDFh8AXe8ZS19De0SfikOt3XEi64gmtrsr1NXeS\r\n  salt=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  loginIp=<null>\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n  dept=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:17:50');
INSERT INTO `sys_oper_log` VALUES (203, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@311e6d33[\r\n  userId=102\r\n  deptId=108\r\n  userName=test01\r\n  nickName=test01\r\n  email=4567@12.com\r\n  phonenumber=13645678658\r\n  sex=0\r\n  avatar=<null>\r\n  password=$2a$10$QbsYoDuZt3hM/FyL7xTpZ.BeCxsrZwJAz659m89T8C/WpqF8FwW3m\r\n  salt=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  loginIp=<null>\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n  dept=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:17:50');
INSERT INTO `sys_oper_log` VALUES (204, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@4a354baf[\r\n  userId=104\r\n  deptId=108\r\n  userName=test01\r\n  nickName=test01\r\n  email=4567@12.com\r\n  phonenumber=13645678658\r\n  sex=0\r\n  avatar=<null>\r\n  password=$2a$10$o0RCY1ahNkOpx369TMRVv.4gkk8yJuJjXKhZZgvDLnX2mUuHle/0.\r\n  salt=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  loginIp=<null>\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n  dept=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:17:50');
INSERT INTO `sys_oper_log` VALUES (205, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@a842864[\r\n  userId=105\r\n  deptId=108\r\n  userName=test01\r\n  nickName=test01\r\n  email=4567@12.com\r\n  phonenumber=13645678658\r\n  sex=0\r\n  avatar=<null>\r\n  password=$2a$10$1D9joJ2e9bIzsTRYQaKgPeB6qXqjjYsMRZQEpJR9tFDtefB3i7ktC\r\n  salt=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  loginIp=<null>\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n  dept=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:17:50');
INSERT INTO `sys_oper_log` VALUES (206, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/102', '127.0.0.1', '内网IP', '{userIds=102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:17:58');
INSERT INTO `sys_oper_log` VALUES (207, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/105', '127.0.0.1', '内网IP', '{userIds=105}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:18:01');
INSERT INTO `sys_oper_log` VALUES (208, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/104', '127.0.0.1', '内网IP', '{userIds=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:18:04');
INSERT INTO `sys_oper_log` VALUES (209, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@418ae4f[\r\n  userId=103\r\n  deptId=<null>\r\n  userName=<null>\r\n  nickName=<null>\r\n  email=<null>\r\n  phonenumber=<null>\r\n  sex=<null>\r\n  avatar=<null>\r\n  password=$2a$10$bgrC7cMflQdhPKT4iVl9K./d4sJHmgeRAqofPyPPzk6.55bZ9AyWe\r\n  salt=<null>\r\n  status=<null>\r\n  delFlag=<null>\r\n  loginIp=<null>\r\n  loginDate=<null>\r\n  createBy=<null>\r\n  createTime=<null>\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=<null>\r\n  dept=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:19:18');
INSERT INTO `sys_oper_log` VALUES (210, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@130f296d[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=3\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:20:29');
INSERT INTO `sys_oper_log` VALUES (211, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@4a5ef7b9[\r\n  userId=106\r\n  deptId=108\r\n  userName=test02\r\n  nickName=test02\r\n  email=1325456@123.com\r\n  phonenumber=13659785689\r\n  sex=0\r\n  avatar=<null>\r\n  password=$2a$10$p/vLZG7GdogfHAHiMx0m.ew3UsUBUabIIlfj9mmklpDBejYEetb7G\r\n  salt=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  loginIp=<null>\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=001\r\n  dept=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:21:14');
INSERT INTO `sys_oper_log` VALUES (212, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'test02', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@5eab004a[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=3\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:22:23');
INSERT INTO `sys_oper_log` VALUES (213, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'test02', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@57cbe443[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=1\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:22:32');
INSERT INTO `sys_oper_log` VALUES (214, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@4661ea50[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=1\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:23:43');
INSERT INTO `sys_oper_log` VALUES (215, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@6cabed75[\r\n  userId=106\r\n  deptId=108\r\n  userName=test02\r\n  nickName=test02\r\n  email=1325456@123.com\r\n  phonenumber=13659785689\r\n  sex=0\r\n  avatar=\r\n  password=\r\n  salt=<null>\r\n  status=0\r\n  delFlag=0\r\n  loginIp=\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=Thu Oct 15 16:21:14 CST 2020\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=001\r\n  dept=com.ruoyi.common.core.domain.entity.SysDept@2d0f912c[\r\n  deptId=108\r\n  parentId=102\r\n  ancestors=<null>\r\n  deptName=市场部门\r\n  orderNum=1\r\n  leader=若依\r\n  phone=<null>\r\n  email=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  createBy=<null>\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n]\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:23:58');
INSERT INTO `sys_oper_log` VALUES (216, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@420096ff[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=3\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:24:41');
INSERT INTO `sys_oper_log` VALUES (217, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@7c643386[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=1\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-15 16:27:31');
INSERT INTO `sys_oper_log` VALUES (218, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '驱蚊器 test Fri Oct 16 00:00:00 CST 2020 我去饿 2130154 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-16 08:58:06');
INSERT INTO `sys_oper_log` VALUES (219, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '请问请问 test Fri Oct 16 00:00:00 CST 2020 企鹅 6841356 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@2592c365, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@2839f8e, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@70fedff0]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-16 08:59:05');
INSERT INTO `sys_oper_log` VALUES (220, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '企鹅 test Thu Oct 15 00:00:00 CST 2020 阿松大 4561 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@505c4f04, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@4976c408, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@5d9eb5fb]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-16 09:01:02');
INSERT INTO `sys_oper_log` VALUES (221, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '维热 etst Fri Oct 16 00:00:00 CST 2020 阿松大 451331 []', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-16 09:05:05');
INSERT INTO `sys_oper_log` VALUES (222, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '维尔 test Fri Oct 16 00:00:00 CST 2020 啊饿啊 454561 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@6a9d8638, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@1bee874c, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@129713c1]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-16 09:05:58');
INSERT INTO `sys_oper_log` VALUES (223, '数据采集通道', 1, 'com.ruoyi.web.controller.system.SysDeviceController.add()', 'POST', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '椰林整车温湿度5分钟数据7.01-7.11.xlsx 温度数据 4月数据 46456', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-16 09:46:10');
INSERT INTO `sys_oper_log` VALUES (224, '数据采集通道', 1, 'com.ruoyi.web.controller.system.SysDeviceController.add()', 'POST', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '椰林整车温湿度5分钟数据7.01-7.11.xlsx 温度数据 4月数据 46456', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-16 09:46:24');
INSERT INTO `sys_oper_log` VALUES (225, '数据采集通道', 3, 'com.ruoyi.web.controller.system.SysDeviceController.remove()', 'DELETE', 1, 'admin', NULL, '/system/device/20101443802087', '127.0.0.1', '内网IP', '{ids=20101443802087}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 09:47:04');
INSERT INTO `sys_oper_log` VALUES (226, '数据采集通道', 1, 'com.ruoyi.web.controller.system.SysDeviceController.add()', 'POST', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '椰林整车温湿度5分钟数据7.01-7.11.xlsx 温度数据 阿松大 611611', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-16 09:47:24');
INSERT INTO `sys_oper_log` VALUES (227, '数据采集通道', 1, 'com.ruoyi.web.controller.system.SysDeviceController.add()', 'POST', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '椰林整车温湿度5分钟数据7.01-7.11.xlsx 温度数据 阿松大 611611', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-16 09:48:18');
INSERT INTO `sys_oper_log` VALUES (228, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '4月数据 test Fri Oct 16 00:00:00 CST 2020 阿松大 4561513 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@10f6a32, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@76281491]', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`rouyi`.`sys_report`, CONSTRAINT `sys_report_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)\r\n### The error may involve com.ruoyi.system.mapper.SysReportMapper.insertSysReport-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_report          ( id,             name,             report_path,             time,             additional_info,             asset_id,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`rouyi`.`sys_report`, CONSTRAINT `sys_report_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`rouyi`.`sys_report`, CONSTRAINT `sys_report_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`rouyi`.`sys_report`, CONSTRAINT `sys_report_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `sys_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)', '2020-10-16 09:51:03');
INSERT INTO `sys_oper_log` VALUES (229, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '4月数据 test Fri Oct 16 00:00:00 CST 2020 阿松大 4561513 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@6fd9b033, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@3d4df514]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 09:52:10');
INSERT INTO `sys_oper_log` VALUES (230, '车辆信息', 1, 'com.ruoyi.web.controller.system.SysAssetController.add()', 'POST', 1, 'admin', NULL, '/system/asset', '127.0.0.1', '内网IP', 'com.ruoyi.system.domain.SysAsset@3dd059ca[\r\n  id=20101697258869\r\n  name=大\r\n  type=1\r\n  additionalInfo=啊实打实\r\n  tenantId=54643\r\n  createBy=<null>\r\n  createTime=Fri Oct 16 10:25:46 CST 2020\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 10:25:46');
INSERT INTO `sys_oper_log` VALUES (231, '数据采集通道', 1, 'com.ruoyi.web.controller.system.SysDeviceController.add()', 'POST', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', '椰林整车温湿度5分钟数据7.01-7.11.xlsx 温度数据 收到 5466', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 10:26:41');
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'test', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-10-16 11:21:02');
INSERT INTO `sys_oper_log` VALUES (233, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@3572d1f0[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=3\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 13:44:48');
INSERT INTO `sys_oper_log` VALUES (234, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@6d6bfc05[\r\n  userId=107\r\n  deptId=103\r\n  userName=boss\r\n  nickName=董事长\r\n  email=123@123.com\r\n  phonenumber=13659875643\r\n  sex=0\r\n  avatar=<null>\r\n  password=$2a$10$dtDenKPnXEB3tbMDDW25v.0D7L30ds/FOY9c2wuLoMFNmoX2fQ1Tm\r\n  salt=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  loginIp=<null>\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n  dept=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 13:47:27');
INSERT INTO `sys_oper_log` VALUES (235, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'boss', NULL, '/system/role/1', '127.0.0.1', '内网IP', '{roleIds=1}', 'null', 1, '不允许操作超级管理员角色', '2020-10-16 13:48:50');
INSERT INTO `sys_oper_log` VALUES (236, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'boss', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@56381be7[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=1\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 13:49:00');
INSERT INTO `sys_oper_log` VALUES (237, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@1b4d872f[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=1\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:34:29');
INSERT INTO `sys_oper_log` VALUES (238, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'test02', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@6f5f00bc[\r\n  userId=106\r\n  deptId=103\r\n  userName=test02\r\n  nickName=test02\r\n  email=1325456@123.com\r\n  phonenumber=13659785689\r\n  sex=0\r\n  avatar=\r\n  password=\r\n  salt=<null>\r\n  status=0\r\n  delFlag=0\r\n  loginIp=\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=Thu Oct 15 16:21:14 CST 2020\r\n  updateBy=test02\r\n  updateTime=<null>\r\n  remark=001\r\n  dept=com.ruoyi.common.core.domain.entity.SysDept@6846bbd8[\r\n  deptId=108\r\n  parentId=102\r\n  ancestors=<null>\r\n  deptName=市场部门\r\n  orderNum=1\r\n  leader=若依\r\n  phone=<null>\r\n  email=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  createBy=<null>\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n]\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:36:14');
INSERT INTO `sys_oper_log` VALUES (239, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@7d0190c9[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=4\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:37:44');
INSERT INTO `sys_oper_log` VALUES (240, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'test02', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@3f9eb461[\r\n  userId=107\r\n  deptId=103\r\n  userName=boss\r\n  nickName=董事长\r\n  email=123@123.com\r\n  phonenumber=13659875643\r\n  sex=0\r\n  avatar=\r\n  password=\r\n  salt=<null>\r\n  status=0\r\n  delFlag=0\r\n  loginIp=\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=Fri Oct 16 13:47:26 CST 2020\r\n  updateBy=test02\r\n  updateTime=<null>\r\n  remark=123\r\n  dept=com.ruoyi.common.core.domain.entity.SysDept@24f5497f[\r\n  deptId=103\r\n  parentId=101\r\n  ancestors=<null>\r\n  deptName=研发部门\r\n  orderNum=1\r\n  leader=若依\r\n  phone=<null>\r\n  email=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  createBy=<null>\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n]\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:40:07');
INSERT INTO `sys_oper_log` VALUES (241, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'test02', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@36cdf459[\r\n  userId=107\r\n  deptId=103\r\n  userName=boss\r\n  nickName=董事长1\r\n  email=123@123.com\r\n  phonenumber=13659875643\r\n  sex=0\r\n  avatar=\r\n  password=\r\n  salt=<null>\r\n  status=0\r\n  delFlag=0\r\n  loginIp=\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=Fri Oct 16 13:47:26 CST 2020\r\n  updateBy=test02\r\n  updateTime=<null>\r\n  remark=123\r\n  dept=com.ruoyi.common.core.domain.entity.SysDept@1122b2b7[\r\n  deptId=103\r\n  parentId=101\r\n  ancestors=<null>\r\n  deptName=研发部门\r\n  orderNum=1\r\n  leader=若依\r\n  phone=<null>\r\n  email=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  createBy=<null>\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n]\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:40:13');
INSERT INTO `sys_oper_log` VALUES (242, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@454c3d56[\r\n  userId=108\r\n  deptId=107\r\n  userName=aaaa\r\n  nickName=aaaa\r\n  email=123456@123.com\r\n  phonenumber=13645678952\r\n  sex=0\r\n  avatar=<null>\r\n  password=$2a$10$Mq2x3NnVPFZlp0z62jIbouhgEteAtNSbvicd6fJ.qsPP7tRFZM3SO\r\n  salt=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  loginIp=<null>\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=aaa\r\n  dept=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:42:15');
INSERT INTO `sys_oper_log` VALUES (243, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@96a8c30[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=2\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:43:36');
INSERT INTO `sys_oper_log` VALUES (244, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@6e21262b[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=3\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:46:18');
INSERT INTO `sys_oper_log` VALUES (245, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@4f234cca[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=3\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:46:34');
INSERT INTO `sys_oper_log` VALUES (246, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/100', '127.0.0.1', '内网IP', '{roleIds=100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:52:38');
INSERT INTO `sys_oper_log` VALUES (247, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@4273ccbc[\r\n  userId=100\r\n  deptId=<null>\r\n  userName=<null>\r\n  nickName=<null>\r\n  email=<null>\r\n  phonenumber=<null>\r\n  sex=<null>\r\n  avatar=<null>\r\n  password=$2a$10$ahpimFqEUIIaR4hKTeTcluE/pQYUIJrhPhEEce4hP7C4XoevFahAu\r\n  salt=<null>\r\n  status=<null>\r\n  delFlag=<null>\r\n  loginIp=<null>\r\n  loginDate=<null>\r\n  createBy=<null>\r\n  createTime=<null>\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=<null>\r\n  dept=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:53:04');
INSERT INTO `sys_oper_log` VALUES (248, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/100', '127.0.0.1', '内网IP', '{userIds=100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:53:18');
INSERT INTO `sys_oper_log` VALUES (249, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/101', '127.0.0.1', '内网IP', '{userIds=101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:53:22');
INSERT INTO `sys_oper_log` VALUES (250, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/103', '127.0.0.1', '内网IP', '{userIds=103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:53:26');
INSERT INTO `sys_oper_log` VALUES (251, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/106', '127.0.0.1', '内网IP', '{userIds=106}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 14:53:28');
INSERT INTO `sys_oper_log` VALUES (252, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@6f13606f[\r\n  userId=107\r\n  deptId=103\r\n  userName=boss\r\n  nickName=董事长\r\n  email=123@123.com\r\n  phonenumber=13659875643\r\n  sex=0\r\n  avatar=\r\n  password=\r\n  salt=<null>\r\n  status=0\r\n  delFlag=0\r\n  loginIp=\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=Fri Oct 16 13:47:26 CST 2020\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=123\r\n  dept=com.ruoyi.common.core.domain.entity.SysDept@13a6c743[\r\n  deptId=103\r\n  parentId=101\r\n  ancestors=<null>\r\n  deptName=研发部门\r\n  orderNum=1\r\n  leader=若依\r\n  phone=<null>\r\n  email=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  createBy=<null>\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n]\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 15:00:17');
INSERT INTO `sys_oper_log` VALUES (253, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@63861687[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=3\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 15:26:19');
INSERT INTO `sys_oper_log` VALUES (254, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'aaaa', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@35148209[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=5\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 15:27:36');
INSERT INTO `sys_oper_log` VALUES (255, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@19b21338[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=4\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 15:48:48');
INSERT INTO `sys_oper_log` VALUES (256, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@411ed879[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=2\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 15:49:09');
INSERT INTO `sys_oper_log` VALUES (257, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@6c7c4ee4[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=2\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 15:51:08');
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@4f49fa4a[\r\n  menuId=<null>\r\n  menuName=添加报告\r\n  parentId=1098\r\n  orderNum=2\r\n  path=<null>\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:report:add\r\n  icon=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:07:54');
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@710baa[\r\n  menuId=<null>\r\n  menuName=添加图片\r\n  parentId=1099\r\n  orderNum=2\r\n  path=<null>\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:picture:add\r\n  icon=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:08:30');
INSERT INTO `sys_oper_log` VALUES (260, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@4a1c1541[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=2\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:09:03');
INSERT INTO `sys_oper_log` VALUES (261, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@193e5781[\r\n  roleId=1\r\n  roleName=超级管理员\r\n  roleKey=admin\r\n  roleSort=1\r\n  dataScope=1\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=超级管理员\r\n]', 'null', 1, '不允许操作超级管理员角色', '2020-10-16 16:11:17');
INSERT INTO `sys_oper_log` VALUES (262, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@26ba96b9[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=2\r\n  dataScope=4\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:11:45');
INSERT INTO `sys_oper_log` VALUES (263, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@70400b09[\r\n  userId=108\r\n  deptId=107\r\n  userName=aaaa\r\n  nickName=aaaa\r\n  email=123456@123.com\r\n  phonenumber=13645678952\r\n  sex=0\r\n  avatar=\r\n  password=\r\n  salt=<null>\r\n  status=0\r\n  delFlag=0\r\n  loginIp=\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=Fri Oct 16 14:42:15 CST 2020\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=aaa\r\n  dept=com.ruoyi.common.core.domain.entity.SysDept@607fd0b0[\r\n  deptId=107\r\n  parentId=101\r\n  ancestors=<null>\r\n  deptName=运维部门\r\n  orderNum=5\r\n  leader=若依\r\n  phone=<null>\r\n  email=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  createBy=<null>\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n]\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:12:35');
INSERT INTO `sys_oper_log` VALUES (264, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@597aa704[\r\n  roleId=101\r\n  roleName=系统管理员\r\n  roleKey=xtgly\r\n  roleSort=2\r\n  dataScope=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:16:13');
INSERT INTO `sys_oper_log` VALUES (265, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@1dd18298[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=3\r\n  dataScope=4\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:16:24');
INSERT INTO `sys_oper_log` VALUES (266, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@681f5ec9[\r\n  roleId=2\r\n  roleName=普通角色\r\n  roleKey=common\r\n  roleSort=3\r\n  dataScope=3\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Mar 16 11:33:00 CST 2018\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=普通角色\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:18:33');
INSERT INTO `sys_oper_log` VALUES (267, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.clearCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/clearCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:19:50');
INSERT INTO `sys_oper_log` VALUES (268, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@6452798d[\r\n  userId=<null>\r\n  deptId=104\r\n  userName=yqgs\r\n  nickName=一汽公司\r\n  email=123456@123.com\r\n  phonenumber=13645689656\r\n  sex=0\r\n  avatar=<null>\r\n  password=123456\r\n  salt=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  loginIp=<null>\r\n  loginDate=<null>\r\n  createBy=<null>\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n  dept=<null>\r\n]', '{\"msg\":\"新增用户\'yqgs\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2020-10-16 16:25:04');
INSERT INTO `sys_oper_log` VALUES (269, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@60b8d8[\r\n  userId=109\r\n  deptId=104\r\n  userName=yqgs\r\n  nickName=一汽公司\r\n  email=1234556@123.com\r\n  phonenumber=13645689656\r\n  sex=0\r\n  avatar=<null>\r\n  password=$2a$10$on36Ynu.xbCLmEmh.g/Tbub5Zp873vqcVwbXMBrflKDvauDXL/Zl.\r\n  salt=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  loginIp=<null>\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n  dept=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:25:10');
INSERT INTO `sys_oper_log` VALUES (270, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/6', '127.0.0.1', '内网IP', '{tableIds=6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:43:00');
INSERT INTO `sys_oper_log` VALUES (271, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/7', '127.0.0.1', '内网IP', '{tableIds=7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:43:03');
INSERT INTO `sys_oper_log` VALUES (272, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/8', '127.0.0.1', '内网IP', '{tableIds=8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:43:04');
INSERT INTO `sys_oper_log` VALUES (273, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/9', '127.0.0.1', '内网IP', '{tableIds=9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:43:06');
INSERT INTO `sys_oper_log` VALUES (274, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/10', '127.0.0.1', '内网IP', '{tableIds=10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:43:08');
INSERT INTO `sys_oper_log` VALUES (275, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_asset,sys_device', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:44:40');
INSERT INTO `sys_oper_log` VALUES (276, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_picture,sys_report', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:44:55');
INSERT INTO `sys_oper_log` VALUES (277, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-16 16:45:13');
INSERT INTO `sys_oper_log` VALUES (278, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-16 16:45:15');
INSERT INTO `sys_oper_log` VALUES (279, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-16 16:45:16');
INSERT INTO `sys_oper_log` VALUES (280, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-16 16:45:17');
INSERT INTO `sys_oper_log` VALUES (281, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/14', '127.0.0.1', '内网IP', '{tableIds=14}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:53:37');
INSERT INTO `sys_oper_log` VALUES (282, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_report', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-16 16:53:46');
INSERT INTO `sys_oper_log` VALUES (283, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-10-16 16:53:59');
INSERT INTO `sys_oper_log` VALUES (284, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '安的 阿道夫 Thu Oct 15 00:00:00 CST 2020 的风格 545 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@a794f94, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@59424988]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-16 17:36:55');
INSERT INTO `sys_oper_log` VALUES (285, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@78eb931[\r\n  menuId=<null>\r\n  menuName=车辆下发\r\n  parentId=1092\r\n  orderNum=4\r\n  path=<null>\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:asset:issue\r\n  icon=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-19 09:20:58');
INSERT INTO `sys_oper_log` VALUES (286, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'GET', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '{}', 'null', 1, '', '2020-10-19 11:30:08');
INSERT INTO `sys_oper_log` VALUES (287, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101379698698 [object Object]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-19 13:48:54');
INSERT INTO `sys_oper_log` VALUES (288, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101379698698 [object Object]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-19 14:05:11');
INSERT INTO `sys_oper_log` VALUES (289, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101379698698 [object Object]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-19 14:07:32');
INSERT INTO `sys_oper_log` VALUES (290, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101379698698 [object Object]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-19 14:10:05');
INSERT INTO `sys_oper_log` VALUES (291, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101379698698 [object Object]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-19 14:28:04');
INSERT INTO `sys_oper_log` VALUES (292, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101379698698 研发部门', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-19 14:44:19');
INSERT INTO `sys_oper_log` VALUES (293, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101379698698 测试部门', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-19 15:19:42');
INSERT INTO `sys_oper_log` VALUES (294, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101379698698 测试部门', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-19 15:19:42');
INSERT INTO `sys_oper_log` VALUES (295, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101379698698 市场部门', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-19 15:19:56');
INSERT INTO `sys_oper_log` VALUES (296, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101379698698 研发部门', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-19 15:37:07');
INSERT INTO `sys_oper_log` VALUES (297, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101379698698 研发部门', '{\"msg\":\"已下发，请勿重复操作\",\"code\":400}', 0, NULL, '2020-10-19 15:37:16');
INSERT INTO `sys_oper_log` VALUES (298, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101697258869 市场部门', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-19 15:52:41');
INSERT INTO `sys_oper_log` VALUES (299, '车辆信息', 1, 'com.ruoyi.web.controller.system.SysAssetController.add()', 'POST', 1, 'admin', NULL, '/system/asset', '127.0.0.1', '内网IP', 'com.ruoyi.system.domain.SysAsset@6b5d98c7[\r\n  id=20101996454907\r\n  name=一汽奥迪\r\n  type=小轿车\r\n  additionalInfo=阿松大\r\n  tenantId=<null>\r\n  unit=<null>\r\n  createBy=<null>\r\n  createTime=Mon Oct 19 16:30:18 CST 2020\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-19 16:30:18');
INSERT INTO `sys_oper_log` VALUES (300, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101996454907 运维部门 107', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-19 16:34:15');
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@148dab98[\r\n  menuId=<null>\r\n  menuName=采集数据下发\r\n  parentId=1097\r\n  orderNum=3\r\n  path=<null>\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:dvice:issue\r\n  icon=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-19 16:55:06');
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@50735ae1[\r\n  menuId=<null>\r\n  menuName=报告下发\r\n  parentId=1098\r\n  orderNum=3\r\n  path=<null>\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:report:issue\r\n  icon=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-19 16:55:39');
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@6281da16[\r\n  menuId=<null>\r\n  menuName=图片下发\r\n  parentId=1099\r\n  orderNum=3\r\n  path=<null>\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:picture:issue\r\n  icon=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-19 16:56:05');
INSERT INTO `sys_oper_log` VALUES (304, '数据采集通道', 0, 'com.ruoyi.web.controller.system.SysDeviceController.issue()', 'POST', 1, 'admin', NULL, '/system/device/issue', '127.0.0.1', '内网IP', '20101407977239 20101379698698', '{\"msg\":\"已下发，请勿重复操作\",\"code\":400}', 0, NULL, '2020-10-19 17:43:37');
INSERT INTO `sys_oper_log` VALUES (305, '数据采集通道', 0, 'com.ruoyi.web.controller.system.SysDeviceController.issue()', 'POST', 1, 'admin', NULL, '/system/device/issue', '127.0.0.1', '内网IP', '20101407977239 20101379698698', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-19 17:44:16');
INSERT INTO `sys_oper_log` VALUES (306, '数据采集通道', 0, 'com.ruoyi.web.controller.system.SysDeviceController.issue()', 'POST', 1, 'admin', NULL, '/system/device/issue', '127.0.0.1', '内网IP', '20101407977239 20101379698698', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-19 17:44:20');
INSERT INTO `sys_oper_log` VALUES (307, '数据采集通道', 0, 'com.ruoyi.web.controller.system.SysDeviceController.issue()', 'POST', 1, 'admin', NULL, '/system/device/issue', '127.0.0.1', '内网IP', '20101407977239 20101379698698', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-19 17:46:28');
INSERT INTO `sys_oper_log` VALUES (308, '数据采集通道', 0, 'com.ruoyi.web.controller.system.SysDeviceController.issue()', 'POST', 1, 'admin', NULL, '/system/device/issue', '127.0.0.1', '内网IP', '20101407977239 20101379698698', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-19 17:47:18');
INSERT INTO `sys_oper_log` VALUES (309, '数据采集通道', 0, 'com.ruoyi.web.controller.system.SysDeviceController.issue()', 'POST', 1, 'admin', NULL, '/system/device/issue', '127.0.0.1', '内网IP', '20101407977239 20101379698698', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-19 17:48:02');
INSERT INTO `sys_oper_log` VALUES (310, '数据采集通道', 0, 'com.ruoyi.web.controller.system.SysDeviceController.issue()', 'POST', 1, 'admin', NULL, '/system/device/issue', '127.0.0.1', '内网IP', '20101407977239 20101379698698', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-19 17:48:46');
INSERT INTO `sys_oper_log` VALUES (311, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.issue()', 'POST', 1, 'admin', NULL, '/system/report/issue', '127.0.0.1', '内网IP', '20101473691636 20101379698698', '{\"msg\":\"已下发，请勿重复操作\",\"code\":400}', 0, NULL, '2020-10-19 18:04:44');
INSERT INTO `sys_oper_log` VALUES (312, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.issue()', 'POST', 1, 'admin', NULL, '/system/report/issue', '127.0.0.1', '内网IP', '20101473691636 20101379698698', '{\"msg\":\"已下发，请勿重复操作\",\"code\":400}', 0, NULL, '2020-10-19 18:05:15');
INSERT INTO `sys_oper_log` VALUES (313, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.issue()', 'POST', 1, 'admin', NULL, '/system/report/issue', '127.0.0.1', '内网IP', '20101473691636 20101379698698', '{\"msg\":\"已下发，请勿重复操作\",\"code\":400}', 0, NULL, '2020-10-19 18:05:20');
INSERT INTO `sys_oper_log` VALUES (314, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.issue()', 'POST', 1, 'admin', NULL, '/system/report/issue', '127.0.0.1', '内网IP', '20101473691636 20101379698698', '{\"msg\":\"已下发，请勿重复操作\",\"code\":400}', 0, NULL, '2020-10-19 18:05:47');
INSERT INTO `sys_oper_log` VALUES (315, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.issue()', 'POST', 1, 'admin', NULL, '/system/report/issue', '127.0.0.1', '内网IP', '20101473691636 20101379698698', '{\"msg\":\"已下发，请勿重复操作\",\"code\":400}', 0, NULL, '2020-10-19 18:06:39');
INSERT INTO `sys_oper_log` VALUES (316, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.issue()', 'POST', 1, 'admin', NULL, '/system/report/issue', '127.0.0.1', '内网IP', '20101473691636 20101379698698', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-19 18:07:12');
INSERT INTO `sys_oper_log` VALUES (317, '图片存储', 1, 'com.ruoyi.web.controller.system.SysPictureController.add()', 'POST', 1, 'admin', NULL, '/system/picture', '127.0.0.1', '内网IP', '上传图片测试文件夹 test Tue Oct 20 00:00:00 CST 2020 上传测试 2010484613556 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@60312dc8, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@777675c6]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-20 16:18:17');
INSERT INTO `sys_oper_log` VALUES (318, '图片存储', 1, 'com.ruoyi.web.controller.system.SysPictureController.add()', 'POST', 1, 'admin', NULL, '/system/picture', '127.0.0.1', '内网IP', '上传图片测试文件夹 test Tue Oct 20 00:00:00 CST 2020 上传测试 2010484613556 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@3ee3d9c5, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@1aa2b446]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-20 16:19:48');
INSERT INTO `sys_oper_log` VALUES (319, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@201f24e4[\r\n  roleId=101\r\n  roleName=系统管理员\r\n  roleKey=xtgly\r\n  roleSort=2\r\n  dataScope=1\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Oct 16 16:16:13 CST 2020\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-20 16:31:19');
INSERT INTO `sys_oper_log` VALUES (320, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@309092dc[\r\n  userId=108\r\n  deptId=107\r\n  userName=aaaa\r\n  nickName=aaaa\r\n  email=123456@123.com\r\n  phonenumber=13645678952\r\n  sex=0\r\n  avatar=\r\n  password=\r\n  salt=<null>\r\n  status=0\r\n  delFlag=0\r\n  loginIp=\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=Fri Oct 16 14:42:15 CST 2020\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=aaa\r\n  dept=com.ruoyi.common.core.domain.entity.SysDept@5826a050[\r\n  deptId=107\r\n  parentId=101\r\n  ancestors=<null>\r\n  deptName=运维部门\r\n  orderNum=5\r\n  leader=若依\r\n  phone=<null>\r\n  email=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  createBy=<null>\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n]\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-20 16:33:38');
INSERT INTO `sys_oper_log` VALUES (321, '图片存储', 0, 'com.ruoyi.web.controller.system.SysPictureController.issue()', 'POST', 1, 'admin', NULL, '/system/picture/issue', '127.0.0.1', '内网IP', '20102061639468 2010484613556', '{\"msg\":\"对应车辆不存在，请先添加车辆\",\"code\":404}', 0, NULL, '2020-10-20 16:39:01');
INSERT INTO `sys_oper_log` VALUES (322, '图片存储', 0, 'com.ruoyi.web.controller.system.SysPictureController.issue()', 'POST', 1, 'admin', NULL, '/system/picture/issue', '127.0.0.1', '内网IP', '20102061639468 2010484613556', '{\"msg\":\"对应车辆不存在，请先添加车辆\",\"code\":404}', 0, NULL, '2020-10-20 16:39:27');
INSERT INTO `sys_oper_log` VALUES (323, '图片存储', 0, 'com.ruoyi.web.controller.system.SysPictureController.issue()', 'POST', 1, 'admin', NULL, '/system/picture/issue', '127.0.0.1', '内网IP', '20102061639468 2010484613556', '{\"msg\":\"对应车辆不存在，请先添加车辆\",\"code\":401}', 0, NULL, '2020-10-20 16:44:32');
INSERT INTO `sys_oper_log` VALUES (324, '图片存储', 0, 'com.ruoyi.web.controller.system.SysPictureController.issue()', 'POST', 1, 'admin', NULL, '/system/picture/issue', '127.0.0.1', '内网IP', '20102061639468 2010484613556', '{\"msg\":\"对应车辆不存在，请先添加车辆\",\"code\":401}', 0, NULL, '2020-10-20 16:44:44');
INSERT INTO `sys_oper_log` VALUES (325, '图片存储', 0, 'com.ruoyi.web.controller.system.SysPictureController.issue()', 'POST', 1, 'admin', NULL, '/system/picture/issue', '127.0.0.1', '内网IP', '20102061639468 2010484613556', '{\"msg\":\"对应车辆不存在，请先添加车辆\",\"code\":403}', 0, NULL, '2020-10-20 16:45:09');
INSERT INTO `sys_oper_log` VALUES (326, '图片存储', 0, 'com.ruoyi.web.controller.system.SysPictureController.issue()', 'POST', 1, 'admin', NULL, '/system/picture/issue', '127.0.0.1', '内网IP', '20102061639468 2010484613556', '{\"msg\":\"对应车辆不存在，请先添加车辆\",\"code\":405}', 0, NULL, '2020-10-20 16:45:32');
INSERT INTO `sys_oper_log` VALUES (327, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101996454907 市场部门 108', '{\"msg\":\"已下发，请勿重复操作\",\"code\":400}', 0, NULL, '2020-10-20 16:50:55');
INSERT INTO `sys_oper_log` VALUES (328, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20101996454907 市场部门 108', '{\"msg\":\"已下发，请勿重复操作\",\"code\":400}', 0, NULL, '2020-10-20 16:51:00');
INSERT INTO `sys_oper_log` VALUES (329, '数据采集通道', 0, 'com.ruoyi.web.controller.system.SysDeviceController.issue()', 'POST', 1, 'admin', NULL, '/system/device/issue', '127.0.0.1', '内网IP', '20101672382216 5466', '{\"msg\":\"对应车辆不存在，请先添加车辆\",\"code\":404}', 0, NULL, '2020-10-20 16:53:51');
INSERT INTO `sys_oper_log` VALUES (330, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.issue()', 'POST', 1, 'admin', NULL, '/system/report/issue', '127.0.0.1', '内网IP', '20101473691636 20101379698698', '{\"msg\":\"已下发，请勿重复操作\",\"code\":400}', 0, NULL, '2020-10-20 17:04:25');
INSERT INTO `sys_oper_log` VALUES (331, '车辆信息', 1, 'com.ruoyi.web.controller.system.SysAssetController.add()', 'POST', 1, 'admin', NULL, '/system/asset', '127.0.0.1', '内网IP', 'com.ruoyi.system.domain.SysAsset@1a56a02a[\r\n  id=20102013068400\r\n  name=长安\r\n  type=小轿车\r\n  additionalInfo=长安汽车\r\n  tenantId=<null>\r\n  unit=<null>\r\n  createBy=<null>\r\n  createTime=Tue Oct 20 17:34:51 CST 2020\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-20 17:34:51');
INSERT INTO `sys_oper_log` VALUES (332, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20102013068400 运维部门 107', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-20 17:35:06');
INSERT INTO `sys_oper_log` VALUES (333, '数据采集通道', 2, 'com.ruoyi.web.controller.system.SysDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/system/device', '127.0.0.1', '内网IP', 'com.ruoyi.system.domain.SysDevice@5d67a777[\r\n  id=20101672382216\r\n  name=椰林整车温湿度5分钟数据7.01-7.11.xlsx\r\n  type=温度数据\r\n  additionalInfo=收到\r\n  assetId=20101379698698\r\n  unit=<null>\r\n  createBy=<null>\r\n  createTime=Fri Oct 16 10:26:42 CST 2020\r\n  updateBy=<null>\r\n  updateTime=Tue Oct 20 17:35:53 CST 2020\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-20 17:35:53');
INSERT INTO `sys_oper_log` VALUES (334, '数据采集通道', 0, 'com.ruoyi.web.controller.system.SysDeviceController.issue()', 'POST', 1, 'admin', NULL, '/system/device/issue', '127.0.0.1', '内网IP', '20101672382216 20101379698698', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-20 17:36:08');
INSERT INTO `sys_oper_log` VALUES (335, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.issue()', 'POST', 1, 'admin', NULL, '/system/report/issue', '127.0.0.1', '内网IP', '20101487058263 20101379698698', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-20 17:36:17');
INSERT INTO `sys_oper_log` VALUES (336, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysUser@6bd83036[\r\n  userId=108\r\n  deptId=107\r\n  userName=aaaa\r\n  nickName=aaaa\r\n  email=123456@123.com\r\n  phonenumber=13645678952\r\n  sex=0\r\n  avatar=\r\n  password=\r\n  salt=<null>\r\n  status=0\r\n  delFlag=0\r\n  loginIp=\r\n  loginDate=<null>\r\n  createBy=admin\r\n  createTime=Fri Oct 16 14:42:15 CST 2020\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=aaa\r\n  dept=com.ruoyi.common.core.domain.entity.SysDept@880eaa7[\r\n  deptId=107\r\n  parentId=101\r\n  ancestors=<null>\r\n  deptName=运维部门\r\n  orderNum=5\r\n  leader=若依\r\n  phone=<null>\r\n  email=<null>\r\n  status=0\r\n  delFlag=<null>\r\n  createBy=<null>\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n]\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-20 17:56:17');
INSERT INTO `sys_oper_log` VALUES (337, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1100', '127.0.0.1', '内网IP', '{menuId=1100}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-10-20 18:05:12');
INSERT INTO `sys_oper_log` VALUES (338, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1105', '127.0.0.1', '内网IP', '{menuId=1105}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-10-20 18:05:18');
INSERT INTO `sys_oper_log` VALUES (339, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@7a642651[\r\n  menuId=<null>\r\n  menuName=详情\r\n  parentId=1098\r\n  orderNum=4\r\n  path=<null>\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:report:detail\r\n  icon=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-23 14:08:34');
INSERT INTO `sys_oper_log` VALUES (340, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '192.168.50.108', '内网IP', '10月数据上传 test Fri Oct 23 00:00:00 CST 2020 批量上传 20101379698698 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@4f631dd3, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@40d08f28]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-23 14:34:59');
INSERT INTO `sys_oper_log` VALUES (341, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', 'test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 15:28:19');
INSERT INTO `sys_oper_log` VALUES (342, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', 'test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 15:29:01');
INSERT INTO `sys_oper_log` VALUES (343, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101473691636/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 15:31:31');
INSERT INTO `sys_oper_log` VALUES (344, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101473691636/20101379698698', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 15:32:09');
INSERT INTO `sys_oper_log` VALUES (345, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101379698698/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 15:33:10');
INSERT INTO `sys_oper_log` VALUES (346, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101379698698/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 15:44:34');
INSERT INTO `sys_oper_log` VALUES (347, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101379698698/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 15:52:42');
INSERT INTO `sys_oper_log` VALUES (348, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '192.168.50.108', '内网IP', '10月数据测试上传 test Fri Oct 23 00:00:00 CST 2020 呜呜呜 20101697258869 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@c54309e, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@2bd679a1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-23 15:57:22');
INSERT INTO `sys_oper_log` VALUES (349, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101697258869/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 15:57:40');
INSERT INTO `sys_oper_log` VALUES (350, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101697258869/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 15:58:20');
INSERT INTO `sys_oper_log` VALUES (351, '文档存储', 3, 'com.ruoyi.web.controller.system.SysReportController.remove()', 'DELETE', 1, 'admin', NULL, '/system/report/20102304760803', '192.168.50.108', '内网IP', '{ids=20102304760803}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-23 15:59:58');
INSERT INTO `sys_oper_log` VALUES (352, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '192.168.50.108', '内网IP', '批量数据测试上传 test Fri Oct 23 00:00:00 CST 2020 暗红褐色 20101996454907 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@10bf6026, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@6ec156c0]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-23 16:01:28');
INSERT INTO `sys_oper_log` VALUES (353, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:01:38');
INSERT INTO `sys_oper_log` VALUES (354, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:03:18');
INSERT INTO `sys_oper_log` VALUES (355, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:03:25');
INSERT INTO `sys_oper_log` VALUES (356, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:03:54');
INSERT INTO `sys_oper_log` VALUES (357, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:10:11');
INSERT INTO `sys_oper_log` VALUES (358, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:11:48');
INSERT INTO `sys_oper_log` VALUES (359, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:13:05');
INSERT INTO `sys_oper_log` VALUES (360, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:13:49');
INSERT INTO `sys_oper_log` VALUES (361, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:14:19');
INSERT INTO `sys_oper_log` VALUES (362, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:15:04');
INSERT INTO `sys_oper_log` VALUES (363, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:15:27');
INSERT INTO `sys_oper_log` VALUES (364, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:15:43');
INSERT INTO `sys_oper_log` VALUES (365, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:21:58');
INSERT INTO `sys_oper_log` VALUES (366, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:24:41');
INSERT INTO `sys_oper_log` VALUES (367, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101379698698/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 16:24:44');
INSERT INTO `sys_oper_log` VALUES (368, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '4561513/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 16:24:48');
INSERT INTO `sys_oper_log` VALUES (369, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:25:28');
INSERT INTO `sys_oper_log` VALUES (370, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:26:22');
INSERT INTO `sys_oper_log` VALUES (371, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101379698698/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 16:26:25');
INSERT INTO `sys_oper_log` VALUES (372, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:28:07');
INSERT INTO `sys_oper_log` VALUES (373, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:34:40');
INSERT INTO `sys_oper_log` VALUES (374, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '192.168.50.108', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@b8c7de3[\r\n  menuId=<null>\r\n  menuName=详情文件删除\r\n  parentId=1112\r\n  orderNum=6\r\n  path=<null>\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:picture:detailDel\r\n  icon=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-23 16:55:18');
INSERT INTO `sys_oper_log` VALUES (375, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.50.108', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@cda4265[\r\n  menuId=1113\r\n  menuName=详情文件删除\r\n  parentId=1112\r\n  orderNum=6\r\n  path=\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:report:detailDel\r\n  icon=#\r\n  createBy=<null>\r\n  createTime=Fri Oct 23 16:55:18 CST 2020\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-23 16:55:51');
INSERT INTO `sys_oper_log` VALUES (376, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1113', '192.168.50.108', '内网IP', '{menuId=1113}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-23 16:56:25');
INSERT INTO `sys_oper_log` VALUES (377, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '192.168.50.108', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@62d3d523[\r\n  menuId=<null>\r\n  menuName=详情文件删除\r\n  parentId=1098\r\n  orderNum=5\r\n  path=<null>\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:report:detailDel\r\n  icon=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-23 16:56:39');
INSERT INTO `sys_oper_log` VALUES (378, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 16:59:05');
INSERT INTO `sys_oper_log` VALUES (379, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 17:03:30');
INSERT INTO `sys_oper_log` VALUES (380, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"user.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt\"}]}', 0, NULL, '2020-10-23 17:09:59');
INSERT INTO `sys_oper_log` VALUES (381, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.delDetailFile()', 'POST', 1, 'admin', NULL, '/system/report/delDetailFile', '192.168.50.108', '内网IP', 'hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/user.txt', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2020-10-23 17:10:10');
INSERT INTO `sys_oper_log` VALUES (382, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"}]}', 0, NULL, '2020-10-23 17:16:35');
INSERT INTO `sys_oper_log` VALUES (383, '文档存储', 2, 'com.ruoyi.web.controller.system.SysReportController.edit()', 'PUT', 1, 'admin', NULL, '/system/report', '192.168.50.108', '内网IP', 'com.ruoyi.system.domain.SysReport@2110fdc6[\r\n  id=20102396298973\r\n  name=批量数据测试上传\r\n  reportPath=test\r\n  time=Fri Oct 23 00:00:00 CST 2020\r\n  additionalInfo=暗红褐色\r\n  assetId=20101996454907\r\n  unit=<null>\r\n  createBy=<null>\r\n  createTime=Fri Oct 23 16:01:28 CST 2020\r\n  updateBy=<null>\r\n  updateTime=Fri Oct 23 17:18:14 CST 2020\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-23 17:18:14');
INSERT INTO `sys_oper_log` VALUES (384, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"}]}', 0, NULL, '2020-10-23 17:18:17');
INSERT INTO `sys_oper_log` VALUES (385, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"}]}', 0, NULL, '2020-10-23 17:18:21');
INSERT INTO `sys_oper_log` VALUES (386, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"}]}', 0, NULL, '2020-10-23 17:19:15');
INSERT INTO `sys_oper_log` VALUES (387, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.delDetailFile()', 'POST', 1, 'admin', NULL, '/system/report/delDetailFile', '192.168.50.108', '内网IP', 'hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2020-10-23 17:19:19');
INSERT INTO `sys_oper_log` VALUES (388, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2020-10-23 17:19:25');
INSERT INTO `sys_oper_log` VALUES (389, '文档存储', 3, 'com.ruoyi.web.controller.system.SysReportController.remove()', 'DELETE', 1, 'admin', NULL, '/system/report/20102396298973', '192.168.50.108', '内网IP', '{ids=20102396298973}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-23 17:19:31');
INSERT INTO `sys_oper_log` VALUES (390, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101379698698/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-23 17:39:05');
INSERT INTO `sys_oper_log` VALUES (391, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '192.168.50.108', '内网IP', '测试数据批量上传 test Fri Oct 23 00:00:00 CST 2020 阿文 20101996454907 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@25450f8b, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@3a42733c, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@5f05a2a1, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@b60694b]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-23 17:40:15');
INSERT INTO `sys_oper_log` VALUES (392, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx\"}]}', 0, NULL, '2020-10-23 17:40:18');
INSERT INTO `sys_oper_log` VALUES (393, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.delDetailFile()', 'POST', 1, 'admin', NULL, '/system/report/delDetailFile', '192.168.50.108', '内网IP', 'hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/1_疫情防控期间VPN使用说明.docx', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2020-10-23 17:40:26');
INSERT INTO `sys_oper_log` VALUES (394, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-23 17:41:19');
INSERT INTO `sys_oper_log` VALUES (395, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-23 17:41:40');
INSERT INTO `sys_oper_log` VALUES (396, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-23 17:42:07');
INSERT INTO `sys_oper_log` VALUES (397, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '192.168.50.108', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', 'null', 0, NULL, '2020-10-23 17:42:20');
INSERT INTO `sys_oper_log` VALUES (398, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-23 17:42:27');
INSERT INTO `sys_oper_log` VALUES (399, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '192.168.50.108', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', 'null', 0, NULL, '2020-10-23 17:42:29');
INSERT INTO `sys_oper_log` VALUES (400, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-23 17:48:53');
INSERT INTO `sys_oper_log` VALUES (401, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '192.168.50.108', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', 'null', 0, NULL, '2020-10-23 17:48:55');
INSERT INTO `sys_oper_log` VALUES (402, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-23 17:51:21');
INSERT INTO `sys_oper_log` VALUES (403, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '192.168.50.108', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', 'null', 0, NULL, '2020-10-23 17:51:53');
INSERT INTO `sys_oper_log` VALUES (404, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '192.168.50.108', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', 'null', 0, NULL, '2020-10-23 17:52:09');
INSERT INTO `sys_oper_log` VALUES (405, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-23 17:56:42');
INSERT INTO `sys_oper_log` VALUES (406, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-23 17:57:42');
INSERT INTO `sys_oper_log` VALUES (407, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '192.168.50.108', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-23 18:01:02');
INSERT INTO `sys_oper_log` VALUES (408, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-23 18:01:23');
INSERT INTO `sys_oper_log` VALUES (409, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101379698698/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-26 09:04:56');
INSERT INTO `sys_oper_log` VALUES (410, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-26 09:04:57');
INSERT INTO `sys_oper_log` VALUES (411, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-26 09:34:21');
INSERT INTO `sys_oper_log` VALUES (412, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@64c05026[\r\n  menuId=<null>\r\n  menuName=数据导入\r\n  parentId=1092\r\n  orderNum=5\r\n  path=<null>\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:asset:import\r\n  icon=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-26 11:28:12');
INSERT INTO `sys_oper_log` VALUES (413, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-26 17:33:07');
INSERT INTO `sys_oper_log` VALUES (414, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-26 17:43:48');
INSERT INTO `sys_oper_log` VALUES (415, '车辆信息', 1, 'com.ruoyi.web.controller.system.SysAssetController.add()', 'POST', 1, 'admin', NULL, '/system/asset', '127.0.0.1', '内网IP', 'com.ruoyi.system.domain.SysAsset@4e4e6b7b[\r\n  id=20102614345261\r\n  name=123\r\n  type=1\r\n  additionalInfo=123\r\n  tenantId=<null>\r\n  unit=<null>\r\n  createBy=<null>\r\n  createTime=Mon Oct 26 17:53:05 CST 2020\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-26 17:53:05');
INSERT INTO `sys_oper_log` VALUES (416, '车辆信息', 0, 'com.ruoyi.web.controller.system.SysAssetController.issue()', 'POST', 1, 'admin', NULL, '/system/asset/issue', '127.0.0.1', '内网IP', '20102614345261 测试部门 105', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-26 17:53:23');
INSERT INTO `sys_oper_log` VALUES (417, '车辆信息', 5, 'com.ruoyi.web.controller.system.SysAssetController.export()', 'GET', 1, 'admin', NULL, '/system/asset/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"775f64b7-b662-4a4c-9f22-1141c520c0c4_asset.xlsx\",\"code\":200}', 0, NULL, '2020-10-27 08:49:21');
INSERT INTO `sys_oper_log` VALUES (418, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101379698698/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-27 10:51:24');
INSERT INTO `sys_oper_log` VALUES (419, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-27 10:51:26');
INSERT INTO `sys_oper_log` VALUES (420, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-27 10:54:50');
INSERT INTO `sys_oper_log` VALUES (421, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-27 14:25:13');
INSERT INTO `sys_oper_log` VALUES (422, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-27 16:36:06');
INSERT INTO `sys_oper_log` VALUES (423, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@380c8326[\r\n  menuId=<null>\r\n  menuName=图片预览\r\n  parentId=1099\r\n  orderNum=4\r\n  path=<null>\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:picture:preview\r\n  icon=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 16:41:58');
INSERT INTO `sys_oper_log` VALUES (424, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1100', '127.0.0.1', '内网IP', '{menuId=1100}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-10-27 16:48:06');
INSERT INTO `sys_oper_log` VALUES (425, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1105', '127.0.0.1', '内网IP', '{menuId=1105}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-10-27 16:48:10');
INSERT INTO `sys_oper_log` VALUES (426, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysRole@4d0f125[\r\n  roleId=101\r\n  roleName=系统管理员\r\n  roleKey=xtgly\r\n  roleSort=2\r\n  dataScope=1\r\n  status=0\r\n  delFlag=0\r\n  createBy=<null>\r\n  createTime=Fri Oct 16 16:16:13 CST 2020\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 16:48:31');
INSERT INTO `sys_oper_log` VALUES (427, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1105', '127.0.0.1', '内网IP', '{menuId=1105}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 16:48:43');
INSERT INTO `sys_oper_log` VALUES (428, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1100', '127.0.0.1', '内网IP', '{menuId=1100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 16:48:47');
INSERT INTO `sys_oper_log` VALUES (429, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@7882b1f6[\r\n  menuId=<null>\r\n  menuName=文件预览\r\n  parentId=1098\r\n  orderNum=6\r\n  path=<null>\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=F\r\n  visible=0\r\n  status =0\r\n  perms=system:report:preview\r\n  icon=<null>\r\n  createBy=admin\r\n  createTime=<null>\r\n  updateBy=<null>\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-27 16:55:29');
INSERT INTO `sys_oper_log` VALUES (430, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', 'com.ruoyi.common.core.domain.entity.SysMenu@621e9f65[\r\n  menuId=1091\r\n  menuName=数据管理\r\n  parentId=0\r\n  orderNum=5\r\n  path=systems\r\n  component=<null>\r\n  isFrame=1\r\n  menuType=M\r\n  visible=0\r\n  status =0\r\n  perms=\r\n  icon=exit-fullscreen\r\n  createBy=<null>\r\n  createTime=Tue Oct 13 14:08:44 CST 2020\r\n  updateBy=admin\r\n  updateTime=<null>\r\n  remark=<null>\r\n]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-28 08:52:55');
INSERT INTO `sys_oper_log` VALUES (431, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.issue()', 'POST', 1, 'admin', NULL, '/system/report/issue', '127.0.0.1', '内网IP', '20101656479197 4561513', '{\"msg\":\"对应车辆不存在，请先添加车辆\",\"code\":404}', 0, NULL, '2020-10-28 09:45:03');
INSERT INTO `sys_oper_log` VALUES (432, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.issue()', 'POST', 1, 'admin', NULL, '/system/report/issue', '127.0.0.1', '内网IP', '20101656479197 4561513', '{\"msg\":\"对应车辆不存在，请先添加车辆\",\"code\":404}', 0, NULL, '2020-10-28 09:45:27');
INSERT INTO `sys_oper_log` VALUES (433, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-28 09:52:58');
INSERT INTO `sys_oper_log` VALUES (434, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-28 09:52:58');
INSERT INTO `sys_oper_log` VALUES (435, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101379698698/test', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2020-10-28 09:53:41');
INSERT INTO `sys_oper_log` VALUES (436, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-28 09:53:51');
INSERT INTO `sys_oper_log` VALUES (437, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-28 10:26:10');
INSERT INTO `sys_oper_log` VALUES (438, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-28 10:27:23');
INSERT INTO `sys_oper_log` VALUES (439, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-28 10:34:55');
INSERT INTO `sys_oper_log` VALUES (440, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', 'null', 0, NULL, '2020-10-28 10:35:04');
INSERT INTO `sys_oper_log` VALUES (441, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-28 10:38:30');
INSERT INTO `sys_oper_log` VALUES (442, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', 'null', 0, NULL, '2020-10-28 10:38:40');
INSERT INTO `sys_oper_log` VALUES (443, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-28 10:41:18');
INSERT INTO `sys_oper_log` VALUES (444, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', 'null', 0, NULL, '2020-10-28 10:41:19');
INSERT INTO `sys_oper_log` VALUES (445, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-28 16:28:05');
INSERT INTO `sys_oper_log` VALUES (446, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', '{\"msg\":\"下载失败\",\"code\":500}', 0, NULL, '2020-10-28 16:28:14');
INSERT INTO `sys_oper_log` VALUES (447, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', '{\"msg\":\"下载失败\",\"code\":500}', 0, NULL, '2020-10-28 16:32:55');
INSERT INTO `sys_oper_log` VALUES (448, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', '{\"msg\":\"下载失败\",\"code\":500}', 0, NULL, '2020-10-28 16:33:42');
INSERT INTO `sys_oper_log` VALUES (449, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-28 16:34:55');
INSERT INTO `sys_oper_log` VALUES (450, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', '{\"msg\":\"下载失败\",\"code\":500}', 0, NULL, '2020-10-28 16:35:26');
INSERT INTO `sys_oper_log` VALUES (451, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"},{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf\"}]}', 0, NULL, '2020-10-28 16:35:53');
INSERT INTO `sys_oper_log` VALUES (452, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.delDetailFile()', 'POST', 1, 'admin', NULL, '/system/report/delDetailFile', '127.0.0.1', '内网IP', 'hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/123.pdf', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2020-10-28 16:35:56');
INSERT INTO `sys_oper_log` VALUES (453, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"}]}', 0, NULL, '2020-10-28 16:36:07');
INSERT INTO `sys_oper_log` VALUES (454, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '新建文本文档.txt hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt', '{\"msg\":\"下载失败\",\"code\":500}', 0, NULL, '2020-10-28 16:41:15');
INSERT INTO `sys_oper_log` VALUES (455, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '新建文本文档.txt hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt', '{\"msg\":\"下载失败\",\"code\":500}', 0, NULL, '2020-10-28 16:43:53');
INSERT INTO `sys_oper_log` VALUES (456, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"}]}', 0, NULL, '2020-10-28 17:36:25');
INSERT INTO `sys_oper_log` VALUES (457, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '新建文本文档.txt hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt', 'null', 0, NULL, '2020-10-28 17:36:41');
INSERT INTO `sys_oper_log` VALUES (458, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '新建文本文档.txt hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt', 'null', 0, NULL, '2020-10-28 17:36:53');
INSERT INTO `sys_oper_log` VALUES (459, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '接口文档_用户管理.docx hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx', 'null', 0, NULL, '2020-10-28 17:37:04');
INSERT INTO `sys_oper_log` VALUES (460, '文档存储', 1, 'com.ruoyi.web.controller.system.SysReportController.add()', 'POST', 1, 'admin', NULL, '/system/report', '127.0.0.1', '内网IP', '1028批量上传文件 test Wed Oct 28 00:00:00 CST 2020 阿文 20102013068400 [org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@791e373a, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@9b9b82b, org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@2d991d1f]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-28 17:38:16');
INSERT INTO `sys_oper_log` VALUES (461, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20102013068400/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"20200604180225.jpg\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg\"}]}', 0, NULL, '2020-10-28 17:38:20');
INSERT INTO `sys_oper_log` VALUES (462, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf', 'null', 0, NULL, '2020-10-28 17:38:24');
INSERT INTO `sys_oper_log` VALUES (463, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '20200604180225.jpg hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg', 'null', 0, NULL, '2020-10-28 17:38:50');
INSERT INTO `sys_oper_log` VALUES (464, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '1_疫情防控期间VPN使用说明.docx hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx', 'null', 0, NULL, '2020-10-28 17:39:01');
INSERT INTO `sys_oper_log` VALUES (465, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf', 'null', 0, NULL, '2020-10-28 17:40:09');
INSERT INTO `sys_oper_log` VALUES (466, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"}]}', 0, NULL, '2020-10-28 17:41:36');
INSERT INTO `sys_oper_log` VALUES (467, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '新建文本文档.txt hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt', 'null', 0, NULL, '2020-10-28 17:41:38');
INSERT INTO `sys_oper_log` VALUES (468, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20102013068400/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"20200604180225.jpg\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg\"}]}', 0, NULL, '2020-10-28 17:47:24');
INSERT INTO `sys_oper_log` VALUES (469, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '123.pdf hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf', 'null', 0, NULL, '2020-10-28 17:47:27');
INSERT INTO `sys_oper_log` VALUES (470, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '1_疫情防控期间VPN使用说明.docx hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx', 'null', 0, NULL, '2020-10-28 17:47:57');
INSERT INTO `sys_oper_log` VALUES (471, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '20200604180225.jpg hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg', 'null', 0, NULL, '2020-10-28 17:48:15');
INSERT INTO `sys_oper_log` VALUES (472, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20102013068400/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"20200604180225.jpg\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg\"}]}', 0, NULL, '2020-10-28 17:52:39');
INSERT INTO `sys_oper_log` VALUES (473, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20102013068400/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"20200604180225.jpg\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg\"}]}', 0, NULL, '2020-10-28 17:54:42');
INSERT INTO `sys_oper_log` VALUES (474, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20102013068400/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"20200604180225.jpg\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg\"}]}', 0, NULL, '2020-10-28 18:04:14');
INSERT INTO `sys_oper_log` VALUES (475, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '20200604180225.jpg hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg', 'null', 0, NULL, '2020-10-28 18:04:16');
INSERT INTO `sys_oper_log` VALUES (476, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20102013068400/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"20200604180225.jpg\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg\"}]}', 0, NULL, '2020-10-28 18:05:40');
INSERT INTO `sys_oper_log` VALUES (477, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '20200604180225.jpg hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg', 'null', 0, NULL, '2020-10-28 18:05:41');
INSERT INTO `sys_oper_log` VALUES (478, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20102013068400/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"20200604180225.jpg\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg\"}]}', 0, NULL, '2020-10-28 18:05:49');
INSERT INTO `sys_oper_log` VALUES (479, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '20200604180225.jpg hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg', 'null', 0, NULL, '2020-10-28 18:05:50');
INSERT INTO `sys_oper_log` VALUES (480, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '20200604180225.jpg hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg', 'null', 0, NULL, '2020-10-28 18:05:56');
INSERT INTO `sys_oper_log` VALUES (481, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20102013068400/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"20200604180225.jpg\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg\"}]}', 0, NULL, '2020-10-29 08:58:55');
INSERT INTO `sys_oper_log` VALUES (482, '文档存储', 3, 'com.ruoyi.web.controller.system.SysReportController.remove()', 'DELETE', 1, 'admin', NULL, '/system/report/20101473691636', '127.0.0.1', '内网IP', '{ids=20101473691636}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-29 09:02:56');
INSERT INTO `sys_oper_log` VALUES (483, '文档存储', 3, 'com.ruoyi.web.controller.system.SysReportController.remove()', 'DELETE', 1, 'admin', NULL, '/system/report/20101487058263', '127.0.0.1', '内网IP', '{ids=20101487058263}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-29 09:02:59');
INSERT INTO `sys_oper_log` VALUES (484, '文档存储', 3, 'com.ruoyi.web.controller.system.SysReportController.remove()', 'DELETE', 1, 'admin', NULL, '/system/report/20101492658879', '127.0.0.1', '内网IP', '{ids=20101492658879}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-29 09:03:04');
INSERT INTO `sys_oper_log` VALUES (485, '文档存储', 3, 'com.ruoyi.web.controller.system.SysReportController.remove()', 'DELETE', 1, 'admin', NULL, '/system/report/20101656479197', '127.0.0.1', '内网IP', '{ids=20101656479197}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-29 09:03:07');
INSERT INTO `sys_oper_log` VALUES (486, '文档存储', 3, 'com.ruoyi.web.controller.system.SysReportController.remove()', 'DELETE', 1, 'admin', NULL, '/system/report/20102322005024', '127.0.0.1', '内网IP', '{ids=20102322005024}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-29 09:03:11');
INSERT INTO `sys_oper_log` VALUES (487, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20101996454907/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"接口文档_用户管理.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/接口文档_用户管理.docx\"},{\"fileName\":\"新建文本文档.txt\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20101996454907/test/新建文本文档.txt\"}]}', 0, NULL, '2020-10-29 09:03:17');
INSERT INTO `sys_oper_log` VALUES (488, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20102013068400/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"20200604180225.jpg\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg\"}]}', 0, NULL, '2020-10-29 09:03:22');
INSERT INTO `sys_oper_log` VALUES (489, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20102013068400/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"20200604180225.jpg\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg\"}]}', 0, NULL, '2020-10-29 09:03:56');
INSERT INTO `sys_oper_log` VALUES (490, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20102013068400/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"20200604180225.jpg\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg\"}]}', 0, NULL, '2020-10-29 09:04:10');
INSERT INTO `sys_oper_log` VALUES (491, '图片预览', 0, 'com.ruoyi.web.controller.system.SysPictureController.readPic()', 'POST', 1, 'admin', NULL, '/system/picture/preview', '127.0.0.1', '内网IP', '2010484613556 test', 'null', 0, NULL, '2020-10-29 15:42:37');
INSERT INTO `sys_oper_log` VALUES (492, '图片预览', 0, 'com.ruoyi.web.controller.system.SysPictureController.readPic()', 'POST', 1, 'admin', NULL, '/system/picture/preview', '127.0.0.1', '内网IP', '2010484613556 test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[\"hdfs://192.168.50.89:9000/2010484613556/test/0.png\",\"hdfs://192.168.50.89:9000/2010484613556/test/20200604180225.jpg\"]}', 0, NULL, '2020-10-29 16:10:32');
INSERT INTO `sys_oper_log` VALUES (493, '图片预览', 0, 'com.ruoyi.web.controller.system.SysPictureController.readPic()', 'POST', 1, 'admin', NULL, '/system/picture/preview', '127.0.0.1', '内网IP', '2010484613556 test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[\"hdfs://192.168.50.89:9000/2010484613556/test/0.png\",\"hdfs://192.168.50.89:9000/2010484613556/test/20200604180225.jpg\"]}', 0, NULL, '2020-10-29 16:10:57');
INSERT INTO `sys_oper_log` VALUES (494, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.listDetail()', 'POST', 1, 'admin', NULL, '/system/report/detail', '127.0.0.1', '内网IP', '20102013068400/test', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"fileName\":\"123.pdf\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/123.pdf\"},{\"fileName\":\"1_疫情防控期间VPN使用说明.docx\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx\"},{\"fileName\":\"20200604180225.jpg\",\"filePath\":\"hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/20200604180225.jpg\"}]}', 0, NULL, '2020-10-30 15:46:16');
INSERT INTO `sys_oper_log` VALUES (495, '文档存储', 0, 'com.ruoyi.web.controller.system.SysReportController.downloadFile()', 'POST', 1, 'admin', NULL, '/system/report/downloadFile', '127.0.0.1', '内网IP', '1_疫情防控期间VPN使用说明.docx hdfs://192.168.50.89:9000/user/dengsihao/20102013068400/test/1_疫情防控期间VPN使用说明.docx', 'null', 0, NULL, '2020-10-30 15:46:19');

-- ----------------------------
-- Table structure for sys_picture
-- ----------------------------
DROP TABLE IF EXISTS `sys_picture`;
CREATE TABLE `sys_picture`  (
  `id` bigint(11) NOT NULL COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片名称',
  `picture_folder_id` int(11) NULL DEFAULT NULL COMMENT '图片所属文件夹id',
  `picture_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片所属文件夹路径',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `additional_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `asset_id` bigint(11) NOT NULL COMMENT '所属车辆id',
  `unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属单位',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `asset_id`(`asset_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图片存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_picture
-- ----------------------------
INSERT INTO `sys_picture` VALUES (20102061639468, '上传图片测试文件夹', NULL, 'test', '2020-10-20 00:00:00', '上传测试', 2010484613556, NULL, NULL, '2020-10-20 16:19:47', NULL, NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_report
-- ----------------------------
DROP TABLE IF EXISTS `sys_report`;
CREATE TABLE `sys_report`  (
  `id` bigint(11) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `report_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件所属路径',
  `time` datetime(0) NOT NULL COMMENT '上传时间',
  `additional_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `asset_id` bigint(11) NOT NULL COMMENT '所属车辆id',
  `unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属单位',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `asset_id`(`asset_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_report
-- ----------------------------
INSERT INTO `sys_report` VALUES (20102327029551, '测试数据批量上传', 'test', '2020-10-23 00:00:00', '阿文', 20101996454907, NULL, NULL, '2020-10-23 17:40:15', NULL, NULL);
INSERT INTO `sys_report` VALUES (20102857474556, '1028批量上传文件', 'test', '2020-10-28 00:00:00', '阿文', 20102013068400, NULL, NULL, '2020-10-28 17:38:17', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 3, '3', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-16 16:18:33', '普通角色');
INSERT INTO `sys_role` VALUES (100, '测试人员', 'test', 5, '4', '0', '2', 'admin', '2020-08-11 10:19:04', '', '2020-10-12 17:45:08', NULL);
INSERT INTO `sys_role` VALUES (101, '系统管理员', 'xtgly', 2, '1', '0', '0', 'admin', '2020-10-16 16:16:13', 'admin', '2020-10-27 16:48:31', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 107);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1091);
INSERT INTO `sys_role_menu` VALUES (2, 1092);
INSERT INTO `sys_role_menu` VALUES (2, 1093);
INSERT INTO `sys_role_menu` VALUES (2, 1095);
INSERT INTO `sys_role_menu` VALUES (2, 1097);
INSERT INTO `sys_role_menu` VALUES (2, 1098);
INSERT INTO `sys_role_menu` VALUES (2, 1099);
INSERT INTO `sys_role_menu` VALUES (2, 1101);
INSERT INTO `sys_role_menu` VALUES (2, 1102);
INSERT INTO `sys_role_menu` VALUES (2, 1103);
INSERT INTO `sys_role_menu` VALUES (2, 1104);
INSERT INTO `sys_role_menu` VALUES (2, 1106);
INSERT INTO `sys_role_menu` VALUES (2, 1107);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 3);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 114);
INSERT INTO `sys_role_menu` VALUES (100, 115);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (100, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1058);
INSERT INTO `sys_role_menu` VALUES (100, 1059);
INSERT INTO `sys_role_menu` VALUES (100, 1060);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 2);
INSERT INTO `sys_role_menu` VALUES (101, 3);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 101);
INSERT INTO `sys_role_menu` VALUES (101, 102);
INSERT INTO `sys_role_menu` VALUES (101, 103);
INSERT INTO `sys_role_menu` VALUES (101, 104);
INSERT INTO `sys_role_menu` VALUES (101, 105);
INSERT INTO `sys_role_menu` VALUES (101, 106);
INSERT INTO `sys_role_menu` VALUES (101, 107);
INSERT INTO `sys_role_menu` VALUES (101, 108);
INSERT INTO `sys_role_menu` VALUES (101, 109);
INSERT INTO `sys_role_menu` VALUES (101, 110);
INSERT INTO `sys_role_menu` VALUES (101, 111);
INSERT INTO `sys_role_menu` VALUES (101, 112);
INSERT INTO `sys_role_menu` VALUES (101, 113);
INSERT INTO `sys_role_menu` VALUES (101, 114);
INSERT INTO `sys_role_menu` VALUES (101, 115);
INSERT INTO `sys_role_menu` VALUES (101, 500);
INSERT INTO `sys_role_menu` VALUES (101, 501);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1002);
INSERT INTO `sys_role_menu` VALUES (101, 1003);
INSERT INTO `sys_role_menu` VALUES (101, 1004);
INSERT INTO `sys_role_menu` VALUES (101, 1005);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 1007);
INSERT INTO `sys_role_menu` VALUES (101, 1008);
INSERT INTO `sys_role_menu` VALUES (101, 1009);
INSERT INTO `sys_role_menu` VALUES (101, 1010);
INSERT INTO `sys_role_menu` VALUES (101, 1011);
INSERT INTO `sys_role_menu` VALUES (101, 1012);
INSERT INTO `sys_role_menu` VALUES (101, 1013);
INSERT INTO `sys_role_menu` VALUES (101, 1014);
INSERT INTO `sys_role_menu` VALUES (101, 1015);
INSERT INTO `sys_role_menu` VALUES (101, 1016);
INSERT INTO `sys_role_menu` VALUES (101, 1017);
INSERT INTO `sys_role_menu` VALUES (101, 1018);
INSERT INTO `sys_role_menu` VALUES (101, 1019);
INSERT INTO `sys_role_menu` VALUES (101, 1020);
INSERT INTO `sys_role_menu` VALUES (101, 1021);
INSERT INTO `sys_role_menu` VALUES (101, 1022);
INSERT INTO `sys_role_menu` VALUES (101, 1023);
INSERT INTO `sys_role_menu` VALUES (101, 1024);
INSERT INTO `sys_role_menu` VALUES (101, 1025);
INSERT INTO `sys_role_menu` VALUES (101, 1026);
INSERT INTO `sys_role_menu` VALUES (101, 1027);
INSERT INTO `sys_role_menu` VALUES (101, 1028);
INSERT INTO `sys_role_menu` VALUES (101, 1029);
INSERT INTO `sys_role_menu` VALUES (101, 1030);
INSERT INTO `sys_role_menu` VALUES (101, 1031);
INSERT INTO `sys_role_menu` VALUES (101, 1032);
INSERT INTO `sys_role_menu` VALUES (101, 1033);
INSERT INTO `sys_role_menu` VALUES (101, 1034);
INSERT INTO `sys_role_menu` VALUES (101, 1035);
INSERT INTO `sys_role_menu` VALUES (101, 1036);
INSERT INTO `sys_role_menu` VALUES (101, 1037);
INSERT INTO `sys_role_menu` VALUES (101, 1038);
INSERT INTO `sys_role_menu` VALUES (101, 1039);
INSERT INTO `sys_role_menu` VALUES (101, 1040);
INSERT INTO `sys_role_menu` VALUES (101, 1041);
INSERT INTO `sys_role_menu` VALUES (101, 1042);
INSERT INTO `sys_role_menu` VALUES (101, 1043);
INSERT INTO `sys_role_menu` VALUES (101, 1044);
INSERT INTO `sys_role_menu` VALUES (101, 1045);
INSERT INTO `sys_role_menu` VALUES (101, 1046);
INSERT INTO `sys_role_menu` VALUES (101, 1047);
INSERT INTO `sys_role_menu` VALUES (101, 1048);
INSERT INTO `sys_role_menu` VALUES (101, 1049);
INSERT INTO `sys_role_menu` VALUES (101, 1050);
INSERT INTO `sys_role_menu` VALUES (101, 1051);
INSERT INTO `sys_role_menu` VALUES (101, 1052);
INSERT INTO `sys_role_menu` VALUES (101, 1053);
INSERT INTO `sys_role_menu` VALUES (101, 1054);
INSERT INTO `sys_role_menu` VALUES (101, 1055);
INSERT INTO `sys_role_menu` VALUES (101, 1056);
INSERT INTO `sys_role_menu` VALUES (101, 1057);
INSERT INTO `sys_role_menu` VALUES (101, 1058);
INSERT INTO `sys_role_menu` VALUES (101, 1059);
INSERT INTO `sys_role_menu` VALUES (101, 1060);
INSERT INTO `sys_role_menu` VALUES (101, 1091);
INSERT INTO `sys_role_menu` VALUES (101, 1092);
INSERT INTO `sys_role_menu` VALUES (101, 1093);
INSERT INTO `sys_role_menu` VALUES (101, 1094);
INSERT INTO `sys_role_menu` VALUES (101, 1095);
INSERT INTO `sys_role_menu` VALUES (101, 1097);
INSERT INTO `sys_role_menu` VALUES (101, 1098);
INSERT INTO `sys_role_menu` VALUES (101, 1099);
INSERT INTO `sys_role_menu` VALUES (101, 1101);
INSERT INTO `sys_role_menu` VALUES (101, 1102);
INSERT INTO `sys_role_menu` VALUES (101, 1103);
INSERT INTO `sys_role_menu` VALUES (101, 1104);
INSERT INTO `sys_role_menu` VALUES (101, 1106);
INSERT INTO `sys_role_menu` VALUES (101, 1107);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');
INSERT INTO `sys_user` VALUES (100, 106, '财务助理', '财务助理', '00', '123562525@qq.com', '13457812452', '1', '', '$2a$10$ahpimFqEUIIaR4hKTeTcluE/pQYUIJrhPhEEce4hP7C4XoevFahAu', '0', '2', '', NULL, 'admin', '2020-08-11 09:46:23', 'admin', '2020-10-16 14:53:04', NULL);
INSERT INTO `sys_user` VALUES (101, 103, 'test', 'test', '00', '132456@163.com', '13256895689', '0', '', '$2a$10$x4Azx6HLFLpdCYj9xEsP0OtWaTpkgiRp6OOI7XqHe0a6Bs7hUwJ42', '0', '2', '', NULL, 'admin', '2020-10-12 11:07:16', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (102, 108, 'test01', 'test01', '00', '4567@12.com', '13645678658', '0', '', '$2a$10$QbsYoDuZt3hM/FyL7xTpZ.BeCxsrZwJAz659m89T8C/WpqF8FwW3m', '0', '2', '', NULL, 'admin', '2020-10-15 16:17:50', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, 108, 'test01', 'test01', '00', '4567@12.com', '13645678658', '0', '', '$2a$10$bgrC7cMflQdhPKT4iVl9K./d4sJHmgeRAqofPyPPzk6.55bZ9AyWe', '0', '2', '', NULL, 'admin', '2020-10-15 16:17:50', 'admin', '2020-10-15 16:19:18', NULL);
INSERT INTO `sys_user` VALUES (104, 108, 'test01', 'test01', '00', '4567@12.com', '13645678658', '0', '', '$2a$10$o0RCY1ahNkOpx369TMRVv.4gkk8yJuJjXKhZZgvDLnX2mUuHle/0.', '0', '2', '', NULL, 'admin', '2020-10-15 16:17:50', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (105, 108, 'test01', 'test01', '00', '4567@12.com', '13645678658', '0', '', '$2a$10$1D9joJ2e9bIzsTRYQaKgPeB6qXqjjYsMRZQEpJR9tFDtefB3i7ktC', '0', '2', '', NULL, 'admin', '2020-10-15 16:17:50', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (106, 103, 'test02', 'test02', '00', '1325456@123.com', '13659785689', '0', '', '$2a$10$p/vLZG7GdogfHAHiMx0m.ew3UsUBUabIIlfj9mmklpDBejYEetb7G', '0', '2', '', NULL, 'admin', '2020-10-15 16:21:14', 'test02', '2020-10-16 14:36:14', '001');
INSERT INTO `sys_user` VALUES (107, 103, 'boss', '董事长', '00', '123@123.com', '13659875643', '0', '', '$2a$10$dtDenKPnXEB3tbMDDW25v.0D7L30ds/FOY9c2wuLoMFNmoX2fQ1Tm', '0', '0', '', NULL, 'admin', '2020-10-16 13:47:26', 'admin', '2020-10-16 15:00:17', '123');
INSERT INTO `sys_user` VALUES (108, 107, 'aaaa', 'aaaa', '00', '123456@123.com', '13645678952', '0', '', '$2a$10$Mq2x3NnVPFZlp0z62jIbouhgEteAtNSbvicd6fJ.qsPP7tRFZM3SO', '0', '0', '', NULL, 'admin', '2020-10-16 14:42:15', 'admin', '2020-10-20 17:56:17', 'aaa');
INSERT INTO `sys_user` VALUES (109, 104, 'yqgs', '一汽公司', '00', '1234556@123.com', '13645689656', '0', '', '$2a$10$on36Ynu.xbCLmEmh.g/Tbub5Zp873vqcVwbXMBrflKDvauDXL/Zl.', '0', '0', '', NULL, 'admin', '2020-10-16 16:25:10', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 4);
INSERT INTO `sys_user_post` VALUES (101, 3);
INSERT INTO `sys_user_post` VALUES (102, 4);
INSERT INTO `sys_user_post` VALUES (103, 4);
INSERT INTO `sys_user_post` VALUES (104, 4);
INSERT INTO `sys_user_post` VALUES (105, 4);
INSERT INTO `sys_user_post` VALUES (106, 4);
INSERT INTO `sys_user_post` VALUES (107, 1);
INSERT INTO `sys_user_post` VALUES (108, 4);
INSERT INTO `sys_user_post` VALUES (109, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (102, 2);
INSERT INTO `sys_user_role` VALUES (103, 2);
INSERT INTO `sys_user_role` VALUES (104, 2);
INSERT INTO `sys_user_role` VALUES (105, 2);
INSERT INTO `sys_user_role` VALUES (106, 2);
INSERT INTO `sys_user_role` VALUES (107, 2);
INSERT INTO `sys_user_role` VALUES (108, 2);
INSERT INTO `sys_user_role` VALUES (109, 2);

SET FOREIGN_KEY_CHECKS = 1;
