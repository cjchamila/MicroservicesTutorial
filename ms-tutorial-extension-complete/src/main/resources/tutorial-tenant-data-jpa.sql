-- liquibase formatted sql
-- changeset broadleaf:tenant-tutorial-demo

INSERT INTO BLC_TENANT(ID,
                       TENANT_NAME,
                       IDENTIFIER_TYPE,
                       IDENTIFIER_VALUE,
                       DEFAULT_LOCALE,
                       ALLOWED_LOCALES,
                       DEFAULT_CURRENCY,
                       ALLOWED_CURRENCIES)
VALUES ('5DF1363059675161A85F576D',
        'Local Tenant',
        'DOMAIN',
        'localhost',
        'en_US',
        '["en_US"]',
        'USD',
        '["USD"]');

INSERT INTO BLC_TENANT_APPLICATION (ID,
                                    NAME,
                                    IDENTIFIER_TYPE,
                                    IDENTIFIER_VALUE,
                                    CUSTOMER_CONTEXT_ID,
                                    DEACTIVATED,
                                    DEFAULT_LOCALE,
                                    ALLOWED_LOCALES,
                                    DEFAULT_CURRENCY,
                                    ALLOWED_CURRENCIES,
                                    UPDATED_TIMESTAMP,
                                    TRK_ARCHIVED,
                                    TRK_TENANT_ID)
VALUES ('1', 'Tutorial Application',
        'DOMAIN',
        'tutorial.localhost',
        '1',
        'N',
        'en_US',
        '["en_US"]',
        'USD',
        '["USD"]',
        {d'2018-01-01'},
        'N',
        '5DF1363059675161A85F576D');

INSERT INTO BLC_TENANT_APPLICATION_CATALOG (APPLICATION_ID, CONTEXT_ID, IMPLICIT, NAME, MUTABILITY_TYPE,
                                            VISIBLE_AS_ASSIGNED, EXCLUDE_FROM_ADD, CATALOG_STATUS,
                                            ISOLATED_CATALOGS_ORDER)
VALUES ('1', '1', '10', 'TUTORIAL_CATALOG', 'CUSTOMIZABLE', 'Y', 'N', 'ONLINE', 0);

INSERT INTO BLC_NOTIFICATION_STATE (ID, CONTAINER, ENTITY_TYPE, CHANGE_TIMESTAMP, CHANGE_TIMESTAMP_ACK, ACKED, STOPPED,
                                    ATTEMPTS, NEXT_ATTEMPT, NOTIFICATION_NAME, MESSAGE_TYPE, MESSAGE_VALUE)
VALUES ('1', '1', 'com.broadleafcommerce.tenant.provider.jpa.domain.JpaTenantApplication', {d'2018-01-01'}, NULL, 'N', 'N',
        0, NULL, 'PERSISTENCE', NULL, NULL);

INSERT INTO BLC_TENANT_CATALOG (ID, OWNING_APPLICATION, CATALOG_NAME, HIDDEN, CATALOG_LEVEL, UPDATED_TIMESTAMP, CATALOG_LOCALE, DEFAULT_CURRENCY,
                                TRK_ARCHIVED, TRK_TENANT_ID)
VALUES ('1', NULL, 'TUTORIAL_CATALOG', 'N', 1, {d'2018-01-01'}, 'en_US', 'USD', 'N', '5DF1363059675161A85F576D');

INSERT INTO BLC_NOTIFICATION_STATE (ID, CONTAINER, ENTITY_TYPE, CHANGE_TIMESTAMP, CHANGE_TIMESTAMP_ACK, ACKED, STOPPED,
                                    ATTEMPTS, NEXT_ATTEMPT, NOTIFICATION_NAME, MESSAGE_TYPE, MESSAGE_VALUE)
VALUES ('3', '1', 'com.broadleafcommerce.tenant.provider.jpa.domain.JpaTenantCatalog', {d'2018-01-01'}, NULL, 'N', 'N', 0,
        NULL, 'PERSISTENCE', NULL, NULL);

INSERT INTO BLC_TENANT_CATALOG (ID, OWNING_APPLICATION, CATALOG_NAME, HIDDEN, CATALOG_LEVEL, UPDATED_TIMESTAMP, CATALOG_LOCALE, DEFAULT_CURRENCY,
                                TRK_ARCHIVED, TRK_TENANT_ID)
VALUES ('10', '1', 'Tutorial Site''s Catalog', 'Y', 2, {d'2018-01-01'}, 'en_US', 'USD', 'N', '5DF1363059675161A85F576D');

INSERT INTO BLC_TENANT_CATALOG_REF (ID, NAME, PARENT_CATALOG_ID, CHILD_CATALOG_ID, MUTABILITY_TYPE, INCLUSION_FILTERS,
                                    EXCLUSION_FILTERS, PARENTS_ORDER)
VALUES ('1', 'TUTORIAL_CATALOG', '1', '10', 'CUSTOMIZABLE', NULL, NULL, 0);

INSERT INTO BLC_NOTIFICATION_STATE (ID, CONTAINER, ENTITY_TYPE, CHANGE_TIMESTAMP, CHANGE_TIMESTAMP_ACK, ACKED, STOPPED,
                                    ATTEMPTS, NEXT_ATTEMPT, NOTIFICATION_NAME, MESSAGE_TYPE, MESSAGE_VALUE)
VALUES ('4', '10', 'com.broadleafcommerce.tenant.provider.jpa.domain.JpaTenantCatalog', {d'2018-01-01'}, NULL, 'N', 'N', 0,
        NULL, 'PERSISTENCE', NULL, NULL);