/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : ssm_crud

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 14/12/2019 19:27:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES (1, '开发部');
INSERT INTO `tbl_dept` VALUES (2, '人事部');
INSERT INTO `tbl_dept` VALUES (3, '开发部02');
INSERT INTO `tbl_dept` VALUES (4, '测试部');
INSERT INTO `tbl_dept` VALUES (5, '开发部03');
INSERT INTO `tbl_dept` VALUES (6, '测试部02');
INSERT INTO `tbl_dept` VALUES (7, '咸鱼部');
INSERT INTO `tbl_dept` VALUES (8, '钓鱼部');

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp`  (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `fk_emp_dept`(`dept_id`) USING BTREE,
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`dept_id`) REFERENCES `tbl_dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 394 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES (1, 'ljs', 'F', '123@qq.com', 3);
INSERT INTO `tbl_emp` VALUES (2, 'yys', 'M', 'd44d@qq.com', 8);
INSERT INTO `tbl_emp` VALUES (3, 'Jerry', 'M', '123@123.com', 3);
INSERT INTO `tbl_emp` VALUES (4, 'Tom', 'M', '122223@1213.com', 2);
INSERT INTO `tbl_emp` VALUES (5, '17cee0', 'F', '6226@123.com', 3);
INSERT INTO `tbl_emp` VALUES (6, '017a11', 'M', '017a11@123.com', 1);
INSERT INTO `tbl_emp` VALUES (7, '93eee2', 'M', '93eee2@123.com', 1);
INSERT INTO `tbl_emp` VALUES (8, '404943', 'M', '404943@123.com', 1);
INSERT INTO `tbl_emp` VALUES (9, '17ff84', 'M', '17ff84@123.com', 1);
INSERT INTO `tbl_emp` VALUES (10, '1a1625', 'M', '1a1625@123.com', 1);
INSERT INTO `tbl_emp` VALUES (11, '36d746', 'M', '36d746@123.com', 1);
INSERT INTO `tbl_emp` VALUES (12, 'c92747', 'M', 'c92747@123.com', 1);
INSERT INTO `tbl_emp` VALUES (332, 'nick', 'M', 'nick@guigu.com', 1);
INSERT INTO `tbl_emp` VALUES (333, '457df0', 'M', '457df0@shuwei.com', 4);
INSERT INTO `tbl_emp` VALUES (334, 'e636a1', 'M', 'e636a1@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (335, '0a31c2', 'M', '0a31c2@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (336, '386403', 'M', '386403@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (337, 'cdc0a4', 'M', 'cdc0a4@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (338, '1fb415', 'M', '1fb415@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (339, 'a0f2b6', 'M', 'a0f2b6@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (340, '17c207', 'M', '17c207@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (341, '68d908', 'M', '68d908@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (342, '5a9ca9', 'M', '5a9ca9@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (343, '013a110', 'M', '013a110@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (344, '8be5411', 'M', '8be5411@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (345, '1a87712', 'M', '1a87712@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (346, '2c65213', 'M', '2c65213@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (347, 'cd95c14', 'M', 'cd95c14@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (348, '4485515', 'M', '4485515@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (349, '3137616', 'M', '3137616@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (350, '199d617', 'M', '199d617@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (351, '84aac18', 'M', '84aac18@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (352, 'a3c8519', 'M', 'a3c8519@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (353, 'b57dd20', 'M', 'b57dd20@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (354, '24f1521', 'M', '24f1521@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (355, '0bfe922', 'M', '0bfe922@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (356, '7f17323', 'M', '7f17323@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (357, 'f16cf24', 'M', 'f16cf24@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (358, 'f8ff125', 'M', 'f8ff125@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (359, 'e95d826', 'M', 'e95d826@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (360, '618df27', 'M', 'safdf27@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (361, '366c828', 'M', '366c828@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (362, '1e85e29', 'M', '1e85e29@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (363, '5680130', 'M', '5680130@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (364, 'e5dca31', 'M', 'e5dca31@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (365, '83c2432', 'M', '83c2432@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (366, '707c133', 'M', '707c133@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (367, '8cd9c34', 'M', '8cd9c34@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (368, '58f1b35', 'M', '58f1b35@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (369, 'c728b36', 'M', 'c728b36@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (370, '5ce9737', 'M', '5ce9737@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (371, '468ee38', 'M', '468ee38@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (372, '7575e39', 'M', '7575e39@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (373, 'e6f3540', 'M', 'e6f3540@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (374, 'fe1eb41', 'M', 'fe1eb41@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (375, '7246d42', 'M', 'ddd2@shuwei.com', 5);
INSERT INTO `tbl_emp` VALUES (377, '4edd444', 'M', '4edd444@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (378, 'b99cf45', 'M', 'b99cf45@shuwei.com', 1);
INSERT INTO `tbl_emp` VALUES (387, '章搜索', 'F', 'safasdfad5234@qq.com', 4);
INSERT INTO `tbl_emp` VALUES (388, 'dsafdd', 'F', 'asfd75234@qq.com', 2);
INSERT INTO `tbl_emp` VALUES (393, 'safdssadfda', 'M', 'dsa4@qq.com', 1);

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, 'fsw', 'fsw');
INSERT INTO `tbl_user` VALUES (2, 'fff', 'fff');
INSERT INTO `tbl_user` VALUES (4, 'admin', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
