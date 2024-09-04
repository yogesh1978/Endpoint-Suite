--------------------------------------------------------
--  DDL for Table AUDIT_EVENT
--------------------------------------------------------

  CREATE TABLE "SEN11CP2MSI164"."AUDIT_EVENT" 
   (	"AUDITEVENTKEY" NUMBER(*,0), 
	"TIME" DATE, 
	"AUDITUSER" NVARCHAR2(255), 
	"AUDITCATKEY" NUMBER(*,0), 
	"AUDITTYPEKEY" NUMBER(*,0), 
	"AUDITSYSTEM" NVARCHAR2(255), 
	"MESSAGE" NVARCHAR2(2000)
   ) ;
