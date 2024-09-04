--------------------------------------------------------
--  DDL for Table NVD_PATCH
--------------------------------------------------------

  CREATE TABLE "SEN11CP2MSI164"."NVD_PATCH" 
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
   ) ;
