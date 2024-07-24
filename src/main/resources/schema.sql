CREATE TABLE IF NOT EXISTS categories
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    name          VARCHAR(255)          NULL,
    color         VARCHAR(255)          NULL,
    image_url     VARCHAR(255)          NULL,
    `description` VARCHAR(255)          NULL,
    CONSTRAINT pk_categories PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS kakao_members
(
    access_token  VARCHAR(255) NOT NULL,
    token_type    VARCHAR(255) NULL,
    refresh_token VARCHAR(255) NULL,
    expires_in    INT          NULL,
    scope         VARCHAR(255) NULL,
    CONSTRAINT pk_kakao_members PRIMARY KEY (access_token)
);

CREATE TABLE IF NOT EXISTS members
(
    id          BIGINT AUTO_INCREMENT NOT NULL,
    member_type VARCHAR(255)          NULL,
    email       VARCHAR(255)          NULL,
    password    VARCHAR(255)          NULL,
    nickname    VARCHAR(255)          NULL,
    CONSTRAINT pk_members PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS options
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    product_id BIGINT                NULL,
    name       VARCHAR(255)          NULL,
    count      BIGINT                NULL,
    CONSTRAINT pk_options PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS products
(
    id          BIGINT AUTO_INCREMENT NOT NULL,
    category_id BIGINT                NULL,
    name        VARCHAR(255)          NULL,
    price       BIGINT                NULL,
    image_url   VARCHAR(255)          NULL,
    CONSTRAINT pk_products PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS wishes
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    member_id     BIGINT                NULL,
    product_id    BIGINT                NULL,
    product_count BIGINT                NULL,
    CONSTRAINT pk_wishes PRIMARY KEY (id)
);

ALTER TABLE members
    ADD CONSTRAINT uc_members_email UNIQUE (email);

ALTER TABLE members
    ADD CONSTRAINT uc_members_nickname UNIQUE (nickname);

ALTER TABLE options
    ADD CONSTRAINT uc_options_name UNIQUE (name);

ALTER TABLE options
    ADD CONSTRAINT FK_OPTIONS_ON_PRODUCT FOREIGN KEY (product_id) REFERENCES products (id);

ALTER TABLE products
    ADD CONSTRAINT FK_PRODUCTS_ON_CATEGORY FOREIGN KEY (category_id) REFERENCES categories (id);

ALTER TABLE wishes
    ADD CONSTRAINT FK_WISHES_ON_MEMBER FOREIGN KEY (member_id) REFERENCES members (id);

ALTER TABLE wishes
    ADD CONSTRAINT FK_WISHES_ON_PRODUCT FOREIGN KEY (product_id) REFERENCES products (id);