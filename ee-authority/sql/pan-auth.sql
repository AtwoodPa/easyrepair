/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : pan-auth

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 02/08/2023 16:23:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` bigint DEFAULT '0' COMMENT '上级部门id',
  `tree_path` varchar(255) DEFAULT ',' COMMENT '树结构',
  `sort_value` int DEFAULT '1' COMMENT '排序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态（1正常 0停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2018 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='组织机构';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, '硅谷集团有限公司', 0, ',1,', 1, '张老师', '15659090912', 1, '2022-05-24 16:13:13', '2022-05-24 16:13:13', 0);
INSERT INTO `sys_dept` VALUES (10, '北京校区', 1, ',1,10,', 1, '李老师', '18790007789', 1, '2022-05-24 16:13:15', '2022-05-24 16:13:15', 0);
INSERT INTO `sys_dept` VALUES (20, '上海校区', 1, ',1,20,', 1, '王老师', '15090987678', 1, '2022-05-25 14:02:25', '2022-05-25 14:02:25', 0);
INSERT INTO `sys_dept` VALUES (30, '深圳校区', 1, ',1,30,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:24', '2022-05-25 14:02:24', 0);
INSERT INTO `sys_dept` VALUES (1010, '教学部分', 10, ',1,10,1010,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:24', '2022-05-25 14:02:24', 0);
INSERT INTO `sys_dept` VALUES (1020, '运营部门', 10, ',1,10,1020,', 1, '王老师', '15090987678', 1, '2022-05-25 14:02:29', '2022-05-25 14:02:29', 0);
INSERT INTO `sys_dept` VALUES (1021, 'Java学科', 1010, ',1,10,1010,1021,', 1, '王老师', '15090987678', 1, '2022-05-24 16:13:31', '2022-05-24 16:13:31', 0);
INSERT INTO `sys_dept` VALUES (1022, '大数据学科', 1010, ',1,10,1010,1022,', 1, '王老师', '15090987678', 1, '2022-05-25 14:02:22', '2022-05-25 14:02:22', 0);
INSERT INTO `sys_dept` VALUES (1024, '前端学科', 1010, ',1,10,1010,1024,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:22', '2022-05-25 14:02:22', 0);
INSERT INTO `sys_dept` VALUES (1025, '客服', 1020, ',1,10,1020,1025,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:23', '2022-05-25 14:02:23', 0);
INSERT INTO `sys_dept` VALUES (1026, '网站推广', 1020, ',1,10,1020,1026,', 1, '30.607366', '15090987678', 1, '2022-05-25 14:02:26', '2022-05-25 14:02:26', 0);
INSERT INTO `sys_dept` VALUES (1027, '线下运营', 1020, ',1,10,1020,1027,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:26', '2022-05-25 14:02:26', 0);
INSERT INTO `sys_dept` VALUES (1028, '设计', 1020, ',1,10,1020,1028,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:27', '2022-05-25 14:02:27', 0);
INSERT INTO `sys_dept` VALUES (2012, '教学部门', 20, ',1,20,2012,', 1, '王老师', '18909890765', 1, '2022-05-24 16:13:51', '2022-05-24 16:13:51', 0);
INSERT INTO `sys_dept` VALUES (2013, '教学部门', 30, ',1,30,2013,', 1, '李老师', '18567867895', 1, '2022-05-24 16:13:50', '2022-05-24 16:13:50', 0);
INSERT INTO `sys_dept` VALUES (2016, 'Java学科', 2012, ',1,20,2012,2012,', 1, '张老师', '15090909909', 1, '2022-05-25 10:51:12', '2022-05-25 10:51:12', 0);
INSERT INTO `sys_dept` VALUES (2017, '大数据学科', 2012, ',1,20,2012,2012,', 1, '李老师', '15090980989', 1, '2022-05-27 09:11:54', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `username` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_login_log` VALUES (1, 'admin', '0:0:0:0:0:0:0:1', 1, '登录成功', NULL, '2022-06-10 11:24:14', NULL, 0);
INSERT INTO `sys_login_log` VALUES (2, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2022-06-10 11:53:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (3, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2023-06-28 16:59:52', NULL, 0);
INSERT INTO `sys_login_log` VALUES (4, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 10:01:16', NULL, 0);
INSERT INTO `sys_login_log` VALUES (5, 'panpan', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 15:37:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (6, 'panpan', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 15:40:33', NULL, 0);
INSERT INTO `sys_login_log` VALUES (7, 'panpan', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:01:35', NULL, 0);
INSERT INTO `sys_login_log` VALUES (8, 'panpan', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:02:48', NULL, 0);
INSERT INTO `sys_login_log` VALUES (9, 'panpan', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:02:49', NULL, 0);
INSERT INTO `sys_login_log` VALUES (10, 'panpan', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:07:31', NULL, 0);
INSERT INTO `sys_login_log` VALUES (11, 'panpan', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:09:54', NULL, 0);
INSERT INTO `sys_login_log` VALUES (12, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:11:22', NULL, 0);
INSERT INTO `sys_login_log` VALUES (13, 'panpan', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:11:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (14, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:12:08', NULL, 0);
INSERT INTO `sys_login_log` VALUES (15, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:13:31', NULL, 0);
INSERT INTO `sys_login_log` VALUES (16, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:17:44', NULL, 0);
INSERT INTO `sys_login_log` VALUES (17, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:17:45', NULL, 0);
INSERT INTO `sys_login_log` VALUES (18, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:17:46', NULL, 0);
INSERT INTO `sys_login_log` VALUES (19, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2023-08-02 16:17:46', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '所属上级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '类型(0:目录,1:菜单,2:按钮)',
  `path` varchar(100) DEFAULT NULL COMMENT '路由地址',
  `component` varchar(100) DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `sort_value` int DEFAULT NULL COMMENT '排序',
  `status` tinyint DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1674355152561139715 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (2, 0, '系统管理', 0, 'system', 'Layout', NULL, 'el-icon-s-tools', 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:23:24', 0);
INSERT INTO `sys_menu` VALUES (3, 2, '用户管理', 1, 'sysUser', 'system/sysUser/index', '', 'el-icon-s-custom', 1, 1, '2021-05-31 18:05:37', '2023-06-28 17:26:18', 0);
INSERT INTO `sys_menu` VALUES (4, 2, '角色管理', 1, 'sysRole', 'system/sysRole/index', '', 'el-icon-user-solid', 2, 1, '2021-05-31 18:05:37', '2023-06-28 17:26:23', 0);
INSERT INTO `sys_menu` VALUES (5, 2, '菜单管理', 1, 'sysMenu', 'system/sysMenu/index', '', 'el-icon-s-unfold', 3, 1, '2021-05-31 18:05:37', '2023-06-28 17:26:27', 0);
INSERT INTO `sys_menu` VALUES (6, 3, '查看', 2, NULL, NULL, 'bnt.sysUser.list', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (7, 3, '添加', 2, NULL, NULL, 'bnt.sysUser.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (8, 3, '修改', 2, NULL, NULL, 'bnt.sysUser.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (9, 3, '删除', 2, NULL, NULL, 'bnt.sysUser.remove', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (10, 4, '查看', 2, NULL, NULL, 'bnt.sysRole.list', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (11, 4, '添加', 2, NULL, NULL, 'bnt.sysRole.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (12, 4, '修改', 2, NULL, NULL, 'bnt.sysRole.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (13, 4, '删除', 2, NULL, NULL, 'bnt.sysRole.remove', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (14, 5, '查看', 2, NULL, NULL, 'bnt.sysMenu.list', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (15, 5, '添加', 2, NULL, NULL, 'bnt.sysMenu.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (16, 5, '修改', 2, NULL, NULL, 'bnt.sysMenu.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (17, 5, '删除', 2, NULL, NULL, 'bnt.sysMenu.remove', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (18, 3, '分配角色', 2, NULL, NULL, 'bnt.sysUser.assignRole', NULL, 1, 1, '2022-05-23 17:14:32', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (19, 4, '分配权限', 2, 'assignAuth', 'system/sysRole/assignAuth', 'bnt.sysRole.assignAuth', NULL, 1, 1, '2022-05-23 17:18:14', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (20, 2, '部门管理', 1, 'sysDept', 'system/sysDept/index', '', 'el-icon-s-operation', 4, 1, '2022-05-24 10:07:05', '2023-08-02 16:17:25', 1);
INSERT INTO `sys_menu` VALUES (21, 20, '查看', 2, NULL, NULL, 'bnt.sysDept.list', NULL, 1, 1, '2022-05-24 10:07:44', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (22, 2, '岗位管理', 1, 'sysPost', 'system/sysPost/index', '', 'el-icon-more-outline', 5, 1, '2022-05-24 10:25:30', '2023-08-02 16:17:37', 1);
INSERT INTO `sys_menu` VALUES (23, 22, '查看', 2, NULL, NULL, 'bnt.sysPost.list', NULL, 1, 1, '2022-05-24 10:25:45', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (24, 20, '添加', 2, NULL, NULL, 'bnt.sysDept.add', NULL, 1, 1, '2022-05-25 15:31:27', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (25, 20, '修改', 2, NULL, NULL, 'bnt.sysDept.update', NULL, 1, 1, '2022-05-25 15:31:41', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (26, 20, '删除', 2, NULL, NULL, 'bnt.sysDept.remove', NULL, 1, 1, '2022-05-25 15:31:59', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (27, 22, '添加', 2, NULL, NULL, 'bnt.sysPost.add', NULL, 1, 1, '2022-05-25 15:32:44', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (28, 22, '修改', 2, NULL, NULL, 'bnt.sysPost.update', NULL, 1, 1, '2022-05-25 15:32:58', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (29, 22, '删除', 2, NULL, NULL, 'bnt.sysPost.remove', NULL, 1, 1, '2022-05-25 15:33:11', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (30, 34, '操作日志', 1, 'sysOperLog', 'system/sysOperLog/index', '', 'el-icon-document-remove', 7, 1, '2022-05-26 16:09:59', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (31, 30, '查看', 2, NULL, NULL, 'bnt.sysOperLog.list', NULL, 1, 1, '2022-05-26 16:10:17', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (32, 34, '登录日志', 1, 'sysLoginLog', 'system/sysLoginLog/index', '', 'el-icon-s-goods', 8, 1, '2022-05-26 16:36:13', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (33, 32, '查看', 2, NULL, NULL, 'bnt.sysLoginLog.list', NULL, 1, 1, '2022-05-26 16:36:31', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (34, 2, '日志管理', 0, 'log', 'ParentView', '', 'el-icon-tickets', 6, 1, '2022-05-31 13:23:07', '2023-08-02 16:13:25', 0);
INSERT INTO `sys_menu` VALUES (35, 0, '业务管理', 0, 'business', 'Layout', '', 'el-icon-s-check', 1, 1, '2023-06-29 17:50:47', '2023-06-29 17:57:26', 0);
INSERT INTO `sys_menu` VALUES (36, 35, '报修管理', 1, 'busReport', 'business/report/index', '', 'el-icon-document-remove', 1, 1, '2023-06-29 17:52:31', '2023-06-29 17:57:47', 0);
INSERT INTO `sys_menu` VALUES (37, 35, '微信用户', 1, 'busWx', 'business/wxuser/index', '', 'el-icon-s-help', 1, 1, '2023-06-29 17:52:31', '2023-07-06 07:59:29', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` varchar(20) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` varchar(20) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (1, '角色管理', '1', 'com.atguigu.auth.controller.SysRoleController.save()', 'POST', '1', 'admin', '', '/admin/auth/sysRole/save', '', '{\"param\":{},\"roleCode\":\"\",\"roleName\":\"test\",\"id\":5}', '{\"code\":200,\"message\":\"成功\"}', 0, '', NULL, '2022-05-26 15:59:44', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (2, '角色管理', 'DELETE', 'com.atguigu.auth.controller.SysRoleController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/auth/sysRole/remove/5', '', '', '{\"code\":200,\"message\":\"成功\"}', 0, '', NULL, '2022-05-26 16:05:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (3, '角色管理', 'DELETE', 'com.atguigu.auth.controller.SysRoleController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/auth/sysRole/remove/4', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-26 16:52:40', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (4, '角色管理', 'UPDATE', 'com.atguigu.auth.controller.SysRoleController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysRole/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1622507920000,\"param\":{},\"roleCode\":\"\",\"roleName\":\"普通管理员\",\"description\":\"普通管理员\",\"updateTime\":1645670566000,\"id\":2}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 08:47:54', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (5, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"SysRole\",\"select\":false,\"level\":3,\"updateTime\":1653287810000,\"type\":1,\"parentId\":2,\"isDeleted\":0,\"children\":[{\"code\":\"btn.SysRole.list\",\"select\":false,\"level\":4,\"updateTime\":1622460772000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"id\":10},{\"code\":\"btn.SysRole.add\",\"select\":false,\"level\":4,\"updateTime\":1653547976000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"id\":11},{\"code\":\"btn.SysRole.update\",\"select\":false,\"level\":4,\"updateTime\":1653547981000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"id\":12},{\"code\":\"btn.SysRole.remove\",\"select\":false,\"level\":4,\"updateTime\":1622507874000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"id\":13},{\"code\":\"btn.SysRole.assignAuth\",\"select\":false,\"level\":4,\"toCode\":\"AssignAuth\",\"updateTime\":1653376735000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1653297494000,\"param\":{},\"name\":\"分配权限\",\"id\":19}],\"createTime\":1622455537000,\"param\":{},\"name\":\"角色管理\",\"id\":4}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 08:48:08', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (6, '岗位管理', 'UPDATE', 'com.atguigu.auth.controller.SysPostController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysPost/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1653359648000,\"param\":{},\"name\":\"总经理\",\"description\":\"2\",\"postCode\":\"zjl\",\"id\":6,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 08:56:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (7, '岗位管理', 'INSERT', 'com.atguigu.auth.controller.SysPostController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/auth/sysPost/save', '127.0.0.1', '{\"param\":{},\"name\":\"网咨\",\"description\":\"\",\"postCode\":\"wz\",\"id\":7,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 08:56:37', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (8, '岗位管理', 'DELETE', 'com.atguigu.auth.controller.SysPostController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/auth/sysPost/remove/7', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 08:56:41', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (9, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"btn.sysDept.list\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653358064000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653358064000,\"param\":{},\"name\":\"查看\",\"id\":21}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:02:49', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (10, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"btn.sysDept.add\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653463887000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463887000,\"param\":{},\"name\":\"添加\",\"id\":24}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:02:55', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (11, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"btn.sysDept.update\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653463901000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463901000,\"param\":{},\"name\":\"修改\",\"id\":25}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:03:01', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (12, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"btn.sysDept.remove\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653463919000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463919000,\"param\":{},\"name\":\"删除\",\"id\":26}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:03:07', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (13, '部门管理', 'UPDATE', 'com.atguigu.auth.controller.SysDeptController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysDept/update', '127.0.0.1', '{\"leader\":\"张老师\",\"updateTime\":1653447072000,\"parentId\":2012,\"sortValue\":1,\"isDeleted\":0,\"createTime\":1653447072000,\"param\":{},\"phone\":\"15090909909\",\"name\":\"Java学科\",\"id\":2016,\"treePath\":\",1,20,2012,2012,\",\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:11:28', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (14, '部门管理', 'INSERT', 'com.atguigu.auth.controller.SysDeptController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/auth/sysDept/save', '127.0.0.1', '{\"leader\":\"李老师\",\"parentId\":2012,\"param\":{},\"phone\":\"15090980989\",\"name\":\"大数据学科\",\"id\":2017,\"treePath\":\",1,20,2012,2012,\"}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:11:54', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (15, '部门管理', 'UPDATE', 'com.atguigu.auth.controller.SysDeptController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysDept/update', '127.0.0.1', '{\"leader\":\"李老师\",\"parentId\":2012,\"sortValue\":1,\"isDeleted\":0,\"createTime\":1653613914000,\"param\":{},\"phone\":\"15090980989\",\"name\":\"大数据学科\",\"id\":2017,\"treePath\":\",1,20,2012,2012,\",\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:16:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (16, '角色管理', 'UPDATE', 'com.atguigu.auth.controller.SysRoleController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysRole/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1622507920000,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"description\":\"普通管理员\",\"updateTime\":1645670566000,\"id\":2}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 09:28:15', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (17, '角色管理', 'INSERT', 'com.atguigu.auth.controller.SysRoleController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/auth/sysRole/save', '127.0.0.1', '{\"param\":{},\"roleCode\":\"\",\"roleName\":\"用户管理员\",\"id\":6}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 10:42:18', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (18, '角色管理', 'UPDATE', 'com.atguigu.auth.controller.SysRoleController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysRole/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1653619337000,\"param\":{},\"roleCode\":\"\",\"roleName\":\"用户管理员\",\"updateTime\":1653619337000,\"id\":6}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-27 10:43:59', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysUser\",\"select\":false,\"level\":3,\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysUser/list\",\"sortValue\":1,\"component\":\"auth/sysUser/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysUser.list\",\"select\":false,\"level\":4,\"updateTime\":1653957062000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"id\":6,\"status\":1},{\"code\":\"bnt.sysUser.add\",\"select\":false,\"level\":4,\"updateTime\":1653957062000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"id\":7,\"status\":1},{\"code\":\"bnt.sysUser.update\",\"select\":false,\"level\":4,\"updateTime\":1653957062000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"id\":8,\"status\":1},{\"code\":\"bnt.sysUser.remove\",\"select\":false,\"level\":4,\"updateTime\":1653957062000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"id\":9,\"status\":1},{\"code\":\"bnt.sysUser.assignRole\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1653297272000,\"param\":{},\"name\":\"分配角色\",\"id\":18,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"用户管理\",\"perms\":\"bnt.sysUser.list\",\"id\":3,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:14:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (20, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysRole\",\"select\":false,\"level\":3,\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysRole/list\",\"sortValue\":0,\"component\":\"auth/sysRole/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysRole.list\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysRole.list\",\"id\":10,\"status\":1},{\"code\":\"bnt.sysRole.add\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysRole.add\",\"id\":11,\"status\":1},{\"code\":\"bnt.sysRole.update\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysRole.update\",\"id\":12,\"status\":1},{\"code\":\"bnt.sysRole.remove\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysRole.remove\",\"id\":13,\"status\":1},{\"code\":\"bnt.sysRole.assignAuth\",\"select\":false,\"level\":4,\"toCode\":\"assignAuth\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1653297494000,\"param\":{},\"name\":\"分配权限\",\"perms\":\"bnt.sysRole.assignAuth\",\"id\":19,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"角色管理\",\"perms\":\" bnt.sysRole.list\",\"id\":4,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:18:12', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (21, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysMenu\",\"select\":false,\"level\":3,\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysMenu/list\",\"sortValue\":0,\"component\":\"auth/sysMenu/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysMenu.list\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysMenu.list\",\"id\":14,\"status\":1},{\"code\":\"bnt.sysMenu.add\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysMenu.add\",\"id\":15,\"status\":1},{\"code\":\"bnt.sysMenu.update\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysMenu.update\",\"id\":16,\"status\":1},{\"code\":\"bnt.sysMenu.remove\",\"select\":false,\"level\":4,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysMenu.remove\",\"id\":17,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"菜单管理\",\"perms\":\"bnt.sysMenu.list\",\"id\":5,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:18:37', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (22, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysDept\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysDept/list\",\"sortValue\":0,\"component\":\"auth/sysDept/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysDept.list\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653358064000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysDept.list\",\"id\":21,\"status\":1},{\"code\":\"bnt.sysDept.add\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463887000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysDept.add\",\"id\":24,\"status\":1},{\"code\":\"bnt.sysDept.update\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463901000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysDept.update\",\"id\":25,\"status\":1},{\"code\":\"bnt.sysDept.remove\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463919000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysDept.remove\",\"id\":26,\"status\":1}],\"createTime\":1653358025000,\"param\":{},\"name\":\"部门管理\",\"perms\":\"bnt.sysDept.list\",\"id\":20,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:19:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (23, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysPost\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysPost/list\",\"sortValue\":0,\"component\":\"auth/sysPost/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysPost.list\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653359145000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysPost.list\",\"id\":23,\"status\":1},{\"code\":\"bnt.sysPost.add\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653463964000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysPost.add\",\"id\":27,\"status\":1},{\"code\":\"bnt.sysPost.update\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653463978000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysPost.update\",\"id\":28,\"status\":1},{\"code\":\"bnt.sysPost.remove\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653463991000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysPost.remove\",\"id\":29,\"status\":1}],\"createTime\":1653359130000,\"param\":{},\"name\":\"岗位管理\",\"perms\":\"bnt.sysPost.list\",\"id\":22,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:19:23', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (24, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysOperLog\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysOperLog/list\",\"sortValue\":0,\"component\":\"auth/sysOperLog/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysOperLog.list\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":30,\"isDeleted\":0,\"children\":[],\"createTime\":1653552617000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysOperLog.list\",\"id\":31,\"status\":1}],\"createTime\":1653552599000,\"param\":{},\"name\":\"操作日志\",\"perms\":\"bnt.sysOperLog.list\",\"id\":30,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:19:40', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (25, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysLoginLog\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysLoginLog/list\",\"sortValue\":0,\"component\":\"auth/sysLoginLog/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysLoginLog.list\",\"select\":false,\"level\":4,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":32,\"isDeleted\":0,\"children\":[],\"createTime\":1653554191000,\"param\":{},\"name\":\"查看\",\"id\":33,\"status\":1}],\"createTime\":1653554173000,\"param\":{},\"name\":\"登录日志\",\"perms\":\" bnt.sysLoginLog.list\",\"id\":32,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:20:09', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (26, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysUser\",\"select\":false,\"level\":2,\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysUser\",\"sortValue\":1,\"component\":\"auth/sysUser/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysUser.list\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysUser.list\",\"id\":6,\"status\":1},{\"code\":\"bnt.sysUser.add\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysUser.add\",\"id\":7,\"status\":1},{\"code\":\"bnt.sysUser.update\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysUser.update\",\"id\":8,\"status\":1},{\"code\":\"bnt.sysUser.remove\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysUser.remove\",\"id\":9,\"status\":1},{\"code\":\"bnt.sysUser.assignRole\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":3,\"isDeleted\":0,\"children\":[],\"createTime\":1653297272000,\"param\":{},\"name\":\"分配角色\",\"perms\":\"bnt.sysUser.assignRole\",\"id\":18,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"用户管理\",\"perms\":\"bnt.sysUser.list\",\"id\":3,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:41:35', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (27, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysRole\",\"select\":false,\"level\":2,\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysRole\",\"sortValue\":0,\"component\":\"auth/sysRole/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysRole.list\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysRole.list\",\"id\":10,\"status\":1},{\"code\":\"bnt.sysRole.add\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysRole.add\",\"id\":11,\"status\":1},{\"code\":\"bnt.sysRole.update\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysRole.update\",\"id\":12,\"status\":1},{\"code\":\"bnt.sysRole.remove\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysRole.remove\",\"id\":13,\"status\":1},{\"code\":\"bnt.sysRole.assignAuth\",\"select\":false,\"level\":3,\"toCode\":\"assignAuth\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":4,\"isDeleted\":0,\"children\":[],\"createTime\":1653297494000,\"param\":{},\"name\":\"分配权限\",\"perms\":\"bnt.sysRole.assignAuth\",\"id\":19,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"角色管理\",\"perms\":\" bnt.sysRole.list\",\"id\":4,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:41:42', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (28, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysMenu\",\"select\":false,\"level\":2,\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysMenu\",\"sortValue\":0,\"component\":\"auth/sysMenu/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysMenu.list\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysMenu.list\",\"id\":14,\"status\":1},{\"code\":\"bnt.sysMenu.add\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysMenu.add\",\"id\":15,\"status\":1},{\"code\":\"bnt.sysMenu.update\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysMenu.update\",\"id\":16,\"status\":1},{\"code\":\"bnt.sysMenu.remove\",\"select\":false,\"level\":3,\"updateTime\":1653959708000,\"type\":2,\"parentId\":5,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysMenu.remove\",\"id\":17,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"菜单管理\",\"perms\":\"bnt.sysMenu.list\",\"id\":5,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:41:51', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (29, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysDept\",\"select\":false,\"level\":2,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysDept\",\"sortValue\":0,\"component\":\"auth/sysDept/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysDept.list\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653358064000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysDept.list\",\"id\":21,\"status\":1},{\"code\":\"bnt.sysDept.add\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463887000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysDept.add\",\"id\":24,\"status\":1},{\"code\":\"bnt.sysDept.update\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463901000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysDept.update\",\"id\":25,\"status\":1},{\"code\":\"bnt.sysDept.remove\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":20,\"isDeleted\":0,\"children\":[],\"createTime\":1653463919000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysDept.remove\",\"id\":26,\"status\":1}],\"createTime\":1653358025000,\"param\":{},\"name\":\"部门管理\",\"perms\":\"bnt.sysDept.list\",\"id\":20,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:41:58', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (30, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysPost\",\"select\":false,\"level\":2,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysPost\",\"sortValue\":0,\"component\":\"auth/sysPost/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysPost.list\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653359145000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysPost.list\",\"id\":23,\"status\":1},{\"code\":\"bnt.sysPost.add\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653463964000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysPost.add\",\"id\":27,\"status\":1},{\"code\":\"bnt.sysPost.update\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653463978000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysPost.update\",\"id\":28,\"status\":1},{\"code\":\"bnt.sysPost.remove\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":22,\"isDeleted\":0,\"children\":[],\"createTime\":1653463991000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysPost.remove\",\"id\":29,\"status\":1}],\"createTime\":1653359130000,\"param\":{},\"name\":\"岗位管理\",\"perms\":\"bnt.sysPost.list\",\"id\":22,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:42:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (31, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysOperLog\",\"select\":false,\"level\":2,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysOperLog\",\"sortValue\":0,\"component\":\"auth/sysOperLog/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysOperLog.list\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653959708000,\"type\":2,\"parentId\":30,\"isDeleted\":0,\"children\":[],\"createTime\":1653552617000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysOperLog.list\",\"id\":31,\"status\":1}],\"createTime\":1653552599000,\"param\":{},\"name\":\"操作日志\",\"perms\":\"bnt.sysOperLog.list\",\"id\":30,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:42:09', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (32, '菜单管理', 'UPDATE', 'com.atguigu.auth.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/auth/sysMenu/update', '127.0.0.1', '{\"code\":\"sysLoginLog\",\"select\":false,\"level\":2,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":2,\"path\":\"sysLoginLog\",\"sortValue\":0,\"component\":\"auth/sysLoginLog/list\",\"isDeleted\":0,\"children\":[{\"code\":\"bnt.sysLoginLog.list\",\"select\":false,\"level\":3,\"toCode\":\"\",\"updateTime\":1653957062000,\"type\":1,\"parentId\":32,\"isDeleted\":0,\"children\":[],\"createTime\":1653554191000,\"param\":{},\"name\":\"查看\",\"id\":33,\"status\":1}],\"createTime\":1653554173000,\"param\":{},\"name\":\"登录日志\",\"perms\":\" bnt.sysLoginLog.list\",\"id\":32,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 09:42:15', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (33, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"\",\"type\":0,\"parentId\":2,\"path\":\"log\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"日志管理\",\"perms\":\"\",\"id\":34,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 13:23:07', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (34, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"visible\":1,\"icon\":\"\",\"type\":0,\"parentId\":0,\"path\":\"order\",\"sortValue\":1,\"component\":\"Layout\",\"param\":{},\"name\":\"订单管理\",\"perms\":\"\",\"id\":35,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 13:57:50', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (35, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"visible\":1,\"icon\":\"\",\"type\":1,\"parentId\":35,\"path\":\"orderInfo\",\"sortValue\":1,\"component\":\"order/orderInfo/list\",\"param\":{},\"name\":\"订单列表\",\"perms\":\"bnt.orderInfo.list\",\"id\":36,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-05-31 13:58:37', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (36, '岗位管理', 'INSERT', 'com.atguigu.system.controller.SysPostController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysPost/save', '127.0.0.1', '{\"param\":{},\"name\":\"运营总监\",\"description\":\"\",\"postCode\":\"yyzj\",\"id\":8,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-08 17:14:21', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (37, '角色管理', 'INSERT', 'com.atguigu.system.controller.SysRoleController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysRole/save', '127.0.0.1', '{\"param\":{},\"roleCode\":\"\",\"roleName\":\"\",\"id\":8}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-08 17:39:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (38, '角色管理', 'UPDATE', 'com.atguigu.system.controller.SysRoleController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysRole/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1654681144000,\"param\":{},\"roleCode\":\"\",\"roleName\":\"\",\"updateTime\":1654681144000,\"id\":8}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-08 17:39:08', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (39, '角色管理', 'UPDATE', 'com.atguigu.system.controller.SysRoleController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysRole/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1654681144000,\"param\":{},\"roleCode\":\"\",\"roleName\":\"\",\"updateTime\":1654681144000,\"id\":8}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-08 17:39:41', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (40, '角色管理', 'UPDATE', 'com.atguigu.system.controller.SysRoleController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysRole/update', '127.0.0.1', '{\"isDeleted\":0,\"createTime\":1654681144000,\"param\":{},\"roleCode\":\"yhgly\",\"roleName\":\"用户管理员\",\"updateTime\":1654681144000,\"id\":8}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-08 17:42:46', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (41, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-phone\",\"type\":0,\"parentId\":0,\"path\":\"order\",\"sortValue\":1,\"component\":\"Layout\",\"param\":{},\"name\":\"订单管理\",\"perms\":\"\",\"id\":35,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 08:50:13', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (42, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-phone\",\"updateTime\":1654735813000,\"type\":0,\"parentId\":0,\"path\":\"order\",\"sortValue\":1,\"component\":\"Layout\",\"isDeleted\":0,\"children\":[],\"createTime\":1654735813000,\"param\":{},\"name\":\"订单管理\",\"perms\":\"\",\"id\":35,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 08:50:22', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (43, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-s-help\",\"type\":1,\"parentId\":35,\"path\":\"orderInfo\",\"sortValue\":1,\"component\":\"order/orderInfo/list\",\"param\":{},\"name\":\"订单列表\",\"perms\":\"bnt.orderInfo.list\",\"id\":36,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 08:51:22', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (44, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":36,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.add\",\"id\":37,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 08:52:37', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (45, '菜单管理', 'DELETE', 'com.atguigu.system.controller.SysMenuController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/system/sysMenu/remove/37', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 08:53:01', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (46, '菜单管理', 'DELETE', 'com.atguigu.system.controller.SysMenuController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/system/sysMenu/remove/36', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 08:53:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (47, '菜单管理', 'DELETE', 'com.atguigu.system.controller.SysMenuController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/system/sysMenu/remove/35', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 08:53:06', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (48, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-s-custom\",\"updateTime\":1654737767000,\"type\":1,\"parentId\":2,\"path\":\"sysUser\",\"sortValue\":1,\"component\":\"system/sysUser/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysUser.list\",\"id\":6,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysUser.add\",\"id\":7,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysUser.update\",\"id\":8,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysUser.remove\",\"id\":9,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":3,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653297272000,\"param\":{},\"name\":\"分配角色\",\"perms\":\"bnt.sysUser.assignRole\",\"id\":18,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"用户管理\",\"perms\":\"\",\"id\":3,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 09:24:01', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (49, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-user-solid\",\"updateTime\":1654737768000,\"type\":1,\"parentId\":2,\"path\":\"sysRole\",\"sortValue\":1,\"component\":\"system/sysRole/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":4,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysRole.list\",\"id\":10,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":4,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysRole.add\",\"id\":11,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":4,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysRole.update\",\"id\":12,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":4,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysRole.remove\",\"id\":13,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":4,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1653297494000,\"param\":{},\"name\":\"分配权限\",\"perms\":\"bnt.sysRole.assignAuth\",\"id\":19,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"角色管理\",\"perms\":\"\",\"id\":4,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 09:24:10', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (50, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-s-unfold\",\"updateTime\":1654737769000,\"type\":1,\"parentId\":2,\"path\":\"sysMenu\",\"sortValue\":1,\"component\":\"system/sysMenu/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysMenu.list\",\"id\":14,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysMenu.add\",\"id\":15,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysMenu.update\",\"id\":16,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":5,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1622455537000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysMenu.remove\",\"id\":17,\"status\":1}],\"createTime\":1622455537000,\"param\":{},\"name\":\"菜单管理\",\"perms\":\"\",\"id\":5,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 09:24:21', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (51, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-s-operation\",\"updateTime\":1654737776000,\"type\":1,\"parentId\":2,\"path\":\"sysDept\",\"sortValue\":1,\"component\":\"system/sysDept/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":20,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653358064000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysDept.list\",\"id\":21,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":20,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463887000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysDept.add\",\"id\":24,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":20,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463901000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysDept.update\",\"id\":25,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":20,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463919000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysDept.remove\",\"id\":26,\"status\":1}],\"createTime\":1653358025000,\"param\":{},\"name\":\"部门管理\",\"perms\":\"\",\"id\":20,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 09:24:28', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (52, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-more-outline\",\"updateTime\":1654737777000,\"type\":1,\"parentId\":2,\"path\":\"sysPost\",\"sortValue\":1,\"component\":\"system/sysPost/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":22,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653359145000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysPost.list\",\"id\":23,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":22,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463964000,\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.sysPost.add\",\"id\":27,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":22,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463978000,\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.sysPost.update\",\"id\":28,\"status\":1},{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":22,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653463991000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysPost.remove\",\"id\":29,\"status\":1}],\"createTime\":1653359130000,\"param\":{},\"name\":\"岗位管理\",\"perms\":\"\",\"id\":22,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 09:24:35', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (53, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-tickets\",\"updateTime\":1653974966000,\"type\":0,\"parentId\":2,\"path\":\"log\",\"sortValue\":1,\"component\":\"ParentView\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737785000,\"type\":1,\"parentId\":34,\"path\":\"sysOperLog\",\"sortValue\":1,\"component\":\"system/sysOperLog/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":30,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653552617000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysOperLog.list\",\"id\":31,\"status\":1}],\"createTime\":1653552599000,\"param\":{},\"name\":\"操作日志\",\"perms\":\"\",\"id\":30,\"status\":1},{\"select\":false,\"updateTime\":1654737787000,\"type\":1,\"parentId\":34,\"path\":\"sysLoginLog\",\"sortValue\":1,\"component\":\"system/sysLoginLog/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":32,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653554191000,\"param\":{},\"name\":\"查看\",\"id\":33,\"status\":1}],\"createTime\":1653554173000,\"param\":{},\"name\":\"登录日志\",\"perms\":\"\",\"id\":32,\"status\":1}],\"createTime\":1653974587000,\"param\":{},\"name\":\"日志管理\",\"perms\":\"\",\"id\":34,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 09:24:46', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (54, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-document-remove\",\"updateTime\":1654737785000,\"type\":1,\"parentId\":34,\"path\":\"sysOperLog\",\"sortValue\":1,\"component\":\"system/sysOperLog/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":30,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653552617000,\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.sysOperLog.list\",\"id\":31,\"status\":1}],\"createTime\":1653552599000,\"param\":{},\"name\":\"操作日志\",\"perms\":\"\",\"id\":30,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 09:24:55', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (55, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-s-goods\",\"updateTime\":1654737787000,\"type\":1,\"parentId\":34,\"path\":\"sysLoginLog\",\"sortValue\":1,\"component\":\"system/sysLoginLog/list\",\"isDeleted\":0,\"children\":[{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":32,\"sortValue\":1,\"isDeleted\":0,\"children\":[],\"createTime\":1653554191000,\"param\":{},\"name\":\"查看\",\"id\":33,\"status\":1}],\"createTime\":1653554173000,\"param\":{},\"name\":\"登录日志\",\"perms\":\"\",\"id\":32,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 09:25:07', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (56, '用户管理', 'DELETE', 'com.atguigu.system.controller.SysUserController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/system/sysUser/remove/4', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 09:25:21', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (57, '菜单管理', 'UPDATE', 'com.atguigu.system.controller.SysMenuController.updateById()', 'PUT', 'MANAGE', 'admin', '', '/admin/system/sysMenu/update', '127.0.0.1', '{\"select\":false,\"updateTime\":1654737758000,\"type\":2,\"parentId\":4,\"path\":\"assignAuth\",\"sortValue\":1,\"component\":\"system/sysRole/assignAuth\",\"isDeleted\":0,\"children\":[],\"createTime\":1653297494000,\"param\":{},\"name\":\"分配权限\",\"perms\":\"bnt.sysRole.assignAuth\",\"id\":19,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 09:26:07', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (58, '角色管理', 'ASSGIN', 'com.atguigu.system.controller.SysMenuController.doAssign()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/doAssign', '127.0.0.1', '{\"roleId\":2,\"menuIdList\":[2,3,6,7,8,5,14,20,21]}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-09 09:26:34', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (59, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-s-help\",\"type\":0,\"parentId\":0,\"path\":\"vod\",\"sortValue\":1,\"component\":\"Layout\",\"param\":{},\"name\":\"点播管理\",\"perms\":\"\",\"id\":35,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-10 15:26:53', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (60, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"el-icon-phone\",\"type\":1,\"parentId\":35,\"path\":\"teacher/list\",\"sortValue\":1,\"component\":\"vod/teacher/list\",\"param\":{},\"name\":\"讲师列表\",\"perms\":\"\",\"id\":36,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-10 15:27:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (61, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":36,\"path\":\"teacher/create\",\"sortValue\":1,\"component\":\"vod/teacher/form\",\"param\":{},\"name\":\"添加\",\"perms\":\"bnt.teacher.add\",\"id\":37,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-10 15:28:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (62, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":36,\"path\":\"teacher/edit/:id\",\"sortValue\":1,\"component\":\"vod/teacher/form\",\"param\":{},\"name\":\"修改\",\"perms\":\"bnt.teacher.update\",\"id\":38,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-10 15:29:13', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (63, '菜单管理', 'INSERT', 'com.atguigu.system.controller.SysMenuController.save()', 'POST', 'MANAGE', 'admin', '', '/admin/system/sysMenu/save', '127.0.0.1', '{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":36,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"查看\",\"perms\":\"bnt.teacher.list\",\"id\":39,\"status\":1}', '{\"code\":200,\"message\":\"成功\"}', 1, '', NULL, '2022-06-10 15:35:30', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '岗位名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1正常 0停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (5, 'dsz', '董事长', '1', 1, '2022-05-24 10:33:53', NULL, 0);
INSERT INTO `sys_post` VALUES (6, 'zjl', '总经理', '2', 1, '2022-05-24 10:34:08', NULL, 0);
INSERT INTO `sys_post` VALUES (7, 'wz', '网咨', '', 1, '2022-05-27 08:56:41', '2022-05-27 08:56:41', 1);
INSERT INTO `sys_post` VALUES (8, 'yyzj', '运营总监', '', 1, '2022-06-08 17:14:21', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1670996760018837506 DEFAULT CHARSET=utf8mb3 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '系统管理员', 'SYSTEM', '系统管理员', '2021-05-31 18:09:18', '2023-06-19 11:22:16', 0);
INSERT INTO `sys_role` VALUES (2, '普通管理员', 'COMMON', '普通管理员', '2021-06-01 08:38:40', '2023-06-29 17:42:51', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL DEFAULT '0',
  `menu_id` bigint NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_menu_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1674355185616449559 DEFAULT CHARSET=utf8mb3 COMMENT='角色菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 2, 2, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (2, 2, 3, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (3, 2, 6, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (4, 2, 7, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (5, 2, 8, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (6, 2, 9, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (7, 2, 18, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (8, 2, 4, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (9, 2, 10, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (10, 2, 11, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (11, 2, 12, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (12, 2, 13, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (13, 2, 19, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (14, 2, 5, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (15, 2, 14, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (16, 2, 15, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (17, 2, 16, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (18, 2, 17, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (19, 2, 2, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (20, 2, 3, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (21, 2, 6, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (22, 2, 7, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (23, 2, 8, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (24, 2, 2, '2022-06-09 09:26:34', '2023-08-02 16:11:11', 1);
INSERT INTO `sys_role_menu` VALUES (25, 2, 3, '2022-06-09 09:26:34', '2023-08-02 16:11:11', 1);
INSERT INTO `sys_role_menu` VALUES (26, 2, 6, '2022-06-09 09:26:34', '2023-08-02 16:11:11', 1);
INSERT INTO `sys_role_menu` VALUES (27, 2, 7, '2022-06-09 09:26:34', '2023-08-02 16:11:11', 1);
INSERT INTO `sys_role_menu` VALUES (28, 2, 8, '2022-06-09 09:26:34', '2023-08-02 16:11:11', 1);
INSERT INTO `sys_role_menu` VALUES (29, 2, 5, '2022-06-09 09:26:34', '2023-08-02 16:11:11', 1);
INSERT INTO `sys_role_menu` VALUES (30, 2, 14, '2022-06-09 09:26:34', '2023-08-02 16:11:11', 1);
INSERT INTO `sys_role_menu` VALUES (31, 2, 20, '2022-06-09 09:26:34', '2023-08-02 16:11:11', 1);
INSERT INTO `sys_role_menu` VALUES (32, 2, 21, '2022-06-09 09:26:34', '2023-08-02 16:11:11', 1);
INSERT INTO `sys_role_menu` VALUES (1670980601936642049, 1670718803366928385, 2, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980601953419265, 1670718803366928385, 3, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980601957613569, 1670718803366928385, 6, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980601966002177, 1670718803366928385, 7, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980601970196482, 1670718803366928385, 8, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980601978585089, 1670718803366928385, 9, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980601982779393, 1670718803366928385, 18, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980601986973698, 1670718803366928385, 4, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980601995362306, 1670718803366928385, 10, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602003750913, 1670718803366928385, 11, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602007945218, 1670718803366928385, 12, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602012139522, 1670718803366928385, 13, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602016333826, 1670718803366928385, 19, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602020528129, 1670718803366928385, 5, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602024722434, 1670718803366928385, 14, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602028916738, 1670718803366928385, 15, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602033111041, 1670718803366928385, 16, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602037305346, 1670718803366928385, 17, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602041499650, 1670718803366928385, 20, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602045693954, 1670718803366928385, 21, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602049888257, 1670718803366928385, 24, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602049888258, 1670718803366928385, 25, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602054082561, 1670718803366928385, 26, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602058276865, 1670718803366928385, 22, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602062471170, 1670718803366928385, 23, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602070859778, 1670718803366928385, 27, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602075054081, 1670718803366928385, 28, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602079248386, 1670718803366928385, 29, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602083442689, 1670718803366928385, 34, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602087636994, 1670718803366928385, 30, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602091831297, 1670718803366928385, 31, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602091831298, 1670718803366928385, 32, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980602096025602, 1670718803366928385, 33, '2023-06-20 10:23:15', '2023-06-20 10:23:29', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661281849345, 1670718803366928385, 2, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661290237954, 1670718803366928385, 3, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661294432258, 1670718803366928385, 6, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661298626561, 1670718803366928385, 7, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661302820865, 1670718803366928385, 8, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661307015170, 1670718803366928385, 9, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661311209474, 1670718803366928385, 18, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661311209475, 1670718803366928385, 4, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661315403777, 1670718803366928385, 10, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661319598082, 1670718803366928385, 11, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661319598083, 1670718803366928385, 12, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661323792385, 1670718803366928385, 13, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661327986690, 1670718803366928385, 19, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661332180993, 1670718803366928385, 5, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661332180994, 1670718803366928385, 14, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661336375297, 1670718803366928385, 15, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661340569601, 1670718803366928385, 16, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661340569602, 1670718803366928385, 17, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661348958210, 1670718803366928385, 20, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661353152513, 1670718803366928385, 21, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661357346818, 1670718803366928385, 24, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661361541121, 1670718803366928385, 25, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661365735425, 1670718803366928385, 26, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661369929729, 1670718803366928385, 22, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661369929730, 1670718803366928385, 23, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661374124034, 1670718803366928385, 27, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661378318337, 1670718803366928385, 28, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661378318338, 1670718803366928385, 29, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661382512642, 1670718803366928385, 34, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661386706946, 1670718803366928385, 30, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661386706947, 1670718803366928385, 31, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661390901250, 1670718803366928385, 32, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670980661395095553, 1670718803366928385, 33, '2023-06-20 10:23:29', '2023-06-20 10:27:58', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790594007041, 1670718803366928385, 2, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790598201345, 1670718803366928385, 3, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790602395650, 1670718803366928385, 6, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790606589954, 1670718803366928385, 7, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790614978561, 1670718803366928385, 8, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790623367170, 1670718803366928385, 9, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790627561473, 1670718803366928385, 18, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790635950081, 1670718803366928385, 4, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790640144386, 1670718803366928385, 10, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790644338689, 1670718803366928385, 11, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790648532994, 1670718803366928385, 12, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790648532995, 1670718803366928385, 13, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790652727298, 1670718803366928385, 19, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790656921601, 1670718803366928385, 5, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790661115905, 1670718803366928385, 14, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790665310209, 1670718803366928385, 15, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790669504514, 1670718803366928385, 16, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790669504515, 1670718803366928385, 17, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790673698817, 1670718803366928385, 20, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790682087425, 1670718803366928385, 21, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790686281730, 1670718803366928385, 24, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790690476034, 1670718803366928385, 25, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790690476035, 1670718803366928385, 26, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790694670338, 1670718803366928385, 22, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790698864641, 1670718803366928385, 23, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790703058946, 1670718803366928385, 27, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790707253249, 1670718803366928385, 28, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790711447553, 1670718803366928385, 29, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790711447554, 1670718803366928385, 34, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790715641858, 1670718803366928385, 30, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790719836161, 1670718803366928385, 31, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790724030465, 1670718803366928385, 32, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670981790728224770, 1670718803366928385, 33, '2023-06-20 10:27:58', '2023-06-20 10:42:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334894133250, 1670718803366928385, 2, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334898327553, 1670718803366928385, 3, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334902521857, 1670718803366928385, 6, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334906716162, 1670718803366928385, 7, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334910910466, 1670718803366928385, 8, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334910910467, 1670718803366928385, 9, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334915104769, 1670718803366928385, 18, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334919299074, 1670718803366928385, 4, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334919299075, 1670718803366928385, 10, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334923493377, 1670718803366928385, 11, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334927687681, 1670718803366928385, 12, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334927687682, 1670718803366928385, 13, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334931881985, 1670718803366928385, 19, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334936076290, 1670718803366928385, 5, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334936076291, 1670718803366928385, 14, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334940270594, 1670718803366928385, 15, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334944464897, 1670718803366928385, 16, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334948659201, 1670718803366928385, 17, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334952853505, 1670718803366928385, 20, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334961242113, 1670718803366928385, 21, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334965436417, 1670718803366928385, 24, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334969630722, 1670718803366928385, 25, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334973825026, 1670718803366928385, 26, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334978019329, 1670718803366928385, 22, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334982213633, 1670718803366928385, 23, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334986407938, 1670718803366928385, 27, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334986407939, 1670718803366928385, 28, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334990602242, 1670718803366928385, 29, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334994796546, 1670718803366928385, 34, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334994796547, 1670718803366928385, 30, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334998990849, 1670718803366928385, 31, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985334998990850, 1670718803366928385, 32, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670985335003185154, 1670718803366928385, 33, '2023-06-20 10:42:03', '2023-06-20 11:13:03', 1);
INSERT INTO `sys_role_menu` VALUES (1670993133225234433, 1670718803366928385, 2, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133237817345, 1670718803366928385, 3, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133246205954, 1670718803366928385, 6, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133254594562, 1670718803366928385, 7, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133258788866, 1670718803366928385, 8, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133267177474, 1670718803366928385, 9, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133275566082, 1670718803366928385, 18, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133279760386, 1670718803366928385, 4, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133283954689, 1670718803366928385, 10, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133288148993, 1670718803366928385, 11, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133296537602, 1670718803366928385, 12, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133304926209, 1670718803366928385, 13, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133309120513, 1670718803366928385, 19, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133313314818, 1670718803366928385, 5, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133321703426, 1670718803366928385, 14, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133330092034, 1670718803366928385, 15, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133338480642, 1670718803366928385, 16, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133342674946, 1670718803366928385, 17, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133346869249, 1670718803366928385, 20, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133351063554, 1670718803366928385, 21, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133359452162, 1670718803366928385, 24, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133363646465, 1670718803366928385, 25, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133367840770, 1670718803366928385, 26, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133372035074, 1670718803366928385, 22, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133376229377, 1670718803366928385, 23, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133380423682, 1670718803366928385, 27, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133384617985, 1670718803366928385, 28, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133388812290, 1670718803366928385, 29, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133393006594, 1670718803366928385, 34, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133397200898, 1670718803366928385, 30, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133401395201, 1670718803366928385, 31, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133405589506, 1670718803366928385, 32, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670993133409783810, 1670718803366928385, 33, '2023-06-20 11:13:03', '2023-06-20 11:13:03', 0);
INSERT INTO `sys_role_menu` VALUES (1670996856106147842, 1670996760018837505, 2, '2023-06-20 11:27:50', '2023-06-20 11:27:50', 0);
INSERT INTO `sys_role_menu` VALUES (1670996856114536450, 1670996760018837505, 3, '2023-06-20 11:27:50', '2023-06-20 11:27:50', 0);
INSERT INTO `sys_role_menu` VALUES (1670996856127119362, 1670996760018837505, 6, '2023-06-20 11:27:50', '2023-06-20 11:27:50', 0);
INSERT INTO `sys_role_menu` VALUES (1670996856135507969, 1670996760018837505, 7, '2023-06-20 11:27:50', '2023-06-20 11:27:50', 0);
INSERT INTO `sys_role_menu` VALUES (1670996856143896578, 1670996760018837505, 8, '2023-06-20 11:27:50', '2023-06-20 11:27:50', 0);
INSERT INTO `sys_role_menu` VALUES (1670996856156479490, 1670996760018837505, 9, '2023-06-20 11:27:50', '2023-06-20 11:27:50', 0);
INSERT INTO `sys_role_menu` VALUES (1670996856169062401, 1670996760018837505, 18, '2023-06-20 11:27:50', '2023-06-20 11:27:50', 0);
INSERT INTO `sys_role_menu` VALUES (1674352695797903362, 1, 2, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695802097666, 1, 3, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695806291969, 1, 6, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695810486274, 1, 7, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695814680578, 1, 8, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695818874881, 1, 9, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695823069185, 1, 18, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695827263490, 1, 4, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695831457794, 1, 10, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695835652097, 1, 11, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695839846401, 1, 12, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695844040706, 1, 13, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695848235010, 1, 19, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695852429313, 1, 5, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695856623617, 1, 14, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695860817922, 1, 15, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695865012226, 1, 16, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674352695869206529, 1, 17, '2023-06-29 17:42:45', '2023-06-29 17:52:38', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185549340673, 1, 2, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185561923586, 1, 3, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185566117890, 1, 6, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185570312194, 1, 7, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185570312195, 1, 8, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185574506498, 1, 9, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185578700802, 1, 18, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185582895105, 1, 4, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185582895106, 1, 10, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185587089409, 1, 11, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185587089410, 1, 12, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185591283713, 1, 13, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185595478017, 1, 19, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185595478018, 1, 5, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185599672322, 1, 14, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185603866626, 1, 15, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185603866627, 1, 16, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185608060929, 1, 17, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185612255234, 1, 1674354719205650433, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185616449537, 1, 1674355152561139714, '2023-06-29 17:52:38', '2023-08-02 16:11:56', 1);
INSERT INTO `sys_role_menu` VALUES (1674355185616449538, 1, 2, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449539, 1, 3, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449540, 1, 6, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449541, 1, 7, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449542, 1, 8, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449543, 1, 9, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449544, 1, 18, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449545, 1, 4, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449546, 1, 10, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449547, 1, 11, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449548, 1, 12, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449549, 1, 13, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449550, 1, 19, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449551, 1, 5, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449552, 1, 14, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449553, 1, 15, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449554, 1, 16, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449555, 1, 17, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449556, 1, 35, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449557, 1, 36, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
INSERT INTO `sys_role_menu` VALUES (1674355185616449558, 1, 37, '2023-08-02 16:11:56', '2023-08-02 16:11:56', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `head_url` varchar(200) DEFAULT NULL COMMENT '头像地址',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `post_id` bigint DEFAULT NULL COMMENT '岗位id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint DEFAULT NULL COMMENT '状态（1：正常 0：停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '4297f44b13955235245b2497399d7a93', 'admin', '15099909888', 'http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc', 1021, 5, NULL, 1, '2021-05-31 18:08:43', '2023-08-02 15:23:44', 0);
INSERT INTO `sys_user` VALUES (3, 'panpan', '4297f44b13955235245b2497399d7a93', '盼', '18888060737', NULL, 1024, 5, NULL, 1, '2022-05-24 11:05:40', '2023-08-02 15:23:46', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_admin_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1674281044309770242 DEFAULT CHARSET=utf8mb3 COMMENT='用户角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (2, 2, 2, '2022-01-20 20:49:37', '2022-02-24 10:43:07', 0);
INSERT INTO `sys_user_role` VALUES (3, 1, 1, '2022-05-19 10:37:27', '2022-05-24 16:55:53', 1);
INSERT INTO `sys_user_role` VALUES (4, 2, 1, '2022-05-19 10:37:27', '2022-05-24 16:55:53', 1);
INSERT INTO `sys_user_role` VALUES (5, 1, 1, '2022-05-24 16:55:53', '2022-05-24 16:55:53', 0);
INSERT INTO `sys_user_role` VALUES (6, 2, 3, '2022-05-25 16:09:31', '2023-06-19 19:10:02', 1);
INSERT INTO `sys_user_role` VALUES (7, 2, 4, '2022-06-02 11:08:14', '2022-06-02 11:15:36', 1);
INSERT INTO `sys_user_role` VALUES (8, 2, 4, '2022-06-02 11:15:36', '2022-06-02 16:10:53', 1);
INSERT INTO `sys_user_role` VALUES (9, 1, 4, '2022-06-02 11:15:36', '2022-06-02 16:10:53', 1);
INSERT INTO `sys_user_role` VALUES (10, 1, 4, '2022-06-02 16:10:53', '2022-06-02 16:10:53', 0);
INSERT INTO `sys_user_role` VALUES (1670750782984572929, 2, 3, '2023-06-19 19:10:02', '2023-06-29 12:58:02', 1);
INSERT INTO `sys_user_role` VALUES (1670750782997155841, 1, 3, '2023-06-19 19:10:02', '2023-06-29 12:58:02', 1);
INSERT INTO `sys_user_role` VALUES (1674281044263632897, 1, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044267827201, 2, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044272021505, 8, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044276215809, 1670628798657232897, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044280410113, 1670712596405194754, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044284604417, 1670712617112473601, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044284604418, 1670712631335358465, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044288798721, 1670712645075898369, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044292993025, 1670712664763961346, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044297187329, 1670712679142035458, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044297187330, 1670712698045763586, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044301381633, 1670712712079904770, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044305575938, 1670718803366928385, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
INSERT INTO `sys_user_role` VALUES (1674281044309770241, 1670996760018837505, 3, '2023-06-29 12:58:02', '2023-06-29 12:58:02', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_report
-- ----------------------------
DROP TABLE IF EXISTS `t_report`;
CREATE TABLE `t_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '申请人',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '用于根据当前登录的wx用户名称来查询对应的提交记录',
  `telephone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(765) DEFAULT NULL COMMENT '报修地址',
  `equName` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `equType` varchar(255) DEFAULT NULL COMMENT '设备类型',
  `description` varchar(765) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '故障描述',
  `image` varchar(765) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '故障图片',
  `openid` varchar(600) DEFAULT NULL COMMENT '报修申请人的微信openid',
  `status` tinyint DEFAULT NULL COMMENT '状态（1：正常 0：停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_report
-- ----------------------------
BEGIN;
INSERT INTO `t_report` VALUES (55, '1', '00101010', '1', '1', '1', '0', '1', '20230614084325000000110.jpg', 'oQdDP5OcQX2m9W7LN1KTmW2iMQdc', 2, '2023-05-13 16:38:08', '2023-06-15 12:58:37', 0);
INSERT INTO `t_report` VALUES (56, '1', '00101010', '1', '1', '1', '0', '1', '20230614084325000000110.jpg', 'oQdDP5OcQX2m9W7LN1KTmW2iMQdc', 1, '2023-06-13 16:39:27', '2023-06-14 22:07:16', 0);
INSERT INTO `t_report` VALUES (57, '2', '00101010', '2', '2', '2', '2', '2', '20230614084325000000110.jpg', 'oQdDP5OcQX2m9W7LN1KTmW2iMQdc', 3, '2023-06-13 16:41:19', '2023-06-14 22:07:16', 0);
INSERT INTO `t_report` VALUES (58, 'A', '00101010', '1', 'A', 'A', '0', '？？？', '20230614084325000000110.jpg', 'oQdDP5OcQX2m9W7LN1KTmW2iMQdc', 1, '2023-06-13 16:43:28', '2023-06-14 22:06:15', 0);
INSERT INTO `t_report` VALUES (59, '1', '00101010', '1', '1', '1', '0', '1', '20230613044304000000538.jpg', 'oQdDP5OcQX2m9W7LN1KTmW2iMQdc', 2, '2023-06-14 15:01:13', '2023-06-14 22:01:27', 0);
INSERT INTO `t_report` VALUES (60, '1', '00101010', '1', '1', '1', '2', '123', '20230613044304000000538.jpg', 'oQdDP5OcQX2m9W7LN1KTmW2iMQdc', 1, '2023-06-14 15:03:10', '2023-06-14 22:01:27', 0);
INSERT INTO `t_report` VALUES (61, '123', '00101010', '123', '123', '123', '投影仪', '123', '20230613044304000000538.jpg', 'oQdDP5OcQX2m9W7LN1KTmW2iMQdc', 0, '2023-06-14 15:03:47', '2023-06-14 22:07:16', 0);
INSERT INTO `t_report` VALUES (62, '31233', '00101010', '13123', '2131', '3123', '其他', '123', '20230613044304000000538.jpg', 'oQdDP5OcQX2m9W7LN1KTmW2iMQdc', 0, '2023-06-14 15:04:06', '2023-06-14 22:07:16', 0);
INSERT INTO `t_report` VALUES (63, '231', '00101010', '312', '21', '123', '显示器', '213', '20230613044304000000538.jpg', 'oQdDP5OcQX2m9W7LN1KTmW2iMQdc', 1, '2023-06-14 15:04:18', '2023-06-14 22:07:16', 0);
INSERT INTO `t_report` VALUES (65, '平平无奇', '平平无奇', '18888888888', '测试地址', '测试设备', '其他', '哦吼坏哦', '20230614084325000000110.jpg', 'oQdDP5CtEqiJDVIBmH5NOGsrCP2s', 1, '2023-06-14 20:43:33', '2023-06-14 20:43:33', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_wxuserinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_wxuserinfo`;
CREATE TABLE `t_wxuserinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `openid` varchar(90) DEFAULT NULL,
  `nick_name` varchar(150) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `avatar_url` varchar(600) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `status` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_wxuserinfo
-- ----------------------------
BEGIN;
INSERT INTO `t_wxuserinfo` VALUES (22, 'oQdDP5OcQX2m9W7LN1KTmW2iMQdc', '00101010', '18888060737', '20230705102747000000898.jpeg', '2023-06-11 16:05:35', '2023-07-05 10:26:58', '0');
INSERT INTO `t_wxuserinfo` VALUES (23, 'oQdDP5CtEqiJDVIBmH5NOGsrCP2s', '平平无奇', NULL, '20230614083950000000390.jpg', '2023-06-14 20:38:32', '2023-06-14 22:04:05', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
