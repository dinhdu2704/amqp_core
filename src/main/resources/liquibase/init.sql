/*
 Navicat Premium Data Transfer

 Source Server         : One IoT MySQL
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 10.15.12.227:3306
 Source Schema         : stc_iot

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 20/02/2020 15:41:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_applications
-- ----------------------------
DROP TABLE IF EXISTS `base_applications`;
CREATE TABLE `base_applications`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `app_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `app_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_id` bigint(0) NOT NULL,
  `tenant_id` bigint(0) NULL DEFAULT NULL,
  `addition_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `app_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `app_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created` bigint(0) NULL DEFAULT NULL,
  `updated` bigint(0) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `devices` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `base_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_countries
-- ----------------------------
DROP TABLE IF EXISTS `base_countries`;
CREATE TABLE `base_countries`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created` bigint(0) NULL DEFAULT NULL,
  `updated` bigint(0) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_countries
-- ----------------------------
INSERT INTO `base_countries` VALUES (1, 'vie', 'Việt Nam', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (2, 'eng', 'United Kingdom (UK)', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (3, NULL, 'Afghanistan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (4, NULL, 'Albania', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (5, NULL, 'Algeria', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (6, NULL, 'Andorra', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (7, NULL, 'Angola', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (8, NULL, 'Antigua and Barbuda', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (9, NULL, 'Argentina', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (10, NULL, 'Armenia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (11, NULL, 'Australia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (12, NULL, 'Austria', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (13, NULL, 'Azerbaijan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (14, NULL, 'Bahamas', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (15, NULL, 'Bahrain', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (16, NULL, 'Bangladesh', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (17, NULL, 'Barbados', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (18, NULL, 'Belarus', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (19, NULL, 'Belgium', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (20, NULL, 'Belize', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (21, NULL, 'Benin', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (22, NULL, 'Bhutan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (23, NULL, 'Bolivia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (24, NULL, 'Bosnia and Herzegovina', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (25, NULL, 'Botswana', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (26, NULL, 'Brazil', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (27, NULL, 'Brunei', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (28, NULL, 'Bulgaria', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (29, NULL, 'Burkina Faso', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (30, NULL, 'Burundi', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (31, NULL, 'Cabo Verde', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (32, NULL, 'Cambodia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (33, NULL, 'Cameroon', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (34, NULL, 'Canada', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (35, NULL, 'Central African Republic (CAR)', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (36, NULL, 'Chad', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (37, NULL, 'Chile', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (38, NULL, 'China', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (39, NULL, 'Colombia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (40, NULL, 'Comoros', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (41, NULL, 'Congo, Democratic Republic of the', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (42, NULL, 'Congo, Republic of the', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (43, NULL, 'Costa Rica', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (44, NULL, 'Cote d\'Ivoire', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (45, NULL, 'Croatia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (46, NULL, 'Cuba', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (47, NULL, 'Cyprus', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (48, NULL, 'Czechia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (49, NULL, 'Denmark', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (50, NULL, 'Djibouti', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (51, NULL, 'Dominica', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (52, NULL, 'Dominican Republic', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (53, NULL, 'Ecuador', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (54, NULL, 'Egypt', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (55, NULL, 'El Salvador', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (56, NULL, 'Equatorial Guinea', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (57, NULL, 'Eritrea', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (58, NULL, 'Estonia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (59, NULL, 'Eswatini (formerly Swaziland)', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (60, NULL, 'Ethiopia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (61, NULL, 'Fiji', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (62, NULL, 'Finland', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (63, NULL, 'France', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (64, NULL, 'Gabon', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (65, NULL, 'Gambia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (66, NULL, 'Georgia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (67, NULL, 'Germany', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (68, NULL, 'Ghana', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (69, NULL, 'Greece', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (70, NULL, 'Grenada', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (71, NULL, 'Guatemala', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (72, NULL, 'Guinea', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (73, NULL, 'Guinea-Bissau', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (74, NULL, 'Guyana', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (75, NULL, 'Haiti', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (76, NULL, 'Honduras', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (77, NULL, 'Hungary', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (78, NULL, 'Iceland', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (79, NULL, 'India', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (80, NULL, 'Indonesia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (81, NULL, 'Iran', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (82, NULL, 'Iraq', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (83, NULL, 'Ireland', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (84, NULL, 'Israel', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (85, NULL, 'Italy', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (86, NULL, 'Jamaica', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (87, NULL, 'Japan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (88, NULL, 'Jordan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (89, NULL, 'Kazakhstan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (90, NULL, 'Kenya', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (91, NULL, 'Kiribati', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (92, NULL, 'Kosovo', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (93, NULL, 'Kuwait', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (94, NULL, 'Kyrgyzstan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (95, NULL, 'Laos', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (96, NULL, 'Latvia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (97, NULL, 'Lebanon', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (98, NULL, 'Lesotho', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (99, NULL, 'Liberia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (100, NULL, 'Libya', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (101, NULL, 'Liechtenstein', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (102, NULL, 'Lithuania', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (103, NULL, 'Luxembourg', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (104, NULL, 'Madagascar', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (105, NULL, 'Malawi', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (106, NULL, 'Malaysia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (107, NULL, 'Maldives', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (108, NULL, 'Mali', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (109, NULL, 'Malta', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (110, NULL, 'Marshall Islands', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (111, NULL, 'Mauritania', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (112, NULL, 'Mauritius', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (113, NULL, 'Mexico', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (114, NULL, 'Micronesia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (115, NULL, 'Moldova', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (116, NULL, 'Monaco', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (117, NULL, 'Mongolia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (118, NULL, 'Montenegro', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (119, NULL, 'Morocco', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (120, NULL, 'Mozambique', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (121, NULL, 'Myanmar', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (122, NULL, 'Namibia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (123, NULL, 'Nauru', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (124, NULL, 'Nepal', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (125, NULL, 'Netherlands', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (126, NULL, 'New Zealand', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (127, NULL, 'Nicaragua', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (128, NULL, 'Niger', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (129, NULL, 'Nigeria', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (130, NULL, 'North Korea', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (131, NULL, 'North Macedonia (formerly Macedonia)', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (132, NULL, 'Norway', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (133, NULL, 'Oman', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (134, NULL, 'Pakistan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (135, NULL, 'Palau', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (136, NULL, 'Palestine', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (137, NULL, 'Panama', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (138, NULL, 'Papua New Guinea', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (139, NULL, 'Paraguay', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (140, NULL, 'Peru', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (141, NULL, 'Philippines', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (142, NULL, 'Poland', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (143, NULL, 'Portugal', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (144, NULL, 'Qatar', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (145, NULL, 'Romania', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (146, NULL, 'Russia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (147, NULL, 'Rwanda', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (148, NULL, 'Saint Kitts and Nevis', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (149, NULL, 'Saint Lucia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (150, NULL, 'Saint Vincent and the Grenadines', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (151, NULL, 'Samoa', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (152, NULL, 'San Marino', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (153, NULL, 'Sao Tome and Principe', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (154, NULL, 'Saudi Arabia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (155, NULL, 'Senegal', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (156, NULL, 'Serbia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (157, NULL, 'Seychelles', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (158, NULL, 'Sierra Leone', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (159, NULL, 'Singapore', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (160, NULL, 'Slovakia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (161, NULL, 'Slovenia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (162, NULL, 'Solomon Islands', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (163, NULL, 'Somalia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (164, NULL, 'South Africa', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (165, NULL, 'South Korea', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (166, NULL, 'South Sudan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (167, NULL, 'Spain', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (168, NULL, 'Sri Lanka', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (169, NULL, 'Sudan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (170, NULL, 'Suriname', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (171, NULL, 'Sweden', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (172, NULL, 'Switzerland', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (173, NULL, 'Syria', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (174, NULL, 'Taiwan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (175, NULL, 'Tajikistan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (176, NULL, 'Tanzania', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (177, NULL, 'Thailand', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (178, NULL, 'Timor-Leste', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (179, NULL, 'Togo', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (180, NULL, 'Tonga', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (181, NULL, 'Trinidad and Tobago', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (182, NULL, 'Tunisia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (183, NULL, 'Turkey', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (184, NULL, 'Turkmenistan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (185, NULL, 'Tuvalu', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (186, NULL, 'Uganda', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (187, NULL, 'Ukraine', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (188, NULL, 'United Arab Emirates (UAE)', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (189, NULL, 'United States of America (USA)', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (190, NULL, 'Uruguay', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (191, NULL, 'Uzbekistan', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (192, NULL, 'Vanuatu', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (193, NULL, 'Vatican City', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (194, NULL, 'Venezuela', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (195, NULL, 'Vietnam', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (196, NULL, 'Yemen', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (197, NULL, 'Zambia', 'system', 'system', 1580788783209, 1580788783209, 1);
INSERT INTO `base_countries` VALUES (198, NULL, 'Zimbabwe', 'system', 'system', 1580788783209, 1580788783209, 1);

-- ----------------------------
-- Table structure for base_privileges
-- ----------------------------
DROP TABLE IF EXISTS `base_privileges`;
CREATE TABLE `base_privileges`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created` bigint(0) NULL DEFAULT NULL,
  `updated` bigint(0) NULL DEFAULT NULL,
  `active` tinyint(0) NULL DEFAULT 1,
  `displayName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_privileges
-- ----------------------------
INSERT INTO `base_privileges` VALUES (1, 'ROLE_SYSTEM_ADMIN', 'ROLE SYSTEM ADMIN', 'system', 'system', 1562636525724, 1562636525724, 0, NULL, 'SYSTEM ADMIN', 'priv_Quản Trị Hệ Thống_SystemAdmin_All');
INSERT INTO `base_privileges` VALUES (2, 'User_Create', 'Tạo Người Dùng', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Tạo Người Dùng', 'priv_Quản Trị Hệ Thống_Người Dùng_Tạo');
INSERT INTO `base_privileges` VALUES (3, 'User_View', 'Xem Người Dùng', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xem Người Dùng', 'priv_Quản Trị Hệ Thống_Người Dùng_Xem');
INSERT INTO `base_privileges` VALUES (4, 'User_Update', 'Cập Nhật Người Dùng', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Cập Nhật Người Dùng', 'priv_Quản Trị Hệ Thống_Người Dùng_Cập Nhật');
INSERT INTO `base_privileges` VALUES (5, 'User_Delete', 'Xóa Người Dùng', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xóa Người Dùng', 'priv_Quản Trị Hệ Thống_Người Dùng_Xóa');
INSERT INTO `base_privileges` VALUES (6, 'Role_Create', 'Tạo Vai Trò', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Tạo Vai Trò', 'priv_Quản Trị Hệ Thống_Vai Trò_Tạo');
INSERT INTO `base_privileges` VALUES (7, 'Role_View', 'Xem Vai Trò', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xem Vai Trò', 'priv_Quản Trị Hệ Thống_Vai Trò_Xem');
INSERT INTO `base_privileges` VALUES (8, 'Role_Update', 'Cập Nhật Vai Trò', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Cập Nhật Vai Trò', 'priv_Quản Trị Hệ Thống_Vai Trò_Cập Nhật');
INSERT INTO `base_privileges` VALUES (9, 'Role_Delete', 'Xóa Vai Trò', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xóa Vai Trò', 'priv_Quản Trị Hệ Thống_Vai Trò_Xóa');
INSERT INTO `base_privileges` VALUES (10, 'Privilege_View', 'Xem Quyền', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xem Quyền', 'priv_Quản Trị Hệ Thống_Quyền_Xem');
INSERT INTO `base_privileges` VALUES (11, 'Tenant_Create', 'Tạo Tenant', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Tạo Tenant', 'priv_Quản Trị Hệ Thống_Tenant_Tạo');
INSERT INTO `base_privileges` VALUES (12, 'Tenant_View', 'Xem Tenant', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xem Tenant', 'priv_Quản Trị Hệ Thống_Tenant_Xem');
INSERT INTO `base_privileges` VALUES (13, 'Tenant_Update', 'Cập Nhật Tenant', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Cập Nhật Tenant', 'priv_Quản Trị Hệ Thống_Tenant_Cập Nhật');
INSERT INTO `base_privileges` VALUES (14, 'Tenant_Delete', 'Xóa Tenant', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xóa Tenant', 'priv_Quản Trị Hệ Thống_Tenant_Xóa');
INSERT INTO `base_privileges` VALUES (15, 'Notification_Setting_View', 'Xem Cài Đặt Thông Báo', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xem Cài Đặt Thông Báo', 'priv_Quản Trị Hệ Thống_Cài Đặt Thông Báo_Xem');
INSERT INTO `base_privileges` VALUES (16, 'Notification_Setting_Update', 'Cập Nhật Cài Đặt Thông Báo', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Cập Nhật Cài Đặt Thông Báo', 'priv_Quản Trị Hệ Thống_Cài Đặt Thông Báo_Cập Nhật');
INSERT INTO `base_privileges` VALUES (17, 'AuditLog_View', 'Xem Log', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xem Log', 'priv_Quản Trị Hệ Thống_Log_Xem');
INSERT INTO `base_privileges` VALUES (18, 'App_Create', 'Tạo Application', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Tạo Application', 'priv_Quản Trị Hệ Thống_Application_Tạo');
INSERT INTO `base_privileges` VALUES (19, 'App_View', 'Xem Application', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xem Application', 'priv_Quản Trị Hệ Thống_Application_Xem');
INSERT INTO `base_privileges` VALUES (20, 'App_Update', 'Cập Nhật Application', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Cập Nhật Application', 'priv_Quản Trị Hệ Thống_Application_Cập Nhật');
INSERT INTO `base_privileges` VALUES (21, 'App_Delete', 'Xóa Application', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xóa Application', 'priv_Quản Trị Hệ Thống_Application_Xóa');
INSERT INTO `base_privileges` VALUES (22, 'Device_Create', 'Tạo Device', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Tạo Device', 'priv_Quản Trị Hệ Thống_Device_Tạo');
INSERT INTO `base_privileges` VALUES (23, 'Device_View', 'Xem Device', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xem Device', 'priv_Quản Trị Hệ Thống_Device_Xem');
INSERT INTO `base_privileges` VALUES (24, 'Device_Update', 'Cập Nhật Device', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Cập Nhật Device', 'priv_Quản Trị Hệ Thống_Device_Cập Nhật');
INSERT INTO `base_privileges` VALUES (25, 'Device_Delete', 'Xóa Device', 'system', 'system', 1562636525724, 1562636525724, 1, NULL, 'Xóa Device', 'priv_Quản Trị Hệ Thống_Device_Xóa');

-- ----------------------------
-- Table structure for base_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `base_role_privilege`;
CREATE TABLE `base_role_privilege`  (
  `role_id` bigint(0) NULL DEFAULT NULL,
  `privilege_id` bigint(0) NULL DEFAULT NULL,
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_rp_privilege_id`(`privilege_id`) USING BTREE,
  INDEX `fk_rp_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `base_role_privilege_ibfk_1` FOREIGN KEY (`privilege_id`) REFERENCES `base_privileges` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `base_role_privilege_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `base_roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 634 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_role_privilege
-- ----------------------------
INSERT INTO `base_role_privilege` VALUES (7, 2, 634);
INSERT INTO `base_role_privilege` VALUES (7, 7, 635);
INSERT INTO `base_role_privilege` VALUES (7, 8, 636);
INSERT INTO `base_role_privilege` VALUES (7, 10, 637);
INSERT INTO `base_role_privilege` VALUES (7, 14, 638);
INSERT INTO `base_role_privilege` VALUES (7, 13, 639);
INSERT INTO `base_role_privilege` VALUES (7, 6, 640);
INSERT INTO `base_role_privilege` VALUES (7, 4, 641);
INSERT INTO `base_role_privilege` VALUES (7, 9, 642);
INSERT INTO `base_role_privilege` VALUES (7, 3, 643);
INSERT INTO `base_role_privilege` VALUES (7, 5, 644);
INSERT INTO `base_role_privilege` VALUES (7, 11, 645);
INSERT INTO `base_role_privilege` VALUES (7, 12, 646);
INSERT INTO `base_role_privilege` VALUES (1, 3, 647);
INSERT INTO `base_role_privilege` VALUES (1, 2, 648);
INSERT INTO `base_role_privilege` VALUES (1, 14, 649);
INSERT INTO `base_role_privilege` VALUES (1, 9, 650);
INSERT INTO `base_role_privilege` VALUES (1, 13, 651);
INSERT INTO `base_role_privilege` VALUES (1, 11, 652);
INSERT INTO `base_role_privilege` VALUES (1, 4, 653);
INSERT INTO `base_role_privilege` VALUES (1, 10, 654);
INSERT INTO `base_role_privilege` VALUES (1, 12, 655);
INSERT INTO `base_role_privilege` VALUES (1, 6, 656);
INSERT INTO `base_role_privilege` VALUES (1, 7, 657);
INSERT INTO `base_role_privilege` VALUES (1, 8, 658);
INSERT INTO `base_role_privilege` VALUES (1, 5, 659);
INSERT INTO `base_role_privilege` VALUES (1, 16, 667);
INSERT INTO `base_role_privilege` VALUES (1, 15, 668);
INSERT INTO `base_role_privilege` VALUES (1, 17, 669);

-- ----------------------------
-- Table structure for base_roles
-- ----------------------------
DROP TABLE IF EXISTS `base_roles`;
CREATE TABLE `base_roles`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created` bigint(0) NULL DEFAULT NULL,
  `updated` bigint(0) NULL DEFAULT NULL,
  `active` tinyint(0) NULL DEFAULT 1,
  `type` tinyint(1) NULL DEFAULT NULL,
  `tenant_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_roles
-- ----------------------------
INSERT INTO `base_roles` VALUES (1, 'ROLE_PLATFORM_ADMIN', 'Vai trò quản trị cấp hệ thống', 'system', 'admin', 1566382612181, 1582187899063, 1, 1, NULL);
INSERT INTO `base_roles` VALUES (2, 'ROLE_USER', 'Vai trò người dùng cơ bản', 'system', 'system', 1566382612181, 1566382612181, 1, 1, 1);
INSERT INTO `base_roles` VALUES (7, 'ROLE_TENANT_ADMIN', 'Vai trò quản trị Tenant', 'system', 'admin', 1566382612181, 1582184633946, 1, 1, 1);

-- ----------------------------
-- Table structure for base_tenants
-- ----------------------------
DROP TABLE IF EXISTS `base_tenants`;
CREATE TABLE `base_tenants`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `admin_id` bigint(0) NULL DEFAULT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created` bigint(0) NULL DEFAULT NULL,
  `updated` bigint(0) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_tenants
-- ----------------------------
INSERT INTO `base_tenants` VALUES (1, 'c9e50b2e-b33d-4908-a7be-b8bb129dd8c5', 'DEFAULT_TENANT', 1, 'system admin', 'VNPT Technology', 'system', 'system', 1581049507344, 1581049507344, 1);

-- ----------------------------
-- Table structure for base_user_role
-- ----------------------------
DROP TABLE IF EXISTS `base_user_role`;
CREATE TABLE `base_user_role`  (
  `user_id` bigint(0) NULL DEFAULT NULL,
  `role_id` bigint(0) NULL DEFAULT NULL,
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_ur_user_id`(`user_id`) USING BTREE,
  INDEX `fk_ur_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `base_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `base_roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `base_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `base_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_user_role
-- ----------------------------
INSERT INTO `base_user_role` VALUES (1, 1, 1);
INSERT INTO `base_user_role` VALUES (1, 2, 2);

-- ----------------------------
-- Table structure for base_users
-- ----------------------------
DROP TABLE IF EXISTS `base_users`;
CREATE TABLE `base_users`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created` bigint(0) NULL DEFAULT NULL,
  `updated` bigint(0) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  `activated` bigint(0) NULL DEFAULT NULL,
  `activation_token` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `activation_token_created` bigint(0) NULL DEFAULT NULL,
  `forgot_password_token` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `forgot_password_token_created` bigint(0) NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `lang_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `positions` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `jwt_token` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `type` tinyint(1) NULL DEFAULT NULL,
  `tenant_id` bigint(0) NULL DEFAULT NULL,
  `country_id` bigint(0) NULL DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email_UNIQUE`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_users
-- ----------------------------
INSERT INTO `base_users` VALUES (1, 'admin', '$2a$10$p/A/BPCIXciQQv3nD76X..XfBrqVeXCB.49r.CZvK1vXw2d2TvMJe', 'system', 'system', 1580890568804, 1580890568804, 1, NULL, NULL, NULL, NULL, NULL, 'system', 'admin', NULL, NULL, NULL, NULL, NULL, 'system admin', 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU4NDc3ODk5MywidXNlcl9pZCI6MSwidGVuYW50X2lkIjoxfQ.LAFf4lmieBQnT6b_GTMuJ342b30bslrLbdJudboptmwnYpdY2etpLirYZl7DsJBcl8kkbF6-uwxYU7D4mlTbOg', 1, 1, 1, 'VNPT Technology');

-- ----------------------------
-- Table structure for DATABASECHANGELOG
-- ----------------------------
DROP TABLE IF EXISTS `DATABASECHANGELOG`;
CREATE TABLE `DATABASECHANGELOG`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(0) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for DATABASECHANGELOGLOCK
-- ----------------------------
DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
CREATE TABLE `DATABASECHANGELOGLOCK`  (
  `ID` int(0) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of DATABASECHANGELOGLOCK
-- ----------------------------
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for devices
-- ----------------------------
DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created` bigint(0) NULL DEFAULT NULL,
  `updated` bigint(0) NULL DEFAULT NULL,
  `active` tinyint(0) NULL DEFAULT 1,
  `device_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `device_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `device_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `device_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `external_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tenant` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `reg_date` bigint(0) NULL DEFAULT NULL,
  `last_updated` bigint(0) NULL DEFAULT NULL,
  `state` tinyint(0) NULL DEFAULT NULL,
  `tenant_id` bigint(0) NULL DEFAULT NULL,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `meta_datas` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `template_device_model` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 372 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
