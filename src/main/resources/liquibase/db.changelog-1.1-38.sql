-- liquibase formatted sql
-- changeset dudd:1.1-38
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `agri_uoms`;
DROP TABLE IF EXISTS `agri_uom_types`;

CREATE TABLE `agri_uom_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL,
  `updated` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `name` varchar(255)  COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) default 0,
  PRIMARY KEY (`id`),
  KEY `fk_uom_type_tenant_id` (`tenant_id`),
  CONSTRAINT `fk_uom_type_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `base_tenants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO agri_uom_types (created_by, updated_by, created, updated, active, type, name, description, tenant_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 1, "Đơn vị đo diện tích", "Dùng cho đo diện tích", 1, 1);

INSERT INTO agri_uom_types (created_by, updated_by, created, updated, active, type, name, description, tenant_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 2, "Đơn vị đo chiều dài", "Dùng cho các loại đo chiều dài", 1, 1);

INSERT INTO agri_uom_types (created_by, updated_by, created, updated, active, type, name, description, tenant_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 3, "Đơn vị đo nhiệt độ", "Dùng cho các loại đo nhiệt độ", 1, 1);

INSERT INTO agri_uom_types (created_by, updated_by, created, updated, active, type, name, description, tenant_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 4, "Đơn vị đo thời gian", "Dùng cho các loại đo thời gian", 1, 1);

INSERT INTO agri_uom_types (created_by, updated_by, created, updated, active, type, name, description, tenant_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 5, "Đơn vị đo thể tích", "Dùng cho các loại đo thể tích", 1, 1);

INSERT INTO agri_uom_types (created_by, updated_by, created, updated, active, type, name, description, tenant_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 6, "Đơn vị đo khối lượng", "Dùng cho các loại đo khối lượng", 1, 1);

INSERT INTO agri_uom_types (created_by, updated_by, created, updated, active, type, name, description, tenant_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 7, "Đơn vị bao gói", "Dùng cho các loại đo bao gói", 1, 1);

-- table unit
CREATE TABLE `agri_uoms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL,
  `uom_type_id` bigint(20) DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL ,
  `created` bigint(20) DEFAULT NULL,
  `updated` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `name` varchar(255)  COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`pronunciation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`base_unit_id` bigint(20) DEFAULT NULL ,
	`conversion_factor` double DEFAULT 0 ,
	`is_default` tinyint(1) default 0,
  PRIMARY KEY (`id`),
	KEY `fk_uom_tenant_id` (`tenant_id`),
  CONSTRAINT `fk_uom_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `base_tenants` (`id`),
	KEY `fk_uom_type_id` (`tenant_id`),
  CONSTRAINT `fk_uom_types_id` FOREIGN KEY (`uom_type_id`) REFERENCES `agri_uom_types` (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
-- 1
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 1, 0, "m", "Đơn vị đo độ dài","Mét", 1, 2, 1);
-- 2
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 1, 0, "kg", "Đơn vị đo khối lượng", "Ki lô gam", 1, 6, 1);
-- 3
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 1, 0, "s", "Đơn vị đo thời gian", "Giây", 1, 4, 1);
-- 4
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 1, 0, "m2", "Đơn vị đo diện tích", "Mét vuông", 1, 1, 1);
-- 5
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 1, 0, "m3", "Đơn vị đo thể tích", "Mét khối", 1, 5, 1);
-- 6
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 1, 0, "oC", "Đơn vị đo nhiệt độ Celsius", "Độ Celsius", 1, 3, 1);
-- 7
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 1, 0, "quả", "Đơn vị đo bao gói", "1 quả", 1, 7, 1);
-- 8 đơn vị chục quả
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 0, 7, "10 quả", "10 quả", "Bao gói 10 quả", 1, 7, 1);
-- 9
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 1, 0, "cái", "Đơn vị đo bao gói", "1 cái", 1, 7, 1);
-- 10 đơn vị chục cái
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default, conversion_factor)
values ("system", "system" ,1562636525724, 1562636525724, 1, 0, 9, "chục cái", "10 cái", "10 cái", 1, 7, 1, 10);
-- 11
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 1, 0, "chiếc", "Đơn vị đo bao gói", "1 chiếc", 1, 7, 1);
-- 12 đơn vị chục chiếc
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default, conversion_factor)
values ("system", "system" ,1562636525724, 1562636525724, 1, 0, 11, "chục chiếc", "10 chiếc", "10 chiếc", 1, 7, 1, 10);
-- 13
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default)
values ("system", "system" ,1562636525724, 1562636525724, 1, 1, 0, "con", "Đơn vị đo bao gói", "1 con", 1, 7, 1);
-- 14 đơn vị chục con
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default, conversion_factor)
values ("system", "system" ,1562636525724, 1562636525724, 1, 0, 13, "chục con", "10 con", "10 con", 1, 7, 1, 10);
-- 15 tá quả
INSERT INTO agri_uoms (created_by, updated_by, created, updated, active, type, base_unit_id, name, description, pronunciation, tenant_id, uom_type_id, is_default, conversion_factor)
values ("system", "system" ,1562636525724, 1562636525724, 1, 0, 7, "tá", "1 tá", "1 tá", 1, 7, 1, 12);

SET FOREIGN_KEY_CHECKS=1;


ALTER table base_tenants add COLUMN product_index INT(5) DEFAULT 0 NOT NULL;
ALTER table base_tenants add COLUMN tenant_index INT(5) DEFAULT 0 NOT NULL;