prompt PL/SQL Developer import file
prompt Created on 2014年2月8日 by Think Pad
set feedback off
set define off
prompt Dropping AUTHORITIES...
drop table AUTHORITIES cascade constraints;
prompt Dropping CONTACTS...
drop table CONTACTS cascade constraints;
prompt Dropping CUSTOMERS...
drop table CUSTOMERS cascade constraints;
prompt Dropping CUSTOMER_ACTIVITIES...
drop table CUSTOMER_ACTIVITIES cascade constraints;
prompt Dropping CUSTOMER_DRAINS...
drop table CUSTOMER_DRAINS cascade constraints;
prompt Dropping ROLES...
drop table ROLES cascade constraints;
prompt Dropping USERS...
drop table USERS cascade constraints;
prompt Dropping CUSTOMER_SERVICES...
drop table CUSTOMER_SERVICES cascade constraints;
prompt Dropping DICTS...
drop table DICTS cascade constraints;
prompt Dropping ORDERS...
drop table ORDERS cascade constraints;
prompt Dropping PRODUCTS...
drop table PRODUCTS cascade constraints;
prompt Dropping ORDER_ITEMS...
drop table ORDER_ITEMS cascade constraints;
prompt Dropping ROLE_AUTHORITY...
drop table ROLE_AUTHORITY cascade constraints;
prompt Dropping SALES_CHANCES...
drop table SALES_CHANCES cascade constraints;
prompt Dropping SALES_PLAN...
drop table SALES_PLAN cascade constraints;
prompt Dropping STORAGES...
drop table STORAGES cascade constraints;
prompt Creating AUTHORITIES...
create table AUTHORITIES
(
  ID                  NUMBER not null,
  NAME                VARCHAR2(255),
  DISPLAY_NAME        VARCHAR2(255),
  PERMISSIONS         VARCHAR2(255),
  PARENT_AUTHORITY_ID NUMBER,
  URL                 VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table AUTHORITIES
  add constraint PRIMARYAUTHORITIES1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table AUTHORITIES
  add constraint FK_SDU0Y4LWSYD7J783AYMBDA6G4 foreign key (PARENT_AUTHORITY_ID)
  references AUTHORITIES (ID);
create index IDX_FK_SDU0Y4LWSYD7J783AYMBDA6 on AUTHORITIES (PARENT_AUTHORITY_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating CONTACTS...
create table CONTACTS
(
  ID          NUMBER not null,
  MEMO        VARCHAR2(255),
  MOBILE      VARCHAR2(255),
  NAME        VARCHAR2(255),
  POSITION    VARCHAR2(255),
  SEX         VARCHAR2(255),
  TEL         VARCHAR2(255),
  CUSTOMER_ID NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONTACTS
  add constraint PRIMARYCONTACTS1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONTACTS
  add constraint FK_J0UTURNRU83J56UFV1CYQ02XL foreign key (CUSTOMER_ID)
  references CUSTOMERS (ID);
create index IDX_FK_J0UTURNRU83J56UFV1CYQ02 on CONTACTS (CUSTOMER_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating CUSTOMERS...
create table CUSTOMERS
(
  ID              NUMBER not null,
  ADDRESS         VARCHAR2(255),
  BANK            VARCHAR2(255),
  BANK_ACCOUNT    VARCHAR2(255),
  BANKROLL        NUMBER,
  CHIEF           VARCHAR2(255),
  CREDIT          VARCHAR2(255),
  FAX             VARCHAR2(255),
  LICENCE_NO      VARCHAR2(255),
  LOCAL_TAX_NO    VARCHAR2(255),
  NAME            VARCHAR2(255),
  NATIONAL_TAX_NO VARCHAR2(255),
  NO              VARCHAR2(255),
  REGION          VARCHAR2(255),
  SATIFY          VARCHAR2(255),
  STATE           VARCHAR2(255),
  TEL             VARCHAR2(255),
  TURNOVER        NUMBER,
  WEBSIT          VARCHAR2(255),
  ZIP             VARCHAR2(255),
  MANAGER_ID      NUMBER,
  CUSTOMER_LEVEL  VARCHAR2(255 CHAR)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERS
  add constraint PRIMARYCUSTOMERS1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERS
  add constraint FK_RGPEM82QDQAUTSQFMWTWYJP06 foreign key (MANAGER_ID)
  references CONTACTS (ID);
create index IDX_FK_RGPEM82QDQAUTSQFMWTWYJP on CUSTOMERS (MANAGER_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating CUSTOMER_ACTIVITIES...
create table CUSTOMER_ACTIVITIES
(
  ID            NUMBER not null,
  ACTIVITY_DATE DATE,
  DESCRIPTION   VARCHAR2(255),
  PLACE         VARCHAR2(255),
  TITLE         VARCHAR2(255),
  CUSTOMER_ID   NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMER_ACTIVITIES
  add constraint PRIMARYCUSTOMER_ACTIVITIES1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMER_ACTIVITIES
  add constraint FK_BG3W9V3B53U7NAV7NVFU79Y4P foreign key (CUSTOMER_ID)
  references CUSTOMERS (ID);
create index IDX_FK_BG3W9V3B53U7NAV7NVFU79Y on CUSTOMER_ACTIVITIES (CUSTOMER_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating CUSTOMER_DRAINS...
create table CUSTOMER_DRAINS
(
  ID              NUMBER(19) not null,
  DELAY           VARCHAR2(255 CHAR),
  DRAIN_DATE      TIMESTAMP(6),
  LAST_ORDER_DATE TIMESTAMP(6),
  REASON          VARCHAR2(255 CHAR),
  STATUS          VARCHAR2(255 CHAR),
  CUSTOMER_ID     NUMBER(19)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMER_DRAINS
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMER_DRAINS
  add constraint FK_JVIEIQNRGRUJKNXTRV0RMR7TA foreign key (CUSTOMER_ID)
  references CUSTOMERS (ID);

prompt Creating ROLES...
create table ROLES
(
  ID          NUMBER not null,
  DESCRIPTION VARCHAR2(255),
  ENABLED     NUMBER,
  NAME        VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROLES
  add constraint PRIMARYROLES1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating USERS...
create table USERS
(
  ID       NUMBER not null,
  ENABLED  NUMBER,
  NAME     VARCHAR2(255),
  PASSWORD VARCHAR2(255),
  ROLE_ID  NUMBER,
  SALT     VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint PRIMARYUSERS1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint FK_KRVOTBTIQHUDLKAMVLPAQUS0T foreign key (ROLE_ID)
  references ROLES (ID);
create index IDX_FK_KRVOTBTIQHUDLKAMVLPAQUS on USERS (ROLE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating CUSTOMER_SERVICES...
create table CUSTOMER_SERVICES
(
  ID              NUMBER(19) not null,
  ALLOT_DATE      DATE,
  CREATE_DATE     DATE,
  DEAL_DATE       DATE,
  DEAL_RESULT     VARCHAR2(255 CHAR),
  SATISFY         VARCHAR2(255 CHAR),
  SERVICE_DEAL    VARCHAR2(255 CHAR),
  SERVICE_REQUEST VARCHAR2(255 CHAR),
  SERVICE_STATE   VARCHAR2(255 CHAR),
  SERVICE_TITLE   VARCHAR2(255 CHAR),
  SERVICE_TYPE    VARCHAR2(255 CHAR),
  ALLOT_ID        NUMBER(19),
  CREATED_ID      NUMBER(19),
  CUSTOMER_ID     NUMBER(19)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMER_SERVICES
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMER_SERVICES
  add constraint FK_AJFS11OXYGP0ON3JOQE8A1T08 foreign key (CREATED_ID)
  references USERS (ID);
alter table CUSTOMER_SERVICES
  add constraint FK_GXSR8WEEI1A8A45JK0DSP38JF foreign key (CUSTOMER_ID)
  references CUSTOMERS (ID);
alter table CUSTOMER_SERVICES
  add constraint FK_I20KN2QK74HGIINV2E7MB30XF foreign key (ALLOT_ID)
  references USERS (ID);

prompt Creating DICTS...
create table DICTS
(
  ID       NUMBER not null,
  EDITABLE NUMBER,
  ITEM     VARCHAR2(255),
  TYPE     VARCHAR2(255),
  VALUE    VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DICTS
  add constraint PRIMARYDICTS1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ORDERS...
create table ORDERS
(
  ID          NUMBER not null,
  ADDRESS     VARCHAR2(255),
  ORDER_DATE  DATE,
  NO          VARCHAR2(255),
  STATUS      VARCHAR2(255),
  CUSTOMER_ID NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add constraint PRIMARYORDERS1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add constraint FK_ASTYS1DV61MDLP0N0WX0574R2 foreign key (CUSTOMER_ID)
  references CUSTOMERS (ID);
create index IDX_FK_ASTYS1DV61MDLP0N0WX0574 on ORDERS (CUSTOMER_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating PRODUCTS...
create table PRODUCTS
(
  ID    NUMBER not null,
  BATCH VARCHAR2(255),
  MEMO  VARCHAR2(255),
  NAME  VARCHAR2(255),
  PRICE NUMBER,
  TYPE  VARCHAR2(255),
  UNIT  VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PRODUCTS
  add constraint PRIMARYPRODUCTS1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ORDER_ITEMS...
create table ORDER_ITEMS
(
  ID         NUMBER not null,
  ITEM_COUNT NUMBER,
  MONEY      NUMBER,
  ORDER_ID   NUMBER,
  PRODUCT_ID NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDER_ITEMS
  add constraint PRIMARYORDER_ITEMS1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDER_ITEMS
  add constraint FK_3FEA23HXAR30BX7M7H8ED25N9 foreign key (PRODUCT_ID)
  references PRODUCTS (ID);
alter table ORDER_ITEMS
  add constraint FK_9GAP2FMW66V092NTB58RTOHWH foreign key (ORDER_ID)
  references ORDERS (ID);
create index IDX_FK_3FEA23HXAR30BX7M7H8ED25 on ORDER_ITEMS (PRODUCT_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_FK_9GAP2FMW66V092NTB58RTOH on ORDER_ITEMS (ORDER_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLE_AUTHORITY...
create table ROLE_AUTHORITY
(
  ROLE_ID      NUMBER,
  AUTHORITY_ID NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROLE_AUTHORITY
  add constraint FK_17V3U9QBWAJRM5JSAJ4UXUJX8 foreign key (AUTHORITY_ID)
  references AUTHORITIES (ID);
alter table ROLE_AUTHORITY
  add constraint FK_PD9DXRH00OJCI21L1H9PJ772 foreign key (ROLE_ID)
  references ROLES (ID);
create index IDX_FK_17V3U9QBWAJRM5JSAJ4UXUJ on ROLE_AUTHORITY (AUTHORITY_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_FK_PD9DXRH00OJCI21L1H9PJ77 on ROLE_AUTHORITY (ROLE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SALES_CHANCES...
create table SALES_CHANCES
(
  ID              NUMBER not null,
  CONTACT         VARCHAR2(255),
  CONTACT_TEL     VARCHAR2(255),
  CREATE_DATE     DATE,
  CUST_NAME       VARCHAR2(255),
  DESCRIPTION     VARCHAR2(255),
  DESIGNEE_DATE   DATE,
  RATE            NUMBER,
  SOURCE          VARCHAR2(255),
  STATUS          NUMBER,
  TITLE           VARCHAR2(255),
  CREATED_USER_ID NUMBER,
  DESIGNEE_ID     NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SALES_CHANCES
  add constraint PRIMARYSALES_CHANCES1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SALES_CHANCES
  add constraint FK_FTKYCV9D4NVMU2C2W2FW31KNO foreign key (CREATED_USER_ID)
  references USERS (ID);
alter table SALES_CHANCES
  add constraint FK_HQECYRMH65UWK6DC2NM2HOLCG foreign key (DESIGNEE_ID)
  references USERS (ID);
create index IDX_FK_FTKYCV9D4NVMU2C2W2FW31K on SALES_CHANCES (CREATED_USER_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_FK_HQECYRMH65UWK6DC2NM2HOL on SALES_CHANCES (DESIGNEE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SALES_PLAN...
create table SALES_PLAN
(
  ID          NUMBER not null,
  PLAN_DATE   DATE,
  PLAN_RESULT VARCHAR2(255),
  TODO        VARCHAR2(255),
  CHANCE_ID   NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SALES_PLAN
  add constraint PRIMARYSALES_PLAN1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SALES_PLAN
  add constraint FK_FYP32DDRXHRWK4K6QLBGYB03K foreign key (CHANCE_ID)
  references SALES_CHANCES (ID);
create index IDX_FK_FYP32DDRXHRWK4K6QLBGYB0 on SALES_PLAN (CHANCE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating STORAGES...
create table STORAGES
(
  ID          NUMBER not null,
  MEMO        VARCHAR2(255),
  STOCK_COUNT NUMBER,
  STOCK_WARE  VARCHAR2(255),
  WARE_HOUSE  VARCHAR2(255),
  PRODUCT_ID  NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STORAGES
  add constraint PRIMARYSTORAGES1 primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STORAGES
  add constraint FK_GA5F9D7RVVWKJYAH6P02E69N0 foreign key (PRODUCT_ID)
  references PRODUCTS (ID);
create index IDX_FK_GA5F9D7RVVWKJYAH6P02E69 on STORAGES (PRODUCT_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for AUTHORITIES...
alter table AUTHORITIES disable all triggers;
prompt Disabling triggers for CONTACTS...
alter table CONTACTS disable all triggers;
prompt Disabling triggers for CUSTOMERS...
alter table CUSTOMERS disable all triggers;
prompt Disabling triggers for CUSTOMER_ACTIVITIES...
alter table CUSTOMER_ACTIVITIES disable all triggers;
prompt Disabling triggers for CUSTOMER_DRAINS...
alter table CUSTOMER_DRAINS disable all triggers;
prompt Disabling triggers for ROLES...
alter table ROLES disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for CUSTOMER_SERVICES...
alter table CUSTOMER_SERVICES disable all triggers;
prompt Disabling triggers for DICTS...
alter table DICTS disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for PRODUCTS...
alter table PRODUCTS disable all triggers;
prompt Disabling triggers for ORDER_ITEMS...
alter table ORDER_ITEMS disable all triggers;
prompt Disabling triggers for ROLE_AUTHORITY...
alter table ROLE_AUTHORITY disable all triggers;
prompt Disabling triggers for SALES_CHANCES...
alter table SALES_CHANCES disable all triggers;
prompt Disabling triggers for SALES_PLAN...
alter table SALES_PLAN disable all triggers;
prompt Disabling triggers for STORAGES...
alter table STORAGES disable all triggers;
prompt Disabling foreign key constraints for AUTHORITIES...
alter table AUTHORITIES disable constraint FK_SDU0Y4LWSYD7J783AYMBDA6G4;
prompt Disabling foreign key constraints for CONTACTS...
alter table CONTACTS disable constraint FK_J0UTURNRU83J56UFV1CYQ02XL;
prompt Disabling foreign key constraints for CUSTOMERS...
alter table CUSTOMERS disable constraint FK_RGPEM82QDQAUTSQFMWTWYJP06;
prompt Disabling foreign key constraints for CUSTOMER_ACTIVITIES...
alter table CUSTOMER_ACTIVITIES disable constraint FK_BG3W9V3B53U7NAV7NVFU79Y4P;
prompt Disabling foreign key constraints for CUSTOMER_DRAINS...
alter table CUSTOMER_DRAINS disable constraint FK_JVIEIQNRGRUJKNXTRV0RMR7TA;
prompt Disabling foreign key constraints for USERS...
alter table USERS disable constraint FK_KRVOTBTIQHUDLKAMVLPAQUS0T;
prompt Disabling foreign key constraints for CUSTOMER_SERVICES...
alter table CUSTOMER_SERVICES disable constraint FK_AJFS11OXYGP0ON3JOQE8A1T08;
alter table CUSTOMER_SERVICES disable constraint FK_GXSR8WEEI1A8A45JK0DSP38JF;
alter table CUSTOMER_SERVICES disable constraint FK_I20KN2QK74HGIINV2E7MB30XF;
prompt Disabling foreign key constraints for ORDERS...
alter table ORDERS disable constraint FK_ASTYS1DV61MDLP0N0WX0574R2;
prompt Disabling foreign key constraints for ORDER_ITEMS...
alter table ORDER_ITEMS disable constraint FK_3FEA23HXAR30BX7M7H8ED25N9;
alter table ORDER_ITEMS disable constraint FK_9GAP2FMW66V092NTB58RTOHWH;
prompt Disabling foreign key constraints for ROLE_AUTHORITY...
alter table ROLE_AUTHORITY disable constraint FK_17V3U9QBWAJRM5JSAJ4UXUJX8;
alter table ROLE_AUTHORITY disable constraint FK_PD9DXRH00OJCI21L1H9PJ772;
prompt Disabling foreign key constraints for SALES_CHANCES...
alter table SALES_CHANCES disable constraint FK_FTKYCV9D4NVMU2C2W2FW31KNO;
alter table SALES_CHANCES disable constraint FK_HQECYRMH65UWK6DC2NM2HOLCG;
prompt Disabling foreign key constraints for SALES_PLAN...
alter table SALES_PLAN disable constraint FK_FYP32DDRXHRWK4K6QLBGYB03K;
prompt Disabling foreign key constraints for STORAGES...
alter table STORAGES disable constraint FK_GA5F9D7RVVWKJYAH6P02E69N0;
prompt Loading AUTHORITIES...
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (15, null, '营销管理', null, null, '/');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (16, 'chance', '营销机会管理', null, 15, '/chance/list');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (17, 'plan', '客户开发计划', null, 15, '/plan/list');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (18, null, '客户管理', null, null, '/');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (19, 'customer', '客户信息管理', null, 18, '/customer/list');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (20, 'drain', '客户流失管理', null, 18, '/drain/list');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (21, null, '服务管理', null, null, '/');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (22, 'service-create', '服务创建', null, 21, '/service/create');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (23, 'service-allot', '服务分配', null, 21, '/service/allot/list');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (24, 'service-deal', '服务处理', null, 21, '/service/deal/list');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (25, 'service-feedback', '服务反馈', null, 21, '/service/feedback/list');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (26, 'service-archive', '服务归档', null, 21, '/service/archive/list');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (27, null, '统计报表', null, null, '/');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (28, 'report-pay', '客户贡献分析', null, 27, '/report/pay');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (29, 'report-consist', '客户构成分析', null, 27, '/report/consist?type=search_level');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (30, 'report-service', '客户服务分析', null, 27, '/report/service');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (31, 'report-drain', '客户流失分析', null, 27, '/report/drain');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (32, null, '基础数据', null, null, '/');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (33, 'dict', '数据字典管理', null, 32, '/dict/list');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (34, 'product', '查询产品信息', null, 32, '/product/list');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (35, 'storage', '查询库存信息', null, 32, '/storage/list');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (36, null, '系统权限管理', null, null, '/');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (37, 'user', '系统用户管理', null, 36, '/user/list');
insert into AUTHORITIES (ID, NAME, DISPLAY_NAME, PERMISSIONS, PARENT_AUTHORITY_ID, URL)
values (39, 'role', '角色管理', null, 36, '/role/list');
commit;
prompt 24 records loaded
prompt Loading CONTACTS...
insert into CONTACTS (ID, MEMO, MOBILE, NAME, POSITION, SEX, TEL, CUSTOMER_ID)
values (142, '英雄人物的名字', '13456789912', '杨倩', '技术经理', '女', '86789967', 141);
insert into CONTACTS (ID, MEMO, MOBILE, NAME, POSITION, SEX, TEL, CUSTOMER_ID)
values (155, null, null, '黄章2', null, null, '13456789900', 154);
insert into CONTACTS (ID, MEMO, MOBILE, NAME, POSITION, SEX, TEL, CUSTOMER_ID)
values (1, null, null, '丽丽', '开发部经理', '女', '13456789900', 2);
insert into CONTACTS (ID, MEMO, MOBILE, NAME, POSITION, SEX, TEL, CUSTOMER_ID)
values (2, null, null, '王自如', null, null, '13456778800', 3);
insert into CONTACTS (ID, MEMO, MOBILE, NAME, POSITION, SEX, TEL, CUSTOMER_ID)
values (3, '岳飞的好朋友', '13455667788', '杨再兴', '开发部经理', '男', '86789988', 4);
insert into CONTACTS (ID, MEMO, MOBILE, NAME, POSITION, SEX, TEL, CUSTOMER_ID)
values (4, null, null, '付老师', null, null, '13456778900', 5);
insert into CONTACTS (ID, MEMO, MOBILE, NAME, POSITION, SEX, TEL, CUSTOMER_ID)
values (5, null, null, '陈雷', null, null, '51571522', 6);
insert into CONTACTS (ID, MEMO, MOBILE, NAME, POSITION, SEX, TEL, CUSTOMER_ID)
values (6, null, null, '宋红康', null, null, '13456789900', 7);
insert into CONTACTS (ID, MEMO, MOBILE, NAME, POSITION, SEX, TEL, CUSTOMER_ID)
values (8, '最牛逼的将领', '13999999998', '岳飞', '大帅', '男', '010-99999999', 4);
commit;
prompt 9 records loaded
prompt Loading CUSTOMERS...
insert into CUSTOMERS (ID, ADDRESS, BANK, BANK_ACCOUNT, BANKROLL, CHIEF, CREDIT, FAX, LICENCE_NO, LOCAL_TAX_NO, NAME, NATIONAL_TAX_NO, NO, REGION, SATIFY, STATE, TEL, TURNOVER, WEBSIT, ZIP, MANAGER_ID, CUSTOMER_LEVEL)
values (141, 'e世界', '建设银行2', 'YX900987677855400', 10000, '尚硅谷', '☆☆☆☆☆', '010-22345678', 'YYZZ-ZX908765545', 'DS-67Y655', '联想移动', 'GS-78X00ZZ', 'e9852130-84fd-495c-a1d7-cb357f1ee399', '北京', '☆☆☆☆☆', '流失预警', '86789966', 300000, 'www.atguigu.com', '100001', 142, '战略合作伙伴');
insert into CUSTOMERS (ID, ADDRESS, BANK, BANK_ACCOUNT, BANKROLL, CHIEF, CREDIT, FAX, LICENCE_NO, LOCAL_TAX_NO, NAME, NATIONAL_TAX_NO, NO, REGION, SATIFY, STATE, TEL, TURNOVER, WEBSIT, ZIP, MANAGER_ID, CUSTOMER_LEVEL)
values (154, '大连沙河口区', '建设银行', 'YX900987677855400', 10000, '尚硅谷', '☆☆☆☆☆', '010-22345678', 'YYZZ-ZX908765545', 'DS-67Y655', '魅族科技', 'GS-78X00ZZ', '95d687fd-382d-4bad-87d2-6be7a7c57d04', '北京', '☆☆☆☆☆', '流失', '86789967', 300000, 'www.atguigu.com', '100001', 155, '战略合作伙伴');
insert into CUSTOMERS (ID, ADDRESS, BANK, BANK_ACCOUNT, BANKROLL, CHIEF, CREDIT, FAX, LICENCE_NO, LOCAL_TAX_NO, NAME, NATIONAL_TAX_NO, NO, REGION, SATIFY, STATE, TEL, TURNOVER, WEBSIT, ZIP, MANAGER_ID, CUSTOMER_LEVEL)
values (2, '大连沙河口区', '农业银行', 'YX900987677855466', 10000, '陈雷', '☆☆☆☆', '0411-89789901', 'YYZZ-ZX908765544', 'DS-67Y655', '大连重工', 'GS-78X00ZZ', 'dcbc0726-4632-409c-ae27-80e2e8f8be2c', '辽宁', '☆☆☆', '正常', '0411-89789900', 900, 'www.atguigu.com', '160000', 1, '大客户');
insert into CUSTOMERS (ID, ADDRESS, BANK, BANK_ACCOUNT, BANKROLL, CHIEF, CREDIT, FAX, LICENCE_NO, LOCAL_TAX_NO, NAME, NATIONAL_TAX_NO, NO, REGION, SATIFY, STATE, TEL, TURNOVER, WEBSIT, ZIP, MANAGER_ID, CUSTOMER_LEVEL)
values (3, '北京海龙电子城', '农业银行', 'YX900987677855488', 20000, '尚硅谷', '☆☆☆☆☆', '010-22345678', 'YYZZ-ZX908765599', 'DS-67Y677', '恒大电脑', 'GS-78X00YY', '1f2e93e7-9514-4a88-b7db-b35ace6343b1', '北京', '☆☆☆☆☆', '删除', '010-12345678', 800, 'www.atguigu.com', '100001', 2, '战略合作伙伴');
insert into CUSTOMERS (ID, ADDRESS, BANK, BANK_ACCOUNT, BANKROLL, CHIEF, CREDIT, FAX, LICENCE_NO, LOCAL_TAX_NO, NAME, NATIONAL_TAX_NO, NO, REGION, SATIFY, STATE, TEL, TURNOVER, WEBSIT, ZIP, MANAGER_ID, CUSTOMER_LEVEL)
values (4, 'e世界', '建设银行', 'YX900987677855400', 10, '宋红康', '☆', '010-98765432', 'YYZZ-ZX908765545', 'DS-67Y699', '阿拉灯', 'GS-78X00OO', 'edf8f801-7fd5-4ebb-9660-6c115de36c87', '北京', '☆', '正常', '010-98765433', 300000, 'www.atguigu.com', '100001', 3, '合作伙伴');
insert into CUSTOMERS (ID, ADDRESS, BANK, BANK_ACCOUNT, BANKROLL, CHIEF, CREDIT, FAX, LICENCE_NO, LOCAL_TAX_NO, NAME, NATIONAL_TAX_NO, NO, REGION, SATIFY, STATE, TEL, TURNOVER, WEBSIT, ZIP, MANAGER_ID, CUSTOMER_LEVEL)
values (5, null, null, null, null, null, null, null, null, null, '北京培黎师范学院', null, '9a94dfcb-38b0-4e79-ae96-08f19da9f0f1', null, null, '删除', null, null, null, null, null, null);
insert into CUSTOMERS (ID, ADDRESS, BANK, BANK_ACCOUNT, BANKROLL, CHIEF, CREDIT, FAX, LICENCE_NO, LOCAL_TAX_NO, NAME, NATIONAL_TAX_NO, NO, REGION, SATIFY, STATE, TEL, TURNOVER, WEBSIT, ZIP, MANAGER_ID, CUSTOMER_LEVEL)
values (6, null, null, null, null, null, null, null, null, null, '新浪', null, 'ff704114-40cc-41c3-b30a-853f322eae9e', null, null, '删除', null, null, null, null, null, null);
insert into CUSTOMERS (ID, ADDRESS, BANK, BANK_ACCOUNT, BANKROLL, CHIEF, CREDIT, FAX, LICENCE_NO, LOCAL_TAX_NO, NAME, NATIONAL_TAX_NO, NO, REGION, SATIFY, STATE, TEL, TURNOVER, WEBSIT, ZIP, MANAGER_ID, CUSTOMER_LEVEL)
values (7, 'e世界', '建设银行', 'YX900987677855400', 10, '尚硅谷', '☆', '010-22345678', 'YYZZ-ZX908765544', 'DS-67Y655', '腾讯', 'GS-78X00OO', '5baaf7e3-556c-42cf-bb2a-b00964dad13a', '上海', '☆', '正常', '86789966', 300000, 'www.atguigu.com', '100001', 6, '普通客户');
commit;
prompt 8 records loaded
prompt Loading CUSTOMER_ACTIVITIES...
insert into CUSTOMER_ACTIVITIES (ID, ACTIVITY_DATE, DESCRIPTION, PLACE, TITLE, CUSTOMER_ID)
values (160, to_date('12-12-1990', 'dd-mm-yyyy'), 'AASSSDDDD', '北京', '技术培训', 154);
insert into CUSTOMER_ACTIVITIES (ID, ACTIVITY_DATE, DESCRIPTION, PLACE, TITLE, CUSTOMER_ID)
values (2, to_date('15-12-2013', 'dd-mm-yyyy'), '认识了魅族的老总-郭靖', '北京北体体育场', '手机发展论坛2', 4);
insert into CUSTOMER_ACTIVITIES (ID, ACTIVITY_DATE, DESCRIPTION, PLACE, TITLE, CUSTOMER_ID)
values (3, to_date('01-01-2014', 'dd-mm-yyyy'), '意向 10000W 的大单', '大连富丽华酒店', 'PARTY', 2);
commit;
prompt 3 records loaded
prompt Loading CUSTOMER_DRAINS...
insert into CUSTOMER_DRAINS (ID, DELAY, DRAIN_DATE, LAST_ORDER_DATE, REASON, STATUS, CUSTOMER_ID)
values (204, 'AA`BB`CC', null, to_timestamp('28-01-2014 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '客户对我们不满意. 就是不满意! ', '流失', 4);
insert into CUSTOMER_DRAINS (ID, DELAY, DRAIN_DATE, LAST_ORDER_DATE, REASON, STATUS, CUSTOMER_ID)
values (205, 'ACDD`ACEE', to_timestamp('07-02-2014 02:01:17.279000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-02-2014 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '没办法, 流失吧. ', '流失', 141);
insert into CUSTOMER_DRAINS (ID, DELAY, DRAIN_DATE, LAST_ORDER_DATE, REASON, STATUS, CUSTOMER_ID)
values (206, 'AFDDY', to_timestamp('08-02-2014 02:00:53.676000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-02-2014 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '黄老邪, 不走寻常路啊。', '流失', 154);
commit;
prompt 3 records loaded
prompt Loading ROLES...
insert into ROLES (ID, DESCRIPTION, ENABLED, NAME)
values (3, '测试时使用, 上线需删除', 1, '测试管理员');
insert into ROLES (ID, DESCRIPTION, ENABLED, NAME)
values (1, null, 1, '管理员');
insert into ROLES (ID, DESCRIPTION, ENABLED, NAME)
values (2, null, 1, '测试');
commit;
prompt 3 records loaded
prompt Loading USERS...
insert into USERS (ID, ENABLED, NAME, PASSWORD, ROLE_ID, SALT)
values (21, 1, 'bcde', '4f6ed9e4ab25a6dac05933a8a0c5822ada8177e5', 1, 'e2b87e6eced06509');
insert into USERS (ID, ENABLED, NAME, PASSWORD, ROLE_ID, SALT)
values (22, 1, 'abcd', 'f7e480709b119c14621301576eb572ee009a47ce', 2, 'db314a8d91bd6f83');
insert into USERS (ID, ENABLED, NAME, PASSWORD, ROLE_ID, SALT)
values (24, 1, 'a', '9bba13aaeb55b59ce72f9f6aad672e2c32544630', 3, 'ceadfd47cdaa814c');
commit;
prompt 3 records loaded
prompt Loading CUSTOMER_SERVICES...
insert into CUSTOMER_SERVICES (ID, ALLOT_DATE, CREATE_DATE, DEAL_DATE, DEAL_RESULT, SATISFY, SERVICE_DEAL, SERVICE_REQUEST, SERVICE_STATE, SERVICE_TITLE, SERVICE_TYPE, ALLOT_ID, CREATED_ID, CUSTOMER_ID)
values (240, to_date('07-02-2014', 'dd-mm-yyyy'), to_date('07-02-2014', 'dd-mm-yyyy'), to_date('07-02-2014', 'dd-mm-yyyy'), '收到', '☆☆☆☆☆', 'OK。 以安排', '每次送货后, 请电话通知下. 联系人: 宋小宝：13456789988', '已归档', '送货后, 电话通知下', '建议', 24, 24, 2);
insert into CUSTOMER_SERVICES (ID, ALLOT_DATE, CREATE_DATE, DEAL_DATE, DEAL_RESULT, SATISFY, SERVICE_DEAL, SERVICE_REQUEST, SERVICE_STATE, SERVICE_TITLE, SERVICE_TYPE, ALLOT_ID, CREATED_ID, CUSTOMER_ID)
values (220, to_date('07-02-2014', 'dd-mm-yyyy'), to_date('07-02-2014', 'dd-mm-yyyy'), to_date('07-02-2014', 'dd-mm-yyyy'), 'AAA', '☆☆☆☆☆', '一台以上即可打折', '团购多少才能打折优惠啊 ?', '已归档', '团购打折', '咨询', 24, 24, 154);
insert into CUSTOMER_SERVICES (ID, ALLOT_DATE, CREATE_DATE, DEAL_DATE, DEAL_RESULT, SATISFY, SERVICE_DEAL, SERVICE_REQUEST, SERVICE_STATE, SERVICE_TITLE, SERVICE_TYPE, ALLOT_ID, CREATED_ID, CUSTOMER_ID)
values (221, to_date('07-02-2014', 'dd-mm-yyyy'), to_date('07-02-2014', 'dd-mm-yyyy'), to_date('07-02-2014', 'dd-mm-yyyy'), '已经就此道歉', '☆☆☆☆', '开除了。', '你们的 52 号客服的很不耐烦感觉', '已归档', '服务态度', '投诉', 24, 24, 4);
commit;
prompt 3 records loaded
prompt Loading DICTS...
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (8, 0, '☆', '满意度', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (9, 0, '☆☆', '满意度', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (10, 0, '☆☆☆', '满意度', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (11, 0, '☆☆☆☆', '满意度', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (12, 0, '☆☆☆☆☆', '满意度', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (13, 0, '☆', '信用度', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (14, 0, '☆☆', '信用度', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (15, 0, '☆☆☆', '信用度', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (16, 0, '☆☆☆☆', '信用度', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (17, 0, '☆☆☆☆☆', '信用度', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (18, 0, '北京', '地区', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (19, 0, '上海', '地区', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (20, 0, '广州', '地区', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (21, 0, '深圳', '地区', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (22, 0, '香港', '地区', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (28, 0, '辽宁', '地区', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (23, 0, '普通客户', '客户等级', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (24, 0, '大客户', '客户等级', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (25, 0, '重点开发客户', '客户等级', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (26, 0, '合作伙伴', '客户等级', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (27, 0, '战略合作伙伴', '客户等级', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (31, 0, '咨询', '服务类型', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (29, 0, '投诉', '服务类型', null);
insert into DICTS (ID, EDITABLE, ITEM, TYPE, VALUE)
values (30, 0, '建议', '服务类型', null);
commit;
prompt 24 records loaded
prompt Loading ORDERS...
insert into ORDERS (ID, ADDRESS, ORDER_DATE, NO, STATUS, CUSTOMER_ID)
values (7, '长春', to_date('01-02-2014', 'dd-mm-yyyy'), 'DD98000', '已付款', 141);
insert into ORDERS (ID, ADDRESS, ORDER_DATE, NO, STATUS, CUSTOMER_ID)
values (8, '深圳', to_date('01-02-2014', 'dd-mm-yyyy'), 'DD98012', '已付款', 154);
insert into ORDERS (ID, ADDRESS, ORDER_DATE, NO, STATUS, CUSTOMER_ID)
values (1, '北京', to_date('26-01-2014', 'dd-mm-yyyy'), 'DD98065', '未付款', 4);
insert into ORDERS (ID, ADDRESS, ORDER_DATE, NO, STATUS, CUSTOMER_ID)
values (2, '上海', to_date('28-01-2014', 'dd-mm-yyyy'), 'DD98066', '已付款', 4);
insert into ORDERS (ID, ADDRESS, ORDER_DATE, NO, STATUS, CUSTOMER_ID)
values (3, '深圳', to_date('28-09-2013', 'dd-mm-yyyy'), 'DD98088', '已付款', 4);
insert into ORDERS (ID, ADDRESS, ORDER_DATE, NO, STATUS, CUSTOMER_ID)
values (4, '广州', to_date('28-05-2013', 'dd-mm-yyyy'), 'DD98099', '已付款', 4);
insert into ORDERS (ID, ADDRESS, ORDER_DATE, NO, STATUS, CUSTOMER_ID)
values (5, '大连', to_date('28-10-2013', 'dd-mm-yyyy'), 'DD98055', '已付款', 4);
insert into ORDERS (ID, ADDRESS, ORDER_DATE, NO, STATUS, CUSTOMER_ID)
values (6, '石家庄', to_date('28-11-2013', 'dd-mm-yyyy'), 'DD98011', '未付款', 4);
commit;
prompt 8 records loaded
prompt Loading PRODUCTS...
insert into PRODUCTS (ID, BATCH, MEMO, NAME, PRICE, TYPE, UNIT)
values (1, '国行', '保证行货', 'ThinkPad T430 笔记本', 8000, 'T430', '台');
insert into PRODUCTS (ID, BATCH, MEMO, NAME, PRICE, TYPE, UNIT)
values (3, '水货', '不保修', 'Nexus 手机', 2000, 'Nexus5', '台');
insert into PRODUCTS (ID, BATCH, MEMO, NAME, PRICE, TYPE, UNIT)
values (4, '二手', null, 'ipad', 1000, '2', '台');
insert into PRODUCTS (ID, BATCH, MEMO, NAME, PRICE, TYPE, UNIT)
values (5, '32G', null, '小米手机', 1500, '2s', '台');
insert into PRODUCTS (ID, BATCH, MEMO, NAME, PRICE, TYPE, UNIT)
values (6, '金色', null, 'iphone', 5000, '5s', '台');
insert into PRODUCTS (ID, BATCH, MEMO, NAME, PRICE, TYPE, UNIT)
values (7, '32G', null, '三星NOTE', 3000, '3', '台');
commit;
prompt 6 records loaded
prompt Loading ORDER_ITEMS...
insert into ORDER_ITEMS (ID, ITEM_COUNT, MONEY, ORDER_ID, PRODUCT_ID)
values (1, 10, 1000, 1, 1);
insert into ORDER_ITEMS (ID, ITEM_COUNT, MONEY, ORDER_ID, PRODUCT_ID)
values (2, 20, 2000, 1, 3);
commit;
prompt 2 records loaded
prompt Loading ROLE_AUTHORITY...
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 16);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 17);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 19);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 20);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 22);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 23);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 24);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 25);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 26);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 28);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 29);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 30);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 31);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 33);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 34);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 35);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 37);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (1, 39);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (2, 17);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 16);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 17);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 19);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 20);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 22);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 23);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 24);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 25);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 26);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 28);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 29);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 30);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 31);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 33);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 34);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 35);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 37);
insert into ROLE_AUTHORITY (ROLE_ID, AUTHORITY_ID)
values (3, 39);
commit;
prompt 37 records loaded
prompt Loading SALES_CHANCES...
insert into SALES_CHANCES (ID, CONTACT, CONTACT_TEL, CREATE_DATE, CUST_NAME, DESCRIPTION, DESIGNEE_DATE, RATE, SOURCE, STATUS, TITLE, CREATED_USER_ID, DESIGNEE_ID)
values (150, '黄章2', '13456789900', to_date('06-02-2014', 'dd-mm-yyyy'), '魅族科技', '好机会, 不可多得！', to_date('06-02-2014', 'dd-mm-yyyy'), 90, '手机论坛', 3, '原配件', 24, 24);
insert into SALES_CHANCES (ID, CONTACT, CONTACT_TEL, CREATE_DATE, CUST_NAME, DESCRIPTION, DESIGNEE_DATE, RATE, SOURCE, STATUS, TITLE, CREATED_USER_ID, DESIGNEE_ID)
values (156, '付老师', '51571522', to_date('06-02-2014', 'dd-mm-yyyy'), 'IPHONE 直销', '好像是个传说', to_date('06-02-2014', 'dd-mm-yyyy'), 10, 'IOS 论坛', 4, 'IPHONE 直销', 24, 24);
insert into SALES_CHANCES (ID, CONTACT, CONTACT_TEL, CREATE_DATE, CUST_NAME, DESCRIPTION, DESIGNEE_DATE, RATE, SOURCE, STATUS, TITLE, CREATED_USER_ID, DESIGNEE_ID)
values (1, '宋红康', '13456789900', to_date('02-02-2014', 'dd-mm-yyyy'), '腾讯', 'JavaEE', to_date('02-02-2014', 'dd-mm-yyyy'), 90, '微信', 3, '技术培训', 21, 24);
insert into SALES_CHANCES (ID, CONTACT, CONTACT_TEL, CREATE_DATE, CUST_NAME, DESCRIPTION, DESIGNEE_DATE, RATE, SOURCE, STATUS, TITLE, CREATED_USER_ID, DESIGNEE_ID)
values (2, '陈雷', '51571522', to_date('02-02-2014', 'dd-mm-yyyy'), '新浪', '团队凝聚力', to_date('02-02-2014', 'dd-mm-yyyy'), 90, '微博', 3, '团队培训', 21, 24);
insert into SALES_CHANCES (ID, CONTACT, CONTACT_TEL, CREATE_DATE, CUST_NAME, DESCRIPTION, DESIGNEE_DATE, RATE, SOURCE, STATUS, TITLE, CREATED_USER_ID, DESIGNEE_ID)
values (4, '付老师', '13456778900', to_date('02-02-2014', 'dd-mm-yyyy'), '北京培黎师范学院', '50 太高端服务器', to_date('02-02-2014', 'dd-mm-yyyy'), 80, '客户介绍', 3, '50 台服务器', 21, 24);
insert into SALES_CHANCES (ID, CONTACT, CONTACT_TEL, CREATE_DATE, CUST_NAME, DESCRIPTION, DESIGNEE_DATE, RATE, SOURCE, STATUS, TITLE, CREATED_USER_ID, DESIGNEE_ID)
values (5, '杨再兴', '13455667788', to_date('04-02-2014', 'dd-mm-yyyy'), '阿拉灯', '靠谱', to_date('04-02-2014', 'dd-mm-yyyy'), 100, '朋友介绍', 3, '手机经销商', 21, 24);
insert into SALES_CHANCES (ID, CONTACT, CONTACT_TEL, CREATE_DATE, CUST_NAME, DESCRIPTION, DESIGNEE_DATE, RATE, SOURCE, STATUS, TITLE, CREATED_USER_ID, DESIGNEE_ID)
values (7, '王自如', '13456778800', to_date('04-02-2014', 'dd-mm-yyyy'), '恒大电脑', '高端服务器 10 台', to_date('04-02-2014', 'dd-mm-yyyy'), 90, 'QQ 群', 3, '服务器 10 台', 24, 24);
insert into SALES_CHANCES (ID, CONTACT, CONTACT_TEL, CREATE_DATE, CUST_NAME, DESCRIPTION, DESIGNEE_DATE, RATE, SOURCE, STATUS, TITLE, CREATED_USER_ID, DESIGNEE_ID)
values (8, '丽丽', '13456789900', to_date('04-02-2014', 'dd-mm-yyyy'), '大连重工', '办公使用', to_date('04-02-2014', 'dd-mm-yyyy'), 80, '微信', 3, '台式机 50 台', 24, 24);
insert into SALES_CHANCES (ID, CONTACT, CONTACT_TEL, CREATE_DATE, CUST_NAME, DESCRIPTION, DESIGNEE_DATE, RATE, SOURCE, STATUS, TITLE, CREATED_USER_ID, DESIGNEE_ID)
values (120, '杨倩', '13456789912', to_date('05-02-2014', 'dd-mm-yyyy'), '联想移动', '北京乐 PHONE 总代', to_date('05-02-2014', 'dd-mm-yyyy'), 80, '手机博览会', 3, '乐Phone代理', 24, 24);
commit;
prompt 9 records loaded
prompt Loading SALES_PLAN...
insert into SALES_PLAN (ID, PLAN_DATE, PLAN_RESULT, TODO, CHANCE_ID)
values (140, to_date('12-12-1990', 'dd-mm-yyyy'), 'AAA-RESULT', 'AAA', 120);
insert into SALES_PLAN (ID, PLAN_DATE, PLAN_RESULT, TODO, CHANCE_ID)
values (152, to_date('12-12-1991', 'dd-mm-yyyy'), 'AA', 'ASDDD', 150);
insert into SALES_PLAN (ID, PLAN_DATE, PLAN_RESULT, TODO, CHANCE_ID)
values (153, to_date('12-12-1992', 'dd-mm-yyyy'), 'BB', 'ASBBB', 150);
insert into SALES_PLAN (ID, PLAN_DATE, PLAN_RESULT, TODO, CHANCE_ID)
values (1, to_date('12-12-1990', 'dd-mm-yyyy'), '初步意向', '吃个饭?', 1);
insert into SALES_PLAN (ID, PLAN_DATE, PLAN_RESULT, TODO, CHANCE_ID)
values (2, to_date('12-12-1991', 'dd-mm-yyyy'), '培训费没达成', '泡个脚?', 1);
insert into SALES_PLAN (ID, PLAN_DATE, PLAN_RESULT, TODO, CHANCE_ID)
values (3, to_date('12-12-1990', 'dd-mm-yyyy'), 'RESULT....', 'XYZZZ', 4);
insert into SALES_PLAN (ID, PLAN_DATE, PLAN_RESULT, TODO, CHANCE_ID)
values (4, to_date('12-12-1990', 'dd-mm-yyyy'), 'AAA-RESULT', 'AAA', 5);
insert into SALES_PLAN (ID, PLAN_DATE, PLAN_RESULT, TODO, CHANCE_ID)
values (5, to_date('12-12-1991', 'dd-mm-yyyy'), 'BBB-RESULT', 'BBB', 5);
insert into SALES_PLAN (ID, PLAN_DATE, PLAN_RESULT, TODO, CHANCE_ID)
values (7, to_date('12-12-1990', 'dd-mm-yyyy'), 'AAA-RESULT', 'AAA', 7);
insert into SALES_PLAN (ID, PLAN_DATE, PLAN_RESULT, TODO, CHANCE_ID)
values (8, to_date('12-12-1990', 'dd-mm-yyyy'), 'AAA-RESULT', 'AAA', 8);
commit;
prompt 10 records loaded
prompt Loading STORAGES...
insert into STORAGES (ID, MEMO, STOCK_COUNT, STOCK_WARE, WARE_HOUSE, PRODUCT_ID)
values (1, 'Nexus 手机比较抢手', 100, '1', '北京五棵松', 3);
insert into STORAGES (ID, MEMO, STOCK_COUNT, STOCK_WARE, WARE_HOUSE, PRODUCT_ID)
values (2, null, 2000, '2', '中关村海龙', 1);
insert into STORAGES (ID, MEMO, STOCK_COUNT, STOCK_WARE, WARE_HOUSE, PRODUCT_ID)
values (3, null, 200, '3', '京东一号', 3);
insert into STORAGES (ID, MEMO, STOCK_COUNT, STOCK_WARE, WARE_HOUSE, PRODUCT_ID)
values (4, null, 100, '4', 'e世界', 4);
insert into STORAGES (ID, MEMO, STOCK_COUNT, STOCK_WARE, WARE_HOUSE, PRODUCT_ID)
values (5, null, 200, '10', '北京五棵松', 1);
insert into STORAGES (ID, MEMO, STOCK_COUNT, STOCK_WARE, WARE_HOUSE, PRODUCT_ID)
values (6, null, 100, '11', '北京五棵松', 3);
insert into STORAGES (ID, MEMO, STOCK_COUNT, STOCK_WARE, WARE_HOUSE, PRODUCT_ID)
values (7, null, 100, '13', '北京五棵松', 4);
insert into STORAGES (ID, MEMO, STOCK_COUNT, STOCK_WARE, WARE_HOUSE, PRODUCT_ID)
values (8, null, 100, '14', '北京五棵松', 5);
insert into STORAGES (ID, MEMO, STOCK_COUNT, STOCK_WARE, WARE_HOUSE, PRODUCT_ID)
values (9, null, 100, '15', '北京五棵松', 6);
insert into STORAGES (ID, MEMO, STOCK_COUNT, STOCK_WARE, WARE_HOUSE, PRODUCT_ID)
values (10, null, 100, '16', '北京五棵松', 7);
commit;
prompt 10 records loaded
prompt Enabling foreign key constraints for AUTHORITIES...
alter table AUTHORITIES enable constraint FK_SDU0Y4LWSYD7J783AYMBDA6G4;
prompt Enabling foreign key constraints for CONTACTS...
alter table CONTACTS enable constraint FK_J0UTURNRU83J56UFV1CYQ02XL;
prompt Enabling foreign key constraints for CUSTOMERS...
alter table CUSTOMERS enable constraint FK_RGPEM82QDQAUTSQFMWTWYJP06;
prompt Enabling foreign key constraints for CUSTOMER_ACTIVITIES...
alter table CUSTOMER_ACTIVITIES enable constraint FK_BG3W9V3B53U7NAV7NVFU79Y4P;
prompt Enabling foreign key constraints for CUSTOMER_DRAINS...
alter table CUSTOMER_DRAINS enable constraint FK_JVIEIQNRGRUJKNXTRV0RMR7TA;
prompt Enabling foreign key constraints for USERS...
alter table USERS enable constraint FK_KRVOTBTIQHUDLKAMVLPAQUS0T;
prompt Enabling foreign key constraints for CUSTOMER_SERVICES...
alter table CUSTOMER_SERVICES enable constraint FK_AJFS11OXYGP0ON3JOQE8A1T08;
alter table CUSTOMER_SERVICES enable constraint FK_GXSR8WEEI1A8A45JK0DSP38JF;
alter table CUSTOMER_SERVICES enable constraint FK_I20KN2QK74HGIINV2E7MB30XF;
prompt Enabling foreign key constraints for ORDERS...
alter table ORDERS enable constraint FK_ASTYS1DV61MDLP0N0WX0574R2;
prompt Enabling foreign key constraints for ORDER_ITEMS...
alter table ORDER_ITEMS enable constraint FK_3FEA23HXAR30BX7M7H8ED25N9;
alter table ORDER_ITEMS enable constraint FK_9GAP2FMW66V092NTB58RTOHWH;
prompt Enabling foreign key constraints for ROLE_AUTHORITY...
alter table ROLE_AUTHORITY enable constraint FK_17V3U9QBWAJRM5JSAJ4UXUJX8;
alter table ROLE_AUTHORITY enable constraint FK_PD9DXRH00OJCI21L1H9PJ772;
prompt Enabling foreign key constraints for SALES_CHANCES...
alter table SALES_CHANCES enable constraint FK_FTKYCV9D4NVMU2C2W2FW31KNO;
alter table SALES_CHANCES enable constraint FK_HQECYRMH65UWK6DC2NM2HOLCG;
prompt Enabling foreign key constraints for SALES_PLAN...
alter table SALES_PLAN enable constraint FK_FYP32DDRXHRWK4K6QLBGYB03K;
prompt Enabling foreign key constraints for STORAGES...
alter table STORAGES enable constraint FK_GA5F9D7RVVWKJYAH6P02E69N0;
prompt Enabling triggers for AUTHORITIES...
alter table AUTHORITIES enable all triggers;
prompt Enabling triggers for CONTACTS...
alter table CONTACTS enable all triggers;
prompt Enabling triggers for CUSTOMERS...
alter table CUSTOMERS enable all triggers;
prompt Enabling triggers for CUSTOMER_ACTIVITIES...
alter table CUSTOMER_ACTIVITIES enable all triggers;
prompt Enabling triggers for CUSTOMER_DRAINS...
alter table CUSTOMER_DRAINS enable all triggers;
prompt Enabling triggers for ROLES...
alter table ROLES enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for CUSTOMER_SERVICES...
alter table CUSTOMER_SERVICES enable all triggers;
prompt Enabling triggers for DICTS...
alter table DICTS enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for PRODUCTS...
alter table PRODUCTS enable all triggers;
prompt Enabling triggers for ORDER_ITEMS...
alter table ORDER_ITEMS enable all triggers;
prompt Enabling triggers for ROLE_AUTHORITY...
alter table ROLE_AUTHORITY enable all triggers;
prompt Enabling triggers for SALES_CHANCES...
alter table SALES_CHANCES enable all triggers;
prompt Enabling triggers for SALES_PLAN...
alter table SALES_PLAN enable all triggers;
prompt Enabling triggers for STORAGES...
alter table STORAGES enable all triggers;
set feedback on
set define on
prompt Done.