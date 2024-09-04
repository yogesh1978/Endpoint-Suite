--------------------------------------------------------
--  File created - Wednesday-September-04-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ADDEVICECONTAINER
--------------------------------------------------------

  CREATE TABLE "ADDEVICECONTAINER" 
   (	"DEVICENAME" VARCHAR2(255), 
	"CONTAINER" VARCHAR2(255), 
	"DISTINGUISHEDNAME" VARCHAR2(255), 
	"DOMAINNAME" VARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table ADINFO
--------------------------------------------------------

  CREATE TABLE "ADINFO" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"COMPDN" NVARCHAR2(255), 
	"COMPDOMN" NVARCHAR2(128), 
	"COMPGUID" NVARCHAR2(128), 
	"COMPNAME" NVARCHAR2(128), 
	"COMPSITE" NVARCHAR2(128), 
	"COMPUPN" NVARCHAR2(128), 
	"USERDN" NVARCHAR2(128), 
	"USERDOMN" NVARCHAR2(128), 
	"USERGUID" NVARCHAR2(128), 
	"USERNAME" NVARCHAR2(128), 
	"USERUPN" NVARCHAR2(128), 
	"RMADEVDN" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table APPCOMMENTS
--------------------------------------------------------

  CREATE TABLE "APPCOMMENTS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"USERNAME" NVARCHAR2(50), 
	"APPNAME" NVARCHAR2(128), 
	"TITLE" NVARCHAR2(255), 
	"ZSERVICE" NVARCHAR2(255), 
	"MTIME" DATE, 
	"REVIEWCOMMENT" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table APPEVENT
--------------------------------------------------------

  CREATE TABLE "APPEVENT" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"SERVICE_ID" NVARCHAR2(50), 
	"PRODUCT" NVARCHAR2(10), 
	"APP_NAME" NVARCHAR2(80), 
	"CATGROUP" NVARCHAR2(128), 
	"ERRORNUM" NVARCHAR2(10), 
	"EVENT" NVARCHAR2(20), 
	"STATUS" NVARCHAR2(255), 
	"DEL_TIME" NVARCHAR2(30), 
	"VER_TIME" NVARCHAR2(30), 
	"INST_TIME" NVARCHAR2(30), 
	"FIX_TIME" NVARCHAR2(30), 
	"DOWNL_TIME" NVARCHAR2(30), 
	"NVD_DOMAIN" NVARCHAR2(32), 
	"NVD_CLASS" NVARCHAR2(15), 
	"JOBID" NVARCHAR2(64), 
	"CJOBID" NVARCHAR2(64)
   )
--------------------------------------------------------
--  DDL for Table APPLIKES
--------------------------------------------------------

  CREATE TABLE "APPLIKES" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"USERNAME" NVARCHAR2(50), 
	"APPNAME" NVARCHAR2(128), 
	"ZSERVICE" NVARCHAR2(50), 
	"MTIME" DATE, 
	"LIKED" NVARCHAR2(10)
   )
--------------------------------------------------------
--  DDL for Table APPMSIEVENT
--------------------------------------------------------

  CREATE TABLE "APPMSIEVENT" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"SERVICE_ID" NVARCHAR2(50), 
	"APP_NAME" NVARCHAR2(80), 
	"ERRORNUM" NVARCHAR2(10), 
	"EVENT" NVARCHAR2(20), 
	"STATUS" NVARCHAR2(255), 
	"DEL_TIME" NVARCHAR2(30), 
	"VER_TIME" NVARCHAR2(30), 
	"INST_TIME" NVARCHAR2(30), 
	"FIX_TIME" NVARCHAR2(30), 
	"NVD_DOMAIN" NVARCHAR2(15), 
	"NVD_CLASS" NVARCHAR2(15), 
	"JOB_ID" NVARCHAR2(20), 
	"PROD_GUID" NVARCHAR2(75)
   )
--------------------------------------------------------
--  DDL for Table APPRATINGS
--------------------------------------------------------

  CREATE TABLE "APPRATINGS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"USERNAME" NVARCHAR2(50), 
	"APPNAME" NVARCHAR2(128), 
	"ZSERVICE" NVARCHAR2(50), 
	"MTIME" DATE, 
	"RATING" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table APPRNPEVENT
--------------------------------------------------------

  CREATE TABLE "APPRNPEVENT" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"CJOBID" NVARCHAR2(50), 
	"CMDMSG" NVARCHAR2(255), 
	"CMDRC" NUMBER(*,0), 
	"EVENT" NVARCHAR2(50), 
	"INSTDATE" NVARCHAR2(30), 
	"JOBID" NVARCHAR2(50), 
	"MODULE" NVARCHAR2(255), 
	"POSTMSG" NVARCHAR2(255), 
	"POSTRC" NUMBER(*,0), 
	"ZOBJCLAS" NVARCHAR2(25), 
	"ZOBJDATE" NVARCHAR2(25), 
	"ZOBJDOMN" NVARCHAR2(25), 
	"ZOBJID" NVARCHAR2(50), 
	"ZOBJNAME" NVARCHAR2(50), 
	"ZOBJTIME" NVARCHAR2(20), 
	"ZSVCNAME" NVARCHAR2(255), 
	"ZUSERID" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table APPV_SERVICES
--------------------------------------------------------

  CREATE TABLE "APPV_SERVICES" 
   (	"SERVICES_KEY" NUMBER(10,0), 
	"SERVICE_ID" NVARCHAR2(512), 
	"SERVICE_CREATE_TIME" DATE, 
	"SERVICE_NAME" NVARCHAR2(512)
   )
--------------------------------------------------------
--  DDL for Table AUDIT_ATTRNAMES
--------------------------------------------------------

  CREATE TABLE "AUDIT_ATTRNAMES" 
   (	"ATTRNAMEKEY" NUMBER(*,0), 
	"ATTRIBUTE" NVARCHAR2(32), 
	"DESCR" NVARCHAR2(256)
   )
--------------------------------------------------------
--  DDL for Table AUDIT_ATTRS
--------------------------------------------------------

  CREATE TABLE "AUDIT_ATTRS" 
   (	"AUDITEVENTKEY" NUMBER(*,0), 
	"ATTRNAMEKEY" NUMBER(*,0), 
	"VALUE" NVARCHAR2(2000)
   )
--------------------------------------------------------
--  DDL for Table AUDIT_CAT
--------------------------------------------------------

  CREATE TABLE "AUDIT_CAT" 
   (	"AUDITCATKEY" NUMBER(*,0), 
	"CATEGORY" NVARCHAR2(16), 
	"DESCR" NVARCHAR2(256)
   )
--------------------------------------------------------
--  DDL for Table AUDIT_EVENT
--------------------------------------------------------

  CREATE TABLE "AUDIT_EVENT" 
   (	"AUDITEVENTKEY" NUMBER(*,0), 
	"TIME" DATE, 
	"AUDITUSER" NVARCHAR2(255), 
	"AUDITCATKEY" NUMBER(*,0), 
	"AUDITTYPEKEY" NUMBER(*,0), 
	"AUDITSYSTEM" NVARCHAR2(255), 
	"MESSAGE" NVARCHAR2(2000)
   )
--------------------------------------------------------
--  DDL for Table AUDIT_TYPE
--------------------------------------------------------

  CREATE TABLE "AUDIT_TYPE" 
   (	"AUDITTYPEKEY" NUMBER(*,0), 
	"TYPE" NVARCHAR2(16), 
	"DESCR" NVARCHAR2(256)
   )
--------------------------------------------------------
--  DDL for Table AUTOPILOT_DEVICEMGMT
--------------------------------------------------------

  CREATE TABLE "AUTOPILOT_DEVICEMGMT" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"DEVICE_NAME" NVARCHAR2(50), 
	"BOOT_AGENT_INSTALL_TIME" DATE, 
	"BOOT_AGENT_RUNNING_STATUS" NVARCHAR2(100), 
	"RADIA_AGENT_INSTALL_TIME" DATE, 
	"RADIA_AGENT_RUNNING_STATUS" NVARCHAR2(100), 
	"MDM_ENROLLMENT_STATUS" NVARCHAR2(50), 
	"LAST_UPDATE" DATE
   )
--------------------------------------------------------
--  DDL for Table AUTOPILOT_RAGENT_STATUS
--------------------------------------------------------

  CREATE TABLE "AUTOPILOT_RAGENT_STATUS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"DEVICE_NAME" NVARCHAR2(50), 
	"RADSERVICE1" NVARCHAR2(50), 
	"RADSERVICE2" NVARCHAR2(50), 
	"RADSERVICE3" NVARCHAR2(50), 
	"RADSTATUS" NVARCHAR2(50), 
	"LAST_UPDATE" DATE
   )
--------------------------------------------------------
--  DDL for Table AUTOPILOT_REGISTRATION
--------------------------------------------------------

  CREATE TABLE "AUTOPILOT_REGISTRATION" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"DEVICE_NAME" NVARCHAR2(50), 
	"OS" NVARCHAR2(100), 
	"OS_VERSION" NVARCHAR2(100), 
	"DOMAIN_TYPE" NVARCHAR2(255), 
	"OWNER" NVARCHAR2(100), 
	"MDM" NVARCHAR2(50), 
	"MDM_COMPLIANT" NVARCHAR2(8), 
	"REGTIME" DATE, 
	"ACTIVITYTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table CACHEINFO
--------------------------------------------------------

  CREATE TABLE "CACHEINFO" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"DISKFREESPACE" NVARCHAR2(50), 
	"CACHELOC" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table CBBWINDOWS
--------------------------------------------------------

  CREATE TABLE "CBBWINDOWS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"BRANCH" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table COBSTATS
--------------------------------------------------------

  CREATE TABLE "COBSTATS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"SYNCSTATUS" NVARCHAR2(50), 
	"SERVERTYPE" NVARCHAR2(10), 
	"SERVERHOST" NVARCHAR2(100), 
	"SERVERPORT" NUMBER(*,0), 
	"SERVERSTARTTIME" DATE, 
	"SERVERENDTIME" DATE, 
	"MTIME" DATE, 
	"MYSQLSTARTTIME" DATE, 
	"OPENLDAPSTARTTIME" DATE, 
	"CSDBSTARTTIME" DATE, 
	"JOBSSTARTTIME" DATE, 
	"MYSQLENDTIME" DATE, 
	"OPENLDAPENDTIME" DATE, 
	"CSDBENDTIME" DATE, 
	"JOBSENDTIME" DATE, 
	"MYSQLSTATUS" NVARCHAR2(50), 
	"OPENLDAPSTATUS" NVARCHAR2(50), 
	"CSDBSTATUS" NVARCHAR2(50), 
	"JOBSSTATUS" NVARCHAR2(50), 
	"MYSQLSIZE" NUMBER(*,0), 
	"OPENLDAPSIZE" NUMBER(*,0), 
	"CSDBSIZE" NUMBER(*,0), 
	"JOBSSIZE" NUMBER(*,0), 
	"MYSQLSTATUSMESSAGE" NVARCHAR2(100), 
	"OPENLDAPSTATUSMESSAGE" NVARCHAR2(100), 
	"CSDBSTATUSMESSAGE" NVARCHAR2(100), 
	"JOBSSTATUSMESSAGE" NVARCHAR2(100)
   )
--------------------------------------------------------
--  DDL for Table CODES
--------------------------------------------------------

  CREATE TABLE "CODES" 
   (	"CODE_ID" NUMBER(10,0), 
	"CODETYPE_ID" NUMBER(10,0), 
	"DESCRIPTION" NVARCHAR2(80)
   )
--------------------------------------------------------
--  DDL for Table CODETYPES
--------------------------------------------------------

  CREATE TABLE "CODETYPES" 
   (	"CODETYPE_ID" NUMBER(10,0), 
	"DESCRIPTION" NVARCHAR2(80), 
	"REVISIONID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table CONTAINERDETAILS
--------------------------------------------------------

  CREATE TABLE "CONTAINERDETAILS" 
   (	"CONTAINER" VARCHAR2(255), 
	"LASTSYNCTIME" DATE, 
	"LASTUSEDTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table COPINFO
--------------------------------------------------------

  CREATE TABLE "COPINFO" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"EXCEPT_CLASS" NVARCHAR2(32), 
	"EXCEPT_INSTANCE" NVARCHAR2(32), 
	"RESOLVED_LOCATION" NVARCHAR2(32), 
	"ACTUAL_LOCATION" NVARCHAR2(32)
   )
--------------------------------------------------------
--  DDL for Table CUSTOMAPPS
--------------------------------------------------------

  CREATE TABLE "CUSTOMAPPS" 
   (	"APP_NAME" NVARCHAR2(256), 
	"APP_VERSION" NVARCHAR2(256), 
	"C_FLAG" NVARCHAR2(64) DEFAULT 'true'
   )
--------------------------------------------------------
--  DDL for Table DATADICTIONARY
--------------------------------------------------------

  CREATE TABLE "DATADICTIONARY" 
   (	"DICTIONARY_ID" NUMBER(10,0), 
	"SEARCHTYPE" NUMBER(10,0), 
	"COLUMNNAME" NVARCHAR2(255), 
	"DESCRIPTION" NVARCHAR2(80), 
	"SEARCHFIELDTYPE" NUMBER(10,0), 
	"CODETYPE_ID" NUMBER(10,0), 
	"MINVALUE" NUMBER(10,0), 
	"MAXVALUE" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table DATADICTIONARYPRODUCTS
--------------------------------------------------------

  CREATE TABLE "DATADICTIONARYPRODUCTS" 
   (	"PRODUCT_ID" NUMBER(10,0), 
	"PRODUCTNAME" NVARCHAR2(255), 
	"ENABLED" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table DATADICTIONARYVIEWS
--------------------------------------------------------

  CREATE TABLE "DATADICTIONARYVIEWS" 
   (	"PRODUCT_ID" NUMBER(10,0), 
	"SEARCHTYPE" NUMBER(10,0), 
	"VIEWNAME" NVARCHAR2(255), 
	"DESCRIPTION" NVARCHAR2(255), 
	"ENABLED" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table DEVICEADINFO
--------------------------------------------------------

  CREATE TABLE "DEVICEADINFO" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CONTAINERDN" NVARCHAR2(255), 
	"USERDN" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table DEVICEAGENTCONFIG
--------------------------------------------------------

  CREATE TABLE "DEVICEAGENTCONFIG" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"CLIENTREL" NVARCHAR2(50), 
	"LOCKDOWN" NVARCHAR2(1), 
	"MAJORVER" NUMBER(*,0), 
	"MINORVER" NUMBER(*,0), 
	"REVISION" NUMBER(*,0), 
	"BUILDNUM" NUMBER(*,0), 
	"BUILDDATE" DATE, 
	"INSTDIR" NVARCHAR2(128), 
	"PATCHDATE" DATE, 
	"PATCHINF" NVARCHAR2(128), 
	"UNIQUE_ID" NVARCHAR2(128), 
	"INSTDATE" DATE, 
	"HPCA_ID" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table DEVICECONFIG
--------------------------------------------------------

  CREATE TABLE "DEVICECONFIG" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"DEVICENAME" NVARCHAR2(128), 
	"ORGANIZATION" NVARCHAR2(128), 
	"PERSON" NVARCHAR2(128), 
	"OS" NVARCHAR2(128), 
	"OS_LEVEL" NVARCHAR2(128), 
	"CPU" NVARCHAR2(128), 
	"CPU_SPEED" NVARCHAR2(128), 
	"BIOS" NVARCHAR2(128), 
	"KEYBOARD" NVARCHAR2(128), 
	"MOUSE" NVARCHAR2(128), 
	"VIDEO" NVARCHAR2(128), 
	"MEMORY" NUMBER(*,0), 
	"LANGUAGE" NVARCHAR2(128), 
	"IPADDR" NVARCHAR2(128), 
	"SUBNETMASK" NVARCHAR2(128), 
	"SUBNETADDR" NVARCHAR2(128), 
	"MACADDR" NVARCHAR2(128), 
	"N_PARALLEL" NUMBER(*,0), 
	"N_SERIAL" NUMBER(*,0), 
	"N_PRINTER" NUMBER(*,0), 
	"SYSDRV" NVARCHAR2(32), 
	"SYSDRV_TOTAL" NUMBER(*,0), 
	"SYSDRV_FREE" NUMBER(*,0), 
	"CLIENTREL" NVARCHAR2(128), 
	"TPMCHIP" NVARCHAR2(1), 
	"LASTUSER" NVARCHAR2(128), 
	"OSACTIVSTATUS" VARCHAR2(20)
   )
--------------------------------------------------------
--  DDL for Table DEVICEERRORS
--------------------------------------------------------

  CREATE TABLE "DEVICEERRORS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"TYPE" NVARCHAR2(32), 
	"CODE" NUMBER(*,0), 
	"MODULE" NVARCHAR2(128), 
	"COMPONENT" NVARCHAR2(128), 
	"OBJECT" NVARCHAR2(128), 
	"REASON" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table DEVICEMAP
--------------------------------------------------------

  CREATE TABLE "DEVICEMAP" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"TYPE" NVARCHAR2(50), 
	"VAL" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table DEVICENOTIFY
--------------------------------------------------------

  CREATE TABLE "DEVICENOTIFY" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"NFY_TYPE" NVARCHAR2(32), 
	"NFY_STATUS" NVARCHAR2(32), 
	"NFY_REASON" NVARCHAR2(255), 
	"NFY_USERID" NVARCHAR2(32), 
	"NFY_ADDR" NVARCHAR2(128), 
	"NFY_PORT" NVARCHAR2(128), 
	"NFY_CMD" NVARCHAR2(255), 
	"NFY_ATTEMPTS" NUMBER(*,0), 
	"NFY_MAXRETRY" NUMBER(*,0), 
	"NFY_DELAY" NUMBER(*,0), 
	"NFY_TIMEOUT" NUMBER(*,0), 
	"NFY_RETRY2" NUMBER(*,0), 
	"NFY_TIMEOUT2" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table DEVICESERVICES
--------------------------------------------------------

  CREATE TABLE "DEVICESERVICES" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"SERVICE_ID" NVARCHAR2(32), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"REASON" NVARCHAR2(255), 
	"VER_ERROR" NVARCHAR2(128), 
	"SVC_ACTV" NVARCHAR2(32), 
	"SVC_VERS" NVARCHAR2(32), 
	"RSRC_TOTAL" NUMBER(*,0), 
	"RSRC_TOTAL_SIZE" NUMBER(*,0), 
	"RSRC_ACTIVE" NUMBER(*,0), 
	"RSRC_ACTIVE_SIZE" NUMBER(*,0), 
	"RSRC_INACTIVE" NUMBER(*,0), 
	"RSRC_INACTIVE_SIZE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table DEVICESTATE
--------------------------------------------------------

  CREATE TABLE "DEVICESTATE" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"REASON" NVARCHAR2(255), 
	"STATE" NUMBER(*,0), 
	"SVC_COUNT" NUMBER(*,0), 
	"RSRC_COUNT" NUMBER(*,0), 
	"RSRC_ACTIVE" NUMBER(*,0), 
	"RSRC_ACTIVE_SIZE" NUMBER(*,0), 
	"RSRC_INACTIVE" NUMBER(*,0), 
	"RSRC_INACTIVE_SIZE" NUMBER(*,0), 
	"RSRC_ERROR" NUMBER(*,0), 
	"VER_ERROR" NVARCHAR2(8)
   )
--------------------------------------------------------
--  DDL for Table DEVICESTATUS
--------------------------------------------------------

  CREATE TABLE "DEVICESTATUS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"DURATION" NUMBER(*,0), 
	"MRC" NUMBER(*,0), 
	"REASON" NVARCHAR2(255), 
	"SVC_COUNT" NUMBER(*,0), 
	"RSRC_COUNT" NUMBER(*,0), 
	"OBJ_RX" NUMBER(*,0), 
	"OBJ_TX" NUMBER(*,0), 
	"RSRC_TRANSFER" NUMBER(*,0), 
	"RSRC_TRANSFER_SIZE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table DEVICESYNOPSIS
--------------------------------------------------------

  CREATE TABLE "DEVICESYNOPSIS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"DURATION" NUMBER(*,0), 
	"ADDDONE" NUMBER(*,0), 
	"ADDFAIL" NUMBER(*,0), 
	"ADDNUM" NUMBER(*,0), 
	"ADDSKIP" NUMBER(*,0), 
	"CMDLINE" NVARCHAR2(255), 
	"CREFRESH" NVARCHAR2(1), 
	"CURRAPP" NUMBER(*,0), 
	"CURRINS" NUMBER(*,0), 
	"DELDONE" NUMBER(*,0), 
	"DELFAIL" NUMBER(*,0), 
	"DELNUM" NUMBER(*,0), 
	"DELSKIP" NUMBER(*,0), 
	"DNAME" NVARCHAR2(50), 
	"ENDTIME" DATE, 
	"ERRORMSG" NVARCHAR2(255), 
	"EXITCODE" NUMBER(*,0), 
	"JOBID" NVARCHAR2(64), 
	"CJOBID" NVARCHAR2(64), 
	"MACHNAME" NVARCHAR2(50), 
	"MNAME" NVARCHAR2(50), 
	"PRIORAPP" NUMBER(*,0), 
	"PRIORERR" NUMBER(*,0), 
	"PRIORINS" NUMBER(*,0), 
	"REPDONE" NUMBER(*,0), 
	"REPFAIL" NUMBER(*,0), 
	"REPNUM" NUMBER(*,0), 
	"REPSKIP" NUMBER(*,0), 
	"STARTDIR" NVARCHAR2(255), 
	"STARTIME" DATE, 
	"UPDDONE" NUMBER(*,0), 
	"UPDFAIL" NUMBER(*,0), 
	"UPDNUM" NUMBER(*,0), 
	"UPDSKIP" NUMBER(*,0), 
	"USEREXEC" NVARCHAR2(50), 
	"VERDONE" NUMBER(*,0), 
	"VERFAIL" NUMBER(*,0), 
	"VERNUM" NUMBER(*,0), 
	"VERSKIP" NUMBER(*,0), 
	"ZCONTEXT" NVARCHAR2(1), 
	"ZUSERID" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table DEVICEUSERGROUP
--------------------------------------------------------

  CREATE TABLE "DEVICEUSERGROUP" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"USER_ID" NVARCHAR2(50), 
	"DOMAIN_ID" NVARCHAR2(32), 
	"GROUP_ID" NVARCHAR2(32), 
	"CTIME" DATE, 
	"MTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table DEVICEZRSTATE
--------------------------------------------------------

  CREATE TABLE "DEVICEZRSTATE" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"BEHAB" NUMBER(*,0), 
	"BEHAI" NUMBER(*,0), 
	"BUILDATE" DATE, 
	"CONFLICT" NVARCHAR2(5), 
	"DATADIR" NVARCHAR2(100), 
	"DESKI" NUMBER(*,0), 
	"FILACT" NUMBER(*,0), 
	"FILEB" NUMBER(*,0), 
	"FILEI" NUMBER(*,0), 
	"FILINACT" NUMBER(*,0), 
	"FILTOTAL" NUMBER(*,0), 
	"INERROR" NUMBER(*,0), 
	"MSIB" NUMBER(*,0), 
	"MSIFI" NUMBER(*,0), 
	"MSII" NUMBER(*,0), 
	"PATHI" NUMBER(*,0), 
	"RADSTATE" NUMBER(*,0), 
	"REGIB" NUMBER(*,0), 
	"REGII" NUMBER(*,0), 
	"SEVERE1" NUMBER(*,0), 
	"SEVERE2" NUMBER(*,0), 
	"SPCACTVE" NUMBER(*,0), 
	"SPCINACT" NUMBER(*,0), 
	"SPCTOTAL" NUMBER(*,0), 
	"STATELVL" NVARCHAR2(10), 
	"SVCINERR" NUMBER(*,0), 
	"SVCTOTAL" NUMBER(*,0), 
	"WARNING1" NUMBER(*,0), 
	"WARNING2" NUMBER(*,0), 
	"WBEMI" NUMBER(*,0), 
	"ZLUNAME" NVARCHAR2(15), 
	"ZOBJDATE" DATE, 
	"ZOBJNAME" NVARCHAR2(50), 
	"ZOBJTIME" DATE, 
	"ZUSERID" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table DEVICEZRSTATES
--------------------------------------------------------

  CREATE TABLE "DEVICEZRSTATES" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"BEHAB" NUMBER(*,0), 
	"BEHAI" NUMBER(*,0), 
	"BUILDATE" DATE, 
	"CONTEXT" NUMBER(*,0), 
	"CONTEXTM" NUMBER(*,0), 
	"CONTEXTU" NUMBER(*,0), 
	"DESKI" NUMBER(*,0), 
	"DOMAIN" NVARCHAR2(32), 
	"FILACT" NUMBER(*,0), 
	"FILEB" NUMBER(*,0), 
	"FILEI" NUMBER(*,0), 
	"FILINACT" NUMBER(*,0), 
	"FILTOTAL" NUMBER(*,0), 
	"INERROR" NUMBER(*,0), 
	"MSIB" NUMBER(*,0), 
	"MSIFI" NUMBER(*,0), 
	"MSII" NUMBER(*,0), 
	"PATHI" NUMBER(*,0), 
	"REGIB" NUMBER(*,0), 
	"REGII" NUMBER(*,0), 
	"SPCACTVE" NUMBER(*,0), 
	"SPCINACT" NUMBER(*,0), 
	"SPCTOTAL" NUMBER(*,0), 
	"USERNAME" NVARCHAR2(50), 
	"WBEMI" NUMBER(*,0), 
	"ZAVIS" NVARCHAR2(4), 
	"ZCREATE" NVARCHAR2(255), 
	"ZDELETE" NVARCHAR2(255), 
	"ZINIT" NVARCHAR2(150), 
	"ZOBJC001" NVARCHAR2(100), 
	"ZOBJC002" NVARCHAR2(100), 
	"ZOBJC003" NVARCHAR2(100), 
	"ZOBJCNUM" NVARCHAR2(100), 
	"ZOBJDATE" DATE, 
	"ZOBJID" NVARCHAR2(30), 
	"ZOBJNAME" NVARCHAR2(50), 
	"ZOBJTIME" DATE, 
	"ZREASON" NVARCHAR2(30), 
	"ZSVCCSTA" NVARCHAR2(3), 
	"ZSVCMODE" NVARCHAR2(2), 
	"ZSYSACCT" NVARCHAR2(50), 
	"ZUPDATE" NVARCHAR2(255), 
	"ZUSERID" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table DEVICE_CUSTOM_INV
--------------------------------------------------------

  CREATE TABLE "DEVICE_CUSTOM_INV" 
   (	"SRL_NO" VARCHAR2(255), 
	"AMC_END" DATE, 
	"AMC_STRT" DATE, 
	"INST_MON" DATE, 
	"R_CRE_DATE" DATE, 
	"R_CRE_USER" VARCHAR2(255), 
	"R_MOD_DATE" DATE, 
	"R_MOD_USER" VARCHAR2(255), 
	"WRRNTY_END" DATE, 
	"WRRNTY_STRT" DATE
   )
--------------------------------------------------------
--  DDL for Table DMASTATS
--------------------------------------------------------

  CREATE TABLE "DMASTATS" 
   (	"DEVICE_ID" NVARCHAR2(255), 
	"DMABATCH_RC" NVARCHAR2(3), 
	"DMABATCH_STATUS" NVARCHAR2(255), 
	"DMABATCH_ARGUMENTS" NVARCHAR2(80), 
	"REPORT_ID" NVARCHAR2(1), 
	"DMA_VERSION" NVARCHAR2(10), 
	"SOURCE_MANAGER_NAME" NVARCHAR2(32), 
	"SOURCE_MANAGER_ID" NVARCHAR2(3), 
	"DESTINATION_MANAGER_NAME" NVARCHAR2(32), 
	"DESTINATION_MANAGER_ID" NVARCHAR2(3), 
	"DMA_SCOPE" NVARCHAR2(10), 
	"DOMAINS_LIST" NVARCHAR2(255), 
	"TREE_ROOT_PATH" NVARCHAR2(50), 
	"DIFFERENCING_METHOD" NVARCHAR2(10), 
	"CRC_DIFFERENCING_LEVEL" NVARCHAR2(1), 
	"DURATION" NUMBER(*,0), 
	"START_TIME" DATE, 
	"END_TIME" DATE, 
	"TRACE_LEVEL" NVARCHAR2(2), 
	"PRE_SYNC_VERIFY_DB" NVARCHAR2(3), 
	"PRE_SYNC_FIX_DB" NVARCHAR2(3), 
	"POST_SYNC_VERIFY_DB" NVARCHAR2(3), 
	"STRICT_VALIDATION" NVARCHAR2(3), 
	"STAGING_SKIP_MISSING_RSC" NVARCHAR2(3), 
	"BATCH_LOCK_TIMEOUT_ACTION" NVARCHAR2(10), 
	"RESET_SESSION_FAILURE" NVARCHAR2(10), 
	"BATCH_LOCK_EXPOSURE_ACTION" NVARCHAR2(10), 
	"TREE_USE_BASE_INHERITANCE" NVARCHAR2(3), 
	"TREE_INCLUDE_METHODS_INSTANCES" NVARCHAR2(3), 
	"TREE_PROCESS_MATCHING_DIALOGS" NVARCHAR2(3), 
	"TREE_ALLOW_NONCOMPONENTS_DELET" NVARCHAR2(3)
   )
--------------------------------------------------------
--  DDL for Table DOWNLOAD
--------------------------------------------------------

  CREATE TABLE "DOWNLOAD" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"USER_ID" NVARCHAR2(50), 
	"SERVICE_ID" NVARCHAR2(50), 
	"CURRENTTIME" NVARCHAR2(50), 
	"STARTTIME" NVARCHAR2(50), 
	"ENDTIME" NVARCHAR2(50), 
	"PERCENTAGE" NVARCHAR2(50), 
	"STATUS" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table EXCLUDEIPSINFO
--------------------------------------------------------

  CREATE TABLE "EXCLUDEIPSINFO" 
   (	"CTIME" DATE, 
	"SBNT_CI_JOBID" NVARCHAR2(100), 
	"EXCLUDED_IP" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table FILEAUDIT
--------------------------------------------------------

  CREATE TABLE "FILEAUDIT" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"NAME" NVARCHAR2(255), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"STATUS" NVARCHAR2(50), 
	"PRODUCT" NVARCHAR2(100), 
	"VENDOR" NVARCHAR2(100), 
	"VERSION" NVARCHAR2(50), 
	"PRODVERS" NVARCHAR2(50), 
	"FILE_TYPE" NVARCHAR2(10), 
	"FILE_FORMAT" NVARCHAR2(10), 
	"FILE_DATE" DATE, 
	"FILE_SIZE" NUMBER(*,0), 
	"FILE_MD5" NVARCHAR2(32), 
	"SCANFOR" NVARCHAR2(255), 
	"FQSVCID" NVARCHAR2(255), 
	"PATH" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table HAPPEVENT
--------------------------------------------------------

  CREATE TABLE "HAPPEVENT" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"SERVICE_ID" NVARCHAR2(50), 
	"PRODUCT" NVARCHAR2(10), 
	"APP_NAME" NVARCHAR2(80), 
	"CATGROUP" NVARCHAR2(128), 
	"ERRORNUM" NVARCHAR2(10), 
	"EVENT" NVARCHAR2(20), 
	"STATUS" NVARCHAR2(255), 
	"DEL_TIME" NVARCHAR2(30), 
	"VER_TIME" NVARCHAR2(30), 
	"INST_TIME" NVARCHAR2(30), 
	"FIX_TIME" NVARCHAR2(30), 
	"DOWNL_TIME" NVARCHAR2(30), 
	"NVD_DOMAIN" NVARCHAR2(15), 
	"NVD_CLASS" NVARCHAR2(15), 
	"JOBID" NVARCHAR2(64), 
	"CJOBID" NVARCHAR2(64)
   )
--------------------------------------------------------
--  DDL for Table HAPPMSIEVENT
--------------------------------------------------------

  CREATE TABLE "HAPPMSIEVENT" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"SERVICE_ID" NVARCHAR2(50), 
	"APP_NAME" NVARCHAR2(80), 
	"ERRORNUM" NVARCHAR2(10), 
	"EVENT" NVARCHAR2(20), 
	"STATUS" NVARCHAR2(255), 
	"DEL_TIME" NVARCHAR2(30), 
	"VER_TIME" NVARCHAR2(30), 
	"INST_TIME" NVARCHAR2(30), 
	"FIX_TIME" NVARCHAR2(30), 
	"NVD_DOMAIN" NVARCHAR2(15), 
	"NVD_CLASS" NVARCHAR2(15), 
	"JOB_ID" NVARCHAR2(20), 
	"PROD_GUID" NVARCHAR2(75)
   )
--------------------------------------------------------
--  DDL for Table HAPPRNPEVENT
--------------------------------------------------------

  CREATE TABLE "HAPPRNPEVENT" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"CJOBID" NVARCHAR2(50), 
	"CMDMSG" NVARCHAR2(255), 
	"CMDRC" NUMBER(*,0), 
	"EVENT" NVARCHAR2(50), 
	"INSTDATE" NVARCHAR2(30), 
	"JOBID" NVARCHAR2(50), 
	"MODULE" NVARCHAR2(255), 
	"POSTMSG" NVARCHAR2(255), 
	"POSTRC" NUMBER(*,0), 
	"ZOBJCLAS" NVARCHAR2(25), 
	"ZOBJDATE" NVARCHAR2(25), 
	"ZOBJDOMN" NVARCHAR2(25), 
	"ZOBJID" NVARCHAR2(50), 
	"ZOBJNAME" NVARCHAR2(50), 
	"ZOBJTIME" NVARCHAR2(20), 
	"ZSVCNAME" NVARCHAR2(255), 
	"ZUSERID" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table HCOBSTATS
--------------------------------------------------------

  CREATE TABLE "HCOBSTATS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"SYNCSTATUS" NVARCHAR2(50), 
	"SERVERTYPE" NVARCHAR2(10), 
	"SERVERHOST" NVARCHAR2(100), 
	"SERVERPORT" NUMBER(*,0), 
	"SERVERSTARTTIME" DATE, 
	"SERVERENDTIME" DATE, 
	"MTIME" DATE, 
	"MYSQLSTARTTIME" DATE, 
	"OPENLDAPSTARTTIME" DATE, 
	"CSDBSTARTTIME" DATE, 
	"JOBSSTARTTIME" DATE, 
	"MYSQLENDTIME" DATE, 
	"OPENLDAPENDTIME" DATE, 
	"CSDBENDTIME" DATE, 
	"JOBSENDTIME" DATE, 
	"MYSQLSTATUS" NVARCHAR2(50), 
	"OPENLDAPSTATUS" NVARCHAR2(50), 
	"CSDBSTATUS" NVARCHAR2(50), 
	"JOBSSTATUS" NVARCHAR2(50), 
	"MYSQLSIZE" NUMBER(*,0), 
	"OPENLDAPSIZE" NUMBER(*,0), 
	"CSDBSIZE" NUMBER(*,0), 
	"JOBSSIZE" NUMBER(*,0), 
	"MYSQLSTATUSMESSAGE" NVARCHAR2(100), 
	"OPENLDAPSTATUSMESSAGE" NVARCHAR2(100), 
	"CSDBSTATUSMESSAGE" NVARCHAR2(100), 
	"JOBSSTATUSMESSAGE" NVARCHAR2(100)
   )
--------------------------------------------------------
--  DDL for Table HDEVICECONFIG
--------------------------------------------------------

  CREATE TABLE "HDEVICECONFIG" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"DEVICENAME" NVARCHAR2(128), 
	"ORGANIZATION" NVARCHAR2(128), 
	"PERSON" NVARCHAR2(128), 
	"OS" NVARCHAR2(128), 
	"OS_LEVEL" NVARCHAR2(128), 
	"CPU" NVARCHAR2(128), 
	"CPU_SPEED" NVARCHAR2(128), 
	"BIOS" NVARCHAR2(128), 
	"KEYBOARD" NVARCHAR2(128), 
	"MOUSE" NVARCHAR2(128), 
	"VIDEO" NVARCHAR2(128), 
	"MEMORY" NUMBER(*,0), 
	"LANGUAGE" NVARCHAR2(128), 
	"IPADDR" NVARCHAR2(128), 
	"SUBNETMASK" NVARCHAR2(128), 
	"SUBNETADDR" NVARCHAR2(128), 
	"MACADDR" NVARCHAR2(128), 
	"N_PARALLEL" NUMBER(*,0), 
	"N_SERIAL" NUMBER(*,0), 
	"N_PRINTER" NUMBER(*,0), 
	"SYSDRV" NVARCHAR2(32), 
	"SYSDRV_TOTAL" NUMBER(*,0), 
	"SYSDRV_FREE" NUMBER(*,0), 
	"CLIENTREL" NVARCHAR2(128), 
	"TPMCHIP" NVARCHAR2(1), 
	"LASTUSER" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table HDEVICEERRORS
--------------------------------------------------------

  CREATE TABLE "HDEVICEERRORS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"TYPE" NVARCHAR2(32), 
	"CODE" NUMBER(*,0), 
	"MODULE" NVARCHAR2(128), 
	"COMPONENT" NVARCHAR2(128), 
	"OBJECT" NVARCHAR2(128), 
	"REASON" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table HDEVICESTATE
--------------------------------------------------------

  CREATE TABLE "HDEVICESTATE" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"REASON" NVARCHAR2(255), 
	"STATE" NUMBER(*,0), 
	"SVC_COUNT" NUMBER(*,0), 
	"RSRC_COUNT" NUMBER(*,0), 
	"RSRC_ACTIVE" NUMBER(*,0), 
	"RSRC_ACTIVE_SIZE" NUMBER(*,0), 
	"RSRC_INACTIVE" NUMBER(*,0), 
	"RSRC_INACTIVE_SIZE" NUMBER(*,0), 
	"RSRC_ERROR" NUMBER(*,0), 
	"VER_ERROR" NVARCHAR2(8)
   )
--------------------------------------------------------
--  DDL for Table HDEVICESTATUS
--------------------------------------------------------

  CREATE TABLE "HDEVICESTATUS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"DURATION" NUMBER(*,0), 
	"MRC" NUMBER(*,0), 
	"REASON" NVARCHAR2(255), 
	"SVC_COUNT" NUMBER(*,0), 
	"RSRC_COUNT" NUMBER(*,0), 
	"OBJ_RX" NUMBER(*,0), 
	"OBJ_TX" NUMBER(*,0), 
	"RSRC_TRANSFER" NUMBER(*,0), 
	"RSRC_TRANSFER_SIZE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table HDMASTATS
--------------------------------------------------------

  CREATE TABLE "HDMASTATS" 
   (	"DEVICE_ID" NVARCHAR2(255), 
	"DMABATCH_RC" NVARCHAR2(3), 
	"DMABATCH_STATUS" NVARCHAR2(255), 
	"DMABATCH_ARGUMENTS" NVARCHAR2(80), 
	"REPORT_ID" NVARCHAR2(1), 
	"DMA_VERSION" NVARCHAR2(10), 
	"SOURCE_MANAGER_NAME" NVARCHAR2(32), 
	"SOURCE_MANAGER_ID" NVARCHAR2(3), 
	"DESTINATION_MANAGER_NAME" NVARCHAR2(32), 
	"DESTINATION_MANAGER_ID" NVARCHAR2(3), 
	"DMA_SCOPE" NVARCHAR2(10), 
	"DOMAINS_LIST" NVARCHAR2(255), 
	"TREE_ROOT_PATH" NVARCHAR2(50), 
	"DIFFERENCING_METHOD" NVARCHAR2(10), 
	"CRC_DIFFERENCING_LEVEL" NVARCHAR2(1), 
	"DURATION" NUMBER(*,0), 
	"START_TIME" DATE, 
	"END_TIME" DATE, 
	"TRACE_LEVEL" NVARCHAR2(2), 
	"PRE_SYNC_VERIFY_DB" NVARCHAR2(3), 
	"PRE_SYNC_FIX_DB" NVARCHAR2(3), 
	"POST_SYNC_VERIFY_DB" NVARCHAR2(3), 
	"STRICT_VALIDATION" NVARCHAR2(3), 
	"STAGING_SKIP_MISSING_RSC" NVARCHAR2(3), 
	"BATCH_LOCK_TIMEOUT_ACTION" NVARCHAR2(10), 
	"RESET_SESSION_FAILURE" NVARCHAR2(10), 
	"BATCH_LOCK_EXPOSURE_ACTION" NVARCHAR2(10), 
	"TREE_USE_BASE_INHERITANCE" NVARCHAR2(3), 
	"TREE_INCLUDE_METHODS_INSTANCES" NVARCHAR2(3), 
	"TREE_PROCESS_MATCHING_DIALOGS" NVARCHAR2(3), 
	"TREE_ALLOW_NONCOMPONENTS_DELET" NVARCHAR2(3)
   )
--------------------------------------------------------
--  DDL for Table HJOBSTAT
--------------------------------------------------------

  CREATE TABLE "HJOBSTAT" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"JOB_ID" NVARCHAR2(50), 
	"AUTHOR" NVARCHAR2(100), 
	"AGTVER" NVARCHAR2(50), 
	"AGTBUILD" NVARCHAR2(50), 
	"AGTDATE" NVARCHAR2(30), 
	"CREDT" NVARCHAR2(50), 
	"DOCVER" NVARCHAR2(50), 
	"DURATION" NUMBER(*,0), 
	"ENDDT" NVARCHAR2(50), 
	"ZID" NVARCHAR2(50), 
	"ZINST" NVARCHAR2(50), 
	"LANG" NVARCHAR2(25), 
	"MODDT" NVARCHAR2(50), 
	"ZMODE" NVARCHAR2(125), 
	"PCREDT" NVARCHAR2(50), 
	"PCMODDT" NVARCHAR2(50), 
	"PRODUCT" NVARCHAR2(125), 
	"PRODVER" NVARCHAR2(50), 
	"RC" NUMBER(*,0), 
	"SCEMAVER" NVARCHAR2(50), 
	"STARTDT" NVARCHAR2(50), 
	"CODE" NUMBER(*,0), 
	"STATUS" NVARCHAR2(255), 
	"RESUMED" NVARCHAR2(50), 
	"RESTARTS" NUMBER(*,0), 
	"REBOOTDT" NVARCHAR2(50), 
	"TASKCNT" NUMBER(*,0), 
	"TASKFAIL" NUMBER(*,0), 
	"TASKWARN" NUMBER(*,0), 
	"TASKGOOD" NUMBER(*,0), 
	"TASKSKIP" NUMBER(*,0), 
	"TITLE" NVARCHAR2(255), 
	"ZTYPE" NVARCHAR2(25), 
	"USEREXEC" NVARCHAR2(125), 
	"ZOBJCLAS" NVARCHAR2(25), 
	"ZOBJDOMN" NVARCHAR2(25), 
	"ZOBJNAME" NVARCHAR2(125)
   )
--------------------------------------------------------
--  DDL for Table HMOBILEDEVICEREG
--------------------------------------------------------

  CREATE TABLE "HMOBILEDEVICEREG" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"DEVICENAME" NVARCHAR2(50), 
	"DEVICEUUID" NVARCHAR2(50), 
	"EVENT" NVARCHAR2(50), 
	"EVENT_TIME" NVARCHAR2(30), 
	"MTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table HMOBILEWORKFLOWSTATES
--------------------------------------------------------

  CREATE TABLE "HMOBILEWORKFLOWSTATES" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"DEVICEUUID" NVARCHAR2(128), 
	"USERID" NVARCHAR2(128), 
	"ZSERVICE" NVARCHAR2(128), 
	"REASON" NVARCHAR2(128), 
	"ACTION1" NVARCHAR2(128), 
	"ACTION2" NVARCHAR2(128), 
	"ACTION3" NVARCHAR2(128), 
	"ACTION4" NVARCHAR2(128), 
	"CURRENTACTION" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table HO365C2R_SUMMARY
--------------------------------------------------------

  CREATE TABLE "HO365C2R_SUMMARY" 
   (	"HOSTNAME" NVARCHAR2(50), 
	"EVENTTIME" DATE, 
	"APPVCLIV" NVARCHAR2(50), 
	"PKGNAME" NVARCHAR2(250), 
	"PKGVER" NVARCHAR2(250), 
	"PKGSRC" NVARCHAR2(250), 
	"PKGCACHE" NVARCHAR2(50), 
	"PKGID" NVARCHAR2(250), 
	"PKGVID" NVARCHAR2(250), 
	"MANAGEDSVC" NVARCHAR2(250), 
	"EVENTTYPE" NVARCHAR2(50), 
	"STATUS" NVARCHAR2(250), 
	"PKGSIZE" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table HPCA_DEVGRP
--------------------------------------------------------

  CREATE TABLE "HPCA_DEVGRP" 
   (	"GROUPID" NUMBER(*,0), 
	"MTIME" DATE, 
	"NAME" NVARCHAR2(32), 
	"GROUPTYPE" NVARCHAR2(32), 
	"DESCRIPTION" NVARCHAR2(255), 
	"RRSFILTER" VARCHAR2(2000)
   )
--------------------------------------------------------
--  DDL for Table HPCA_DEVGRPDETAILS
--------------------------------------------------------

  CREATE TABLE "HPCA_DEVGRPDETAILS" 
   (	"GROUPID" NUMBER(*,0), 
	"DEVICE_ID" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table HPCA_SCHEMA
--------------------------------------------------------

  CREATE TABLE "HPCA_SCHEMA" 
   (	"NAME" NVARCHAR2(32), 
	"VERSION" NVARCHAR2(32), 
	"MTIME" DATE, 
	"DESCRIPTION" NVARCHAR2(255), 
	"RELEASED" DATE
   )
--------------------------------------------------------
--  DDL for Table HPPA_SCANHISTORY
--------------------------------------------------------

  CREATE TABLE "HPPA_SCANHISTORY" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"SCANDATE" DATE, 
	"SYSTEMSTATE" NUMBER(*,0), 
	"POWERPLAN" NVARCHAR2(255), 
	"TOTALPOWERKWH" FLOAT(126), 
	"DURATION" FLOAT(126)
   )
--------------------------------------------------------
--  DDL for Table HSAPSTATS
--------------------------------------------------------

  CREATE TABLE "HSAPSTATS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"LASTACCESSED" DATE, 
	"STATUS" NVARCHAR2(3), 
	"RESOLVED_LOCATION" NVARCHAR2(32), 
	"ACTUAL_LOCATION" NVARCHAR2(32), 
	"BALANCER" NVARCHAR2(32), 
	"SVRPOOL" NVARCHAR2(32), 
	"SERVER" NVARCHAR2(32), 
	"SAP" NVARCHAR2(32), 
	"TYPE" NVARCHAR2(4), 
	"PRIORITY" NUMBER(*,0), 
	"ENABLED" NVARCHAR2(1), 
	"ROLE" NVARCHAR2(12), 
	"HOSTNAME" NVARCHAR2(100), 
	"NAME" NVARCHAR2(255), 
	"URI" NVARCHAR2(255), 
	"BANDWIDTH" NVARCHAR2(2), 
	"SPEED" NUMBER(*,0), 
	"THROTTLETYPE" NVARCHAR2(8), 
	"ERRORCOUNT" NUMBER(*,0), 
	"BYTESSENT" NUMBER(*,0), 
	"BYTESRECEIVED" NUMBER(*,0), 
	"FILESMISSED" NUMBER(*,0), 
	"FILESSENT" NUMBER(*,0), 
	"FILESRECEIVED" NUMBER(*,0), 
	"OBJECTSSENT" NUMBER(*,0), 
	"OBJECTSRECEIVED" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table HSARPTL_SUMMARY
--------------------------------------------------------

  CREATE TABLE "HSARPTL_SUMMARY" 
   (	"LEADERNAME" NVARCHAR2(50), 
	"CLIENTSERVEDCNT" NVARCHAR2(50), 
	"DATADOWNLOADED" NVARCHAR2(50), 
	"DATASERVED" NVARCHAR2(50), 
	"CACHESIZE" NVARCHAR2(50), 
	"FILESERVEDCNT" NVARCHAR2(50), 
	"DURATION" NVARCHAR2(50), 
	"UPSSERVER" NVARCHAR2(500), 
	"LASTCONNECT" DATE
   )
--------------------------------------------------------
--  DDL for Table JOBPARM
--------------------------------------------------------

  CREATE TABLE "JOBPARM" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"APRIORI" NVARCHAR2(255), 
	"NAME" NVARCHAR2(125), 
	"PID" NVARCHAR2(50), 
	"PHASEID" NUMBER(*,0), 
	"PHASESEQ" NUMBER(*,0), 
	"CMDID" NUMBER(*,0), 
	"CMDSEQ" NUMBER(*,0), 
	"SOURCE" NVARCHAR2(255), 
	"TITLE" NVARCHAR2(255), 
	"ZVALUE" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table JOBSTAT
--------------------------------------------------------

  CREATE TABLE "JOBSTAT" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"JOB_ID" NVARCHAR2(50), 
	"AUTHOR" NVARCHAR2(100), 
	"AGTVER" NVARCHAR2(50), 
	"AGTBUILD" NVARCHAR2(50), 
	"AGTDATE" NVARCHAR2(30), 
	"CREDT" NVARCHAR2(50), 
	"DOCVER" NVARCHAR2(50), 
	"DURATION" NUMBER(*,0), 
	"ENDDT" NVARCHAR2(50), 
	"ZID" NVARCHAR2(50), 
	"ZINST" NVARCHAR2(50), 
	"LANG" NVARCHAR2(25), 
	"MODDT" NVARCHAR2(50), 
	"ZMODE" NVARCHAR2(125), 
	"PCREDT" NVARCHAR2(50), 
	"PCMODDT" NVARCHAR2(50), 
	"PRODUCT" NVARCHAR2(125), 
	"PRODVER" NVARCHAR2(50), 
	"RC" NUMBER(*,0), 
	"SCEMAVER" NVARCHAR2(50), 
	"STARTDT" NVARCHAR2(50), 
	"CODE" NUMBER(*,0), 
	"STATUS" NVARCHAR2(255), 
	"RESUMED" NVARCHAR2(50), 
	"RESTARTS" NUMBER(*,0), 
	"REBOOTDT" NVARCHAR2(30), 
	"TASKCNT" NUMBER(*,0), 
	"TASKFAIL" NUMBER(*,0), 
	"TASKWARN" NUMBER(*,0), 
	"TASKGOOD" NUMBER(*,0), 
	"TASKSKIP" NUMBER(*,0), 
	"TITLE" NVARCHAR2(255), 
	"ZTYPE" NVARCHAR2(25), 
	"USEREXEC" NVARCHAR2(125), 
	"ZOBJCLAS" NVARCHAR2(25), 
	"ZOBJDOMN" NVARCHAR2(25), 
	"ZOBJNAME" NVARCHAR2(125)
   )
--------------------------------------------------------
--  DDL for Table JOBTASK
--------------------------------------------------------

  CREATE TABLE "JOBTASK" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"ENDDT" NVARCHAR2(30), 
	"CODE" NUMBER(*,0), 
	"ERRMSG" NVARCHAR2(255), 
	"PHASEID" NUMBER(*,0), 
	"PHASESEQ" NUMBER(*,0), 
	"CMDID" NUMBER(*,0), 
	"CMDSEQ" NUMBER(*,0), 
	"CMDTYPE" NVARCHAR2(100), 
	"NAME" NVARCHAR2(125), 
	"ZOUTPUT" NVARCHAR2(125), 
	"PHASE" NVARCHAR2(100), 
	"PID" NVARCHAR2(30), 
	"RC" NUMBER(*,0), 
	"STARTDT" NVARCHAR2(30)
   )
--------------------------------------------------------
--  DDL for Table LC_ACQUISITION
--------------------------------------------------------

  CREATE TABLE "LC_ACQUISITION" 
   (	"ACQ_KEY" NUMBER(10,0), 
	"ACQTIME" DATE, 
	"SOURCEID" NVARCHAR2(30), 
	"STATUS" NVARCHAR2(30)
   )
--------------------------------------------------------
--  DDL for Table LC_ACQUISITIONDETAIL
--------------------------------------------------------

  CREATE TABLE "LC_ACQUISITIONDETAIL" 
   (	"ACQDETAIL_KEY" NUMBER(10,0), 
	"ACQ_KEY" NUMBER(10,0), 
	"CONTENTTYPE" NVARCHAR2(30), 
	"STATUS" NVARCHAR2(30), 
	"STATUSMSGID" NVARCHAR2(30)
   )
--------------------------------------------------------
--  DDL for Table LC_ACQUISITIONDETAILATTR
--------------------------------------------------------

  CREATE TABLE "LC_ACQUISITIONDETAILATTR" 
   (	"ACQDETAIL_KEY" NUMBER(10,0), 
	"ATTRIBUTE" NVARCHAR2(32), 
	"STRINGVALUE" NVARCHAR2(2000)
   )
--------------------------------------------------------
--  DDL for Table LOGINATTEMPTFAILED
--------------------------------------------------------

  CREATE TABLE "LOGINATTEMPTFAILED" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"USERNAME" NVARCHAR2(50), 
	"DOMAIN" NVARCHAR2(255), 
	"TIME" DATE, 
	"REASON" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table MOBILEANDROIDSECURITY
--------------------------------------------------------

  CREATE TABLE "MOBILEANDROIDSECURITY" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"ENABLED" NVARCHAR2(50), 
	"MINPWDLENGTH" NVARCHAR2(50), 
	"PASSSTRENGTH" NVARCHAR2(50), 
	"NOOFSYMBOLS" NVARCHAR2(50), 
	"NOOFNUMCHAR" NVARCHAR2(50), 
	"NOOFUPPERCHAR" NVARCHAR2(50), 
	"NOOFLOWERCHAR" NVARCHAR2(50), 
	"MINPASSHISTORY" NVARCHAR2(50), 
	"MAXPASSAGE" NVARCHAR2(50), 
	"MINFAILEDPASS" NVARCHAR2(50), 
	"RESTENABLE" NVARCHAR2(50), 
	"ENABLEWIFI" NVARCHAR2(50), 
	"ENABLEBT" NVARCHAR2(50), 
	"ENABLECAM" NVARCHAR2(50), 
	"ENABLEWIFIT" NVARCHAR2(50), 
	"ENABLEDEVENC" NVARCHAR2(50), 
	"MTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table MOBILEAUDIT
--------------------------------------------------------

  CREATE TABLE "MOBILEAUDIT" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"SERVICE_ID" NVARCHAR2(50), 
	"PRODUCT" NVARCHAR2(100), 
	"VENDOR" NVARCHAR2(100), 
	"PRODVERS" NVARCHAR2(50), 
	"STATUS" NVARCHAR2(50), 
	"MTIME" DATE, 
	"APPTYPE" NVARCHAR2(50), 
	"APPCAT" NVARCHAR2(50), 
	"APPICON" NVARCHAR2(50), 
	"APPDES" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table MOBILEBLACKLIST
--------------------------------------------------------

  CREATE TABLE "MOBILEBLACKLIST" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"PACKAGE_ID" NVARCHAR2(256), 
	"APPNAME" NVARCHAR2(256), 
	"MTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table MOBILEDEVICECONFIG
--------------------------------------------------------

  CREATE TABLE "MOBILEDEVICECONFIG" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"DEVICEUUID" NVARCHAR2(128), 
	"TMDEVICE" NVARCHAR2(128), 
	"TMSERIAL" NVARCHAR2(128), 
	"MPHONENUMBER" NVARCHAR2(128), 
	"OPERATORNAME" NVARCHAR2(128), 
	"OPERATORCODE" NVARCHAR2(128), 
	"OPERATORISO" NVARCHAR2(128), 
	"SIMCOUNTRYCODE" NVARCHAR2(128), 
	"SIMOPERATOR" NVARCHAR2(128), 
	"SIMSERIALNO" NVARCHAR2(128), 
	"NETWORKTYPE" NVARCHAR2(128), 
	"PHONETYPE" NVARCHAR2(128), 
	"TOTALINTMEMORY" NVARCHAR2(128), 
	"TOTALINTAVAILABLEMEMORY" NVARCHAR2(128), 
	"TOTALEXTMEMORY" NVARCHAR2(128), 
	"TOTALEXTAVAILABLEMEMORY" NVARCHAR2(128), 
	"OSNAME" NVARCHAR2(128), 
	"OSVERSION" NVARCHAR2(128), 
	"DEPARTMENT" NVARCHAR2(128), 
	"DEVICEOWNER" NVARCHAR2(128), 
	"DEVICETYPE" NVARCHAR2(128), 
	"OFFICELOCATION" NVARCHAR2(128), 
	"CITY" NVARCHAR2(128), 
	"ADNAME" NVARCHAR2(128), 
	"SATELLITEID" NVARCHAR2(128), 
	"SATELLITEHOST" NVARCHAR2(128), 
	"SATELLITEPORT" NVARCHAR2(10), 
	"SATELLITEMETHOD" NVARCHAR2(10), 
	"IMEI" NVARCHAR2(128), 
	"RESOLUTION" NVARCHAR2(128), 
	"WIFIMAC" NVARCHAR2(128), 
	"PROCESSORARCHITECTURE" NVARCHAR2(128), 
	"FIRMWARE" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table MOBILEDEVICEREG
--------------------------------------------------------

  CREATE TABLE "MOBILEDEVICEREG" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"DEVICENAME" NVARCHAR2(50), 
	"DEVICEUUID" NVARCHAR2(50), 
	"EVENT" NVARCHAR2(50), 
	"EVENT_TIME" NVARCHAR2(30), 
	"MTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table MOBILEIOSSECURITY
--------------------------------------------------------

  CREATE TABLE "MOBILEIOSSECURITY" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"ENABLED" NVARCHAR2(50), 
	"SIMPLEPWDVALUE" NVARCHAR2(50), 
	"ALPHANUMPWDVALUE" NVARCHAR2(50), 
	"MINPWDLENGTH" NVARCHAR2(50), 
	"NOOFCMPLXCHARPWD" NVARCHAR2(50), 
	"MAXPWDAGE" NVARCHAR2(50), 
	"TIMEBEFORELCK" NVARCHAR2(50), 
	"PWDHISTORY" NVARCHAR2(50), 
	"GRACEPERIODLCK" NVARCHAR2(50), 
	"MAXFAILEDPWDATTEMPT" NVARCHAR2(50), 
	"RESTENABLE" NVARCHAR2(50), 
	"INSTAPPENABLE" NVARCHAR2(50), 
	"INSTAPPPURCHENABLE" NVARCHAR2(50), 
	"ASSISTENABLE" NVARCHAR2(50), 
	"INSTMULTIPLYRGAMINGENABLE" NVARCHAR2(50), 
	"ADDGAMECENTFRNDENABLE" NVARCHAR2(50), 
	"ITUNESTOREENABLE" NVARCHAR2(50), 
	"SAFARIENABLE" NVARCHAR2(50), 
	"YOUTUBEENABLE" NVARCHAR2(50), 
	"SCREENSHOTENABLE" NVARCHAR2(50), 
	"ACCTMODFENABLE" NVARCHAR2(50), 
	"AIRDROPENABLE" NVARCHAR2(50), 
	"APPCELLDATAMODFENABLE" NVARCHAR2(50), 
	"ASSTUSRGENCONTENABLE" NVARCHAR2(50), 
	"CLDKEYCHNSYNCENABLE" NVARCHAR2(50), 
	"DGNOSSUBMENABLE" NVARCHAR2(50), 
	"FNDMYFRNDMODFENABLE" NVARCHAR2(50), 
	"FNGRPRNTUNLCKENABLE" NVARCHAR2(50), 
	"HOSTPAIRENABLE" NVARCHAR2(50), 
	"LCKSCRNCTRLCENTENABLE" NVARCHAR2(50), 
	"LCKSCRNNOTFVIEWENABLE" NVARCHAR2(50), 
	"LCKSCRNTODAYVIEWENABLE" NVARCHAR2(50), 
	"OPNFRMMGDTOUNMGDENABLE" NVARCHAR2(50), 
	"OPNFRMUNMGDTOMGDENABLE" NVARCHAR2(50), 
	"OTAPKIUPDENABLE" NVARCHAR2(50), 
	"PASSBKWHILLCKENABLE" NVARCHAR2(50), 
	"EXPLCTCONTENABLE" NVARCHAR2(50), 
	"VOICEDIALENABLE" NVARCHAR2(50), 
	"GAMECENTFRNDENABLE" NVARCHAR2(50), 
	"ASSTWHILLCKENABLE" NVARCHAR2(50), 
	"BKSTRENABLE" NVARCHAR2(50), 
	"BKSTREROTENABLE" NVARCHAR2(50), 
	"CAMENABLE" NVARCHAR2(50), 
	"SHARSTRMENABLE" NVARCHAR2(50), 
	"UNTRUSTTLSPROMPTENABLE" NVARCHAR2(50), 
	"VDEOCONFENABLE" NVARCHAR2(50), 
	"FRCENCRBKPENABLE" NVARCHAR2(50), 
	"GLBLBGFTCHWHNROAMENABLE" NVARCHAR2(50), 
	"FRCITUNESTRPWDENTRYENABLE" NVARCHAR2(50), 
	"UICONFIGPROFINSTENABLE" NVARCHAR2(50), 
	"FRCLMTADTRCKENABLE" NVARCHAR2(50), 
	"BKPENABLE" NVARCHAR2(50), 
	"DOCSYNCENABLE" NVARCHAR2(50), 
	"PHOTOSTRMENABLE" NVARCHAR2(50), 
	"MTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table MOBILEREG
--------------------------------------------------------

  CREATE TABLE "MOBILEREG" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"REG_ID" NVARCHAR2(350), 
	"REGCOMPLETE" NVARCHAR2(50), 
	"REGERROR" NVARCHAR2(1000), 
	"MTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table MOBILESECURITY
--------------------------------------------------------

  CREATE TABLE "MOBILESECURITY" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"ENABLED" NVARCHAR2(50), 
	"MINPWDLENGTH" NVARCHAR2(50), 
	"PWDCOMPLEXITY" NVARCHAR2(50), 
	"MAXLOCKTIME" NVARCHAR2(50), 
	"MAXATTEMPTSWIPE" NVARCHAR2(50), 
	"MTIME" DATE, 
	"RESTENABLE" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table MOBILEWINDOWSSECURITY
--------------------------------------------------------

  CREATE TABLE "MOBILEWINDOWSSECURITY" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"ENABLED" NVARCHAR2(50), 
	"SIMPLEPWDVALUE" NVARCHAR2(50), 
	"ALPHANUMPWDVALUE" NVARCHAR2(50), 
	"MINPWDLENGTH" NVARCHAR2(50), 
	"NOOFCMPLXCHARPWD" NVARCHAR2(50), 
	"MAXPWDAGE" NVARCHAR2(50), 
	"TIMEBEFORELCK" NVARCHAR2(50), 
	"PWDHISTORY" NVARCHAR2(50), 
	"MAXFAILEDPWDATTEMPT" NVARCHAR2(50), 
	"RESTENABLE" NVARCHAR2(50), 
	"DEVENCRYPT" NVARCHAR2(50), 
	"ENABLESDCARD" NVARCHAR2(50), 
	"MTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table MOBILEWORKFLOWSTATES
--------------------------------------------------------

  CREATE TABLE "MOBILEWORKFLOWSTATES" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"DEVICEUUID" NVARCHAR2(128), 
	"USERID" NVARCHAR2(128), 
	"ZSERVICE" NVARCHAR2(128), 
	"REASON" NVARCHAR2(128), 
	"ACTION1" NVARCHAR2(128), 
	"ACTION2" NVARCHAR2(128), 
	"ACTION3" NVARCHAR2(128), 
	"ACTION4" NVARCHAR2(128), 
	"CURRENTACTION" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table NETDEVICECONFIG
--------------------------------------------------------

  CREATE TABLE "NETDEVICECONFIG" 
   (	"STATUS" NVARCHAR2(50), 
	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"DEVICETYPE" NVARCHAR2(128), 
	"IPADDR" NVARCHAR2(128), 
	"OS" NVARCHAR2(128), 
	"OS_LEVEL" NVARCHAR2(128), 
	"SUBNETADDR" NVARCHAR2(128), 
	"SUBNETRANGE" NVARCHAR2(128), 
	"MACADDR" NVARCHAR2(128), 
	"SLNO" NVARCHAR2(128), 
	"DOMAIN" NVARCHAR2(128), 
	"WORKGROUP" NVARCHAR2(128), 
	"MODEL" NVARCHAR2(128), 
	"NETBIOS" NVARCHAR2(128), 
	"DCLASS" NVARCHAR2(128), 
	"MANUFACTURER" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table NETDEVICETEMPCONFIG
--------------------------------------------------------

  CREATE TABLE "NETDEVICETEMPCONFIG" 
   (	"STATUS" NVARCHAR2(50), 
	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"DEVICETYPE" NVARCHAR2(128), 
	"IPADDR" NVARCHAR2(128), 
	"OS" NVARCHAR2(128), 
	"OS_LEVEL" NVARCHAR2(128), 
	"SUBNETADDR" NVARCHAR2(128), 
	"SUBNETRANGE" NVARCHAR2(128), 
	"MACADDR" NVARCHAR2(128), 
	"SLNO" NVARCHAR2(128), 
	"DOMAIN" NVARCHAR2(128), 
	"WORKGROUP" NVARCHAR2(128), 
	"MODEL" NVARCHAR2(128), 
	"NETBIOS" NVARCHAR2(128), 
	"DCLASS" NVARCHAR2(128), 
	"MANUFACTURER" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table NVDPING
--------------------------------------------------------

  CREATE TABLE "NVDPING" 
   (	"PING" CHAR(1)
   )
--------------------------------------------------------
--  DDL for Table NVD_BULLETIN
--------------------------------------------------------

  CREATE TABLE "NVD_BULLETIN" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_NAME" NVARCHAR2(32), 
	"NVD_ID" NVARCHAR2(12), 
	"NVD_TITLE" NVARCHAR2(255), 
	"NVD_POSTED" NVARCHAR2(18), 
	"NVD_REVISED" NVARCHAR2(18), 
	"NVD_SUPPORT" NVARCHAR2(1), 
	"NVD_URL" NVARCHAR2(255), 
	"NVD_FAQURL" NVARCHAR2(255), 
	"NVD_IMPACT" NVARCHAR2(8), 
	"NVD_PREREQ" NVARCHAR2(8), 
	"NVD_MITIGATE" NVARCHAR2(8), 
	"NVD_POPULAR" NVARCHAR2(8), 
	"NVD_CTIME" NVARCHAR2(24), 
	"NVD_MTIME" NVARCHAR2(24), 
	"NVD_SOURCE" NVARCHAR2(32), 
	"NVD_TYPE" NVARCHAR2(40), 
	"NVD_PLATFORM" NVARCHAR2(32), 
	"NVD_VENDOR" NVARCHAR2(80), 
	"NVD_CVENAME" NVARCHAR2(255), 
	"NVD_ALTIDS" NVARCHAR2(255), 
	"NVD_ENABLED" NVARCHAR2(1), 
	"NVD_XMLMD5" NVARCHAR2(32), 
	"NVD_ROLLBACK" NVARCHAR2(1), 
	"NVD_REVISION" NVARCHAR2(32), 
	"NVD_RUNMODE" NVARCHAR2(48), 
	"NVD_HPPOSTED" NVARCHAR2(32), 
	"NVD_HPREVISD" NVARCHAR2(32), 
	"NVD_PSLPOSTD" NVARCHAR2(32), 
	"NVD_PSLREVSD" NVARCHAR2(32), 
	"NVD_ALLDATA" NVARCHAR2(1), 
	"NVD_RATING" NVARCHAR2(255), 
	"NVD_W10SBRS" NVARCHAR2(255), 
	"NVD_MSSOPTS" NVARCHAR2(255), 
	"NVD_BEXPINS" NVARCHAR2(30)
   )
--------------------------------------------------------
--  DDL for Table NVD_BUSTATUS
--------------------------------------------------------

  CREATE TABLE "NVD_BUSTATUS" 
   (	"NVD_ZOBJDEV" NVARCHAR2(64), 
	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJRC" FLOAT(126), 
	"NVD_ZOBJMSG" NVARCHAR2(1024), 
	"NVD_JOBID" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table NVD_CODES
--------------------------------------------------------

  CREATE TABLE "NVD_CODES" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_CODE" NVARCHAR2(32), 
	"NVD_TYPE" NVARCHAR2(12), 
	"NVD_NAME" NVARCHAR2(32), 
	"NVD_DESCRIPT" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table NVD_DEERROR
--------------------------------------------------------

  CREATE TABLE "NVD_DEERROR" 
   (	"NVD_ZOBJDEV" NVARCHAR2(64), 
	"NVD_ZOBJCLAS" NVARCHAR2(8), 
	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJRC" FLOAT(126), 
	"NVD_ZOBJMSG" NVARCHAR2(1024), 
	"NVD_ERRTIME" DATE, 
	"NVD_JOBID" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table NVD_DESTATUS
--------------------------------------------------------

  CREATE TABLE "NVD_DESTATUS" 
   (	"NVD_ZOBJDEV" NVARCHAR2(64), 
	"NVD_SCANTIME" DATE, 
	"NVD_PRODCNT" FLOAT(126), 
	"NVD_BULLCNT" FLOAT(126), 
	"NVD_OKBULL" FLOAT(126), 
	"NVD_WARNBULL" FLOAT(126), 
	"NVD_RPENBULL" FLOAT(126), 
	"NVD_ERRBULL" FLOAT(126), 
	"NVD_OTHRBULL" FLOAT(126), 
	"NVD_ZOBJRC" FLOAT(126), 
	"NVD_JOBID" NVARCHAR2(255), 
	"NVD_MSIVER" NVARCHAR2(255), 
	"NVD_WUAVER" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table NVD_DFSTATUS
--------------------------------------------------------

  CREATE TABLE "NVD_DFSTATUS" 
   (	"NVD_ZOBJDEV" NVARCHAR2(64), 
	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_BULLETIN" NVARCHAR2(32), 
	"NVD_OS" NVARCHAR2(255), 
	"NVD_OSBRANCH" NVARCHAR2(255), 
	"NVD_DFTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table NVD_DOMVER
--------------------------------------------------------

  CREATE TABLE "NVD_DOMVER" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_DOMVER" NVARCHAR2(8)
   )
--------------------------------------------------------
--  DDL for Table NVD_FILE
--------------------------------------------------------

  CREATE TABLE "NVD_FILE" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_ZRSCNAME" NVARCHAR2(30), 
	"NVD_ZRSCCFIL" NVARCHAR2(255), 
	"NVD_ZRSCMO" NVARCHAR2(1), 
	"NVD_ZRSCVRFY" NVARCHAR2(8), 
	"NVD_ZRSCCONF" NVARCHAR2(1), 
	"NVD_ZRSCRASH" NVARCHAR2(4), 
	"NVD_ZRSCSTYP" NVARCHAR2(8), 
	"NVD_ZRSCMMEM" NVARCHAR2(8), 
	"NVD_ZRSCDATE" NVARCHAR2(8), 
	"NVD_ZRSCTIME" NVARCHAR2(8), 
	"NVD_ZRSCSIZE" NVARCHAR2(11), 
	"NVD_ZRSCVERS" NVARCHAR2(12), 
	"NVD_ZRSCCSTA" NVARCHAR2(3), 
	"NVD_ZRSCCKPT" NVARCHAR2(1), 
	"NVD_ZRSCCRC" NVARCHAR2(8), 
	"NVD_ZRSCRSTR" NVARCHAR2(3), 
	"NVD_ZRSCOBJN" NVARCHAR2(8), 
	"NVD_ZCMPSIZE" NVARCHAR2(11), 
	"NVD_ZCMPKEY" NVARCHAR2(80), 
	"NVD_ZRSCSVRB" NVARCHAR2(1), 
	"NVD_ZRSCPRI" NVARCHAR2(2), 
	"NVD_ZRSCPADM" NVARCHAR2(30), 
	"NVD_ZRSCSRC" NVARCHAR2(20), 
	"NVD_ZINIT" NVARCHAR2(50), 
	"NVD_ZCREATE" NVARCHAR2(50), 
	"NVD_ZDELETE" NVARCHAR2(50), 
	"NVD_ZREPAIR" NVARCHAR2(50), 
	"NVD_ZUPDATE" NVARCHAR2(50), 
	"NVD_ZFILEUPD" NVARCHAR2(50), 
	"NVD_ZOPENERR" NVARCHAR2(50), 
	"NVD_NAME" NVARCHAR2(80), 
	"NVD_LOCATION" NVARCHAR2(255), 
	"NVD_ZCONTEXT" NVARCHAR2(8), 
	"NVD_FVERSION" NVARCHAR2(30), 
	"NVD_PVERSION" NVARCHAR2(30), 
	"NVD_ZPUBVER" NVARCHAR2(8), 
	"NVD_OBJGUID" NVARCHAR2(32), 
	"NVD_ZOBJPTCH" NVARCHAR2(1), 
	"NVD_ZRSCSIG" NVARCHAR2(32), 
	"NVD_SIGTYPE" NVARCHAR2(3)
   )
--------------------------------------------------------
--  DDL for Table NVD_FILECHG
--------------------------------------------------------

  CREATE TABLE "NVD_FILECHG" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_PATH" NVARCHAR2(255), 
	"NVD_NAME" NVARCHAR2(255), 
	"NVD_VERSION" NVARCHAR2(32), 
	"NVD_GMTDATE" NVARCHAR2(8), 
	"NVD_GMTTIME" NVARCHAR2(8), 
	"NVD_CHECKSUM" NVARCHAR2(12), 
	"NVD_CRC32" NVARCHAR2(12), 
	"NVD_SIZE" NVARCHAR2(12), 
	"NVD_ZOBJPART" NVARCHAR2(128), 
	"NVD_REPORT" NVARCHAR2(5), 
	"NVD_DSTATE" NVARCHAR2(32), 
	"NVD_USE" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table NVD_HPFSET
--------------------------------------------------------

  CREATE TABLE "NVD_HPFSET" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_NAME" NVARCHAR2(255), 
	"NVD_VERSION" NVARCHAR2(255), 
	"NVD_ZOBJPART" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table NVD_LOCATION
--------------------------------------------------------

  CREATE TABLE "NVD_LOCATION" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_ZSTOP000" NVARCHAR2(255), 
	"NVD_ZSTOP001" NVARCHAR2(255), 
	"NVD_URL" NVARCHAR2(255), 
	"NVD_ID" NVARCHAR2(12), 
	"NVD_STATUS" NVARCHAR2(8), 
	"NVD_DATE" NVARCHAR2(18), 
	"NVD_SIZE" NVARCHAR2(12), 
	"NVD_CRC" NVARCHAR2(12), 
	"NVD_LOCATION" NVARCHAR2(255), 
	"NVD_ZRSCCFIL" NVARCHAR2(128), 
	"NVD_ZRSCDATE" NVARCHAR2(8), 
	"NVD_ZRSCTIME" NVARCHAR2(8), 
	"NVD_ZRSCVRFY" NVARCHAR2(8), 
	"NVD_ZRSCSIZE" NVARCHAR2(12), 
	"NVD_ZRSCCRC" NVARCHAR2(8), 
	"NVD_ZRSCSIG" NVARCHAR2(32), 
	"NVD_SIGTYPE" NVARCHAR2(5), 
	"NVD_ZCMPSIZE" NVARCHAR2(12), 
	"NVD_ZRSCSTYP" NVARCHAR2(8), 
	"NVD_ZOBJMO" NVARCHAR2(1), 
	"NVD_ZRSCRASH" NVARCHAR2(4), 
	"NVD_ZRSCRSTR" NVARCHAR2(1), 
	"NVD_ZOBJPRI" NVARCHAR2(2), 
	"NVD_CTIME" NVARCHAR2(24), 
	"NVD_MTIME" NVARCHAR2(24), 
	"NVD_ZRSCRSTR#2" NVARCHAR2(1), 
	"NVD_ZCREATE" NVARCHAR2(255), 
	"NVD_ZUPDATE" NVARCHAR2(255), 
	"NVD_ZDELETE" NVARCHAR2(255), 
	"NVD_LEXPINS" NVARCHAR2(30)
   )
--------------------------------------------------------
--  DDL for Table NVD_MSGCAT
--------------------------------------------------------

  CREATE TABLE "NVD_MSGCAT" 
   (	"NVD_MSGTAG" NVARCHAR2(255), 
	"NVD_MSGLANG" NVARCHAR2(32), 
	"NVD_MSGSTR" NVARCHAR2(1024), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8)
   )
--------------------------------------------------------
--  DDL for Table NVD_PACKAGE
--------------------------------------------------------

  CREATE TABLE "NVD_PACKAGE" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_OWNER" NVARCHAR2(80), 
	"NVD_RELEASE" NVARCHAR2(80), 
	"NVD_ZSTOP000" NVARCHAR2(255), 
	"NVD_ZSTOP001" NVARCHAR2(255), 
	"NVD_ZSTOP002" NVARCHAR2(255), 
	"NVD_ZSTOP003" NVARCHAR2(255), 
	"NVD_PKGNAME" NVARCHAR2(80), 
	"NVD_NAME" NVARCHAR2(80), 
	"NVD_DESCRIPT" NVARCHAR2(255), 
	"NVD_SIZE" NVARCHAR2(12), 
	"NVD_COMPSIZE" NVARCHAR2(12), 
	"NVD_ITEMS" NVARCHAR2(7), 
	"NVD_PKGURL" NVARCHAR2(255), 
	"NVD_NOTES" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table NVD_PASTATUS
--------------------------------------------------------

  CREATE TABLE "NVD_PASTATUS" 
   (	"NVD_ZOBJDEV" NVARCHAR2(64), 
	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJRC" FLOAT(126), 
	"NVD_ZOBJMSG" NVARCHAR2(1024), 
	"NVD_JOBID" NVARCHAR2(255), 
	"NVD_BULLETIN" NVARCHAR2(32), 
	"NVD_RELEASE" NVARCHAR2(255), 
	"NVD_PRODUCT" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table NVD_PASTORE
--------------------------------------------------------

  CREATE TABLE "NVD_PASTORE" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_NAME" NVARCHAR2(80), 
	"NVD_ID" NVARCHAR2(12), 
	"NVD_DVERSION" NVARCHAR2(16), 
	"NVD_LDUPDATE" NVARCHAR2(16), 
	"NVD_SVERSION" NVARCHAR2(16), 
	"NVD_LSUPDATE" NVARCHAR2(16), 
	"NVD_TVERSION" NVARCHAR2(16), 
	"NVD_BULLTNUM" NVARCHAR2(8), 
	"NVD_ZRSCCFIL" NVARCHAR2(255), 
	"NVD_LOCATION" NVARCHAR2(80), 
	"NVD_ZRSCSIZE" NVARCHAR2(12), 
	"NVD_ZCMPSIZE" NVARCHAR2(12), 
	"NVD_ZGMTDATE" NVARCHAR2(8), 
	"NVD_ZGMTTIME" NVARCHAR2(8), 
	"NVD_ZRSCSIG" NVARCHAR2(32), 
	"NVD_SIGTYPE" NVARCHAR2(8), 
	"NVD_ZSTATUS" NVARCHAR2(3), 
	"NVD_SRCURL" NVARCHAR2(255), 
	"NVD_JOBSTART" NVARCHAR2(32), 
	"NVD_JOBEND" NVARCHAR2(32), 
	"NVD_MACHINE" NVARCHAR2(80), 
	"NVD_AUTHOR" NVARCHAR2(32), 
	"NVD_PATCHNUM" NVARCHAR2(8), 
	"NVD_PATCHERR" NVARCHAR2(8), 
	"NVD_ZRSCCRC" NVARCHAR2(8), 
	"NVD_ZRSCSTYP" NVARCHAR2(8), 
	"NVD_RVENDORS" NVARCHAR2(255), 
	"NVD_AVENDORS" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table NVD_PATCH
--------------------------------------------------------

  CREATE TABLE "NVD_PATCH" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_LANG" NVARCHAR2(5), 
	"NVD_ARCH" NVARCHAR2(8), 
	"NVD_PLATFORM" NVARCHAR2(16), 
	"NVD_OSVER" NVARCHAR2(12), 
	"NVD_OSTYPE" NVARCHAR2(16), 
	"NVD_OSSUITE" NVARCHAR2(16), 
	"NVD_LOCATION" NVARCHAR2(32), 
	"NVD_PATCHSIG" NVARCHAR2(32), 
	"NVD_RELEASE" NVARCHAR2(32), 
	"NVD_NAME" NVARCHAR2(80), 
	"NVD_REBOOT" NVARCHAR2(1), 
	"NVD_BULLETIN" NVARCHAR2(32), 
	"NVD_QNUMBER" NVARCHAR2(32), 
	"NVD_ID" NVARCHAR2(12), 
	"NVD_SUPERCED" NVARCHAR2(1), 
	"NVD_SUSNAME" NVARCHAR2(80), 
	"NVD_MSSNAME" NVARCHAR2(80), 
	"NVD_SUPERBU" NVARCHAR2(32), 
	"NVD_SUPERPA" NVARCHAR2(32), 
	"NVD_SUPERMSS" NVARCHAR2(80), 
	"NVD_DATA" NVARCHAR2(1), 
	"NVD_PATCHURL" NVARCHAR2(255), 
	"NVD_PATCHFN" NVARCHAR2(255), 
	"NVD_FORCEDL" NVARCHAR2(1), 
	"NVD_CTIME" NVARCHAR2(24), 
	"NVD_MTIME" NVARCHAR2(24), 
	"NVD_FIXEDIN" NVARCHAR2(32), 
	"NVD_ROLLBACK" NVARCHAR2(1), 
	"NVD_RUNMODE" NVARCHAR2(48), 
	"NVD_ZSTOP000" NVARCHAR2(128), 
	"NVD_ZSTOP001" NVARCHAR2(128), 
	"NVD_ZSTOP002" NVARCHAR2(128), 
	"NVD_OTYPE" NVARCHAR2(80), 
	"NVD_OCREATE" NVARCHAR2(255), 
	"NVD_ODELETE" NVARCHAR2(255), 
	"NVD_OVERIFY" NVARCHAR2(255), 
	"NVD_OASSERT" NVARCHAR2(255), 
	"NVD_OUPDATE" NVARCHAR2(255), 
	"NVD_ENABLED" NVARCHAR2(1), 
	"NVD_INSORDER" NVARCHAR2(3), 
	"NVD_DELORDER" NVARCHAR2(3), 
	"NVD_CPU" NVARCHAR2(8), 
	"NVD_PATCHNAM" NVARCHAR2(255), 
	"NVD_REBOOT_U" NVARCHAR2(1), 
	"NVD_RATING" NVARCHAR2(255), 
	"NVD_TITLE" NVARCHAR2(255), 
	"NVD_WIN10SBR" NVARCHAR2(30), 
	"NVD_PPOSTED" NVARCHAR2(24), 
	"NVD_MSSOPT" NVARCHAR2(24), 
	"NVD_PEXPINS" NVARCHAR2(30)
   )
--------------------------------------------------------
--  DDL for Table NVD_PATCHSIG
--------------------------------------------------------

  CREATE TABLE "NVD_PATCHSIG" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_ZSTOP001" NVARCHAR2(255), 
	"NVD_NAME" NVARCHAR2(32), 
	"NVD_ID" NVARCHAR2(12), 
	"NVD_CRC" NVARCHAR2(8), 
	"NVD_CTIME" NVARCHAR2(24), 
	"NVD_MTIME" NVARCHAR2(24)
   )
--------------------------------------------------------
--  DDL for Table NVD_PRODUCT
--------------------------------------------------------

  CREATE TABLE "NVD_PRODUCT" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_NAME" NVARCHAR2(255), 
	"NVD_ID" NVARCHAR2(12), 
	"NVD_TAG" NVARCHAR2(255), 
	"NVD_CVERSION" NVARCHAR2(32), 
	"NVD_RSUPPORT" NVARCHAR2(255), 
	"NVD_RCURRENT" NVARCHAR2(255), 
	"NVD_CTIME" NVARCHAR2(24), 
	"NVD_MTIME" NVARCHAR2(24), 
	"NVD_OTYPE" NVARCHAR2(80), 
	"NVD_OVERIFY" NVARCHAR2(255), 
	"NVD_VENDOR" NVARCHAR2(80)
   )
--------------------------------------------------------
--  DDL for Table NVD_PUBERROR
--------------------------------------------------------

  CREATE TABLE "NVD_PUBERROR" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_URL" NVARCHAR2(255), 
	"NVD_PATCHNAM" NVARCHAR2(80), 
	"NVD_BULLETIN" NVARCHAR2(16), 
	"NVD_ERROR" NVARCHAR2(3), 
	"NVD_ERRORMSG" NVARCHAR2(255), 
	"NVD_ID" NVARCHAR2(32), 
	"NVD_LOCATION" NVARCHAR2(32), 
	"NVD_VENDOR" NVARCHAR2(80)
   )
--------------------------------------------------------
--  DDL for Table NVD_REGCHG
--------------------------------------------------------

  CREATE TABLE "NVD_REGCHG" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_PATH" NVARCHAR2(255), 
	"NVD_VALUE" NVARCHAR2(255), 
	"NVD_NAME" NVARCHAR2(255), 
	"NVD_TYPE" NVARCHAR2(12), 
	"NVD_ZOBJPART" NVARCHAR2(128), 
	"NVD_REPORT" NVARCHAR2(5), 
	"NVD_DSTATE" NVARCHAR2(32), 
	"NVD_USE" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table NVD_RELEASE
--------------------------------------------------------

  CREATE TABLE "NVD_RELEASE" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_PRODUCT" NVARCHAR2(32), 
	"NVD_SP" NVARCHAR2(32), 
	"NVD_ID" NVARCHAR2(12), 
	"NVD_PROBE" NVARCHAR2(32), 
	"NVD_ARGS" NVARCHAR2(128), 
	"NVD_NAME" NVARCHAR2(255), 
	"NVD_CTIME" NVARCHAR2(24), 
	"NVD_MTIME" NVARCHAR2(24), 
	"NVD_PARENTC" NVARCHAR2(8), 
	"NVD_PARENTI" NVARCHAR2(32), 
	"NVD_CHILDC" NVARCHAR2(8), 
	"NVD_CHILDI" NVARCHAR2(32)
   )
--------------------------------------------------------
--  DDL for Table NVD_RESTATUS
--------------------------------------------------------

  CREATE TABLE "NVD_RESTATUS" 
   (	"NVD_ZOBJDEV" NVARCHAR2(64), 
	"NVD_ZOBJNAME" NVARCHAR2(32)
   )
--------------------------------------------------------
--  DDL for Table NVD_SP
--------------------------------------------------------

  CREATE TABLE "NVD_SP" 
   (	"NVD_ZOBJNAME" NVARCHAR2(32), 
	"NVD_ZOBJDATE" NVARCHAR2(8), 
	"NVD_ZOBJTIME" NVARCHAR2(8), 
	"NVD_ZOBJRCRC" NVARCHAR2(8), 
	"NVD_ZOBJID" NVARCHAR2(12), 
	"NVD_ZUNUSED1" NVARCHAR2(4), 
	"NVD_ZOBJCID" NVARCHAR2(12), 
	"NVD_ZOBJRSIZ" NVARCHAR2(8), 
	"NVD_NAME" NVARCHAR2(255), 
	"NVD_ID" NVARCHAR2(12), 
	"NVD_TAG" NVARCHAR2(255), 
	"NVD_POSTED" NVARCHAR2(18), 
	"NVD_REVISED" NVARCHAR2(18), 
	"NVD_SUPPORT" NVARCHAR2(1), 
	"NVD_URL" NVARCHAR2(255), 
	"NVD_FAQURL" NVARCHAR2(255), 
	"NVD_IMPACT" NVARCHAR2(8), 
	"NVD_PREREQ" NVARCHAR2(8), 
	"NVD_MITIGATE" NVARCHAR2(8), 
	"NVD_POPULAR" NVARCHAR2(8), 
	"NVD_CTIME" NVARCHAR2(24), 
	"NVD_MTIME" NVARCHAR2(24), 
	"NVD_OTYPE" NVARCHAR2(80), 
	"NVD_OASSERT" NVARCHAR2(255), 
	"NVD_OVERIFY" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table O365C2R_APPDETAILS
--------------------------------------------------------

  CREATE TABLE "O365C2R_APPDETAILS" 
   (	"HOSTNAME" NVARCHAR2(50), 
	"PKGID" NVARCHAR2(250), 
	"PKGVID" NVARCHAR2(250), 
	"APPNAME" NVARCHAR2(250), 
	"APPVER" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table O365C2R_SUMMARY
--------------------------------------------------------

  CREATE TABLE "O365C2R_SUMMARY" 
   (	"HOSTNAME" NVARCHAR2(50), 
	"EVENTTIME" DATE, 
	"APPVCLIV" NVARCHAR2(50), 
	"PKGNAME" NVARCHAR2(250), 
	"PKGVER" NVARCHAR2(250), 
	"PKGSRC" NVARCHAR2(250), 
	"PKGCACHE" NVARCHAR2(50), 
	"PKGID" NVARCHAR2(250), 
	"PKGVID" NVARCHAR2(250), 
	"MANAGEDSVC" NVARCHAR2(250), 
	"EVENTTYPE" NVARCHAR2(50), 
	"STATUS" NVARCHAR2(250), 
	"PKGSIZE" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table OSMEVENTS
--------------------------------------------------------

  CREATE TABLE "OSMEVENTS" 
   (	"EVENT_ID" NUMBER(*,0), 
	"DEPLOYMENT_ID" NVARCHAR2(100), 
	"DEVICE_ID" NVARCHAR2(50), 
	"SERIAL_NO" NVARCHAR2(100), 
	"ROMS_SERVER" NVARCHAR2(20), 
	"COMP_NAME" NVARCHAR2(100), 
	"EOS_NAME" NVARCHAR2(100), 
	"TOS_NAME" NVARCHAR2(100), 
	"IPADDRESS" NVARCHAR2(20), 
	"SUBNETMASK" NVARCHAR2(50), 
	"SUBNETID" NVARCHAR2(20), 
	"REGION" NVARCHAR2(100), 
	"JOBID" NVARCHAR2(100), 
	"EVENT_NAME" NVARCHAR2(30), 
	"EVENT_TYPE" NVARCHAR2(30), 
	"EVENT_SUBTYPE" NVARCHAR2(30), 
	"DRIVEMAP" NVARCHAR2(50), 
	"WITH_PBR" NVARCHAR2(10), 
	"TIMEZONE" NVARCHAR2(20), 
	"EVENT_TIME" DATE, 
	"DEP_STIME" DATE, 
	"DEP_ETIME" DATE, 
	"DURATION" NVARCHAR2(20), 
	"SUBEVENT" NVARCHAR2(200), 
	"STATUS" NVARCHAR2(50), 
	"PROGRESS_OVERALL" NVARCHAR2(10), 
	"ERRORMSG" NVARCHAR2(200)
   )
--------------------------------------------------------
--  DDL for Table OSMLOGS
--------------------------------------------------------

  CREATE TABLE "OSMLOGS" 
   (	"EVENT_ID" NUMBER(*,0), 
	"DEPLOYMENT_ID" NVARCHAR2(100), 
	"ALL_LOG_URL" NVARCHAR2(300), 
	"RNL_LOG_URL" NVARCHAR2(300)
   )
--------------------------------------------------------
--  DDL for Table OVAL_REMEDIATION
--------------------------------------------------------

  CREATE TABLE "OVAL_REMEDIATION" 
   (	"DEVICE" NVARCHAR2(50), 
	"CVE_ID" NVARCHAR2(255), 
	"OVAL_ID" NVARCHAR2(80), 
	"DEVICESTATE" NVARCHAR2(32), 
	"SCANTIME" DATE, 
	"PRODUCT" NVARCHAR2(32), 
	"VERSION" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table PATCHADV
--------------------------------------------------------

  CREATE TABLE "PATCHADV" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"MTIME" DATE, 
	"STIME" DATE, 
	"PTIME" DATE, 
	"BULLETIN" NVARCHAR2(50), 
	"LANGUAGE" NVARCHAR2(50), 
	"NAME" NVARCHAR2(50), 
	"PATCHNAME" NVARCHAR2(80), 
	"PATCHUID" NVARCHAR2(50), 
	"VENDOR" NVARCHAR2(100), 
	"MAJORVER" NVARCHAR2(50), 
	"MINORVER" NVARCHAR2(50), 
	"PRODFAMILY" NVARCHAR2(100), 
	"REASON" NVARCHAR2(250), 
	"SEVERITY" NVARCHAR2(50), 
	"SPNAME" NVARCHAR2(50), 
	"SQNUMBER" NVARCHAR2(50), 
	"STATUS" NVARCHAR2(50), 
	"PRODID" NVARCHAR2(50), 
	"PATCHTYP" NVARCHAR2(50), 
	"PRVPATCH" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table PNPINVSCAN
--------------------------------------------------------

  CREATE TABLE "PNPINVSCAN" 
   (	"MTIME" DATE, 
	"WDEVICENAME" NVARCHAR2(50), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(225), 
	"WHARDGUID" NVARCHAR2(225), 
	"IPADDR" NVARCHAR2(128), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMODEL" NVARCHAR2(128), 
	"OS" NVARCHAR2(128), 
	"OSARCH" NVARCHAR2(128), 
	"WPNPCLASS" NVARCHAR2(128), 
	"WPNPNAME" NVARCHAR2(128), 
	"WSLNO" NVARCHAR2(225)
   )
--------------------------------------------------------
--  DDL for Table POLICY_APPROVAL_DETAILS
--------------------------------------------------------

  CREATE TABLE "POLICY_APPROVAL_DETAILS" 
   (	"DEVICE_DN" VARCHAR2(255 CHAR), 
	"OPERATION_TYPE" VARCHAR2(255 CHAR), 
	"POLICY_ID" VARCHAR2(255 CHAR), 
	"APPROVAL_STATUS" VARCHAR2(255 CHAR), 
	"APPROVAL_TYPE" VARCHAR2(255 CHAR), 
	"APPROVED_TIME" TIMESTAMP (6), 
	"APPROVER_USER_ID" VARCHAR2(255 CHAR), 
	"APPROVER_MAIL_ID" VARCHAR2(255 CHAR), 
	"APPROVER_NAME" VARCHAR2(255 CHAR), 
	"CREATED_TIME" TIMESTAMP (6), 
	"DEVICE_NAME" VARCHAR2(255 CHAR), 
	"EXPIRED_TIME" TIMESTAMP (6), 
	"POLICY_CLASSFICATION" VARCHAR2(255 CHAR), 
	"POLICY_CONFIG" VARCHAR2(255 CHAR), 
	"POLICY_DOMAIN" VARCHAR2(255 CHAR), 
	"POLICY_NAME" VARCHAR2(255 CHAR), 
	"PRIORITY" VARCHAR2(255 CHAR), 
	"REQUEST_ID" NUMBER(10,0), 
	"REQUESTER_NAME" VARCHAR2(255 CHAR)
   )
--------------------------------------------------------
--  DDL for Table POLICY_APPROVAL_DETAILS_HISTORY
--------------------------------------------------------

  CREATE TABLE "POLICY_APPROVAL_DETAILS_HISTORY" 
   (	"HISTORYID" NUMBER(19,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"APPROVALSTATUS" VARCHAR2(255 CHAR), 
	"APPROVALTYPE" VARCHAR2(255 CHAR), 
	"APPROVEDTIME" TIMESTAMP (6), 
	"APPROVERID" VARCHAR2(255 CHAR), 
	"APPROVERMAILID" VARCHAR2(255 CHAR), 
	"APPROVERNAME" VARCHAR2(255 CHAR), 
	"CREATEDDATE" TIMESTAMP (6), 
	"DEVICEDN" VARCHAR2(255 CHAR), 
	"DEVICENAME" VARCHAR2(255 CHAR), 
	"EXPIREDON" TIMESTAMP (6), 
	"OPERATIONTYPE" VARCHAR2(255 CHAR), 
	"POLICYCLASSFICATION" VARCHAR2(255 CHAR), 
	"POLICYCONFIG" VARCHAR2(255 CHAR), 
	"POLICYDOMAIN" VARCHAR2(255 CHAR), 
	"POLICYID" VARCHAR2(255 CHAR), 
	"POLICYNAME" VARCHAR2(255 CHAR), 
	"PRIORITY" VARCHAR2(255 CHAR), 
	"REQUESTID" NUMBER(10,0), 
	"REQUESTERNAME" VARCHAR2(255 CHAR)
   )
--------------------------------------------------------
--  DDL for Table QUERY
--------------------------------------------------------

  CREATE TABLE "QUERY" 
   (	"QID" NVARCHAR2(8), 
	"QNAME" NVARCHAR2(80), 
	"QOS" NVARCHAR2(32), 
	"QSHOW" NVARCHAR2(255), 
	"QCRITERIA" NVARCHAR2(255), 
	"QSELECTEDELNUM" NVARCHAR2(255), 
	"QBB" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCACOMPUTERNAMES
--------------------------------------------------------

  CREATE TABLE "RCACOMPUTERNAMES" 
   (	"COMPUTERNAME_ID" NUMBER(10,0), 
	"NAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCACONCURRENTINTERVALS
--------------------------------------------------------

  CREATE TABLE "RCACONCURRENTINTERVALS" 
   (	"INTERVAL_" NUMBER(10,0), 
	"YEAR_" NUMBER(10,0), 
	"MONTH_" NUMBER(10,0), 
	"DAY_" NUMBER(10,0), 
	"HOUR_" NUMBER(10,0), 
	"MINUTE_" NUMBER(10,0), 
	"TIME_" NVARCHAR2(32), 
	"GMTINTERVAL_ID" NUMBER(10,0), 
	"USED00TO06" NUMBER(10,0), 
	"USED06TO12" NUMBER(10,0), 
	"USED12TO18" NUMBER(10,0), 
	"USED18TO24" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCACRITERIA
--------------------------------------------------------

  CREATE TABLE "RCACRITERIA" 
   (	"CRITERIANAME_ID" NUMBER(10,0), 
	"CRITERIAVIEWNAME_ID" NUMBER(10,0), 
	"CRITERIAOPERATOR_ID" NUMBER(10,0), 
	"CRITERIASEARCHTYPEID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCACRITERIACOLUMNNAMES
--------------------------------------------------------

  CREATE TABLE "RCACRITERIACOLUMNNAMES" 
   (	"CRITERIACOLUMNNAME_ID" NUMBER(10,0), 
	"COLUMNNAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCACRITERIACOLUMNS
--------------------------------------------------------

  CREATE TABLE "RCACRITERIACOLUMNS" 
   (	"CRITERIANAME_ID" NUMBER(10,0), 
	"CRITERIACOLUMNNAME_ID" NUMBER(10,0), 
	"CRITERIACONDITION_ID" NUMBER(10,0), 
	"CRITERIAOPERATOR_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCACRITERIACOLUMNVALUES
--------------------------------------------------------

  CREATE TABLE "RCACRITERIACOLUMNVALUES" 
   (	"CRITERIANAME_ID" NUMBER(10,0), 
	"CRITERIACOLUMNNAME_ID" NUMBER(10,0), 
	"CRITERIAVALUE_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCACRITERIACONDITIONS
--------------------------------------------------------

  CREATE TABLE "RCACRITERIACONDITIONS" 
   (	"CRITERIACONDITION_ID" NUMBER(10,0), 
	"CONDITION" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCACRITERIADATABASETYPES
--------------------------------------------------------

  CREATE TABLE "RCACRITERIADATABASETYPES" 
   (	"DATABASETYPE_ID" NUMBER(10,0), 
	"DATABASETYPE" NVARCHAR2(32)
   )
--------------------------------------------------------
--  DDL for Table RCACRITERIANAMES
--------------------------------------------------------

  CREATE TABLE "RCACRITERIANAMES" 
   (	"CRITERIANAME_ID" NUMBER(10,0), 
	"CRITERIANAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCACRITERIAOPERATORS
--------------------------------------------------------

  CREATE TABLE "RCACRITERIAOPERATORS" 
   (	"CRITERIAOPERATOR_ID" NUMBER(10,0), 
	"OPERATOR" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCACRITERIASQL
--------------------------------------------------------

  CREATE TABLE "RCACRITERIASQL" 
   (	"CRITERIANAME_ID" NUMBER(10,0), 
	"DATABASETYPE_ID" NUMBER(10,0), 
	"CRITERIASQL" NVARCHAR2(2000)
   )
--------------------------------------------------------
--  DDL for Table RCACRITERIASQLELEMENTS
--------------------------------------------------------

  CREATE TABLE "RCACRITERIASQLELEMENTS" 
   (	"CRITERIANAME_ID" NUMBER(10,0), 
	"ELEMENT_ID" NUMBER(10,0), 
	"CRITERIASQL" NVARCHAR2(2000)
   )
--------------------------------------------------------
--  DDL for Table RCACRITERIAVALUES
--------------------------------------------------------

  CREATE TABLE "RCACRITERIAVALUES" 
   (	"CRITERIAVALUE_ID" NUMBER(10,0), 
	"CRITERIAVALUETYPEID" NUMBER(10,0), 
	"CRITERIAVALUE" NVARCHAR2(512)
   )
--------------------------------------------------------
--  DDL for Table RCACRITERIAVIEWNAMES
--------------------------------------------------------

  CREATE TABLE "RCACRITERIAVIEWNAMES" 
   (	"CRITERIAVIEWNAME_ID" NUMBER(10,0), 
	"VIEWNAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCADOMAINNAMES
--------------------------------------------------------

  CREATE TABLE "RCADOMAINNAMES" 
   (	"DOMAINNAME_ID" NUMBER(10,0), 
	"NAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCAFILENAMES
--------------------------------------------------------

  CREATE TABLE "RCAFILENAMES" 
   (	"FILENAME_ID" NUMBER(10,0), 
	"NAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCAFILEPATHS
--------------------------------------------------------

  CREATE TABLE "RCAFILEPATHS" 
   (	"FILEPATH_ID" NUMBER(10,0), 
	"NAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCAFILEPROPERTIES
--------------------------------------------------------

  CREATE TABLE "RCAFILEPROPERTIES" 
   (	"FILEPROPERTY_ID" NUMBER(10,0), 
	"FILEPROPERTYNAME_ID" NUMBER(10,0), 
	"FILEPROPERTYVALUE_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCAFILEPROPERTYNAMES
--------------------------------------------------------

  CREATE TABLE "RCAFILEPROPERTYNAMES" 
   (	"FILEPROPERTYNAME_ID" NUMBER(10,0), 
	"NAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCAFILEPROPERTYVALUES
--------------------------------------------------------

  CREATE TABLE "RCAFILEPROPERTYVALUES" 
   (	"FILEPROPERTYVALUE_ID" NUMBER(10,0), 
	"VALUE_" NVARCHAR2(384)
   )
--------------------------------------------------------
--  DDL for Table RCAFILEROOTS
--------------------------------------------------------

  CREATE TABLE "RCAFILEROOTS" 
   (	"FILEROOT_ID" NUMBER(10,0), 
	"NAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCAFILESIGNATUREPROPERTIES
--------------------------------------------------------

  CREATE TABLE "RCAFILESIGNATUREPROPERTIES" 
   (	"FILESIGNATURE_ID" NUMBER(10,0), 
	"FILEPROPERTY_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCAFILESIGNATURES
--------------------------------------------------------

  CREATE TABLE "RCAFILESIGNATURES" 
   (	"FILESIGNATURE_ID" NUMBER(10,0), 
	"MD5HASH" NVARCHAR2(255), 
	"FILESIZE" NUMBER(10,0), 
	"VENDOR" NVARCHAR2(255), 
	"PRODUCTNAME" NVARCHAR2(255), 
	"PRODUCTVER" NVARCHAR2(255), 
	"APPLICATIONVER" NVARCHAR2(255), 
	"APPLICATIONDESC" NVARCHAR2(384), 
	"ORIGINALFILENAME" NVARCHAR2(255), 
	"FILECRC" NVARCHAR2(15), 
	"MODCRC" NVARCHAR2(15)
   )
--------------------------------------------------------
--  DDL for Table RCAFULLFILENAMES
--------------------------------------------------------

  CREATE TABLE "RCAFULLFILENAMES" 
   (	"FULLFILENAME_ID" NUMBER(10,0), 
	"FOLDERFILEROOT_ID" NUMBER(10,0), 
	"FILEPATH_ID" NUMBER(10,0), 
	"FILENAME_ID" NUMBER(10,0), 
	"FILEPATHLOGICALCRC" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCARULENAMES
--------------------------------------------------------

  CREATE TABLE "RCARULENAMES" 
   (	"RULENAME_ID" NUMBER(10,0), 
	"RULENAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCARULEOPERATORS
--------------------------------------------------------

  CREATE TABLE "RCARULEOPERATORS" 
   (	"RULENAME_ID" NUMBER(10,0), 
	"CRITERIAOPERATOR_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCARULES
--------------------------------------------------------

  CREATE TABLE "RCARULES" 
   (	"RULENAME_ID" NUMBER(10,0), 
	"CRITERIANAME_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCARULESETGROUPNAMES
--------------------------------------------------------

  CREATE TABLE "RCARULESETGROUPNAMES" 
   (	"RULESETGROUPNAME_ID" NUMBER(10,0), 
	"RULESETGROUPNAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCARULESETGROUPOPERATORS
--------------------------------------------------------

  CREATE TABLE "RCARULESETGROUPOPERATORS" 
   (	"RULESETGROUPNAME_ID" NUMBER(10,0), 
	"CRITERIAOPERATOR_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCARULESETGROUPS
--------------------------------------------------------

  CREATE TABLE "RCARULESETGROUPS" 
   (	"RULESETGROUPNAME_ID" NUMBER(10,0), 
	"RULESETNAME_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCARULESETNAMES
--------------------------------------------------------

  CREATE TABLE "RCARULESETNAMES" 
   (	"RULESETNAME_ID" NUMBER(10,0), 
	"RULESETNAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCARULESETOPERATORS
--------------------------------------------------------

  CREATE TABLE "RCARULESETOPERATORS" 
   (	"RULESETNAME_ID" NUMBER(10,0), 
	"CRITERIAOPERATOR_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCARULESETS
--------------------------------------------------------

  CREATE TABLE "RCARULESETS" 
   (	"RULESETNAME_ID" NUMBER(10,0), 
	"RULENAME_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCASERVICEPACKHISTORY
--------------------------------------------------------

  CREATE TABLE "RCASERVICEPACKHISTORY" 
   (	"SERVICEPACK_ID" NUMBER(10,0), 
	"SERVICEPACKCOMPONENT" NVARCHAR2(100), 
	"SERVICEPACKNUMBER" NUMBER(10,0), 
	"SERVICEPACKNAME" NVARCHAR2(255), 
	"SERVICEPACKDESC" NVARCHAR2(255), 
	"SERVICEPACKINSTALLED" DATE, 
	"SCHEMAVERSION" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCASQLDATABASEMAINTHISTORY
--------------------------------------------------------

  CREATE TABLE "RCASQLDATABASEMAINTHISTORY" 
   (	"SERVICE_ID" NUMBER(10,0), 
	"SERVICECOMPONENTNAME" NVARCHAR2(100), 
	"SERVICENUMBER" NUMBER(10,0), 
	"SERVICENAME" NVARCHAR2(255), 
	"SERVICEDESC" NVARCHAR2(255), 
	"SERVICEDATEINSTALLED" DATE, 
	"SCHEMAVERSION" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCAUSAGEINTERVALS
--------------------------------------------------------

  CREATE TABLE "RCAUSAGEINTERVALS" 
   (	"USAGEINTERVAL_ID" NUMBER(10,0), 
	"INTERVAL_" NUMBER(10,0), 
	"INTERVALTYPE" NUMBER(5,0), 
	"YEAR_" NUMBER(5,0), 
	"MONTH_" NUMBER(5,0), 
	"DAY_" NUMBER(5,0), 
	"DATE_" NVARCHAR2(10)
   )
--------------------------------------------------------
--  DDL for Table RCAUSERNAMES
--------------------------------------------------------

  CREATE TABLE "RCAUSERNAMES" 
   (	"USERNAME_ID" NUMBER(10,0), 
	"NAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCAWINDOWSCOMPUTERS
--------------------------------------------------------

  CREATE TABLE "RCAWINDOWSCOMPUTERS" 
   (	"WINDOWSCOMPUTER_ID" NUMBER(10,0), 
	"DOMAINNAME_ID" NUMBER(10,0), 
	"COMPUTERNAME_ID" NUMBER(10,0), 
	"WINDOWSSID_ID" NUMBER(10,0), 
	"WINDOWSOSVERSION_ID" NUMBER(10,0), 
	"FIRSTCOLLECTION" DATE, 
	"LASTCOLLECTION" DATE
   )
--------------------------------------------------------
--  DDL for Table RCAWINDOWSCOMPUTERUSERS
--------------------------------------------------------

  CREATE TABLE "RCAWINDOWSCOMPUTERUSERS" 
   (	"WINDOWSCOMPUTERUSER_ID" NUMBER(10,0), 
	"WINDOWSCOMPUTER_ID" NUMBER(10,0), 
	"WINDOWSUSER_ID" NUMBER(10,0), 
	"COMPUTERNAME" NVARCHAR2(32), 
	"COMPUTERDOMAIN" NVARCHAR2(64), 
	"USERNAME" NVARCHAR2(255), 
	"USERDOMAIN" NVARCHAR2(100), 
	"CURRENTCOMPUTER" NUMBER(10,0) DEFAULT 1
   )
--------------------------------------------------------
--  DDL for Table RCAWINDOWSCONCURRENTUSAGE
--------------------------------------------------------

  CREATE TABLE "RCAWINDOWSCONCURRENTUSAGE" 
   (	"WINDOWSCOMPUTERUSER_ID" NUMBER(10,0), 
	"WINDOWSFILEINSTANCE_ID" NUMBER(10,0), 
	"GMTINTERVAL_ID" NUMBER(10,0), 
	"USED00TO06" NUMBER(10,0), 
	"USED06TO12" NUMBER(10,0), 
	"USED12TO18" NUMBER(10,0), 
	"USED18TO24" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCAWINDOWSFILEINSTANCES
--------------------------------------------------------

  CREATE TABLE "RCAWINDOWSFILEINSTANCES" 
   (	"WINDOWSFILEINSTANCE_ID" NUMBER(10,0), 
	"WINDOWSFILE_ID" NUMBER(10,0), 
	"FILESIGNATURE_ID" NUMBER(10,0), 
	"LASTUSEDINTERVAL" NUMBER(10,0), 
	"FIRSTINVNINTERVAL_ID" NUMBER(10,0), 
	"UNINSTALLEDINTERVAL_ID" NUMBER(10,0), 
	"FIRSTUSEDINTERVAL_ID" NUMBER(10,0), 
	"LASTUSEDINTERVAL_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCAWINDOWSFILEROOTS
--------------------------------------------------------

  CREATE TABLE "RCAWINDOWSFILEROOTS" 
   (	"WINDOWSCOMPUTERUSER_ID" NUMBER(10,0), 
	"FOLDERFILEROOT_ID" NUMBER(10,0), 
	"PATHFILEROOT_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCAWINDOWSFILES
--------------------------------------------------------

  CREATE TABLE "RCAWINDOWSFILES" 
   (	"WINDOWSFILE_ID" NUMBER(10,0), 
	"WINDOWSCOMPUTERUSER_ID" NUMBER(10,0), 
	"FULLFILENAME_ID" NUMBER(10,0), 
	"CURRENTFILEINSTANCE_ID" NUMBER(10,0), 
	"INVENTORIED" NUMBER(5,0), 
	"USAGEFILTERINCLUDE" NUMBER(5,0), 
	"USAGEFILTERREASON" NUMBER(5,0), 
	"LASTUSEDINTERVAL" NUMBER(10,0), 
	"LASTUSEDINTERVAL_ID" NUMBER(10,0), 
	"FIRSTUSEDINTERVAL_ID" NUMBER(10,0), 
	"FIRSTINVNINTERVAL_ID" NUMBER(10,0), 
	"UNINSTALLEDINTERVAL_ID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCAWINDOWSFILEUSAGE
--------------------------------------------------------

  CREATE TABLE "RCAWINDOWSFILEUSAGE" 
   (	"WINDOWSCOMPUTERUSER_ID" NUMBER(10,0), 
	"WINDOWSFILEINSTANCE_ID" NUMBER(10,0), 
	"USAGEINTERVAL_ID" NUMBER(10,0), 
	"USAGECOUNT" NUMBER(10,0), 
	"USAGESECONDS" NUMBER(10,0), 
	"FOCUSSECONDS" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table RCAWINDOWSOSVERSIONS
--------------------------------------------------------

  CREATE TABLE "RCAWINDOWSOSVERSIONS" 
   (	"WINDOWSOSVERSION_ID" NUMBER(10,0), 
	"PLATFORMID" NUMBER(10,0), 
	"MAJORVERSION" NUMBER(10,0), 
	"MINORVERSION" NUMBER(10,0), 
	"BUILDNUMBER" NUMBER(10,0), 
	"SERVICEPACKMAJOR" NUMBER(10,0), 
	"SERVICEPACKMINOR" NUMBER(10,0), 
	"SUITEMASK" NUMBER(10,0), 
	"PRODUCTTYPE" NUMBER(10,0), 
	"CSDVERSION" NVARCHAR2(255), 
	"PLATFORM" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCAWINDOWSSIDS
--------------------------------------------------------

  CREATE TABLE "RCAWINDOWSSIDS" 
   (	"WINDOWSSID_ID" NUMBER(10,0), 
	"NAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCAWINDOWSUSERS
--------------------------------------------------------

  CREATE TABLE "RCAWINDOWSUSERS" 
   (	"WINDOWSUSER_ID" NUMBER(10,0), 
	"DOMAINNAME_ID" NUMBER(10,0), 
	"USERNAME_ID" NUMBER(10,0), 
	"WINDOWSSID_ID" NUMBER(10,0), 
	"FIRSTCOLLECTION" DATE, 
	"LASTCOLLECTION" DATE
   )
--------------------------------------------------------
--  DDL for Table RCIM_CDROMDRIVE
--------------------------------------------------------

  CREATE TABLE "RCIM_CDROMDRIVE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADDITIONALAVAILABILITY" NVARCHAR2(255), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPABILITIES" NVARCHAR2(255), 
	"WCAPABILITYDESCRIPTIONS" NVARCHAR2(255), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOMPRESSIONMETHOD" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDEFAULTBLOCKSIZE" FLOAT(126), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WIDENTIFYINGDESCRIPTIONS" NVARCHAR2(255), 
	"WINSTALLDATE" DATE, 
	"WLASTCLEANED" DATE, 
	"WLASTERRORCODE" FLOAT(126), 
	"WLOADTIME" FLOAT(126), 
	"WMAXACCESSTIME" FLOAT(126), 
	"WMAXBLOCKSIZE" FLOAT(126), 
	"WMAXMEDIASIZE" FLOAT(126), 
	"WMAXQUIESCETIME" FLOAT(126), 
	"WMAXUNITSBEFORECLEANING" FLOAT(126), 
	"WMEDIAISLOCKED" NUMBER(*,0), 
	"WMINBLOCKSIZE" FLOAT(126), 
	"WMOUNTCOUNT" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNEEDSCLEANING" NUMBER(*,0), 
	"WNUMBEROFMEDIASUPPORTED" NUMBER(*,0), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(255), 
	"WPOWERMANAGEMENTCAPABILITIES" NVARCHAR2(255), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPOWERONHOURS" FLOAT(126), 
	"WSECURITY" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTMOUNT" DATE, 
	"WTOTALMOUNTTIME" FLOAT(126), 
	"WTOTALPOWERONHOURS" FLOAT(126), 
	"WUNCOMPRESSEDDATARATE" FLOAT(126), 
	"WUNITSDESCRIPTION" NVARCHAR2(128), 
	"WUNITSUSED" FLOAT(126), 
	"WUNLOADTIME" FLOAT(126)
   )
--------------------------------------------------------
--  DDL for Table RCIM_COMPUTERSYSTEM
--------------------------------------------------------

  CREATE TABLE "RCIM_COMPUTERSYSTEM" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAUTOSHUTDOWNBEHAVIOR" NVARCHAR2(128), 
	"WAUTOSHUTDOWNIDLETIME" NVARCHAR2(128), 
	"WAUTOSHUTDOWNSTARTTIME" NVARCHAR2(128), 
	"WAUTOSHUTDOWNSTOPTIME" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(255), 
	"WHOSTID" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WISATYPE" NUMBER(*,0), 
	"WISATYPEDESCRIPTION" NVARCHAR2(128), 
	"WLASTLOADINFO" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMEFORMAT" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(255), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPOWERSTATE" NUMBER(*,0), 
	"WPRIMARYOWNERCONTACT" NVARCHAR2(128), 
	"WPRIMARYOWNERNAME" NVARCHAR2(128), 
	"WPRIMARYOWNERPAGER" NVARCHAR2(128), 
	"WSECONDARYOWNERCONTACT" NVARCHAR2(128), 
	"WSECONDARYOWNERNAME" NVARCHAR2(128), 
	"WSECONDARYOWNERPAGER" NVARCHAR2(128), 
	"WRESETCAPABILITY" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(255), 
	"WWAKEUPTYPE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RCIM_DIRECTORY
--------------------------------------------------------

  CREATE TABLE "RCIM_DIRECTORY" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOMPRESSIONMETHOD" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(64), 
	"WCREATIONDATE" DATE, 
	"WCSCREATIONCLASSNAME" NVARCHAR2(64), 
	"WCSNAME" NVARCHAR2(64), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WENCRIPTIONMETHOD" NVARCHAR2(128), 
	"WFILESIZE" NUMBER(*,0), 
	"WFSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WFSNAME" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WINUSECOUNT" NUMBER(*,0), 
	"WLASTACCESSED" DATE, 
	"WLASTMODIFIED" DATE, 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(32), 
	"WREADABLE" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WWRITABLE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RCIM_DISKDRIVE
--------------------------------------------------------

  CREATE TABLE "RCIM_DISKDRIVE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADDITIONALAVAILABILITY" NVARCHAR2(255), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPABILITIES" NVARCHAR2(255), 
	"WCAPABILITYDESCRIPTIONS" NVARCHAR2(255), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOMPRESSIONMETHOD" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDEFAULTBLOCKSIZE" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WIDENTIFYINGDESCRIPTIONS" NVARCHAR2(255), 
	"WINSTALLDATE" DATE, 
	"WLASTCLEANED" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WLOADTIME" NUMBER(*,0), 
	"WMAXACCESSTIME" NUMBER(*,0), 
	"WMAXBLOCKSIZE" NUMBER(*,0), 
	"WMAXMEDIASIZE" NUMBER(*,0), 
	"WMAXQUIESCETIME" NUMBER(*,0), 
	"WMAXUNITSBEFORECLEANING" NUMBER(*,0), 
	"WMEDIAISLOCKED" NUMBER(*,0), 
	"WMINBLOCKSIZE" NUMBER(*,0), 
	"WMOUNTCOUNT" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNEEDSCLEANING" NUMBER(*,0), 
	"WNUMBEROFMEDIASUPPORTED" NUMBER(*,0), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(255), 
	"WPOWERMANAGEMENTCAPABILITIES" NVARCHAR2(255), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPOWERONHOURS" NUMBER(*,0), 
	"WSECURITY" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTMOUNT" DATE, 
	"WTOTALMOUNTTIME" NUMBER(*,0), 
	"WTOTALPOWERONHOURS" NUMBER(*,0), 
	"WUNCOMPRESSEDDATARATE" NUMBER(*,0), 
	"WUNITSDESCRIPTION" NVARCHAR2(128), 
	"WUNITSUSED" NUMBER(*,0), 
	"WUNLOADTIME" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RCIM_DVDDRIVE
--------------------------------------------------------

  CREATE TABLE "RCIM_DVDDRIVE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADDITIONALAVAILABILITY" NVARCHAR2(128), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPABILITIES" NVARCHAR2(128), 
	"WCAPABILITYDESCRIPTIONS" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOMPRESSIONMETHOD" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDEFAULTBLOCKSIZE" FLOAT(126), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WFORMATSSUPPORTED" NVARCHAR2(128), 
	"WIDENTIFYINGDESCRIPTIONS" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTCLEANED" DATE, 
	"WLASTERRORCODE" FLOAT(126), 
	"WLOADTIME" FLOAT(126), 
	"WMAXACCESSTIME" FLOAT(126), 
	"WMAXBLOCKSIZE" FLOAT(126), 
	"WMAXMEDIASIZE" FLOAT(126), 
	"WMAXQUIESCETIME" FLOAT(126), 
	"WMAXUNITSBEFORECLEANING" FLOAT(126), 
	"WMEDIAISLOCKED" NUMBER(*,0), 
	"WMINBLOCKSIZE" FLOAT(126), 
	"WMOUNTCOUNT" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNEEDSCLEANING" NUMBER(*,0), 
	"WNUMBEROFMEDIASUPPORTED" NUMBER(*,0), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NVARCHAR2(128), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPOWERONHOURS" FLOAT(126), 
	"WSECURITY" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTMOUNT" DATE, 
	"WTOTALMOUNTTIME" FLOAT(126), 
	"WTOTALPOWERONHOURS" FLOAT(126), 
	"WUNCOMPRESSEDDATARATE" FLOAT(126), 
	"WUNITSDESCRIPTION" NVARCHAR2(128), 
	"WUNITSUSED" FLOAT(126), 
	"WUNLOADTIME" FLOAT(126)
   )
--------------------------------------------------------
--  DDL for Table RCIM_ETHERNETADAPTER
--------------------------------------------------------

  CREATE TABLE "RCIM_ETHERNETADAPTER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADDITIONALAVAILABILITY" NVARCHAR2(255), 
	"WALLIGNMENTERRORS" NUMBER(*,0), 
	"WAUTOSENSE" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPABILITIES" NVARCHAR2(255), 
	"WCAPABILITYDESCRIPTIONS" NVARCHAR2(255), 
	"WCAPTION" NVARCHAR2(128), 
	"WCARRIERSENSEERRORS" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDEFFEREDTRANSMISSIONS" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WENABLEDCAPABILITIES" NVARCHAR2(255), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WEXCESSIVECOLLISIONS" NUMBER(*,0), 
	"WFCSERRORS" NUMBER(*,0), 
	"WFRAMETOOLONGS" NUMBER(*,0), 
	"WFULLDUPLEX" NUMBER(*,0), 
	"WIDENTIFYINGDESCRIPTIONS" NVARCHAR2(255), 
	"WINSTALLDATE" DATE, 
	"WINTERNALMACRECEIVEERRORS" NUMBER(*,0), 
	"WINTERNALMACTRANSMITTERRORS" NUMBER(*,0), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WLATECOLLISIONS" NUMBER(*,0), 
	"WMAXDATASIZE" NUMBER(*,0), 
	"WMAXQUISCETIME" NUMBER(*,0), 
	"WMAXSPEED" FLOAT(126), 
	"WMULTIPLECOLLISIONFRAMES" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNETWORKADDRESSES" NVARCHAR2(255), 
	"WOCTETSRECEIVED" FLOAT(126), 
	"WOCTETSTRANSMITTED" FLOAT(126), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(255), 
	"WPERMANENTADDRESS" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NVARCHAR2(255), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPOWERONHOURS" NUMBER(*,0), 
	"WSINGLECOLLISIONFRAMES" NUMBER(*,0), 
	"WSPEED" FLOAT(126), 
	"WSQETESTERRORS" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYMBOLERRORS" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTOTALPACKETSRECEIVED" FLOAT(126), 
	"WTOTALPACKETSTRANSMITTED" FLOAT(126), 
	"WTOTALPOWERONHOURS" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RCIM_EXPORT
--------------------------------------------------------

  CREATE TABLE "RCIM_EXPORT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WDIRECTORY" NVARCHAR2(255), 
	"WEXPORTEDDIRECTORYNAME" NVARCHAR2(128), 
	"WLOCALFS" NVARCHAR2(255), 
	"WNAMESPACE" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RCIM_HPUX_SWBUNDLES
--------------------------------------------------------

  CREATE TABLE "RCIM_HPUX_SWBUNDLES" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WIDENTIFYINGNUMBER" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WVENDOR" NVARCHAR2(128), 
	"WVERSION" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RCIM_IDECONTROLLER
--------------------------------------------------------

  CREATE TABLE "RCIM_IDECONTROLLER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADDITIONALAVAILABILITY" NVARCHAR2(255), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WIDENTIFYINGDESCRIPTIONS" NVARCHAR2(255), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" FLOAT(126), 
	"WMAXNUMBERCONTROLLED" FLOAT(126), 
	"WMAXQUIESCETIME" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(255), 
	"WPOWERMANAGEMENTCAPABILITIES" NVARCHAR2(255), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPOWERONHOURS" FLOAT(126), 
	"WPROTOCOLDESCRIPTION" NVARCHAR2(128), 
	"WPROTOCOLSUPPORTED" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTRESET" DATE, 
	"WTOTALPOWERONHOURS" FLOAT(126)
   )
--------------------------------------------------------
--  DDL for Table RCIM_LOGICALDISK
--------------------------------------------------------

  CREATE TABLE "RCIM_LOGICALDISK" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCESS" NUMBER(*,0), 
	"WADDITIONALAVAILABILITY" NVARCHAR2(255), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBLOCKSIZE" FLOAT(126), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONSUMABLEBLOCKS" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDATAORGANIZATION" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WIDENTIFYINGDESCRIPTIONS" NVARCHAR2(255), 
	"WINSTALLDATE" DATE, 
	"WISBASEDONUNDERLYINGREDUNDANCY" NUMBER(*,0), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMAXQUIESCETIME" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFBLOCKS" NUMBER(*,0), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(255), 
	"WPOWERMANAGEMENTCAPABILITIES" NVARCHAR2(255), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPOWERONHOURS" NUMBER(*,0), 
	"WPURPOSE" NVARCHAR2(128), 
	"WSEQUENTIALACCESS" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTOTALPOWERONHOURS" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RCIM_LOGICALDISKBASEDONVOLUME
--------------------------------------------------------

  CREATE TABLE "RCIM_LOGICALDISKBASEDONVOLUME" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WANTECEDENT" NVARCHAR2(255), 
	"WDEPENDENT" NVARCHAR2(255), 
	"WNAMESPACE" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RCIM_MEDIAPRESENT
--------------------------------------------------------

  CREATE TABLE "RCIM_MEDIAPRESENT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WANTECEDENT" NVARCHAR2(255), 
	"WDEPENDENT" NVARCHAR2(255), 
	"WFIXEDMEDIA" NUMBER(*,0), 
	"WNAMESPACE" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RCIM_NFS
--------------------------------------------------------

  CREATE TABLE "RCIM_NFS" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WATTRIBUTECACHING" NUMBER(*,0), 
	"WATTRCACHINGFORDIRECTORIESMAX" NUMBER(*,0), 
	"WATTRCACHINGFORDIRECTORIESMIN" NUMBER(*,0), 
	"WATTRCACHINGFORREGULARFILESMAX" NUMBER(*,0), 
	"WATTRCACHINGFORREGULARFILESMIN" NUMBER(*,0), 
	"WAVAILABLESPACE" FLOAT(126), 
	"WBLOCKSIZE" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCASEPRESERVED" NUMBER(*,0), 
	"WCASESENSITIVE" NVARCHAR2(128), 
	"WCLUSTERSIZE" NUMBER(*,0), 
	"WCODESET" NUMBER(*,0), 
	"WCOMPRESSIONMETHOD" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WENCRYPTIONMETHOD" NVARCHAR2(128), 
	"WFILESYSTEMSIZE" FLOAT(126), 
	"WFILESYSTEMTYPE" NVARCHAR2(128), 
	"WFOREGROUNDMOUNT" NUMBER(*,0), 
	"WHARDMOUNT" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WINTERRUPT" NUMBER(*,0), 
	"WMAXFILENAMELENGTH" NUMBER(*,0), 
	"WMOUNTFAILURERETRIES" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WREADBUFFERSIZE" NUMBER(*,0), 
	"WREADONLY" NUMBER(*,0), 
	"WRETRANSMISSIONATTEMPTS" NUMBER(*,0), 
	"WRETRANSMISSIONTIMEOUT" NUMBER(*,0), 
	"WROOT" NVARCHAR2(128), 
	"WSERVERCOMMUNICATIONPORT" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WWRITEBUFFERSIZE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RCIM_OPERATINGSYSTEM
--------------------------------------------------------

  CREATE TABLE "RCIM_OPERATINGSYSTEM" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WALLOCATEDSWAPSPACE" FLOAT(126), 
	"WAVAILABLESWAPSPACE" FLOAT(126), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WCURRENTTIMEZONE" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(255), 
	"WDISTRIBUTED" NUMBER(*,0), 
	"WFREEPHYSICALMEMORY" FLOAT(126), 
	"WFREESPACEINPAGINGFILES" FLOAT(126), 
	"WFREEVIRTUALMEMORY" FLOAT(126), 
	"WINSTALLDATE" NVARCHAR2(128), 
	"WLASTBOOTUPTIME" DATE, 
	"WLOADAVERAGEFIFTEENMINUTES" NVARCHAR2(128), 
	"WLOADAVERAGEFIVEMINUTES" NVARCHAR2(128), 
	"WLOADAVERAGEONEMINUTE" NVARCHAR2(128), 
	"WLOCALDATETIME" DATE, 
	"WMAXNUMBEROFPROCESSES" NUMBER(*,0), 
	"WMAXPROCESSESPERUSER" NUMBER(*,0), 
	"WMAXPROCESSMEMORYSIZE" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFLICENSEDUSERS" NUMBER(*,0), 
	"WNUMBEROFPROCESSES" NUMBER(*,0), 
	"WNUMBEROFUSERS" NUMBER(*,0), 
	"WOPERATINGSYSTEMCAPABILITY" NVARCHAR2(128), 
	"WOSTYPE" NUMBER(*,0), 
	"WOTHERTYPEDESCRIPTION" NVARCHAR2(255), 
	"WOTHERVERSIONDESCRIPTION" NVARCHAR2(128), 
	"WRESERVEDSWAPSPACE" FLOAT(126), 
	"WSIZESTOREDINPAGINGFILES" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128), 
	"WSYSTEMUPTIME" FLOAT(126), 
	"WTOTALSWAPSPACESIZE" FLOAT(126), 
	"WTOTALVIRTUALMEMORYSIZE" FLOAT(126), 
	"WTOTALVISIBLEMEMORYSIZE" FLOAT(126), 
	"WUSEDSWAPSPACE" FLOAT(126), 
	"WVERSION" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCIM_PARALLELCONTROLLER
--------------------------------------------------------

  CREATE TABLE "RCIM_PARALLELCONTROLLER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADDITIONALAVAILABILITY" NVARCHAR2(255), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPABILITIES" NVARCHAR2(255), 
	"WCAPABILITYDESCRIPTIONS" NVARCHAR2(255), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WDMASUPPORTED" NUMBER(*,0), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WIDENTIFYINGDESCRIPTIONS" NVARCHAR2(255), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMAXNUMBERCONTROLLED" NUMBER(*,0), 
	"WMAXQUISCETIME" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(255), 
	"WPOWERMANAGEMENTCAPABILITIES" NVARCHAR2(255), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPOWERONHOURS" NUMBER(*,0), 
	"WPROTOCOLDESCRIPTIONS" NVARCHAR2(128), 
	"WPROTOCOLSUPPORTED" NUMBER(*,0), 
	"WSECURITY" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTRESET" DATE, 
	"WTOTALPOWERONHOURS" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RCIM_PROCESS
--------------------------------------------------------

  CREATE TABLE "RCIM_PROCESS" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WBOUNDPROCESSORNUMBER" NVARCHAR2(128), 
	"WBOUNDPROCESSORSET" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCREATIONDATE" DATE, 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WCUMULATIVEEXECUTIONTIME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WELAPSEDTIME" NVARCHAR2(128), 
	"WEXECUTINGCOMMAND" NVARCHAR2(128), 
	"WEXECUTIONSTATE" NUMBER(*,0), 
	"WGROUPHANDLE" NVARCHAR2(128), 
	"WHANDLE" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WKERNELMODETIME" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WOSNAME" NVARCHAR2(128), 
	"WOTHEREXECUTIONDESCRIPTION" NVARCHAR2(128), 
	"WPARAMETERS" NVARCHAR2(128), 
	"WPARAMETERS2" NVARCHAR2(128), 
	"WPARAMETERS3" NVARCHAR2(128), 
	"WPARAMETERS4" NVARCHAR2(128), 
	"WPARAMETERS5" NVARCHAR2(128), 
	"WPARAMETERS6" NVARCHAR2(128), 
	"WPARAMETERS7" NVARCHAR2(128), 
	"WPARAMETERS8" NVARCHAR2(128), 
	"WPARAMETERS9" NVARCHAR2(128), 
	"WPARAMETERS10" NVARCHAR2(128), 
	"WPARAMETERS11" NVARCHAR2(128), 
	"WPARAMETERS12" NVARCHAR2(128), 
	"WPARAMETERS13" NVARCHAR2(128), 
	"WPARENTHANDLE" NVARCHAR2(128), 
	"WPARENTPROCESSID" NVARCHAR2(128), 
	"WPERCENTCPUTIME" NVARCHAR2(128), 
	"WPERCENTMEMORYSIZE" NVARCHAR2(128), 
	"WPRIORITY" NUMBER(*,0), 
	"WPROCESSCONTROLLINGTERMINAL" NVARCHAR2(128), 
	"WPROCESSEXECUTABLE" NVARCHAR2(128), 
	"WPROCESSGROUPID" FLOAT(126), 
	"WPROCESSID" NVARCHAR2(128), 
	"WPROCESSLWPCOUNT" NVARCHAR2(128), 
	"WPROCESSLWPID" NVARCHAR2(128), 
	"WPROCESSMEMORYADDR" NVARCHAR2(128), 
	"WPROCESSNICEVALUE" NUMBER(*,0), 
	"WPROCESSOWNER" NVARCHAR2(128), 
	"WPROCESSRESIDENTSETSIZE" FLOAT(126), 
	"WPROCESSSCHEDULINGCLASS" NVARCHAR2(128), 
	"WPROCESSSID" NVARCHAR2(128), 
	"WPROCESSSESSIONID" FLOAT(126), 
	"WPROCESSSTARTTIME" NVARCHAR2(128), 
	"WPROCESSSTATESTRING" NVARCHAR2(128), 
	"WPROCESSTTY" NVARCHAR2(128), 
	"WPROCESSUSERPRIORITY" NVARCHAR2(128), 
	"WPROCESSVMSIZE" FLOAT(126), 
	"WPROCESSWAITINGADDR" NVARCHAR2(128), 
	"WPROJECTID" NVARCHAR2(128), 
	"WREALUSERID" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128), 
	"WSYSTEMSCHEDULINGPRIORITY" NVARCHAR2(128), 
	"WTASKID" NVARCHAR2(128), 
	"WTERMINATIONDATE" DATE, 
	"WUSERKERNELMODETIME" FLOAT(126), 
	"WUSERMODETIME" FLOAT(126), 
	"WWORKINGSETSIZE" FLOAT(126)
   )
--------------------------------------------------------
--  DDL for Table RCIM_PROCESSOR
--------------------------------------------------------

  CREATE TABLE "RCIM_PROCESSOR" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADDITIONALAVAILABILITY" NVARCHAR2(255), 
	"WADDRESSWIDTH" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCPUSTATUS" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCURRENTCLOCKSPEED" NUMBER(*,0), 
	"WDATAWIDTH" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WFAMILY" NUMBER(*,0), 
	"WIDENTIFYINGDESCRIPTION" NVARCHAR2(255), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WLOADPERCENTAGE" NUMBER(*,0), 
	"WMAXCLOCKSPEED" NUMBER(*,0), 
	"WMAXQUIESCETIME" NVARCHAR2(32), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOTHERFAMILYDESCRIPTION" NVARCHAR2(128), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(255), 
	"WPOWERMANAGEMENTCAPABILITIES" NVARCHAR2(255), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPOWERONHOURS" NVARCHAR2(128), 
	"WROLE" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSTEPPING" NVARCHAR2(128), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTOTALPOWERONHOURS" NVARCHAR2(32), 
	"WUNIQUEID" NVARCHAR2(128), 
	"WUPGRADEMETHOD" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RCIM_PRODUCT
--------------------------------------------------------

  CREATE TABLE "RCIM_PRODUCT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(255), 
	"WDESCRIPTION" NVARCHAR2(255), 
	"WIDENTIFYINGNUMBER" NVARCHAR2(255), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSKUNUMBER" NVARCHAR2(128), 
	"WVENDOR" NVARCHAR2(128), 
	"WVERSION" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RCIM_PRODUCTSOFTWAREFEATURES
--------------------------------------------------------

  CREATE TABLE "RCIM_PRODUCTSOFTWAREFEATURES" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCOMPONENT" NVARCHAR2(255), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPRODUCT" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RCIM_RESIDESONEXTENT
--------------------------------------------------------

  CREATE TABLE "RCIM_RESIDESONEXTENT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WANTECEDENT" NVARCHAR2(255), 
	"WDEPENDENT" NVARCHAR2(255), 
	"WNAMESPACE" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RCIM_SCSICONTROLLER
--------------------------------------------------------

  CREATE TABLE "RCIM_SCSICONTROLLER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADDITIONALAVAILABILITY" NVARCHAR2(255), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONTROLLERTIMEOUTS" FLOAT(126), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WIDENTIFYINGDESCRIPTION" NVARCHAR2(255), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" FLOAT(126), 
	"WMAXDATAWIDTH" FLOAT(126), 
	"WMAXNUMBERCONTROLLED" FLOAT(126), 
	"WMAXQUIESCETIME" FLOAT(126), 
	"WMAXTRANSFERRATE" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(255), 
	"WPOWERMANAGEMENTCAPABILITIES" NVARCHAR2(255), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPOWERONHOURS" FLOAT(126), 
	"WPROTECTIONMANAGEMENT" NUMBER(*,0), 
	"WPROTOCOLDESCRIPTION" NVARCHAR2(128), 
	"WPROTOCOLSUPPORTED" NUMBER(*,0), 
	"WSIGNALCAPABILITIES" NVARCHAR2(255), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTRESET" DATE, 
	"WTOTALPOWERONHOURS" FLOAT(126)
   )
--------------------------------------------------------
--  DDL for Table RCIM_SCSIINTERFACE
--------------------------------------------------------

  CREATE TABLE "RCIM_SCSIINTERFACE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCESSSTATE" NUMBER(*,0), 
	"WANTECEDENT" NVARCHAR2(255), 
	"WDEPENDENT" NVARCHAR2(255), 
	"WINITIATORID" FLOAT(126), 
	"WMAXQUEUEDEPTH" FLOAT(126), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNEGOTIATEDDATAWIDTH" FLOAT(126), 
	"WNEGOTIATEDSPEED" FLOAT(126), 
	"WNUMBEROFHARDRESETS" FLOAT(126), 
	"WNUMBEROFSOFTRESETS" FLOAT(126), 
	"WQUEUEDEPTHLIMIT" FLOAT(126), 
	"WSCSIRESERVATION" NUMBER(*,0), 
	"WSCSIRETRIES" FLOAT(126), 
	"WSCSISIGNAL" NUMBER(*,0), 
	"WSCSITIMEOUTS" FLOAT(126), 
	"WTARGETID" FLOAT(126), 
	"WTARGETLUN" FLOAT(126), 
	"WTIMEOFDEVICERESET" DATE
   )
--------------------------------------------------------
--  DDL for Table RCIM_SERVICE
--------------------------------------------------------

  CREATE TABLE "RCIM_SERVICE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSTARTED" NUMBER(*,0), 
	"WSTARTMODE" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RCIM_SOFTWAREELEMENT
--------------------------------------------------------

  CREATE TABLE "RCIM_SOFTWAREELEMENT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WBUILDNUMBER" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(255), 
	"WCODESET" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(500), 
	"WIDENTIFICATIONCODE" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLANGUAGEEDITION" NVARCHAR2(128), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOTHERTARGETOS" NVARCHAR2(128), 
	"WSERIALNUMBER" NVARCHAR2(128), 
	"WSOFTWAREELEMENTID" NVARCHAR2(128), 
	"WSOFTWAREELEMENTSTATE" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WTARGETOPERATINGSYSTEM" NUMBER(*,0), 
	"WVERSION" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RCIM_SOFTWAREFEATURE
--------------------------------------------------------

  CREATE TABLE "RCIM_SOFTWAREFEATURE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WIDENTIFYINGNUMBER" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WNAME" NVARCHAR2(64), 
	"WNAMESPACE" NVARCHAR2(64), 
	"WPRODUCTNAME" NVARCHAR2(64), 
	"WVENDOR" NVARCHAR2(128), 
	"WVERSION" NVARCHAR2(64)
   )
--------------------------------------------------------
--  DDL for Table RCIM_SOFTWAREFEATUREELEMENTS
--------------------------------------------------------

  CREATE TABLE "RCIM_SOFTWAREFEATUREELEMENTS" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WGROUPCOMPONENT" NVARCHAR2(400), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPARTCOMPONENT" NVARCHAR2(400)
   )
--------------------------------------------------------
--  DDL for Table RCIM_STORAGEVOLUME
--------------------------------------------------------

  CREATE TABLE "RCIM_STORAGEVOLUME" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCESS" NUMBER(*,0), 
	"WADDITIONALAVAILABILITY" NVARCHAR2(255), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBLOCKSIZE" FLOAT(126), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONSUMABLEBLOCKS" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDATAORGANIZATION" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WIDENTIFYINGDESCRIPTIONS" NVARCHAR2(255), 
	"WINSTALLDATE" DATE, 
	"WISBASEDONUNDERLYINGREDUNDANCY" NUMBER(*,0), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMAXQUIESCETIME" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFBLOCKS" NUMBER(*,0), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(255), 
	"WPOWERMANAGEMENTCAPABILITIES" NVARCHAR2(255), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPOWERONHOURS" NUMBER(*,0), 
	"WPURPOSE" NVARCHAR2(128), 
	"WSEQUENTIALACCESS" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTOTALPOWERONHOURS" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RCIM_UNIXCOMPUTERSYSTEM
--------------------------------------------------------

  CREATE TABLE "RCIM_UNIXCOMPUTERSYSTEM" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDEDICATED" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WIDENTIFYINGDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTLOADINFO" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMEFORMAT" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERSTATE" NUMBER(*,0), 
	"WPRIMARYOWNERCONTACT" NVARCHAR2(128), 
	"WPRIMARYOWNERNAME" NVARCHAR2(128), 
	"WRESETCAPABILITY" NUMBER(*,0), 
	"WROLES" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RCIM_UNIXLOCALFILESYSTEM
--------------------------------------------------------

  CREATE TABLE "RCIM_UNIXLOCALFILESYSTEM" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCESSMODE" NVARCHAR2(128), 
	"WAVAILABLESPACE" FLOAT(126), 
	"WBLOCKSIZE" NUMBER(*,0), 
	"WBOOTABLE" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCASEPRESERVED" NUMBER(*,0), 
	"WCASESENSITIVE" NUMBER(*,0), 
	"WCLUSTERSIZE" NUMBER(*,0), 
	"WCODESET" NVARCHAR2(255), 
	"WCOMPRESSIONMETHOD" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WENCRYPTIONMETHOD" NVARCHAR2(128), 
	"WFILESYSTEMSIZE" FLOAT(126), 
	"WFILESYSTEMTYPE" NVARCHAR2(128), 
	"WFREESLOTS" FLOAT(126), 
	"WINSTALLDATE" DATE, 
	"WMAXFILENAMELENGTH" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WREADONLY" NUMBER(*,0), 
	"WRESERVEDCAPACITY" FLOAT(126), 
	"WROOT" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WTOTALSLOTS" FLOAT(126)
   )
--------------------------------------------------------
--  DDL for Table RCIM_UNIXOPERATINGSYSTEM
--------------------------------------------------------

  CREATE TABLE "RCIM_UNIXOPERATINGSYSTEM" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WCURRENTTIMEZONE" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDISTRIBUTED" NUMBER(*,0), 
	"WFREEPHYSICALMEMORY" FLOAT(126), 
	"WFREESPACEINPAGINGFILES" FLOAT(126), 
	"WFREEVIRTUALMEMORY" FLOAT(126), 
	"WINSTALLDATE" DATE, 
	"WLASTBOOTUPTIME" DATE, 
	"WLOCALDATETIME" DATE, 
	"WMAXNUMBEROFPROCESSES" NUMBER(*,0), 
	"WMAXPROCESSESPERUSER" NUMBER(*,0), 
	"WMAXPROCESSMEMORYSIZE" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFLICENSEDUSERS" NUMBER(*,0), 
	"WNUMBEROFPROCESSES" NUMBER(*,0), 
	"WNUMBEROFUSERS" NUMBER(*,0), 
	"WOSTYPE" NUMBER(*,0), 
	"WOTHERTYPEDESCRIPTION" NVARCHAR2(128), 
	"WSIZESTOREDINPAGINGFILES" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128), 
	"WTOTALSWAPSPACESIZE" FLOAT(126), 
	"WTOTALVIRTUALMEMORYSIZE" FLOAT(126), 
	"WTOTALVISIBLEMEMORYSIZE" FLOAT(126), 
	"WVERSION" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RHP_BIOSENUMERATION
--------------------------------------------------------

  CREATE TABLE "RHP_BIOSENUMERATION" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACTIVE" NUMBER(*,0), 
	"WCURRENTVALUE" NVARCHAR2(128), 
	"WDISPLAYINUI" NUMBER(*,0), 
	"WINSTANCENAME" NVARCHAR2(128), 
	"WISREADONLY" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPATH" NVARCHAR2(255), 
	"WPOSSIBLEVALUES" NVARCHAR2(128), 
	"WPOSSIBLEVALUES2" NVARCHAR2(128), 
	"WPOSSIBLEVALUES3" NVARCHAR2(128), 
	"WPOSSIBLEVALUES4" NVARCHAR2(128), 
	"WPOSSIBLEVALUES5" NVARCHAR2(128), 
	"WPOSSIBLEVALUES6" NVARCHAR2(128), 
	"WPOSSIBLEVALUES7" NVARCHAR2(128), 
	"WPOSSIBLEVALUES8" NVARCHAR2(128), 
	"WPOSSIBLEVALUES9" NVARCHAR2(128), 
	"WPOSSIBLEVALUES10" NVARCHAR2(128), 
	"WPOSSIBLEVALUES11" NVARCHAR2(128), 
	"WPOSSIBLEVALUES12" NVARCHAR2(128), 
	"WPREREQUISITES" NVARCHAR2(128), 
	"WREQUIRESPHYSICALPRESENCE" NUMBER(*,0), 
	"WSELECTIONINDEX" NUMBER(*,0), 
	"WSEQUENCE" NUMBER(*,0), 
	"WSIZE" NUMBER(*,0), 
	"WVALUE" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RHP_BIOSEVENT
--------------------------------------------------------

  CREATE TABLE "RHP_BIOSEVENT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACTIVE" NVARCHAR2(128), 
	"WCATEGORY" NVARCHAR2(128), 
	"WCOLLECTIONTIME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICENAME" NVARCHAR2(128), 
	"WINSTANCENAME" NVARCHAR2(128), 
	"WLOGGEDONUSER" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSECURITY_DESCRIPTOR" NVARCHAR2(128), 
	"WSEVERITY" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WTIME_CREATED" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RHP_BIOSINTEGER
--------------------------------------------------------

  CREATE TABLE "RHP_BIOSINTEGER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACTIVE" NUMBER(*,0), 
	"WDISPLAYINUI" NUMBER(*,0), 
	"WINSTANCENAME" NVARCHAR2(128), 
	"WINTVALUE" NUMBER(*,0), 
	"WISREADONLY" NUMBER(*,0), 
	"WLOWERBOUND" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPATH" NVARCHAR2(255), 
	"WPREREQUISITES" NVARCHAR2(128), 
	"WREQUIRESPHYSICALPRESENCE" NUMBER(*,0), 
	"WSEQUENCE" NUMBER(*,0), 
	"WUPPERBOUND" NUMBER(*,0), 
	"WVALUE" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RHP_BIOSORDEREDLIST
--------------------------------------------------------

  CREATE TABLE "RHP_BIOSORDEREDLIST" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACTIVE" NUMBER(*,0), 
	"WDISPLAYINUI" NUMBER(*,0), 
	"WELEMENTS" NVARCHAR2(128), 
	"WELEMENTS2" NVARCHAR2(128), 
	"WELEMENTS3" NVARCHAR2(128), 
	"WELEMENTS4" NVARCHAR2(128), 
	"WELEMENTS5" NVARCHAR2(128), 
	"WELEMENTS6" NVARCHAR2(128), 
	"WELEMENTS7" NVARCHAR2(128), 
	"WELEMENTS8" NVARCHAR2(128), 
	"WELEMENTS9" NVARCHAR2(128), 
	"WELEMENTS10" NVARCHAR2(128), 
	"WELEMENTS11" NVARCHAR2(128), 
	"WELEMENTS12" NVARCHAR2(128), 
	"WELEMENTS13" NVARCHAR2(128), 
	"WELEMENTS14" NVARCHAR2(128), 
	"WELEMENTS15" NVARCHAR2(128), 
	"WELEMENTS16" NVARCHAR2(128), 
	"WINSTANCENAME" NVARCHAR2(128), 
	"WISREADONLY" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPATH" NVARCHAR2(255), 
	"WPREREQUISITES" NVARCHAR2(128), 
	"WREQUIRESPHYSICALPRESENCE" NUMBER(*,0), 
	"WSEQUENCE" NUMBER(*,0), 
	"WSIZE" NUMBER(*,0), 
	"WVALUE" NVARCHAR2(512)
   )
--------------------------------------------------------
--  DDL for Table RHP_BIOSPASSWORD
--------------------------------------------------------

  CREATE TABLE "RHP_BIOSPASSWORD" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACTIVE" NUMBER(*,0), 
	"WDISPLAYINUI" NUMBER(*,0), 
	"WINSTANCENAME" NVARCHAR2(128), 
	"WISREADONLY" NUMBER(*,0), 
	"WISSET" NUMBER(*,0), 
	"WMAXLENGTH" NUMBER(*,0), 
	"WMINLENGTH" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPATH" NVARCHAR2(255), 
	"WPREREQUISITES" NVARCHAR2(128), 
	"WREQUIRESPHYSICALPRESENCE" NUMBER(*,0), 
	"WSEQUENCE" NUMBER(*,0), 
	"WSUPPORTEDENCODING" NVARCHAR2(128), 
	"WSUPPORTEDENCODING2" NVARCHAR2(128), 
	"WVALUE" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RHP_BIOSSENSOR
--------------------------------------------------------

  CREATE TABLE "RHP_BIOSSENSOR" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACTIVE" NVARCHAR2(128), 
	"WBASEUNITS" NVARCHAR2(128), 
	"WCOLLECTIONTIME" NVARCHAR2(128), 
	"WCURRENTREADING" NVARCHAR2(128), 
	"WCURRENTSTATE" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICENAME" NVARCHAR2(128), 
	"WINSTANCENAME" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOPERATIONALSTATUS" NVARCHAR2(128), 
	"WOTHERSENSORTYPE" NVARCHAR2(128), 
	"WPOSSIBLESTATES" NVARCHAR2(128), 
	"WSENSORTYPE" NVARCHAR2(128), 
	"WUNITMODIFIER" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RHP_BIOSSTRING
--------------------------------------------------------

  CREATE TABLE "RHP_BIOSSTRING" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACTIVE" NUMBER(*,0), 
	"WDISPLAYINUI" NUMBER(*,0), 
	"WINSTANCENAME" NVARCHAR2(128), 
	"WISREADONLY" NUMBER(*,0), 
	"WMAXLENGTH" NUMBER(*,0), 
	"WMINLENGTH" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPATH" NVARCHAR2(255), 
	"WPREREQUISITES" NVARCHAR2(128), 
	"WREQUIRESPHYSICALPRESENCE" NUMBER(*,0), 
	"WSEQUENCE" NUMBER(*,0), 
	"WVALUE" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RMSSD_ATTRIBUTEDATA
--------------------------------------------------------

  CREATE TABLE "RMSSD_ATTRIBUTEDATA" 
   (	"MTIME" DATE, 
	"WNAMESPACE" NVARCHAR2(128), 
	"USERID" NVARCHAR2(50), 
	"WTHRESHOLD" NUMBER(*,0), 
	"WATTRIBUTEID" NUMBER(*,0), 
	"WNORMALIZEDVALUE" NUMBER(*,0), 
	"WINSTANCENAME" NVARCHAR2(128), 
	"WCOLLECTIONTIME" DATE, 
	"WWORSTVALUE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RMSSD_FAILUREPREDICTSTATUS
--------------------------------------------------------

  CREATE TABLE "RMSSD_FAILUREPREDICTSTATUS" 
   (	"MTIME" DATE, 
	"WNAMESPACE" NVARCHAR2(128), 
	"USERID" NVARCHAR2(50), 
	"WINSTANCENAME" NVARCHAR2(128), 
	"WPREDICTFAILURE" NUMBER(*,0), 
	"WACTIVE" NUMBER(*,0), 
	"WREASON" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RNVD_DOWNLOADSTATISTICS
--------------------------------------------------------

  CREATE TABLE "RNVD_DOWNLOADSTATISTICS" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WDURATION" NUMBER(*,0), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNBYTESRCV" NUMBER(*,0), 
	"WNBYTESREJ" NUMBER(*,0), 
	"WNBYTESREQ" NUMBER(*,0), 
	"WNFILESRCV" NUMBER(*,0), 
	"WNFILESREJ" NUMBER(*,0), 
	"WNFILESREQ" NUMBER(*,0), 
	"WNPKTSDRP" NUMBER(*,0), 
	"WNPKTSRCV" NUMBER(*,0), 
	"WSERVICEID" NVARCHAR2(128), 
	"WSOURCEID" NVARCHAR2(128), 
	"WSOURCETYPE" NVARCHAR2(128), 
	"WSTARTTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table RNVD_GROUPACCOUNT
--------------------------------------------------------

  CREATE TABLE "RNVD_GROUPACCOUNT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOMMONNAME" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RNVD_GROUPMEMBER
--------------------------------------------------------

  CREATE TABLE "RNVD_GROUPMEMBER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WGROUPACCOUNT" NVARCHAR2(255), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WUSERACCOUNT" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RNVD_INSTALLED_APPS
--------------------------------------------------------

  CREATE TABLE "RNVD_INSTALLED_APPS" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCMINTERNALVERSION" NVARCHAR2(128), 
	"WCMNATIVE" NUMBER(*,0), 
	"WCMSTPEXTENSIONDLL" NVARCHAR2(128), 
	"WCOMMENTS" NVARCHAR2(255), 
	"WCOMPANYNAME" NVARCHAR2(128), 
	"WDEFAULT" NVARCHAR2(128), 
	"WFILEDESCRIPTION" NVARCHAR2(128), 
	"WFILEVERSION" NVARCHAR2(128), 
	"WHIVE" NVARCHAR2(128), 
	"WINTERNALNAME" NVARCHAR2(128), 
	"WLANGUAGE" NVARCHAR2(128), 
	"WLEGALCOPYRIGHT" NVARCHAR2(255), 
	"WLEGALTRADEMARKS" NVARCHAR2(255), 
	"WLEGALTRADEMARKS1" NVARCHAR2(128), 
	"WLEGALTRADEMARKS2" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WORIGINALFILENAME" NVARCHAR2(128), 
	"WPATH" NVARCHAR2(255), 
	"WPRODUCTNAME" NVARCHAR2(128), 
	"WPRODUCTVERSION" NVARCHAR2(128), 
	"WSUBKEY" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RNVD_INSTALLED_UNINSTALL
--------------------------------------------------------

  CREATE TABLE "RNVD_INSTALLED_UNINSTALL" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAUTHORIZEDCDFPREFIX" NVARCHAR2(128), 
	"WCOMMENTS" NVARCHAR2(255), 
	"WCONTACT" NVARCHAR2(128), 
	"WDEFAULT" NVARCHAR2(128), 
	"WDISPLAYNAME" NVARCHAR2(128), 
	"WDISPLAYVERSION" NVARCHAR2(128), 
	"WESTIMATEDSIZE" NUMBER(*,0), 
	"WHELPLINK" NVARCHAR2(128), 
	"WHELPTELEPHONE" NVARCHAR2(128), 
	"WHIVE" NVARCHAR2(128), 
	"WINSTALLDATE" NVARCHAR2(128), 
	"WINSTALLLOCATION" NVARCHAR2(128), 
	"WINSTALLSOURCE" NVARCHAR2(255), 
	"WLANGUAGE" NVARCHAR2(10), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNOMODIFY" NUMBER(*,0), 
	"WNOREMOVE" NUMBER(*,0), 
	"WNOREPAIR" NUMBER(*,0), 
	"WPRODUCTID" NVARCHAR2(128), 
	"WPUBLISHER" NVARCHAR2(128), 
	"WQUIETUNINSTALLSTRING" NVARCHAR2(128), 
	"WREADME" NVARCHAR2(128), 
	"WREGCOMPANY" NVARCHAR2(128), 
	"WREGOWNER" NVARCHAR2(128), 
	"WREQUIRESIESYSFILE" NVARCHAR2(128), 
	"WREQUIRESWABFILE" NVARCHAR2(128), 
	"WSIZE" NVARCHAR2(128), 
	"WSUBKEY" NVARCHAR2(128), 
	"WSYSTEMCOMPONENT" NUMBER(*,0), 
	"WUNINSTALLSTRING" NVARCHAR2(255), 
	"WURLINFOABOUT" NVARCHAR2(128), 
	"WURLUPDATEINFO" NVARCHAR2(128), 
	"WVERSION" NVARCHAR2(10), 
	"WVERSIONMAJOR" NVARCHAR2(10), 
	"WVERSIONMINOR" NVARCHAR2(10), 
	"WWINDOWSINSTALLER" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RNVD_MULTICASTSTATISTICS
--------------------------------------------------------

  CREATE TABLE "RNVD_MULTICASTSTATISTICS" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WDURATION" NUMBER(*,0), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNBYTESREJ" NUMBER(*,0), 
	"WNBYTESREQ" NUMBER(*,0), 
	"WNBYTESXMT" NUMBER(*,0), 
	"WNCLIENTS" NUMBER(*,0), 
	"WNDEVICES" NUMBER(*,0), 
	"WNFILESREJ" NUMBER(*,0), 
	"WNFILESREQ" NUMBER(*,0), 
	"WNFILESXMT" NUMBER(*,0), 
	"WSERVICEID" NVARCHAR2(128), 
	"WSOURCEID" NVARCHAR2(128), 
	"WSOURCETYPE" NVARCHAR2(128), 
	"WSTARTTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table RNVD_NISGROUPACCOUNT
--------------------------------------------------------

  CREATE TABLE "RNVD_NISGROUPACCOUNT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOMMONNAME" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RNVD_NISUSERACCOUNT
--------------------------------------------------------

  CREATE TABLE "RNVD_NISUSERACCOUNT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDESCRIPTIONS" NVARCHAR2(128), 
	"WHOMEDIRPATHNAME" NVARCHAR2(128), 
	"WHOST" NVARCHAR2(128), 
	"WINITIALSHELL" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLOCALITYNAME" NVARCHAR2(128), 
	"WLOGINNAME" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOBJECTCLASS" NVARCHAR2(128), 
	"WORGANIZATIONNAME" NVARCHAR2(128), 
	"WOU" NVARCHAR2(128), 
	"WPRIMARYGROUP" NVARCHAR2(128), 
	"WSEEALSO" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WUSERCERTIFICATE" NVARCHAR2(128), 
	"WUSERID" NVARCHAR2(128), 
	"WUSERPASSWORD" NVARCHAR2(128), 
	"WUSERUID" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RNVD_PDASYSTEM
--------------------------------------------------------

  CREATE TABLE "RNVD_PDASYSTEM" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMEFORMAT" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPRIMARYOWNERCONTACT" NVARCHAR2(128), 
	"WPRIMARYOWNERNAME" NVARCHAR2(128), 
	"WROLES" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RNVD_PRODUCT
--------------------------------------------------------

  CREATE TABLE "RNVD_PRODUCT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WIDENTIFYINGNUMBER" NVARCHAR2(128), 
	"WINSTALLDATE" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSKUNUMBER" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WVENDOR" NVARCHAR2(128), 
	"WVERSION" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RNVD_SOLARISPATCH
--------------------------------------------------------

  CREATE TABLE "RNVD_SOLARISPATCH" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPATCHINCOMPATIBLES" NVARCHAR2(128), 
	"WPATCHOBSOLETES" NVARCHAR2(255), 
	"WPATCHPACKAGES" NVARCHAR2(255), 
	"WPATCHREQUIRES" NVARCHAR2(255), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RNVD_USERACCOUNT
--------------------------------------------------------

  CREATE TABLE "RNVD_USERACCOUNT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAGEMAX" NUMBER(*,0), 
	"WAGEMIN" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDESCRIPTIONS" NVARCHAR2(128), 
	"WHOMEDIRPATHNAME" NVARCHAR2(128), 
	"WHOST" NVARCHAR2(128), 
	"WINITIALSHELL" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLOCALITYNAME" NVARCHAR2(128), 
	"WLOGINNAME" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOBJECTCLASS" NVARCHAR2(128), 
	"WORGANIZATIONNAME" NVARCHAR2(128), 
	"WOU" NVARCHAR2(128), 
	"WPRIMARYGROUP" NVARCHAR2(128), 
	"WSEEALSO" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WUSERCERTIFICATE" NVARCHAR2(128), 
	"WUSERID" NVARCHAR2(128), 
	"WUSERPASSWORD" NVARCHAR2(128), 
	"WUSERUID" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RNVD_WBEMSTATUS
--------------------------------------------------------

  CREATE TABLE "RNVD_WBEMSTATUS" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RPRODUCT_LICENSES
--------------------------------------------------------

  CREATE TABLE "RPRODUCT_LICENSES" 
   (	"USERID" NVARCHAR2(50), 
	"WLICENSE_KEY" NVARCHAR2(40), 
	"WLICENSE_TYPE" NUMBER(*,0), 
	"WPRODUCT_ID" NVARCHAR2(40), 
	"WPRODUCT_CODE" NVARCHAR2(40), 
	"WINSTALL_DATE" NVARCHAR2(40), 
	"WPRODUCT_NAME" NVARCHAR2(100), 
	"WVENDOR_NAME" NVARCHAR2(100), 
	"WDOMAIN_NAME" NVARCHAR2(100)
   )
--------------------------------------------------------
--  DDL for Table RPT_MASTER_FILTER_PREFERENCES
--------------------------------------------------------

  CREATE TABLE "RPT_MASTER_FILTER_PREFERENCES" 
   (	"MFID" NUMBER(*,0), 
	"DOMAIN_TYPE" VARCHAR2(255), 
	"FILTER_OPTION" VARCHAR2(255), 
	"FILTER_OPTION_NAME" VARCHAR2(255), 
	"OPTIONTYPE" VARCHAR2(255), 
	"OPTION_VALUE" VARCHAR2(255), 
	"DESCRIPTION" VARCHAR2(255), 
	"CREATED_BY" VARCHAR2(255), 
	"MODIFIED_BY" VARCHAR2(255), 
	"MODIFIED_DATETIME" TIMESTAMP (6), 
	"SCOPE" VARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table RPT_USER_FILTER_PREFERENCES
--------------------------------------------------------

  CREATE TABLE "RPT_USER_FILTER_PREFERENCES" 
   (	"FID" NUMBER(10,0), 
	"CREATED_BY" VARCHAR2(255), 
	"DOMAIN_TYPE" VARCHAR2(255), 
	"EMAIL_ID" VARCHAR2(255), 
	"FILTER_NAME" VARCHAR2(255), 
	"MODIFIED_BY" VARCHAR2(255), 
	"MODIFIED_DATETIME" DATE, 
	"SCOPE_TYPE" VARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table RPT_USER_PREF_OPTIONS
--------------------------------------------------------

  CREATE TABLE "RPT_USER_PREF_OPTIONS" 
   (	"FOPTIONID" NUMBER(10,0), 
	"FID" NUMBER(10,0), 
	"FILTER_OPTION" VARCHAR2(255), 
	"FILTER_OPTION_TYPE" VARCHAR2(255), 
	"FILTER_VALUES" VARCHAR2(2000)
   )
--------------------------------------------------------
--  DDL for Table RREGISTRY
--------------------------------------------------------

  CREATE TABLE "RREGISTRY" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WHIVE" NVARCHAR2(128), 
	"WINDEX" NUMBER(*,0), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WREGDATA" NVARCHAR2(128), 
	"WREGNAME" NVARCHAR2(128), 
	"WSUBKEY" NVARCHAR2(255), 
	"WTYPE" NVARCHAR2(128), 
	"W__Q" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RRS_DEVICECACHE
--------------------------------------------------------

  CREATE TABLE "RRS_DEVICECACHE" 
   (	"SESSIONID" NVARCHAR2(128), 
	"FILTERNAME" NVARCHAR2(128), 
	"FILTERVALUE" NVARCHAR2(768), 
	"DEVICENAME" NVARCHAR2(128), 
	"CACHETIME" NUMBER(10,0), 
	"SOURCE" NVARCHAR2(20)
   )
--------------------------------------------------------
--  DDL for Table RRS_DEVICETABLE
--------------------------------------------------------

  CREATE TABLE "RRS_DEVICETABLE" 
   (	"DEVICENAME" VARCHAR2(128), 
	"SESSIONID" VARCHAR2(32)
   )
--------------------------------------------------------
--  DDL for Table RRS_SESSION
--------------------------------------------------------

  CREATE TABLE "RRS_SESSION" 
   (	"SESSIONID" VARCHAR2(32), 
	"SESSIONDATE" DATE
   )
--------------------------------------------------------
--  DDL for Table RWIFI_NETWORKADAPTER
--------------------------------------------------------

  CREATE TABLE "RWIFI_NETWORKADAPTER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADAPTERSTATE" NUMBER(*,0), 
	"WADAPTERTYPE" NVARCHAR2(128), 
	"WADAPTERTYPEID" NUMBER(*,0), 
	"WASSOCIATIONSTATUS" NVARCHAR2(255), 
	"WAUTHENTICATIONSTATUS" NVARCHAR2(255), 
	"WAUTOSENSE" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBAND" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(255), 
	"WCCXPOWERLEVELS" NVARCHAR2(128), 
	"WCCXTPCPOWER" NVARCHAR2(128), 
	"WCCXVERSION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCONNECTIONPREFERENCE" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(255), 
	"WDEVICEID" NVARCHAR2(128), 
	"WDISABLERFCONTROL" NUMBER(*,0), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(255), 
	"WHARDWARERADIOSTATE" NUMBER(*,0), 
	"WIBSSTXPOWER" NUMBER(*,0), 
	"WINDEX" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WINSTALLED" NUMBER(*,0), 
	"WLASTAPPLIEDPROFILE" NVARCHAR2(255), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMACADDRESS" NVARCHAR2(128), 
	"WMANUFACTURER" NVARCHAR2(255), 
	"WMAXNUMBERCONTROLLED" NUMBER(*,0), 
	"WMAXSPEED" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNETCONNECTIONID" NVARCHAR2(128), 
	"WNETCONNECTIONSTATUS" NUMBER(*,0), 
	"WNETWORKADDRESSES" NVARCHAR2(128), 
	"WPERMANENTADDRESS" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPRODUCTNAME" NVARCHAR2(255), 
	"WPROTOCOLPREFERENCE" NUMBER(*,0), 
	"WPSPMODE" NUMBER(*,0), 
	"WRADIOSTATE" NUMBER(*,0), 
	"WREADYFORPROFILESTATE" NUMBER(*,0), 
	"WREGISTRATIONSTATE" NUMBER(*,0), 
	"WSERVICENAME" NVARCHAR2(255), 
	"WSPEED" FLOAT(126), 
	"WSTATUS" NVARCHAR2(255), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSUPPORTEDRATES" NVARCHAR2(128), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTRESET" DATE, 
	"WTXRATE" NVARCHAR2(128), 
	"WWIFIADAPTERTYPE" NVARCHAR2(255), 
	"WXPZEROCONFIGENABLED" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_BASEBOARD
--------------------------------------------------------

  CREATE TABLE "RWIN32_BASEBOARD" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGOPTIONS" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDEPTH" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WHEIGHT" NVARCHAR2(128), 
	"WHOSTINGBOARD" NUMBER(*,0), 
	"WHOTSWAPPABLE" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMODEL" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(128), 
	"WPARTNUMBER" NVARCHAR2(128), 
	"WPOWEREDON" NUMBER(*,0), 
	"WPRODUCT" NVARCHAR2(128), 
	"WREMOVABLE" NUMBER(*,0), 
	"WREPLACEABLE" NUMBER(*,0), 
	"WREQUIREMENTSDESCRIPTION" NVARCHAR2(128), 
	"WREQUIRESDAUGHTERBOARD" NUMBER(*,0), 
	"WSERIALNUMBER" NVARCHAR2(128), 
	"WSKU" NVARCHAR2(128), 
	"WSLOTLAYOUT" NVARCHAR2(128), 
	"WSPECIALREQUIREMENTS" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WTAG" NVARCHAR2(128), 
	"WVERSION" NVARCHAR2(128), 
	"WWEIGHT" NVARCHAR2(128), 
	"WWIDTH" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_BIOS
--------------------------------------------------------

  CREATE TABLE "RWIN32_BIOS" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WBIOSCHARACTERISTICS" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS2" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS3" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS4" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS5" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS6" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS7" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS8" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS9" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS10" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS11" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS12" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS13" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS14" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS15" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS16" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS17" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS18" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS19" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS20" NUMBER(*,0), 
	"WBIOSCHARACTERISTICS21" NUMBER(*,0), 
	"WBUILDNUMBER" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCODESET" NVARCHAR2(128), 
	"WCURRENTLANGUAGE" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WIDENTIFICATIONCODE" NVARCHAR2(128), 
	"WINSTALLABLELANGUAGES" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WLANGUAGEEDITION" NVARCHAR2(128), 
	"WLISTOFLANGUAGES" NVARCHAR2(128), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOTHERTARGETOS" NVARCHAR2(128), 
	"WPRIMARYBIOS" NUMBER(*,0), 
	"WRELEASEDATE" DATE, 
	"WSERIALNUMBER" NVARCHAR2(128), 
	"WSMBIOSBIOSVERSION" NVARCHAR2(128), 
	"WSMBIOSMAJORVERSION" NUMBER(*,0), 
	"WSMBIOSMINORVERSION" NUMBER(*,0), 
	"WSMBIOSPRESENT" NUMBER(*,0), 
	"WSOFTWAREELEMENTID" NVARCHAR2(128), 
	"WSOFTWAREELEMENTSTATE" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WTARGETOPERATINGSYSTEM" NUMBER(*,0), 
	"WVERSION" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_BOOTCONF
--------------------------------------------------------

  CREATE TABLE "RWIN32_BOOTCONF" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WBOOTDIRECTORY" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGURATIONPATH" NVARCHAR2(255), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WLASTDRIVE" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSCRATCHDIRECTORY" NVARCHAR2(128), 
	"WSETTINGID" NVARCHAR2(128), 
	"WTEMPDIRECTORY" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_BUS
--------------------------------------------------------

  CREATE TABLE "RWIN32_BUS" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBUSNUM" NUMBER(*,0), 
	"WBUSTYPE" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_CACHEMEMORY
--------------------------------------------------------

  CREATE TABLE "RWIN32_CACHEMEMORY" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCESS" NUMBER(*,0), 
	"WADDITIONALERRORDATA" NUMBER(*,0), 
	"WASSOCIATIVITY" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBLOCKSIZE" FLOAT(126), 
	"WCACHESPEED" NUMBER(*,0), 
	"WCACHETYPE" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCORRECTABLEERROR" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCURRENTSRAM" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WENDINGADDRESS" FLOAT(126), 
	"WERRORACCESS" NUMBER(*,0), 
	"WERRORADDRESS" FLOAT(126), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORCORRECTTYPE" NUMBER(*,0), 
	"WERRORDATA" NUMBER(*,0), 
	"WERRORDATAORDER" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WERRORINFO" NUMBER(*,0), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WERRORRESOLUTION" FLOAT(126), 
	"WERRORTIME" DATE, 
	"WERRORTRANSFERSIZE" NUMBER(*,0), 
	"WFLUSHTIMER" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WINSTALLEDSIZE" NUMBER(*,0), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WLEVEL" NUMBER(*,0), 
	"WLINESIZE" NUMBER(*,0), 
	"WLOCATION" NUMBER(*,0), 
	"WMAXCACHESIZE" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFBLOCKS" FLOAT(126), 
	"WOTHERERRORDESCRIPTION" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPURPOSE" NVARCHAR2(128), 
	"WREADPOLICY" NUMBER(*,0), 
	"WREPLACEMENTPOLICY" NUMBER(*,0), 
	"WSTARTINGADDRESS" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSUPPORTEDSRAM" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMLEVELADDRESS" NUMBER(*,0), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WWRITEPOLICY" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_CDROMDRIVE
--------------------------------------------------------

  CREATE TABLE "RWIN32_CDROMDRIVE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPABILITIES" NUMBER(*,0), 
	"WCAPABILITIES2" NUMBER(*,0), 
	"WCAPABILITYDESCRIPTIONS" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOMPRESSIONMETHOD" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDEFAULTBLOCKSIZE" FLOAT(126), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WDRIVE" NVARCHAR2(128), 
	"WDRIVEINTEGRITY" NUMBER(*,0), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WFILESYSTEMFLAGS" NUMBER(*,0), 
	"WFILESYSTEMFLAGSEX" NUMBER(*,0), 
	"WID" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMAXBLOCKSIZE" FLOAT(126), 
	"WMAXIMUMCOMPONENTLENGTH" NUMBER(*,0), 
	"WMAXMEDIASIZE" FLOAT(126), 
	"WMEDIALOADED" NUMBER(*,0), 
	"WMEDIATYPE" NVARCHAR2(128), 
	"WMINBLOCKSIZE" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNEEDSCLEANING" NUMBER(*,0), 
	"WNUMBEROFMEDIASUPPORTED" NUMBER(*,0), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WREVISIONLEVEL" NVARCHAR2(128), 
	"WSCSIBUS" NUMBER(*,0), 
	"WSCSILOGICALUNIT" NUMBER(*,0), 
	"WSCSIPORT" NUMBER(*,0), 
	"WSCSITARGETID" NUMBER(*,0), 
	"WSIZE" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTRANSFERRATE" NVARCHAR2(128), 
	"WVOLUMENAME" NVARCHAR2(128), 
	"WVOLUMESERIALNUMBER" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_COMPUTERSYSTEM
--------------------------------------------------------

  CREATE TABLE "RWIN32_COMPUTERSYSTEM" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADMINPASSWORDSTATUS" NUMBER(*,0), 
	"WAUTOMATICRESETBOOTOPTION" NUMBER(*,0), 
	"WAUTOMATICRESETCAPABILITY" NUMBER(*,0), 
	"WBOOTOPTIONONLIMIT" NUMBER(*,0), 
	"WBOOTOPTIONONWATCHDOG" NUMBER(*,0), 
	"WBOOTROMSUPPORTED" NUMBER(*,0), 
	"WBOOTUPSTATE" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCHASSISBOOTUPSTATE" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCURRENTTIMEZONE" NUMBER(*,0), 
	"WDAYLIGHTINEFFECT" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDOMAIN" NVARCHAR2(128), 
	"WDOMAINROLE" NUMBER(*,0), 
	"WFRONTPANELRESETSTATUS" NUMBER(*,0), 
	"WINFRAREDSUPPORTED" NUMBER(*,0), 
	"WINITIALLOADINFO" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WKEYBOARDPASSWORDSTATUS" NUMBER(*,0), 
	"WLASTLOADINFO" NVARCHAR2(128), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMODEL" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMEFORMAT" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNETWORKSERVERMODEENABLED" NUMBER(*,0), 
	"WNUMBEROFPROCESSORS" NUMBER(*,0), 
	"WOEMLOGOBITMAP" NUMBER(*,0), 
	"WOEMSTRINGARRAY" NVARCHAR2(128), 
	"WOEMSTRINGARRAY2" NVARCHAR2(128), 
	"WOEMSTRINGARRAY3" NVARCHAR2(128), 
	"WOEMSTRINGARRAY4" NVARCHAR2(128), 
	"WPAUSEAFTERRESET" FLOAT(126), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPOWERONPASSWORDSTATUS" NUMBER(*,0), 
	"WPOWERSTATE" NUMBER(*,0), 
	"WPOWERSUPPLYSTATE" NUMBER(*,0), 
	"WPRIMARYOWNERCONTACT" NVARCHAR2(128), 
	"WPRIMARYOWNERNAME" NVARCHAR2(128), 
	"WRESETCAPABILITY" NUMBER(*,0), 
	"WRESETCOUNT" NUMBER(*,0), 
	"WRESETLIMIT" NUMBER(*,0), 
	"WROLES" NVARCHAR2(128), 
	"WROLES2" NVARCHAR2(128), 
	"WROLES3" NVARCHAR2(128), 
	"WROLES4" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSUPPORTCONTACTDESCRIPTION" NVARCHAR2(128), 
	"WSYSTEMSTARTUPDELAY" NUMBER(*,0), 
	"WSYSTEMSTARTUPOPTIONS" NVARCHAR2(128), 
	"WSYSTEMSTARTUPOPTIONS2" NVARCHAR2(128), 
	"WSYSTEMSTARTUPOPTIONS3" NVARCHAR2(128), 
	"WSYSTEMSTARTUPOPTIONS4" NVARCHAR2(128), 
	"WSYSTEMSTARTUPSETTING" NUMBER(*,0), 
	"WSYSTEMTYPE" NVARCHAR2(128), 
	"WTHERMALSTATE" NUMBER(*,0), 
	"WTOTALPHYSICALMEMORY" FLOAT(126), 
	"WUSERNAME" NVARCHAR2(128), 
	"WWAKEUPTYPE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_COMPUTERSYSTEMPRODUCT
--------------------------------------------------------

  CREATE TABLE "RWIN32_COMPUTERSYSTEMPRODUCT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WIDENTIFYINGNUMBER" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSKUNUMBER" NVARCHAR2(128), 
	"WUUID" NVARCHAR2(128), 
	"WVENDOR" NVARCHAR2(128), 
	"WVERSION" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_DESKTOP
--------------------------------------------------------

  CREATE TABLE "RWIN32_DESKTOP" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WBORDERWIDTH" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOOLSWITCH" NUMBER(*,0), 
	"WCURSORBLINKRATE" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDRAGFULLWINDOWS" NUMBER(*,0), 
	"WGRIDGRANULARITY" NUMBER(*,0), 
	"WICONSPACING" NUMBER(*,0), 
	"WICONTITLEFACENAME" NVARCHAR2(128), 
	"WICONTITLESIZE" NUMBER(*,0), 
	"WICONTITLEWRAP" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPATTERN" NVARCHAR2(128), 
	"WSCREENSAVERACTIVE" NUMBER(*,0), 
	"WSCREENSAVEREXECUTABLE" NVARCHAR2(128), 
	"WSCREENSAVERSECURE" NUMBER(*,0), 
	"WSCREENSAVERTIMEOUT" NUMBER(*,0), 
	"WSETTINGID" NVARCHAR2(128), 
	"WWALLPAPER" NVARCHAR2(128), 
	"WWALLPAPERSTRETCHED" NUMBER(*,0), 
	"WWALLPAPERTILED" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_DESKTOPMONITOR
--------------------------------------------------------

  CREATE TABLE "RWIN32_DESKTOPMONITOR" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBANDWIDTH" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WDISPLAYTYPE" NUMBER(*,0), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WISLOCKED" NUMBER(*,0), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMONITORMANUFACTURER" NVARCHAR2(128), 
	"WMONITORTYPE" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPIXELSPERXLOGICALINCH" NUMBER(*,0), 
	"WPIXELSPERYLOGICALINCH" NUMBER(*,0), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WSCREENHEIGHT" NUMBER(*,0), 
	"WSCREENWIDTH" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WSERIALNUMBER" NVARCHAR2(14)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_DEVICEMEMORYADDRESS
--------------------------------------------------------

  CREATE TABLE "RWIN32_DEVICEMEMORYADDRESS" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WENDINGADDRESS" FLOAT(126), 
	"WINSTALLDATE" DATE, 
	"WMEMORYTYPE" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSTARTINGADDRESS" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_DISKDRIVE
--------------------------------------------------------

  CREATE TABLE "RWIN32_DISKDRIVE" 
   (	"WMEDIATYPE" NVARCHAR2(128), 
	"WCOMPRESSIONMETHOD" NVARCHAR2(128), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WTOTALHEADS" NUMBER(*,0), 
	"WMAXMEDIASIZE" FLOAT(126), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WSERIALNUMBER" NVARCHAR2(128), 
	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WDEVICEID" NVARCHAR2(128), 
	"WSCSILOGICALUNIT" NUMBER(*,0), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WCAPABILITYDESCRIPTIONS2" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WSIZE" FLOAT(126), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WSCSIPORT" NUMBER(*,0), 
	"WINDEX" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WINTERFACETYPE" NVARCHAR2(128), 
	"WSCSIBUS" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WPARTITIONS" NUMBER(*,0), 
	"WTOTALSECTORS" FLOAT(126), 
	"WNEEDSCLEANING" NUMBER(*,0), 
	"WCAPABILITYDESCRIPTIONS" NVARCHAR2(128), 
	"WTOTALCYLINDERS" FLOAT(126), 
	"WMEDIALOADED" NUMBER(*,0), 
	"WMINBLOCKSIZE" FLOAT(126), 
	"WDEFAULTBLOCKSIZE" FLOAT(126), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WCAPABILITIES2" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WBYTESPERSECTOR" NUMBER(*,0), 
	"WSCSITARGETID" NUMBER(*,0), 
	"WSECTORSPERTRACK" NUMBER(*,0), 
	"WMODEL" NVARCHAR2(128), 
	"WTRACKSPERCYLINDER" NUMBER(*,0), 
	"WCAPABILITIES" NUMBER(*,0), 
	"WNUMBEROFMEDIASUPPORTED" NUMBER(*,0), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WSIGNATURE" NUMBER(*,0), 
	"WTOTALTRACKS" FLOAT(126), 
	"WFIRMWAREREVISION" NVARCHAR2(128), 
	"WMAXBLOCKSIZE" FLOAT(126)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_DISKPARTITION
--------------------------------------------------------

  CREATE TABLE "RWIN32_DISKPARTITION" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCESS" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBLOCKSIZE" FLOAT(126), 
	"WBOOTABLE" NUMBER(*,0), 
	"WBOOTPARTITION" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WDISKINDEX" NUMBER(*,0), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WHIDDENSECTORS" NUMBER(*,0), 
	"WINDEX" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFBLOCKS" FLOAT(126), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPRIMARYPARTITION" NUMBER(*,0), 
	"WPURPOSE" NVARCHAR2(128), 
	"WREWRITEPARTITION" NUMBER(*,0), 
	"WSIZE" FLOAT(126), 
	"WSTARTINGOFFSET" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTYPE" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_DISPLAYCONF
--------------------------------------------------------

  CREATE TABLE "RWIN32_DISPLAYCONF" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WBITSPERPEL" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICENAME" NVARCHAR2(128), 
	"WDISPLAYFLAGS" NUMBER(*,0), 
	"WDISPLAYFREQUENCY" NUMBER(*,0), 
	"WDITHERTYPE" NUMBER(*,0), 
	"WDRIVERVERSION" NVARCHAR2(128), 
	"WICMINTENT" NUMBER(*,0), 
	"WICMMETHOD" NUMBER(*,0), 
	"WLOGPIXELS" NUMBER(*,0), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPELSHEIGHT" NUMBER(*,0), 
	"WPELSWIDTH" NUMBER(*,0), 
	"WSETTINGID" NVARCHAR2(128), 
	"WSPECIFICATIONVERSION" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_DISPLAYCONTROLLERCONF
--------------------------------------------------------

  CREATE TABLE "RWIN32_DISPLAYCONTROLLERCONF" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WBITSPERPIXEL" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOLORPLANES" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEENTRIESINACOLORTABLE" NUMBER(*,0), 
	"WDEVICESPECIFICPENS" NUMBER(*,0), 
	"WHORIZONTALRESOLUTION" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WREFRESHRATE" NUMBER(*,0), 
	"WRESERVEDSYSTEMPALETTEENTRIES" NUMBER(*,0), 
	"WSETTINGID" NVARCHAR2(128), 
	"WSYSTEMPALETTEENTRIES" NUMBER(*,0), 
	"WVERTICALRESOLUTION" NUMBER(*,0), 
	"WVIDEOMODE" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_DMACHANNEL
--------------------------------------------------------

  CREATE TABLE "RWIN32_DMACHANNEL" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADDRESSSIZE" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBURSTMODE" NUMBER(*,0), 
	"WBYTEMODE" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCHANNELTIMING" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDMACHANNEL" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WMAXTRANSFERSIZE" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPORT" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WTRANSFERWIDTHS" NUMBER(*,0), 
	"WTYPECTIMING" NUMBER(*,0), 
	"WWORDMODE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_ENVIRONMENT
--------------------------------------------------------

  CREATE TABLE "RWIN32_ENVIRONMENT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSYSTEMVARIABLE" NUMBER(*,0), 
	"WUSERNAME" NVARCHAR2(128), 
	"WVARIABLEVALUE" NVARCHAR2(512)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_FLOPPYCONTROLLER
--------------------------------------------------------

  CREATE TABLE "RWIN32_FLOPPYCONTROLLER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMAXNUMBERCONTROLLED" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPROTOCOLSUPPORTED" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTRESET" DATE
   )
--------------------------------------------------------
--  DDL for Table RWIN32_FLOPPYDRIVE
--------------------------------------------------------

  CREATE TABLE "RWIN32_FLOPPYDRIVE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPABILITIES" NUMBER(*,0), 
	"WCAPABILITYDESCRIPTIONS" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOMPRESSIONMETHOD" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDEFAULTBLOCKSIZE" FLOAT(126), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMAXBLOCKSIZE" FLOAT(126), 
	"WMAXMEDIASIZE" FLOAT(126), 
	"WMINBLOCKSIZE" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNEEDSCLEANING" NUMBER(*,0), 
	"WNUMBEROFMEDIASUPPORTED" NUMBER(*,0), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_GROUP
--------------------------------------------------------

  CREATE TABLE "RWIN32_GROUP" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(255), 
	"WDOMAIN" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSID" NVARCHAR2(128), 
	"WSIDTYPE" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_IDECONTROLLER
--------------------------------------------------------

  CREATE TABLE "RWIN32_IDECONTROLLER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMAXNUMBERCONTROLLED" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPROTOCOLSUPPORTED" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTRESET" DATE
   )
--------------------------------------------------------
--  DDL for Table RWIN32_IRQRESOURCE
--------------------------------------------------------

  CREATE TABLE "RWIN32_IRQRESOURCE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WHARDWARE" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WIRQNUMBER" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSHAREABLE" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WTRIGGERLEVEL" NUMBER(*,0), 
	"WTRIGGERTYPE" NUMBER(*,0), 
	"WVECTOR" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_KEYBOARD
--------------------------------------------------------

  CREATE TABLE "RWIN32_KEYBOARD" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WISLOCKED" NUMBER(*,0), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WLAYOUT" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFFUNCTIONKEYS" NUMBER(*,0), 
	"WPASSWORD" NUMBER(*,0), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_LOADORDERGROUP
--------------------------------------------------------

  CREATE TABLE "RWIN32_LOADORDERGROUP" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDRIVERENABLED" NUMBER(*,0), 
	"WGROUPORDER" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_LOGICALDISK
--------------------------------------------------------

  CREATE TABLE "RWIN32_LOGICALDISK" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCESS" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBLOCKSIZE" FLOAT(126), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOMPRESSED" NUMBER(*,0), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WDRIVETYPE" NUMBER(*,0), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WFILESYSTEM" NVARCHAR2(128), 
	"WFREESPACE" FLOAT(126), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMAXIMUMCOMPONENTLENGTH" NUMBER(*,0), 
	"WMEDIATYPE" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFBLOCKS" FLOAT(126), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPROVIDERNAME" NVARCHAR2(128), 
	"WPURPOSE" NVARCHAR2(128), 
	"WSIZE" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSUPPORTSFILEBASEDCOMPRESSION" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WVOLUMENAME" NVARCHAR2(128), 
	"WVOLUMESERIALNUMBER" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_LOGICALMEMORYCONF
--------------------------------------------------------

  CREATE TABLE "RWIN32_LOGICALMEMORYCONF" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABLEVIRTUALMEMORY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSETTINGID" NVARCHAR2(128), 
	"WTOTALPAGEFILESPACE" NUMBER(*,0), 
	"WTOTALPHYSICALMEMORY" NUMBER(*,0), 
	"WTOTALVIRTUALMEMORY" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_LOGICALPROGRAMGROUP
--------------------------------------------------------

  CREATE TABLE "RWIN32_LOGICALPROGRAMGROUP" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WGROUPNAME" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WUSERNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_MEMORYARRAY
--------------------------------------------------------

  CREATE TABLE "RWIN32_MEMORYARRAY" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCESS" NUMBER(*,0), 
	"WADDITIONALERRORDATA" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBLOCKSIZE" FLOAT(126), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCORRECTABLEERROR" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WENDINGADDRESS" FLOAT(126), 
	"WERRORACCESS" NUMBER(*,0), 
	"WERRORADDRESS" FLOAT(126), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDATA" NUMBER(*,0), 
	"WERRORDATAORDER" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WERRORGRANULARITY" NUMBER(*,0), 
	"WERRORINFO" NUMBER(*,0), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WERRORRESOLUTION" FLOAT(126), 
	"WERRORTIME" DATE, 
	"WERRORTRANSFERSIZE" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFBLOCKS" FLOAT(126), 
	"WOTHERERRORDESCRIPTION" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPURPOSE" NVARCHAR2(128), 
	"WSTARTINGADDRESS" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMLEVELADDRESS" NUMBER(*,0), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_MEMORYDEVICE
--------------------------------------------------------

  CREATE TABLE "RWIN32_MEMORYDEVICE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCESS" NUMBER(*,0), 
	"WADDITIONALERRORDATA" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBLOCKSIZE" FLOAT(126), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCORRECTABLEERROR" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WENDINGADDRESS" FLOAT(126), 
	"WERRORACCESS" NUMBER(*,0), 
	"WERRORADDRESS" FLOAT(126), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDATA" NUMBER(*,0), 
	"WERRORDATAORDER" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WERRORGRANULARITY" NUMBER(*,0), 
	"WERRORINFO" NUMBER(*,0), 
	"WERRORMETHODOLOGY" NVARCHAR2(128), 
	"WERRORRESOLUTION" FLOAT(126), 
	"WERRORTIME" DATE, 
	"WERRORTRANSFERSIZE" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFBLOCKS" FLOAT(126), 
	"WOTHERERRORDESCRIPTION" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPURPOSE" NVARCHAR2(128), 
	"WSTARTINGADDRESS" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMLEVELADDRESS" NUMBER(*,0), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_MOTHERBOARDDEVICE
--------------------------------------------------------

  CREATE TABLE "RWIN32_MOTHERBOARDDEVICE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPRIMARYBUSTYPE" NVARCHAR2(128), 
	"WREVISIONNUMBER" NVARCHAR2(128), 
	"WSECONDARYBUSTYPE" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_NETWORKADAPTER
--------------------------------------------------------

  CREATE TABLE "RWIN32_NETWORKADAPTER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADAPTERTYPE" NVARCHAR2(128), 
	"WAUTOSENSE" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WINDEX" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WINSTALLED" NUMBER(*,0), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMACADDRESS" NVARCHAR2(128), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMAXNUMBERCONTROLLED" NUMBER(*,0), 
	"WMAXSPEED" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNETWORKADDRESSES" NVARCHAR2(128), 
	"WPERMANENTADDRESS" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPRODUCTNAME" NVARCHAR2(128), 
	"WSERVICENAME" NVARCHAR2(128), 
	"WSPEED" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTRESET" DATE
   )
--------------------------------------------------------
--  DDL for Table RWIN32_NETWORKADAPTERCONF
--------------------------------------------------------

  CREATE TABLE "RWIN32_NETWORKADAPTERCONF" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WARPALWAYSSOURCEROUTE" NUMBER(*,0), 
	"WARPUSEETHERSNAP" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WDATABASEPATH" NVARCHAR2(128), 
	"WDEADGWDETECTENABLED" NUMBER(*,0), 
	"WDEFAULTIPGATEWAY" NVARCHAR2(128), 
	"WDEFAULTTOS" NUMBER(*,0), 
	"WDEFAULTTTL" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDHCPENABLED" NUMBER(*,0), 
	"WDHCPLEASEEXPIRES" DATE, 
	"WDHCPLEASEOBTAINED" DATE, 
	"WDHCPSERVER" NVARCHAR2(128), 
	"WDNSDOMAIN" NVARCHAR2(128), 
	"WDNSDOMAINSUFFIXSEARCHORDER" NVARCHAR2(128), 
	"WDNSENABLEDFORWINSRESOLUTION" NUMBER(*,0), 
	"WDNSHOSTNAME" NVARCHAR2(128), 
	"WDNSSERVERSEARCHORDER" NVARCHAR2(128), 
	"WDOMAINDNSREGISTRATIONENABLED" NUMBER(*,0), 
	"WFORWARDBUFFERMEMORY" NUMBER(*,0), 
	"WFULLDNSREGISTRATIONENABLED" NUMBER(*,0), 
	"WGATEWAYCOSTMETRIC" NUMBER(*,0), 
	"WIGMPLEVEL" NUMBER(*,0), 
	"WINDEX" NUMBER(*,0), 
	"WIPADDRESS" NVARCHAR2(128), 
	"WIPCONNECTIONMETRIC" NUMBER(*,0), 
	"WIPENABLED" NUMBER(*,0), 
	"WIPFILTERSECURITYENABLED" NUMBER(*,0), 
	"WIPPORTSECURITYENABLED" NUMBER(*,0), 
	"WIPSECPERMITIPPROTOCOLS" NVARCHAR2(128), 
	"WIPSECPERMITTCPPORTS" NVARCHAR2(128), 
	"WIPSECPERMITUDPPORTS" NVARCHAR2(128), 
	"WIPSUBNET" NVARCHAR2(128), 
	"WIPUSEZEROBROADCAST" NUMBER(*,0), 
	"WIPXADDRESS" NVARCHAR2(128), 
	"WIPXENABLED" NUMBER(*,0), 
	"WIPXFRAMETYPE" NUMBER(*,0), 
	"WIPXMEDIATYPE" NUMBER(*,0), 
	"WIPXNETWORKNUMBER" NVARCHAR2(128), 
	"WIPXVIRTUALNETNUMBER" NVARCHAR2(128), 
	"WKEEPALIVEINTERVAL" NUMBER(*,0), 
	"WKEEPALIVETIME" NUMBER(*,0), 
	"WMACADDRESS" NVARCHAR2(128), 
	"WMTU" NUMBER(*,0), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMFORWARDPACKETS" NUMBER(*,0), 
	"WPMTUBHDETECTENABLED" NUMBER(*,0), 
	"WPMTUDISCOVERYENABLED" NUMBER(*,0), 
	"WSERVICENAME" NVARCHAR2(128), 
	"WSETTINGID" NVARCHAR2(128), 
	"WTCPIPNETBIOSOPTIONS" NUMBER(*,0), 
	"WTCPMAXCONNECTRETRANSMISSIONS" NUMBER(*,0), 
	"WTCPMAXDATARETRANSMISSIONS" NUMBER(*,0), 
	"WTCPNUMCONNECTIONS" NUMBER(*,0), 
	"WTCPUSERFC1122URGENTPOINTER" NUMBER(*,0), 
	"WTCPWINDOWSIZE" NUMBER(*,0), 
	"WWINSENABLELMHOSTSLOOKUP" NUMBER(*,0), 
	"WWINSHOSTLOOKUPFILE" NVARCHAR2(128), 
	"WWINSPRIMARYSERVER" NVARCHAR2(128), 
	"WWINSSCOPEID" NVARCHAR2(128), 
	"WWINSSECONDARYSERVER" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_NETWORKCONNECTION
--------------------------------------------------------

  CREATE TABLE "RWIN32_NETWORKCONNECTION" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCESSMASK" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOMMENT" NVARCHAR2(128), 
	"WCONNECTIONSTATE" NVARCHAR2(128), 
	"WCONNECTIONTYPE" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDISPLAYTYPE" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLOCALNAME" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPERSISTENT" NUMBER(*,0), 
	"WPROVIDERNAME" NVARCHAR2(128), 
	"WREMOTENAME" NVARCHAR2(128), 
	"WREMOTEPATH" NVARCHAR2(255), 
	"WRESOURCETYPE" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WUSERNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_NETWORKLOGINPROFILE
--------------------------------------------------------

  CREATE TABLE "RWIN32_NETWORKLOGINPROFILE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCOUNTEXPIRES" DATE, 
	"WAUTHORIZATIONFLAGS" NUMBER(*,0), 
	"WBADPASSWORDCOUNT" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCODEPAGE" NUMBER(*,0), 
	"WCOMMENT" NVARCHAR2(128), 
	"WCOUNTRYCODE" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WFLAGS" NUMBER(*,0), 
	"WFULLNAME" NVARCHAR2(128), 
	"WHOMEDIRECTORY" NVARCHAR2(128), 
	"WHOMEDIRECTORYDRIVE" NVARCHAR2(128), 
	"WLASTLOGOFF" DATE, 
	"WLASTLOGON" DATE, 
	"WLOGONHOURS" NVARCHAR2(255), 
	"WLOGONSERVER" NVARCHAR2(128), 
	"WMAXIMUMSTORAGE" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFLOGONS" NUMBER(*,0), 
	"WPARAMETERS" NVARCHAR2(128), 
	"WPASSWORDAGE" NVARCHAR2(14), 
	"WPASSWORDEXPIRES" DATE, 
	"WPRIMARYGROUPID" NUMBER(*,0), 
	"WPRIVILEGES" NUMBER(*,0), 
	"WPROFILE" NVARCHAR2(128), 
	"WSCRIPTPATH" NVARCHAR2(128), 
	"WSETTINGID" NVARCHAR2(128), 
	"WUNITSPERWEEK" NUMBER(*,0), 
	"WUSERCOMMENT" NVARCHAR2(128), 
	"WUSERID" NUMBER(*,0), 
	"WUSERTYPE" NVARCHAR2(128), 
	"WWORKSTATIONS" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_OPERATINGSYSTEM
--------------------------------------------------------

  CREATE TABLE "RWIN32_OPERATINGSYSTEM" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WBOOTDEVICE" NVARCHAR2(128), 
	"WBUILDNUMBER" NVARCHAR2(128), 
	"WBUILDTYPE" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCODESET" NVARCHAR2(128), 
	"WCOUNTRYCODE" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSDVERSION" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WCURRENTTIMEZONE" NUMBER(*,0), 
	"WDEBUG" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDISTRIBUTED" NUMBER(*,0), 
	"WFOREGROUNDAPPLICATIONBOOST" NUMBER(*,0), 
	"WFREEPHYSICALMEMORY" FLOAT(126), 
	"WFREESPACEINPAGINGFILES" FLOAT(126), 
	"WFREEVIRTUALMEMORY" FLOAT(126), 
	"WINSTALLDATE" DATE, 
	"WLASTBOOTUPTIME" DATE, 
	"WLOCALDATETIME" DATE, 
	"WLOCALE" NVARCHAR2(128), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMAXNUMBEROFPROCESSES" NUMBER(*,0), 
	"WMAXPROCESSMEMORYSIZE" FLOAT(126), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFLICENSEDUSERS" NUMBER(*,0), 
	"WNUMBEROFPROCESSES" NUMBER(*,0), 
	"WNUMBEROFUSERS" NUMBER(*,0), 
	"WORGANIZATION" NVARCHAR2(128), 
	"WOSLANGUAGE" NUMBER(*,0), 
	"WOSPRODUCTSUITE" NUMBER(*,0), 
	"WOSTYPE" NUMBER(*,0), 
	"WOTHERTYPEDESCRIPTION" NVARCHAR2(128), 
	"WPLUSPRODUCTID" NVARCHAR2(128), 
	"WPLUSVERSIONNUMBER" NVARCHAR2(128), 
	"WPRIMARY" NUMBER(*,0), 
	"WQUANTUMLENGTH" NUMBER(*,0), 
	"WQUANTUMTYPE" NUMBER(*,0), 
	"WREGISTEREDUSER" NVARCHAR2(128), 
	"WSERIALNUMBER" NVARCHAR2(128), 
	"WSERVICEPACKMAJORVERSION" NUMBER(*,0), 
	"WSERVICEPACKMINORVERSION" NUMBER(*,0), 
	"WSIZESTOREDINPAGINGFILES" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128), 
	"WSYSTEMDEVICE" NVARCHAR2(128), 
	"WSYSTEMDIRECTORY" NVARCHAR2(128), 
	"WTOTALSWAPSPACESIZE" FLOAT(126), 
	"WTOTALVIRTUALMEMORYSIZE" FLOAT(126), 
	"WTOTALVISIBLEMEMORYSIZE" FLOAT(126), 
	"WVERSION" NVARCHAR2(128), 
	"WWINDOWSDIRECTORY" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_PAGEFILE
--------------------------------------------------------

  CREATE TABLE "RWIN32_PAGEFILE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCESSMASK" NUMBER(*,0), 
	"WARCHIVE" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOMPRESSED" NUMBER(*,0), 
	"WCOMPRESSIONMETHOD" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCREATIONDATE" DATE, 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDRIVE" NVARCHAR2(128), 
	"WEIGHTDOTTHREEFILENAME" NVARCHAR2(128), 
	"WENCRYPTED" NUMBER(*,0), 
	"WENCRYPTIONMETHOD" NVARCHAR2(128), 
	"WEXTENSION" NVARCHAR2(128), 
	"WFILENAME" NVARCHAR2(128), 
	"WFILESIZE" FLOAT(126), 
	"WFILETYPE" NVARCHAR2(128), 
	"WFREESPACE" NUMBER(*,0), 
	"WFSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WFSNAME" NVARCHAR2(128), 
	"WHIDDEN" NUMBER(*,0), 
	"WINITIALSIZE" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WINUSECOUNT" FLOAT(126), 
	"WLASTACCESSED" DATE, 
	"WLASTMODIFIED" DATE, 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMAXIMUMSIZE" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPATH" NVARCHAR2(255), 
	"WREADABLE" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSYSTEM" NUMBER(*,0), 
	"WVERSION" NVARCHAR2(128), 
	"WWRITEABLE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_PAGEFILESETTING
--------------------------------------------------------

  CREATE TABLE "RWIN32_PAGEFILESETTING" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WINITIALSIZE" NUMBER(*,0), 
	"WMAXIMUMSIZE" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSETTINGID" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_PAGEFILEUSAGE
--------------------------------------------------------

  CREATE TABLE "RWIN32_PAGEFILEUSAGE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WALLOCATEDBASESIZE" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCURRENTUSAGE" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPEAKUSAGE" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_PARALLELPORT
--------------------------------------------------------

  CREATE TABLE "RWIN32_PARALLELPORT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPABILITIES" NUMBER(*,0), 
	"WCAPABILITYDESCRIPTIONS" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WDMASUPPORT" NUMBER(*,0), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMAXNUMBERCONTROLLED" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOSAUTODISCOVERED" NUMBER(*,0), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPROTOCOLSUPPORTED" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTRESET" DATE
   )
--------------------------------------------------------
--  DDL for Table RWIN32_PHYSICALMEMORY
--------------------------------------------------------

  CREATE TABLE "RWIN32_PHYSICALMEMORY" 
   (	"WMODEL" NVARCHAR2(128), 
	"WSERIALNUMBER" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WDATAWIDTH" NUMBER(*,0), 
	"WHOTSWAPPABLE" NUMBER(*,0), 
	"WPOWEREDON" NUMBER(*,0), 
	"WMEMORYTYPE" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WTOTALWIDTH" NUMBER(*,0), 
	"WPOSITIONINROW" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICELOCATOR" NVARCHAR2(128), 
	"WTAG" NVARCHAR2(128), 
	"MTIME" DATE, 
	"WNAMESPACE" NVARCHAR2(128), 
	"USERID" NVARCHAR2(50), 
	"WREMOVABLE" NUMBER(*,0), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WTYPEDETAIL" NUMBER(*,0), 
	"WCAPACITY" FLOAT(126), 
	"WPARTNUMBER" NVARCHAR2(128), 
	"WREPLACEABLE" NUMBER(*,0), 
	"WSPEED" NUMBER(*,0), 
	"WSKU" NVARCHAR2(128), 
	"WFORMFACTOR" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WBANKLABEL" NVARCHAR2(128), 
	"WINTERLEAVEPOSITION" NUMBER(*,0), 
	"WVERSION" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WINTERLEAVEDATADEPTH" NUMBER(*,0), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_PNPENTITY
--------------------------------------------------------

  CREATE TABLE "RWIN32_PNPENTITY" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCLASSGUID" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WSERVICE" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_POINTINGDEVICE
--------------------------------------------------------

  CREATE TABLE "RWIN32_POINTINGDEVICE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WDEVICEINTERFACE" NUMBER(*,0), 
	"WDOUBLESPEEDTHRESHOLD" NUMBER(*,0), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WHANDEDNESS" NUMBER(*,0), 
	"WHARDWARETYPE" NVARCHAR2(128), 
	"WINFFILENAME" NVARCHAR2(128), 
	"WINFSECTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WISLOCKED" NUMBER(*,0), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFBUTTONS" NUMBER(*,0), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOINTINGTYPE" NUMBER(*,0), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WQUADSPEEDTHRESHOLD" NUMBER(*,0), 
	"WRESOLUTION" NUMBER(*,0), 
	"WSAMPLERATE" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYNCH" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_PORTABLEBATTERY
--------------------------------------------------------

  CREATE TABLE "RWIN32_PORTABLEBATTERY" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBATTERYSTATUS" NUMBER(*,0), 
	"WCAPACITYMULTIPLIER" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCHEMISTRY" NUMBER(*,0), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDESIGNCAPACITY" NUMBER(*,0), 
	"WDESIGNVOLTAGE" FLOAT(126), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WESTIMATEDCHARGEREMAINING" NUMBER(*,0), 
	"WESTIMATEDRUNTIME" NUMBER(*,0), 
	"WEXPECTEDLIFE" NUMBER(*,0), 
	"WFULLCHARGECAPACITY" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WLOCATION" NVARCHAR2(128), 
	"WMANUFACTUREDATE" NVARCHAR2(128), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMAXBATTERYERROR" NUMBER(*,0), 
	"WMAXRECHARGETIME" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WSMARTBATTERYVERSION" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEONBATTERY" NUMBER(*,0), 
	"WTIMETOFULLCHARGE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_PORTRESOURCE
--------------------------------------------------------

  CREATE TABLE "RWIN32_PORTRESOURCE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WALIAS" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WENDINGADDRESS" FLOAT(126), 
	"WINSTALLDATE" DATE, 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSTARTINGADDRESS" FLOAT(126), 
	"WSTATUS" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_PRINTER
--------------------------------------------------------

  CREATE TABLE "RWIN32_PRINTER" 
   (	"MTIME" DATE, 
	"WATTRIBUTES" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WAVERAGEPAGESPERMINUTE" NUMBER(*,0), 
	"WCAPABILITIES" NUMBER(*,0), 
	"WCAPABILITIES2" NUMBER(*,0), 
	"WCAPABILITYDESCRIPTIONS" NVARCHAR2(128), 
	"WCAPABILITYDESCRIPTIONS2" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDEFAULTPRIORITY" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDETECTEDERRORSTATE" NUMBER(*,0), 
	"WDEVICEID" NVARCHAR2(128), 
	"WDRIVERNAME" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WHORIZONTALRESOLUTION" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WJOBCOUNTSINCELASTRESET" NUMBER(*,0), 
	"WLANGUAGESSUPPORTED" NUMBER(*,0), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WLOCATION" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPAPERSIZESSUPPORTED" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED2" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED3" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED4" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED5" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED6" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED7" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED8" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED9" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED10" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED11" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED12" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED13" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED14" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED15" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED16" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED17" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED18" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED19" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED20" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED21" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED22" NUMBER(*,0), 
	"WPAPERSIZESSUPPORTED23" NUMBER(*,0), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPORTNAME" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPRINTERPAPERNAMES" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES2" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES3" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES4" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES5" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES6" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES7" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES8" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES9" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES10" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES11" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES12" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES13" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES14" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES15" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES16" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES17" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES18" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES19" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES20" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES21" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES22" NVARCHAR2(128), 
	"WPRINTERPAPERNAMES23" NVARCHAR2(128), 
	"WPRINTERSTATE" NUMBER(*,0), 
	"WPRINTERSTATUS" NUMBER(*,0), 
	"WPRINTJOBDATATYPE" NVARCHAR2(128), 
	"WPRINTPROCESSOR" NVARCHAR2(128), 
	"WSEPARATORFILE" NVARCHAR2(128), 
	"WSERVERNAME" NVARCHAR2(128), 
	"WSHARENAME" NVARCHAR2(128), 
	"WSPOOLENABLED" NUMBER(*,0), 
	"WSTARTTIME" DATE, 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTRESET" DATE, 
	"WUNTILTIME" DATE, 
	"WVERTICALRESOLUTION" NUMBER(*,0), 
	"USERID" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_PROCESS
--------------------------------------------------------

  CREATE TABLE "RWIN32_PROCESS" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCREATIONDATE" DATE, 
	"WCSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WEXECUTABLEPATH" NVARCHAR2(255), 
	"WEXECUTIONSTATE" NUMBER(*,0), 
	"WHANDLE" NVARCHAR2(128), 
	"WHANDLECOUNT" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WKERNELMODETIME" FLOAT(126), 
	"WMAXIMUMWORKINGSETSIZE" NUMBER(*,0), 
	"WMINIMUMWORKINGSETSIZE" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOSCREATIONCLASSNAME" NVARCHAR2(128), 
	"WOSNAME" NVARCHAR2(128), 
	"WOTHEROPERATIONCOUNT" FLOAT(126), 
	"WOTHERTRANSFERCOUNT" FLOAT(126), 
	"WPAGEFAULTS" NUMBER(*,0), 
	"WPAGEFILEUSAGE" NUMBER(*,0), 
	"WPARENTPROCESSID" NUMBER(*,0), 
	"WPEAKPAGEFILEUSAGE" NUMBER(*,0), 
	"WPEAKVIRTUALSIZE" FLOAT(126), 
	"WPEAKWORKINGSETSIZE" NUMBER(*,0), 
	"WPRIORITY" NUMBER(*,0), 
	"WPRIVATEPAGECOUNT" FLOAT(126), 
	"WPROCESSID" NUMBER(*,0), 
	"WQUOTANONPAGEDPOOLUSAGE" NUMBER(*,0), 
	"WQUOTAPAGEDPOOLUSAGE" NUMBER(*,0), 
	"WQUOTAPEAKNONPAGEDPOOLUSAGE" NUMBER(*,0), 
	"WQUOTAPEAKPAGEDPOOLUSAGE" NUMBER(*,0), 
	"WREADOPERATIONCOUNT" FLOAT(126), 
	"WREADTRANSFERCOUNT" FLOAT(126), 
	"WSESSIONID" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WTERMINATIONDATE" DATE, 
	"WTHREADCOUNT" NUMBER(*,0), 
	"WUSERMODETIME" FLOAT(126), 
	"WVIRTUALSIZE" FLOAT(126), 
	"WWINDOWSVERSION" NVARCHAR2(128), 
	"WWORKINGSETSIZE" FLOAT(126), 
	"WWRITEOPERATIONCOUNT" FLOAT(126), 
	"WWRITETRANSFERCOUNT" FLOAT(126)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_PROCESSOR
--------------------------------------------------------

  CREATE TABLE "RWIN32_PROCESSOR" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WADDRESSWIDTH" NUMBER(*,0), 
	"WARCHITECTURE" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCPUSTATUS" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCURRENTCLOCKSPEED" NUMBER(*,0), 
	"WCURRENTVOLTAGE" NUMBER(*,0), 
	"WDATAWIDTH" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WEXTCLOCK" NUMBER(*,0), 
	"WFAMILY" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WL2CACHESIZE" NUMBER(*,0), 
	"WL2CACHESPEED" NUMBER(*,0), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WLEVEL" NUMBER(*,0), 
	"WLOADPERCENTAGE" NUMBER(*,0), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMAXCLOCKSPEED" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOTHERFAMILYDESCRIPTION" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPROCESSORID" NVARCHAR2(128), 
	"WPROCESSORTYPE" NUMBER(*,0), 
	"WREVISION" NUMBER(*,0), 
	"WROLE" NVARCHAR2(128), 
	"WSOCKETDESIGNATION" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSTEPPING" NVARCHAR2(128), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WUNIQUEID" NVARCHAR2(128), 
	"WUPGRADEMETHOD" NUMBER(*,0), 
	"WVERSION" NVARCHAR2(128), 
	"WVOLTAGECAPS" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_PRODUCT
--------------------------------------------------------

  CREATE TABLE "RWIN32_PRODUCT" 
   (	"MTIME" DATE, 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WIDENTIFYINGNUMBER" NVARCHAR2(128), 
	"WINSTALLDATE" NVARCHAR2(128), 
	"WINSTALLLOCATION" NVARCHAR2(128), 
	"WINSTALLSTATE" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPACKAGECACHE" NVARCHAR2(128), 
	"WSKUNUMBER" NVARCHAR2(128), 
	"WVENDOR" NVARCHAR2(500), 
	"WVERSION" NVARCHAR2(128), 
	"USERID" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_QUICKFIXENGINEERING
--------------------------------------------------------

  CREATE TABLE "RWIN32_QUICKFIXENGINEERING" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WFIXCOMMENTS" NVARCHAR2(128), 
	"WHOTFIXID" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WINSTALLEDBY" NVARCHAR2(128), 
	"WINSTALLEDON" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSERVICEPACKINEFFECT" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_SERIALPORT
--------------------------------------------------------

  CREATE TABLE "RWIN32_SERIALPORT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WBINARY" NUMBER(*,0), 
	"WCAPABILITIES" NUMBER(*,0), 
	"WCAPABILITYDESCRIPTIONS" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMAXBAUDRATE" NUMBER(*,0), 
	"WMAXIMUMINPUTBUFFERSIZE" NUMBER(*,0), 
	"WMAXIMUMOUTPUTBUFFERSIZE" NUMBER(*,0), 
	"WMAXNUMBERCONTROLLED" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOSAUTODISCOVERED" NUMBER(*,0), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPROTOCOLSUPPORTED" NUMBER(*,0), 
	"WPROVIDERTYPE" NVARCHAR2(128), 
	"WSETTABLEBAUDRATE" NUMBER(*,0), 
	"WSETTABLEDATABITS" NUMBER(*,0), 
	"WSETTABLEFLOWCONTROL" NUMBER(*,0), 
	"WSETTABLEPARITY" NUMBER(*,0), 
	"WSETTABLEPARITYCHECK" NUMBER(*,0), 
	"WSETTABLERLSD" NUMBER(*,0), 
	"WSETTABLESTOPBITS" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSUPPORTS16BITMODE" NUMBER(*,0), 
	"WSUPPORTSDTRDSR" NUMBER(*,0), 
	"WSUPPORTSELAPSEDTIMEOUTS" NUMBER(*,0), 
	"WSUPPORTSINTTIMEOUTS" NUMBER(*,0), 
	"WSUPPORTSPARITYCHECK" NUMBER(*,0), 
	"WSUPPORTSRLSD" NUMBER(*,0), 
	"WSUPPORTSRTSCTS" NUMBER(*,0), 
	"WSUPPORTSSPECIALCHARACTERS" NUMBER(*,0), 
	"WSUPPORTSXONXOFF" NUMBER(*,0), 
	"WSUPPORTSXONXOFFSET" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTRESET" DATE
   )
--------------------------------------------------------
--  DDL for Table RWIN32_SERVICE
--------------------------------------------------------

  CREATE TABLE "RWIN32_SERVICE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCEPTPAUSE" NUMBER(*,0), 
	"WACCEPTSTOP" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCHECKPOINT" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(512), 
	"WDESKTOPINTERACT" NUMBER(*,0), 
	"WDISPLAYNAME" NVARCHAR2(128), 
	"WERRORCONTROL" NVARCHAR2(128), 
	"WEXITCODE" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPATHNAME" NVARCHAR2(255), 
	"WPROCESSID" NUMBER(*,0), 
	"WSERVICESPECIFICEXITCODE" NUMBER(*,0), 
	"WSERVICETYPE" NVARCHAR2(128), 
	"WSTARTED" NUMBER(*,0), 
	"WSTARTMODE" NVARCHAR2(128), 
	"WSTARTNAME" NVARCHAR2(128), 
	"WSTATE" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTAGID" NUMBER(*,0), 
	"WWAITHINT" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_SHARE
--------------------------------------------------------

  CREATE TABLE "RWIN32_SHARE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCESSMASK" NUMBER(*,0), 
	"WALLOWMAXIMUM" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WMAXIMUMALLOWED" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPATH" NVARCHAR2(255), 
	"WSTATUS" NVARCHAR2(128), 
	"WTYPE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_SOFTWAREELEMENT
--------------------------------------------------------

  CREATE TABLE "RWIN32_SOFTWAREELEMENT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WATTRIBUTES" NUMBER(*,0), 
	"WBUILDNUMBER" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCODESET" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WIDENTIFICATIONCODE" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WINSTALLSTATE" NUMBER(*,0), 
	"WLANGUAGEEDITION" NVARCHAR2(128), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WOTHERTARGETOS" NVARCHAR2(128), 
	"WPATH" NVARCHAR2(255), 
	"WSERIALNUMBER" NVARCHAR2(128), 
	"WSOFTWAREELEMENTID" NVARCHAR2(128), 
	"WSOFTWAREELEMENTSTATE" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WTARGETOPERATINGSYSTEM" NUMBER(*,0), 
	"WVERSION" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_SOFTWAREFEATURE
--------------------------------------------------------

  CREATE TABLE "RWIN32_SOFTWAREFEATURE" 
   (	"MTIME" DATE, 
	"WACCESSES" NUMBER(*,0), 
	"WATTRIBUTES" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WIDENTIFYINGNUMBER" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WINSTALLSTATE" NUMBER(*,0), 
	"WLASTUSE" DATE, 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPRODUCTNAME" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WVENDOR" NVARCHAR2(128), 
	"WVERSION" NVARCHAR2(128), 
	"USERID" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_SOUNDDEVICE
--------------------------------------------------------

  CREATE TABLE "RWIN32_SOUNDDEVICE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WDMABUFFERSIZE" NUMBER(*,0), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMPU401ADDRESS" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPRODUCTNAME" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_STARTUPCOMMAND
--------------------------------------------------------

  CREATE TABLE "RWIN32_STARTUPCOMMAND" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOMMAND" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WLOCATION" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSETTINGID" NVARCHAR2(128), 
	"WUSER" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_SYSTEMDRIVER
--------------------------------------------------------

  CREATE TABLE "RWIN32_SYSTEMDRIVER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCEPTPAUSE" NUMBER(*,0), 
	"WACCEPTSTOP" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDESKTOPINTERACT" NUMBER(*,0), 
	"WDISPLAYNAME" NVARCHAR2(128), 
	"WERRORCONTROL" NVARCHAR2(128), 
	"WEXITCODE" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPATHNAME" NVARCHAR2(255), 
	"WSERVICESPECIFICEXITCODE" NUMBER(*,0), 
	"WSERVICETYPE" NVARCHAR2(128), 
	"WSTARTED" NUMBER(*,0), 
	"WSTARTMODE" NVARCHAR2(128), 
	"WSTARTNAME" NVARCHAR2(128), 
	"WSTATE" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTAGID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_SYSTEMENCLOSURE
--------------------------------------------------------

  CREATE TABLE "RWIN32_SYSTEMENCLOSURE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAUDIBLEALARM" NUMBER(*,0), 
	"WBREACHDESCRIPTION" NVARCHAR2(128), 
	"WCABLEMANAGEMENTSTRATEGY" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCHASSISTYPES" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCURRENTREQUIREDORPRODUCED" NUMBER(*,0), 
	"WDEPTH" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WHEATGENERATION" NUMBER(*,0), 
	"WHEIGHT" NVARCHAR2(128), 
	"WHOTSWAPPABLE" NUMBER(*,0), 
	"WINSTALLDATE" DATE, 
	"WLOCKPRESENT" NUMBER(*,0), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMODEL" NVARCHAR2(128), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFPOWERCORDS" NUMBER(*,0), 
	"WOTHERIDENTIFYINGINFO" NVARCHAR2(128), 
	"WPARTNUMBER" NVARCHAR2(128), 
	"WPOWEREDON" NUMBER(*,0), 
	"WREMOVABLE" NUMBER(*,0), 
	"WREPLACEABLE" NUMBER(*,0), 
	"WSECURITYBREACH" NUMBER(*,0), 
	"WSECURITYSTATUS" NUMBER(*,0), 
	"WSERIALNUMBER" NVARCHAR2(128), 
	"WSERVICEDESCRIPTIONS" NVARCHAR2(128), 
	"WSERVICEPHILOSOPHY" NUMBER(*,0), 
	"WSKU" NVARCHAR2(128), 
	"WSMBIOSASSETTAG" NVARCHAR2(128), 
	"WSTATUS" NVARCHAR2(128), 
	"WTAG" NVARCHAR2(128), 
	"WTYPEDESCRIPTIONS" NVARCHAR2(128), 
	"WVERSION" NVARCHAR2(128), 
	"WVISIBLEALARM" NUMBER(*,0), 
	"WWEIGHT" NVARCHAR2(128), 
	"WWIDTH" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_TIMEZONE
--------------------------------------------------------

  CREATE TABLE "RWIN32_TIMEZONE" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WBIAS" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WDAYLIGHTBIAS" NUMBER(*,0), 
	"WDAYLIGHTDAY" NUMBER(*,0), 
	"WDAYLIGHTDAYOFWEEK" NUMBER(*,0), 
	"WDAYLIGHTHOUR" NUMBER(*,0), 
	"WDAYLIGHTMILLISECOND" NUMBER(*,0), 
	"WDAYLIGHTMINUTE" NUMBER(*,0), 
	"WDAYLIGHTMONTH" NUMBER(*,0), 
	"WDAYLIGHTNAME" NVARCHAR2(128), 
	"WDAYLIGHTSECOND" NUMBER(*,0), 
	"WDAYLIGHTYEAR" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WSETTINGID" NVARCHAR2(128), 
	"WSTANDARDBIAS" NUMBER(*,0), 
	"WSTANDARDDAY" NUMBER(*,0), 
	"WSTANDARDDAYOFWEEK" NUMBER(*,0), 
	"WSTANDARDHOUR" NUMBER(*,0), 
	"WSTANDARDMILLISECOND" NUMBER(*,0), 
	"WSTANDARDMINUTE" NUMBER(*,0), 
	"WSTANDARDMONTH" NUMBER(*,0), 
	"WSTANDARDNAME" NVARCHAR2(128), 
	"WSTANDARDSECOND" NUMBER(*,0), 
	"WSTANDARDYEAR" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_USBCONTROLLER
--------------------------------------------------------

  CREATE TABLE "RWIN32_USBCONTROLLER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMANUFACTURER" NVARCHAR2(128), 
	"WMAXNUMBERCONTROLLED" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPROTOCOLSUPPORTED" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WTIMEOFLASTRESET" DATE
   )
--------------------------------------------------------
--  DDL for Table RWIN32_USERACCOUNT
--------------------------------------------------------

  CREATE TABLE "RWIN32_USERACCOUNT" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCOUNTTYPE" NUMBER(*,0), 
	"WCAPTION" NVARCHAR2(128), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDISABLED" NUMBER(*,0), 
	"WDOMAIN" NVARCHAR2(128), 
	"WFULLNAME" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WLOCKOUT" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WPASSWORDCHANGEABLE" NUMBER(*,0), 
	"WPASSWORDEXPIRES" NUMBER(*,0), 
	"WPASSWORDREQUIRED" NUMBER(*,0), 
	"WSID" NVARCHAR2(128), 
	"WSIDTYPE" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_VIDEOCONTROLLER
--------------------------------------------------------

  CREATE TABLE "RWIN32_VIDEOCONTROLLER" 
   (	"MTIME" DATE, 
	"USERID" NVARCHAR2(50), 
	"WACCELERATORCAPABILITIES" NUMBER(*,0), 
	"WADAPTERCOMPATIBILITY" NVARCHAR2(128), 
	"WADAPTERDACTYPE" NVARCHAR2(128), 
	"WADAPTERRAM" NUMBER(*,0), 
	"WAVAILABILITY" NUMBER(*,0), 
	"WCAPABILITYDESCRIPTIONS" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(128), 
	"WCOLORTABLEENTRIES" NUMBER(*,0), 
	"WCONFIGMANAGERERRORCODE" NUMBER(*,0), 
	"WCONFIGMANAGERUSERCONFIG" NUMBER(*,0), 
	"WCREATIONCLASSNAME" NVARCHAR2(128), 
	"WCURRENTBITSPERPIXEL" NUMBER(*,0), 
	"WCURRENTHORIZONTALRESOLUTION" NUMBER(*,0), 
	"WCURRENTNUMBEROFCOLORS" FLOAT(126), 
	"WCURRENTNUMBEROFCOLUMNS" NUMBER(*,0), 
	"WCURRENTNUMBEROFROWS" NUMBER(*,0), 
	"WCURRENTREFRESHRATE" NUMBER(*,0), 
	"WCURRENTSCANMODE" NUMBER(*,0), 
	"WCURRENTVERTICALRESOLUTION" NUMBER(*,0), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WDEVICEID" NVARCHAR2(128), 
	"WDEVICESPECIFICPENS" NUMBER(*,0), 
	"WDITHERTYPE" NUMBER(*,0), 
	"WDRIVERDATE" DATE, 
	"WDRIVERVERSION" NVARCHAR2(128), 
	"WERRORCLEARED" NUMBER(*,0), 
	"WERRORDESCRIPTION" NVARCHAR2(128), 
	"WICMINTENT" NUMBER(*,0), 
	"WICMMETHOD" NUMBER(*,0), 
	"WINFFILENAME" NVARCHAR2(128), 
	"WINFSECTION" NVARCHAR2(128), 
	"WINSTALLDATE" DATE, 
	"WINSTALLEDDISPLAYDRIVERS" NVARCHAR2(128), 
	"WLASTERRORCODE" NUMBER(*,0), 
	"WMAXMEMORYSUPPORTED" NUMBER(*,0), 
	"WMAXNUMBERCONTROLLED" NUMBER(*,0), 
	"WMAXREFRESHRATE" NUMBER(*,0), 
	"WMINREFRESHRATE" NUMBER(*,0), 
	"WMONOCHROME" NUMBER(*,0), 
	"WNAME" NVARCHAR2(128), 
	"WNAMESPACE" NVARCHAR2(128), 
	"WNUMBEROFCOLORPLANES" NUMBER(*,0), 
	"WNUMBEROFVIDEOPAGES" NUMBER(*,0), 
	"WPNPDEVICEID" NVARCHAR2(128), 
	"WPOWERMANAGEMENTCAPABILITIES" NUMBER(*,0), 
	"WPOWERMANAGEMENTSUPPORTED" NUMBER(*,0), 
	"WPROTOCOLSUPPORTED" NUMBER(*,0), 
	"WRESERVEDSYSTEMPALETTEENTRIES" NUMBER(*,0), 
	"WSPECIFICATIONVERSION" NUMBER(*,0), 
	"WSTATUS" NVARCHAR2(128), 
	"WSTATUSINFO" NUMBER(*,0), 
	"WSYSTEMCREATIONCLASSNAME" NVARCHAR2(128), 
	"WSYSTEMNAME" NVARCHAR2(128), 
	"WSYSTEMPALETTEENTRIES" NUMBER(*,0), 
	"WTIMEOFLASTRESET" DATE, 
	"WVIDEOARCHITECTURE" NUMBER(*,0), 
	"WVIDEOMEMORYTYPE" NUMBER(*,0), 
	"WVIDEOMODE" NUMBER(*,0), 
	"WVIDEOMODEDESCRIPTION" NVARCHAR2(128), 
	"WVIDEOPROCESSOR" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table RWIN32_WINSAT
--------------------------------------------------------

  CREATE TABLE "RWIN32_WINSAT" 
   (	"MTIME" DATE, 
	"WNAMESPACE" NVARCHAR2(128), 
	"USERID" NVARCHAR2(50), 
	"WMEMORYSCORE" NVARCHAR2(128), 
	"WGRAPHICSSCORE" NVARCHAR2(128), 
	"WWINSATASSESSMENTSTATE" NUMBER(*,0), 
	"WTIMETAKEN" NVARCHAR2(128), 
	"WD3DSCORE" NVARCHAR2(128), 
	"WDISKSCORE" NVARCHAR2(128), 
	"WWINSPRLEVEL" NVARCHAR2(128), 
	"WCPUSCORE" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table SAPSTATS
--------------------------------------------------------

  CREATE TABLE "SAPSTATS" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"LASTACCESSED" DATE, 
	"STATUS" NVARCHAR2(3), 
	"RESOLVED_LOCATION" NVARCHAR2(32), 
	"ACTUAL_LOCATION" NVARCHAR2(32), 
	"BALANCER" NVARCHAR2(32), 
	"SVRPOOL" NVARCHAR2(32), 
	"SERVER" NVARCHAR2(32), 
	"SAP" NVARCHAR2(32), 
	"TYPE" NVARCHAR2(4), 
	"PRIORITY" NUMBER(*,0), 
	"ENABLED" NVARCHAR2(1), 
	"ROLE" NVARCHAR2(12), 
	"HOSTNAME" NVARCHAR2(100), 
	"NAME" NVARCHAR2(255), 
	"URI" NVARCHAR2(255), 
	"BANDWIDTH" NVARCHAR2(2), 
	"SPEED" NUMBER(*,0), 
	"THROTTLETYPE" NVARCHAR2(8), 
	"ERRORCOUNT" NUMBER(*,0), 
	"BYTESSENT" NUMBER(*,0), 
	"BYTESRECEIVED" NUMBER(*,0), 
	"FILESMISSED" NUMBER(*,0), 
	"FILESSENT" NUMBER(*,0), 
	"FILESRECEIVED" NUMBER(*,0), 
	"OBJECTSSENT" NUMBER(*,0), 
	"OBJECTSRECEIVED" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table SARPTL_SUMMARY
--------------------------------------------------------

  CREATE TABLE "SARPTL_SUMMARY" 
   (	"LEADERNAME" NVARCHAR2(50), 
	"CLIENTSERVEDCNT" NVARCHAR2(50), 
	"DATADOWNLOADED" NVARCHAR2(50), 
	"DATASERVED" NVARCHAR2(50), 
	"CACHESIZE" NVARCHAR2(50), 
	"FILESERVEDCNT" NVARCHAR2(50), 
	"DURATION" NVARCHAR2(50), 
	"UPSSERVER" NVARCHAR2(500), 
	"LASTCONNECT" DATE
   )
--------------------------------------------------------
--  DDL for Table SA_DEVICE_DATA
--------------------------------------------------------

  CREATE TABLE "SA_DEVICE_DATA" 
   (	"SUBNET_ID" NVARCHAR2(255), 
	"HOST_NAME" NVARCHAR2(255), 
	"CACHE_SIZE" NVARCHAR2(255), 
	"DSOURCE" NVARCHAR2(225), 
	"DOWNLOAD_FILENAME" NVARCHAR2(255), 
	"DOWNLOAD_PERCENTAGE" NVARCHAR2(255), 
	"LAST_UPDATED_DATETIME" DATE, 
	"ROLE" NVARCHAR2(255), 
	"STATUS" NVARCHAR2(255), 
	"SYNC_FILENAME" NVARCHAR2(255), 
	"SYNC_PERCENTAGE" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table SA_SUBNET_MASTER
--------------------------------------------------------

  CREATE TABLE "SA_SUBNET_MASTER" 
   (	"SUBNET_ID" NVARCHAR2(255), 
	"ALPHA" NVARCHAR2(255), 
	"COLLECT_FLAG" NUMBER(*,0), 
	"DEFAULT_GATEWAY" NVARCHAR2(225), 
	"REGION_NAME" NVARCHAR2(255), 
	"SCHDMODIFIEDTIME" NVARCHAR2(255), 
	"STATE" NVARCHAR2(255), 
	"STATECODE" NVARCHAR2(255), 
	"SUBNET_NAME" NVARCHAR2(255), 
	"UPDATED_DATETIME" NVARCHAR2(255), 
	"UUID" NVARCHAR2(255), 
	"ZONE_NAME" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table SCAP_ACQUISITIONDETAIL
--------------------------------------------------------

  CREATE TABLE "SCAP_ACQUISITIONDETAIL" 
   (	"ACQDETAIL_KEY" NUMBER(10,0), 
	"ACQ_KEY" NUMBER(10,0), 
	"BENCHMARK_ID" NVARCHAR2(512), 
	"VERSION" NVARCHAR2(512), 
	"PROFILE_ID" NVARCHAR2(512), 
	"SCANNER" NVARCHAR2(1), 
	"STATUS" NVARCHAR2(30), 
	"STATUSMSGID" NVARCHAR2(30)
   )
--------------------------------------------------------
--  DDL for Table SCAP_BENCHMARK
--------------------------------------------------------

  CREATE TABLE "SCAP_BENCHMARK" 
   (	"BENCHMARK_KEY" NUMBER(10,0), 
	"BENCHMARK_ID" NVARCHAR2(512), 
	"VERSION" NVARCHAR2(512), 
	"STATUS" NVARCHAR2(32), 
	"STATUS_DATE" DATE, 
	"TITLE" NVARCHAR2(2000), 
	"DESCRIPTION" NVARCHAR2(2000)
   )
--------------------------------------------------------
--  DDL for Table SCAP_DEVICESCAN
--------------------------------------------------------

  CREATE TABLE "SCAP_DEVICESCAN" 
   (	"SCAN_ID" NVARCHAR2(32), 
	"DEVICE_ID" NVARCHAR2(50), 
	"PROFILE_KEY" NUMBER(10,0), 
	"BENCHMARKAPPLICABLE" NVARCHAR2(1), 
	"AUTHENTICATED" NVARCHAR2(512), 
	"PRIVILEGED" NVARCHAR2(512), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"STARTTIME" DATE, 
	"ENDTIME" DATE, 
	"FAILCNT" NUMBER(10,0), 
	"PASSCNT" NUMBER(10,0), 
	"UNKNOWNCNT" NUMBER(10,0), 
	"ERRORCNT" NUMBER(10,0), 
	"NOTAPPLICABLECNT" NUMBER(10,0), 
	"NOTCHECKEDCNT" NUMBER(10,0), 
	"NOTSELECTEDCNT" NUMBER(10,0), 
	"INFORMATIONALCNT" NUMBER(10,0), 
	"FIXEDCNT" NUMBER(10,0), 
	"OTHERCNT" NUMBER(10,0), 
	"TESTCNT" NUMBER(10,0), 
	"SCORE_DEFAULT" NUMBER(6,2), 
	"SCORE_FLAT" NUMBER(6,2), 
	"SCORE_FLATMAX" NUMBER(6,2)
   )
--------------------------------------------------------
--  DDL for Table SCAP_DEVICESTATUS
--------------------------------------------------------

  CREATE TABLE "SCAP_DEVICESTATUS" 
   (	"SCAN_ID" NVARCHAR2(32), 
	"RULE_KEY" NUMBER(10,0), 
	"STATUS" NVARCHAR2(16)
   )
--------------------------------------------------------
--  DDL for Table SCAP_IDENT
--------------------------------------------------------

  CREATE TABLE "SCAP_IDENT" 
   (	"IDENT_KEY" NUMBER(10,0), 
	"IDENT_ID" NVARCHAR2(512), 
	"IDENT_SYSTEM" NVARCHAR2(512)
   )
--------------------------------------------------------
--  DDL for Table SCAP_PROFILE
--------------------------------------------------------

  CREATE TABLE "SCAP_PROFILE" 
   (	"PROFILE_KEY" NUMBER(10,0), 
	"PROFILE_ID" NVARCHAR2(512), 
	"BENCHMARK_KEY" NUMBER(10,0), 
	"TITLE" NVARCHAR2(2000), 
	"DESCRIPTION" NVARCHAR2(2000)
   )
--------------------------------------------------------
--  DDL for Table SCAP_PROFILERULE
--------------------------------------------------------

  CREATE TABLE "SCAP_PROFILERULE" 
   (	"RULE_KEY" NUMBER(10,0), 
	"PROFILE_KEY" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table SCAP_RULE
--------------------------------------------------------

  CREATE TABLE "SCAP_RULE" 
   (	"RULE_KEY" NUMBER(10,0), 
	"RULE_ID" NVARCHAR2(512), 
	"BENCHMARK_KEY" NUMBER(10,0), 
	"TITLE" NVARCHAR2(2000), 
	"DESCRIPTION" NVARCHAR2(2000), 
	"WEIGHT" NUMBER(3,1)
   )
--------------------------------------------------------
--  DDL for Table SCAP_RULEIDENT
--------------------------------------------------------

  CREATE TABLE "SCAP_RULEIDENT" 
   (	"IDENT_KEY" NUMBER(10,0), 
	"RULE_KEY" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table SCAP_SCANHISTATTR
--------------------------------------------------------

  CREATE TABLE "SCAP_SCANHISTATTR" 
   (	"SCANHIST_KEY" NUMBER(10,0), 
	"ATTRIBUTE" NVARCHAR2(32), 
	"NUMVALUE" NUMBER(12,2)
   )
--------------------------------------------------------
--  DDL for Table SCAP_SCANHISTORY
--------------------------------------------------------

  CREATE TABLE "SCAP_SCANHISTORY" 
   (	"SCANHIST_KEY" NUMBER(10,0), 
	"PROFILE_KEY" NUMBER(10,0), 
	"SNAPSHOTDATE" DATE
   )
--------------------------------------------------------
--  DDL for Table SLFRPT
--------------------------------------------------------

  CREATE TABLE "SLFRPT" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"DEVICENAME" NVARCHAR2(50), 
	"EVENT_DATE" DATE, 
	"EVENT_DESC" NVARCHAR2(255), 
	"EVENT_TYPE" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table SMBIOSINFO
--------------------------------------------------------

  CREATE TABLE "SMBIOSINFO" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"ASSET_TAG" NVARCHAR2(128), 
	"MACHUUID" NVARCHAR2(128), 
	"SYS_SERIALNO" NVARCHAR2(128), 
	"SYS_MANUFACT" NVARCHAR2(128), 
	"SYS_MODEL" NVARCHAR2(128), 
	"ENC_SERIALNO" NVARCHAR2(128), 
	"ENC_MANUFACT" NVARCHAR2(128), 
	"ENC_TYPE" NVARCHAR2(128), 
	"ENC_MODEL" NVARCHAR2(128), 
	"ENC_NAME" NVARCHAR2(128), 
	"ENC_SLOT" NVARCHAR2(128), 
	"RACKNAME" NVARCHAR2(128), 
	"OSDVARCH" NVARCHAR2(128), 
	"PRODUCT" NVARCHAR2(128), 
	"SYSID" NVARCHAR2(128), 
	"BIOSVEND" NVARCHAR2(128), 
	"BIOSDATE" NVARCHAR2(128), 
	"BIOSVERS" NVARCHAR2(128), 
	"FLASHMEM" NVARCHAR2(128), 
	"COMPDOMN" NVARCHAR2(128), 
	"COMPNAME" NVARCHAR2(128), 
	"IPADDR" NVARCHAR2(64), 
	"MACADDR" NVARCHAR2(16), 
	"ADDRESSWIDTH" NVARCHAR2(10), 
	"LOGICALCORE" NVARCHAR2(10), 
	"TPMVERSION" NVARCHAR2(10), 
	"SECUREBOOT" NVARCHAR2(10)
   )
--------------------------------------------------------
--  DDL for Table SRCDSTMAPPING
--------------------------------------------------------

  CREATE TABLE "SRCDSTMAPPING" 
   (	"CTIME" DATE, 
	"SBNT_CI_JOBID" NVARCHAR2(100), 
	"DEVICE_IP" NVARCHAR2(50), 
	"SRC_IP" NVARCHAR2(50), 
	"DST_IP" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table STM_ACQUISITIONDETAIL
--------------------------------------------------------

  CREATE TABLE "STM_ACQUISITIONDETAIL" 
   (	"ACQDETAIL_KEY" NUMBER(10,0), 
	"ACQ_KEY" NUMBER(10,0), 
	"SCANNER" NVARCHAR2(1), 
	"STATUS" NVARCHAR2(30), 
	"STATUSMSGID" NVARCHAR2(30)
   )
--------------------------------------------------------
--  DDL for Table STM_ANTISPYTOOLDEVICE
--------------------------------------------------------

  CREATE TABLE "STM_ANTISPYTOOLDEVICE" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"SECTOOL_KEY" NVARCHAR2(32), 
	"DEF_DATE" DATE, 
	"LAST_FULL_SCAN_DATE" DATE, 
	"DEF_VERSION" NVARCHAR2(32), 
	"ENGINE_VERSION" NVARCHAR2(32), 
	"REALTIME_PROTECT_ENABLED" NVARCHAR2(1), 
	"BINARIES_AUTHENTICATED" NVARCHAR2(1), 
	"SUP_DEF_DATE" NVARCHAR2(1), 
	"SUP_DEF_VERSION" NVARCHAR2(1), 
	"SUP_ENGINE_VERSION" NVARCHAR2(1), 
	"SUP_REALTIME_PROTECT_ENABLED" NVARCHAR2(1), 
	"SUP_LAST_FULL_SCAN_DATE" NVARCHAR2(1), 
	"SUP_BINARIES_AUTHENTICATED" NVARCHAR2(1)
   )
--------------------------------------------------------
--  DDL for Table STM_ANTIVIRUSTOOLDEVICE
--------------------------------------------------------

  CREATE TABLE "STM_ANTIVIRUSTOOLDEVICE" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"SECTOOL_KEY" NVARCHAR2(32), 
	"DEF_DATE" DATE, 
	"LAST_FULL_SCAN_DATE" DATE, 
	"DEF_VERSION" NVARCHAR2(32), 
	"ENGINE_VERSION" NVARCHAR2(32), 
	"REALTIME_PROTECT_ENABLED" NVARCHAR2(1), 
	"BINARIES_AUTHENTICATED" NVARCHAR2(1), 
	"SUP_DEF_DATE" NVARCHAR2(1), 
	"SUP_DEF_VERSION" NVARCHAR2(1), 
	"SUP_ENGINE_VERSION" NVARCHAR2(1), 
	"SUP_REALTIME_PROTECT_ENABLED" NVARCHAR2(1), 
	"SUP_LAST_FULL_SCAN_DATE" NVARCHAR2(1), 
	"SUP_BINARIES_AUTHENTICATED" NVARCHAR2(1)
   )
--------------------------------------------------------
--  DDL for Table STM_BITLOCKER
--------------------------------------------------------

  CREATE TABLE "STM_BITLOCKER" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"DRIVE" NVARCHAR2(50), 
	"ENCRALGO" NVARCHAR2(50), 
	"KEYPROT" NVARCHAR2(50), 
	"NAME" NVARCHAR2(50), 
	"RESULT_DESC" NVARCHAR2(50), 
	"RESULT" NVARCHAR2(50), 
	"SCANTIME" DATE, 
	"STATUS" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table STM_DEVICEERR
--------------------------------------------------------

  CREATE TABLE "STM_DEVICEERR" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"SCANTIME" DATE, 
	"ERRCODE" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table STM_DEVICESCAN
--------------------------------------------------------

  CREATE TABLE "STM_DEVICESCAN" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"STARTTIME" DATE, 
	"ENDTIME" DATE, 
	"AUTHENTICATED" NVARCHAR2(512), 
	"PRIVILEGED" NVARCHAR2(512), 
	"ANTIVIRUSCHECKED" NVARCHAR2(1), 
	"ANTISPYCHECKED" NVARCHAR2(1), 
	"FIREWALLCHECKED" NVARCHAR2(1)
   )
--------------------------------------------------------
--  DDL for Table STM_FIREWALLRULE
--------------------------------------------------------

  CREATE TABLE "STM_FIREWALLRULE" 
   (	"FWRULE_KEY" NVARCHAR2(32), 
	"DEVICE_ID" NVARCHAR2(50), 
	"SECTOOL_KEY" NVARCHAR2(32), 
	"ALLOW" NVARCHAR2(1), 
	"NAME" NVARCHAR2(256), 
	"PROTOCOL" NVARCHAR2(32), 
	"TYPE" NVARCHAR2(32), 
	"VALUE" NVARCHAR2(2000)
   )
--------------------------------------------------------
--  DDL for Table STM_FIREWALLTOOLDEVICE
--------------------------------------------------------

  CREATE TABLE "STM_FIREWALLTOOLDEVICE" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"SECTOOL_KEY" NVARCHAR2(32), 
	"REALTIME_PROTECT_ENABLED" NVARCHAR2(1), 
	"BINARIES_AUTHENTICATED" NVARCHAR2(1), 
	"SUP_REALTIME_PROTECT_ENABLED" NVARCHAR2(1), 
	"SUP_BINARIES_AUTHENTICATED" NVARCHAR2(1), 
	"SUP_FIREWALLRULES" NVARCHAR2(1)
   )
--------------------------------------------------------
--  DDL for Table STM_SECURITYTOOL
--------------------------------------------------------

  CREATE TABLE "STM_SECURITYTOOL" 
   (	"SECTOOL_KEY" NVARCHAR2(32), 
	"NAME" NVARCHAR2(512), 
	"VERSION" NVARCHAR2(32), 
	"VENDOR_NAME" NVARCHAR2(512)
   )
--------------------------------------------------------
--  DDL for Table SUBNETCIEVENTINFO
--------------------------------------------------------

  CREATE TABLE "SUBNETCIEVENTINFO" 
   (	"EVENT_ID" NUMBER(*,0), 
	"EVENT_NAME" NVARCHAR2(100), 
	"EVENT_MSG" NVARCHAR2(100), 
	"ORIGINATOR" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table SUBNETCIEVENTLOG
--------------------------------------------------------

  CREATE TABLE "SUBNETCIEVENTLOG" 
   (	"ETIME_GMT" DATE, 
	"EREL_CLICKS" NUMBER(*,0), 
	"SBNT_CI_JOBID" NVARCHAR2(100), 
	"EVENT_ID" NUMBER(*,0), 
	"EVENT_DATA" NVARCHAR2(2000), 
	"DEVICE_IP" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table SUBNETCIJOBINFO
--------------------------------------------------------

  CREATE TABLE "SUBNETCIJOBINFO" 
   (	"START_TIMESTAMP" DATE, 
	"SBNT_CI_JOBID" NVARCHAR2(100), 
	"SBNT_CI_JOBNAME" NVARCHAR2(100), 
	"SUBNET" NVARCHAR2(50), 
	"USERNAME" NVARCHAR2(100), 
	"PASSWORD" NVARCHAR2(100), 
	"EXCLUDED_ANYIP" NVARCHAR2(30), 
	"STARTIP" NVARCHAR2(50), 
	"ENDIP" NVARCHAR2(50), 
	"MODE_1" NUMBER(*,0), 
	"TOTAL_SELECTEDIPS" NUMBER(*,0), 
	"TOTAL_SUBNETIPS" NUMBER(*,0), 
	"EXCLUDED_IPS" NVARCHAR2(2000)
   )
--------------------------------------------------------
--  DDL for Table SUMMARY
--------------------------------------------------------

  CREATE TABLE "SUMMARY" 
   (	"SUMMARYID" NUMBER(*,0), 
	"GROUPID" NUMBER(*,0), 
	"MTIME" DATE, 
	"NDEVICE" NUMBER(*,0), 
	"BEGINTIME" DATE, 
	"ENDTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table SUM_ACTIVITY
--------------------------------------------------------

  CREATE TABLE "SUM_ACTIVITY" 
   (	"NAME" NVARCHAR2(32), 
	"STARTTIME" DATE, 
	"MTIME" DATE, 
	"ENDTIME" DATE, 
	"EXITCODE" NUMBER(*,0), 
	"SUMMARY" NVARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table SUM_COMPLIANCE
--------------------------------------------------------

  CREATE TABLE "SUM_COMPLIANCE" 
   (	"SUMMARYID" NUMBER(*,0), 
	"SUMMARYTYPE" NVARCHAR2(32), 
	"BENCHMARK_KEY" NUMBER(*,0), 
	"MTIME" DATE, 
	"NDEVICE" NUMBER(*,0), 
	"NDEVICESCANNED" NUMBER(*,0), 
	"NCOMPLIANT" NUMBER(*,0), 
	"NNONCOMPLIANT" NUMBER(*,0), 
	"AVGRULE" NUMBER(*,0), 
	"AVGRULEFAIL" NUMBER(*,0), 
	"AVGRULEPASS" NUMBER(*,0), 
	"AVGRULEOTHER" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table SUM_REMEDIATION
--------------------------------------------------------

  CREATE TABLE "SUM_REMEDIATION" 
   (	"SUMMARYID" NUMBER(*,0), 
	"SUMMARYTYPE" NVARCHAR2(32), 
	"MTIME" DATE, 
	"NREMEDIATE" NUMBER(*,0), 
	"AVGREMEDIATELAG" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table SUM_REPORT
--------------------------------------------------------

  CREATE TABLE "SUM_REPORT" 
   (	"SUMMARYID" NUMBER(*,0), 
	"REPORTID" NVARCHAR2(32), 
	"MTIME" DATE, 
	"NAME" NVARCHAR2(255), 
	"URL" NVARCHAR2(2000)
   )
--------------------------------------------------------
--  DDL for Table SUM_SERVICE
--------------------------------------------------------

  CREATE TABLE "SUM_SERVICE" 
   (	"SUMMARYID" NUMBER(*,0), 
	"SUMMARYTYPE" NVARCHAR2(32), 
	"MTIME" DATE, 
	"NINSTALL" NUMBER(*,0), 
	"NINSTALLFAIL" NUMBER(*,0), 
	"NUPDATE" NUMBER(*,0), 
	"NUPDATEFAIL" NUMBER(*,0), 
	"NREMOVE" NUMBER(*,0), 
	"NREMOVEFAIL" NUMBER(*,0), 
	"NVERIFY" NUMBER(*,0), 
	"NVERIFYFAIL" NUMBER(*,0), 
	"NREPAIR" NUMBER(*,0), 
	"NREPAIRFAIL" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table SUM_VULNERABILITY
--------------------------------------------------------

  CREATE TABLE "SUM_VULNERABILITY" 
   (	"SUMMARYID" NUMBER(*,0), 
	"SUMMARYTYPE" NVARCHAR2(32), 
	"MTIME" DATE, 
	"NDEVICE" NUMBER(*,0), 
	"NDEVICESCANNED" NUMBER(*,0), 
	"NHIGHVULNERABLE" NUMBER(*,0), 
	"NMEDVULNERABLE" NUMBER(*,0), 
	"NLOWVULNERABLE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table THINAPP_APPSYNCEVENTS
--------------------------------------------------------

  CREATE TABLE "THINAPP_APPSYNCEVENTS" 
   (	"CTIME" DATE, 
	"MTIME" DATE, 
	"SERVICE_ID" NVARCHAR2(32), 
	"SYNC_DATE" DATE, 
	"EXE_NAME" NVARCHAR2(255), 
	"OLD_DATE" DATE, 
	"NEW_DATE" DATE, 
	"OLD_SIZE" NUMBER(*,0), 
	"NEW_SIZE" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table THINAPP_SERVICES
--------------------------------------------------------

  CREATE TABLE "THINAPP_SERVICES" 
   (	"CTIME" DATE, 
	"MTIME" DATE, 
	"SERVICE_ID" NVARCHAR2(50), 
	"APP_NAME" NVARCHAR2(80), 
	"NVD_DOMAIN" NVARCHAR2(15), 
	"APPSYNC_ENABLED" NVARCHAR2(1), 
	"SERVICE_CREATE_TIME" DATE
   )
--------------------------------------------------------
--  DDL for Table TOSMEVENT
--------------------------------------------------------

  CREATE TABLE "TOSMEVENT" 
   (	"DEPLOYMENT_ID" NVARCHAR2(100), 
	"DEVICE_ID" NVARCHAR2(50), 
	"SERIAL_NO" NVARCHAR2(100), 
	"ROMS_SERVER" NVARCHAR2(20), 
	"COMP_NAME" NVARCHAR2(100), 
	"EOS_NAME" NVARCHAR2(100), 
	"TOS_NAME" NVARCHAR2(100), 
	"IPADDRESS" NVARCHAR2(20), 
	"SUBNETMASK" NVARCHAR2(50), 
	"SUBNETID" NVARCHAR2(20), 
	"REGION" NVARCHAR2(100), 
	"JOBID" NVARCHAR2(100), 
	"EVENT_NAME" NVARCHAR2(30), 
	"EVENT_TYPE" NVARCHAR2(30), 
	"EVENT_SUBTYPE" NVARCHAR2(30), 
	"DRIVEMAP" NVARCHAR2(50), 
	"WITH_PBR" NVARCHAR2(10), 
	"TIMEZONE" NVARCHAR2(20), 
	"EVENT_TIME" DATE, 
	"DEP_STIME" DATE, 
	"DEP_ETIME" DATE, 
	"SUBEVENT" NVARCHAR2(200), 
	"STATUS" NVARCHAR2(50), 
	"PROGRESS_OVERALL" NVARCHAR2(10), 
	"ERRORMSG" NVARCHAR2(200)
   )
--------------------------------------------------------
--  DDL for Table VDIDEVICECONFIG
--------------------------------------------------------

  CREATE TABLE "VDIDEVICECONFIG" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"POOLNAME" NVARCHAR2(50), 
	"POOLDESC" NVARCHAR2(50), 
	"POOLTYPE" NVARCHAR2(50), 
	"MASTER" NVARCHAR2(50), 
	"SNAPSHOT" NVARCHAR2(250), 
	"BROKER" NVARCHAR2(50), 
	"VCSERVER" NVARCHAR2(50), 
	"VMFOLDERPATH" NVARCHAR2(250), 
	"VMTYPE" NVARCHAR2(50), 
	"VDITYPE" NVARCHAR2(50), 
	"DATASTORE" NVARCHAR2(250), 
	"RESOURCEPATH" NVARCHAR2(250), 
	"OU" NVARCHAR2(250), 
	"DESKTOPPATH" NVARCHAR2(250), 
	"VENDOR" NVARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table VDIDEVICEREG
--------------------------------------------------------

  CREATE TABLE "VDIDEVICEREG" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"VMTYPE" NVARCHAR2(50), 
	"POOLNAME" NVARCHAR2(50), 
	"POOLTYPE" NVARCHAR2(50), 
	"SERVERPOOLDN" NVARCHAR2(255), 
	"SERVERDN" NVARCHAR2(255), 
	"VDITYPE" NVARCHAR2(50), 
	"VDIVENDR" NVARCHAR2(50), 
	"MTIME" DATE
   )
--------------------------------------------------------
--  DDL for Table VM_ACQUISITIONDETAIL
--------------------------------------------------------

  CREATE TABLE "VM_ACQUISITIONDETAIL" 
   (	"ACQDETAIL_KEY" NUMBER(10,0), 
	"ACQ_KEY" NUMBER(10,0), 
	"FAMILY" NVARCHAR2(20), 
	"VULNERABILITY_CNT" NUMBER(10,0), 
	"EXPOSURE_CNT" NUMBER(10,0), 
	"HIGHCNT" NUMBER(10,0), 
	"MEDCNT" NUMBER(10,0), 
	"LOWCNT" NUMBER(10,0), 
	"UNKNOWNCNT" NUMBER(10,0), 
	"SCANNER" NVARCHAR2(1), 
	"STATUS" NVARCHAR2(30), 
	"STATUSMSGID" NVARCHAR2(30)
   )
--------------------------------------------------------
--  DDL for Table VM_AFFECTED_PLATFORM
--------------------------------------------------------

  CREATE TABLE "VM_AFFECTED_PLATFORM" 
   (	"ID" NUMBER(10,0), 
	"FAMILY" NVARCHAR2(20), 
	"NAME" NVARCHAR2(120)
   )
--------------------------------------------------------
--  DDL for Table VM_AFFECTED_SOFTWARE
--------------------------------------------------------

  CREATE TABLE "VM_AFFECTED_SOFTWARE" 
   (	"ID" NUMBER(10,0), 
	"FAMILY" NVARCHAR2(20), 
	"NAME" NVARCHAR2(120)
   )
--------------------------------------------------------
--  DDL for Table VM_CVE
--------------------------------------------------------

  CREATE TABLE "VM_CVE" 
   (	"CVEROW" NUMBER(*,0), 
	"CVEID" NVARCHAR2(150), 
	"DESCRIPTION" NVARCHAR2(2000), 
	"SEVERITY" NVARCHAR2(150), 
	"CVSS" NUMBER(4,1), 
	"CVSSIMPACT" NUMBER(4,1), 
	"CVSSEXPLOIT" NUMBER(4,1), 
	"CVSSVECT" NVARCHAR2(80)
   )
--------------------------------------------------------
--  DDL for Table VM_CVE_URL
--------------------------------------------------------

  CREATE TABLE "VM_CVE_URL" 
   (	"CVEROW" NUMBER(10,0), 
	"URL" NVARCHAR2(255), 
	"SOURCE" NVARCHAR2(60), 
	"NAME" NVARCHAR2(255), 
	"PATCH" NVARCHAR2(1), 
	"ADV" NVARCHAR2(1)
   )
--------------------------------------------------------
--  DDL for Table VM_DEVICE_SCAN
--------------------------------------------------------

  CREATE TABLE "VM_DEVICE_SCAN" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"STARTTIME" DATE, 
	"ENDTIME" DATE, 
	"FAILCNT" NUMBER(10,0), 
	"PASSCNT" NUMBER(10,0), 
	"UNKNOWNCNT" NUMBER(10,0), 
	"TESTCNT" NUMBER(10,0), 
	"LOWCNT" NUMBER(10,0), 
	"MEDIUMCNT" NUMBER(10,0), 
	"HIGHCNT" NUMBER(10,0), 
	"MAXCVSS" NUMBER(4,1), 
	"SEVERITY" NVARCHAR2(150)
   )
--------------------------------------------------------
--  DDL for Table VM_DEVICE_VULNERABILITY
--------------------------------------------------------

  CREATE TABLE "VM_DEVICE_VULNERABILITY" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"OVALROW" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table VM_OVAL
--------------------------------------------------------

  CREATE TABLE "VM_OVAL" 
   (	"OVALROW" NUMBER(10,0), 
	"OVALID" NVARCHAR2(150), 
	"VERSION" NVARCHAR2(50), 
	"SOURCE" NVARCHAR2(50), 
	"TITLE" NVARCHAR2(250), 
	"FAMILY" NVARCHAR2(20), 
	"STATUS" NVARCHAR2(20), 
	"SUBMIT" DATE, 
	"CVEROW" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table VM_OVAL_PLATFORM
--------------------------------------------------------

  CREATE TABLE "VM_OVAL_PLATFORM" 
   (	"OVALROW" NUMBER(10,0), 
	"PLATFORMID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table VM_OVAL_SOFTWARE
--------------------------------------------------------

  CREATE TABLE "VM_OVAL_SOFTWARE" 
   (	"OVALROW" NUMBER(10,0), 
	"SOFTWAREID" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table VM_SEVERITY_HISTORY
--------------------------------------------------------

  CREATE TABLE "VM_SEVERITY_HISTORY" 
   (	"SNAPSHOTDATE" DATE, 
	"DEVICECNT" NUMBER(10,0), 
	"SCANCNT" NUMBER(10,0), 
	"NOCNT" NUMBER(10,0), 
	"HIGHCNT" NUMBER(10,0), 
	"MEDIUMCNT" NUMBER(10,0), 
	"LOWCNT" NUMBER(10,0), 
	"UNKNOWNCNT" NUMBER(10,0), 
	"VULCNT" NUMBER(10,0)
   )
--------------------------------------------------------
--  DDL for Table VNCSESSIONINFO
--------------------------------------------------------

  CREATE TABLE "VNCSESSIONINFO" 
   (	"REQUEST_ID" NVARCHAR2(20), 
	"SESSION_ID" NVARCHAR2(20), 
	"VNC_UID" NVARCHAR2(255), 
	"USER_DN" NVARCHAR2(255), 
	"USER_NAME" NVARCHAR2(100), 
	"CUSTOMER_OU" NVARCHAR2(255), 
	"CUSTOMER_NAME" NVARCHAR2(100), 
	"TARGET_DN" NVARCHAR2(255), 
	"TARGET_MACHNAME" NVARCHAR2(100), 
	"TARGET_IP" NVARCHAR2(20), 
	"SESS_START_TIME" DATE, 
	"SESS_END_TIME" DATE, 
	"SESS_DURATION" NVARCHAR2(20), 
	"CONN_STATUS" NVARCHAR2(20), 
	"ERROR_DESCRIPTION" NVARCHAR2(255), 
	"CONN_TYPE" NVARCHAR2(10), 
	"DATA_EXCHANGE" NVARCHAR2(20)
   )
--------------------------------------------------------
--  DDL for Table WHITELISTED
--------------------------------------------------------

  CREATE TABLE "WHITELISTED" 
   (	"APP_NAME" NVARCHAR2(256), 
	"APP_VERSION" NVARCHAR2(256), 
	"W_FLAG" NVARCHAR2(64) DEFAULT 'true'
   )
--------------------------------------------------------
--  DDL for Table WINDOWSUPDATE
--------------------------------------------------------

  CREATE TABLE "WINDOWSUPDATE" 
   (	"MTIME" DATE, 
	"WDEVICENAME" NVARCHAR2(50), 
	"WDESCRIPTION" NVARCHAR2(128), 
	"WCAPTION" NVARCHAR2(225), 
	"WIPADDR" NVARCHAR2(128), 
	"WINSTALLDATE" NVARCHAR2(20), 
	"WUSER" NVARCHAR2(128), 
	"WKB" NVARCHAR2(50), 
	"WNAME" NVARCHAR2(128), 
	"OS" NVARCHAR2(128), 
	"OSARCH" NVARCHAR2(128), 
	"WCOMMENT" NVARCHAR2(128), 
	"WSPEFFECT" NVARCHAR2(128)
   )
--------------------------------------------------------
--  DDL for Table WINTEN
--------------------------------------------------------

  CREATE TABLE "WINTEN" 
   (	"DEVICE_ID" NVARCHAR2(50), 
	"STARTTIME" DATE, 
	"ENDTIME" DATE, 
	"BRANCH" NVARCHAR2(128), 
	"OLD_OS" NVARCHAR2(255), 
	"UPG_OS" NVARCHAR2(255), 
	"ZSERVICE" NVARCHAR2(255), 
	"STATUS" NVARCHAR2(50), 
	"ERRORCODE" NVARCHAR2(30), 
	"ERRORMSG" NVARCHAR2(255)
   )
