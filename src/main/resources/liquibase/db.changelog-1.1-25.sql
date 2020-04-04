-- liquibase formatted sql
-- changeset dudd:1.1-25

DROP TABLE IF EXISTS `agri_product_categories`;
CREATE TABLE `agri_product_categories` (
    id bigint(20) NOT NULL AUTO_INCREMENT,
    created_by varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    updated_by varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    created bigint(20) DEFAULT NULL,
    updated bigint(20) DEFAULT NULL,
    active tinyint(1) DEFAULT NULL,
    tenant_id bigint(20) DEFAULT NULL,
    parent_id BIGINT(20) DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    relate_name varchar(255) DEFAULT NULL,
    category_name varchar (500) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_product_category_tenant_id` (`tenant_id`),
    CONSTRAINT `fk_product_category_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `base_tenants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO agri_product_categories (created_by, active, tenant_id, name, description, parent_id, relate_name, category_name)
values ("system", 1, 1, 'Cây củ', 'Cây củ', null, 1, 'Cây củ');

INSERT INTO agri_product_categories (created_by,active, tenant_id, name, description, parent_id, relate_name, category_name)
values ("system", 1, 1, 'Cây ăn quả', 'Cây ăn quả', null, 2, 'Cây ăn quả');

INSERT INTO agri_product_categories (created_by,active, tenant_id, name, description, parent_id, relate_name, category_name)
values ("system", 1, 1, 'Rau ăn lá', 'Rau ăn lá', null, 3, 'Rau ăn lá');

DROP TABLE IF EXISTS `agri_products`;
CREATE TABLE `agri_products` (
    id bigint(20) NOT NULL AUTO_INCREMENT,
    created_by varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    updated_by varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    created bigint(20) DEFAULT NULL,
    updated bigint(20) DEFAULT NULL,
    active tinyint(1) DEFAULT NULL,
    tenant_id bigint(20) NOT NULL,
    category BIGINT(20) DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    unit_id bigint(20) DEFAULT NULL,
    package_id bigint(20) DEFAULT NULL,
    avatar varchar(500) DEFAULT NULL,
    code varchar(20) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_product_tenant_id` (`tenant_id`),
    CONSTRAINT `fk_product_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `base_tenants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;