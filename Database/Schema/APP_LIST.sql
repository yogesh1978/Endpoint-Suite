--------------------------------------------------------
--  DDL for View APP_LIST
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SEN11CP2MSI164"."APP_LIST" ("DEVICE_ID", "APP_NAME", "VERSION") AS 
  select distinct userid as device_id, wDisplayName as app_name, wDisplayVersion as Version from rNVD_INSTALLED_UNINSTALL where wDisplayName <> 'null' UNION
 select distinct userid as device_id, wFileDescription as app_name, wProductVersion as Version from rNVD_INSTALLED_APPS where wFileDescription <> 'null' 
 
;
