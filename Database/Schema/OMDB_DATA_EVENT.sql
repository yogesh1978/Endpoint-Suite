--------------------------------------------------------
--  DDL for View OMDB_DATA_EVENT
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SEN11CP2MSI164"."OMDB_DATA_EVENT" ("LAST_EVENT_DATE") AS 
  SELECT max(endtime) + (sysdate - cast(sys_extract_utc(systimestamp) as date)) LAST_EVENT_DATE 
					FROM Sum_Activity WHERE exitcode = 0
;
