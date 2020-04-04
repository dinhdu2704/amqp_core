-- liquibase formatted sql
-- changeset dudd:1.1-12
DROP TABLE IF EXISTS agri_areas;
CREATE TABLE `agri_areas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL,
  `updated` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `farm_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acreage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `type` INTEGER DEFAULT NULL, -- loai canh cac
  PRIMARY KEY (`id`)
  -- KEY `fk_contact_organization_id` (`organization_id`),
  -- CONSTRAINT `fk_contact_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `base_organizations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;