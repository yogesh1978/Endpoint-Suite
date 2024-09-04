--------------------------------------------------------
--  File created - Wednesday-September-04-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure DELETE_HPPATCH_DEVICE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "DELETE_HPPATCH_DEVICE" 
 (
 Var_devname IN NVARCHAR2
 )
 AS
 BEGIN
 DELETE FROM NVD_DESTATUS WHERE NVD_ZOBJDEV = Var_devname;
 DELETE FROM NVD_BUSTATUS WHERE NVD_ZOBJDEV = Var_devname;
 DELETE FROM NVD_RESTATUS WHERE NVD_ZOBJDEV = Var_devname;
 DELETE FROM NVD_PASTATUS WHERE NVD_ZOBJDEV = Var_devname;
 DELETE FROM NVD_DEERROR WHERE NVD_ZOBJDEV = Var_devname;
 END DELETE_HPPATCH_DEVICE;
--------------------------------------------------------
--  DDL for Procedure SDMANIPULATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SDMANIPULATE" (
 SUBNETIP in VARCHAR2
)
AS
begin

 DBMS_OUTPUT.PUT_LINE('SubnetIp: ' || SUBNETIP);

 DELETE from 
 NETDEVICECONFIG 
 where exists (
 select 1 from NETDEVICETEMPCONFIG s, NETDEVICECONFIG target
 where s.SLNO != target.SLNO
 and SUBNETIP = target.SUBNETADDR 
 AND target.macaddr = s.macaddr
 );

 MERGE INTO NETDEVICECONFIG TARGET
 USING NETDEVICETEMPCONFIG SOURCE
 ON (TARGET.SUBNETADDR = SUBNETIP AND target.macaddr = source.macaddr)

 WHEN MATCHED THEN

 UPDATE SET 
 target.status = 'Found',
 target.device_id = source.device_id,
 target.mtime = source.mtime,
 target.devicetype = source.devicetype,
 target.ipaddr = source.ipaddr,
 target.os = source.os,
 target.os_level = source.os_level,
 
 
 target.slno = source.slno,
 target.domain = source.domain,
 target.workgroup = source.workgroup,
 target.model = source.model,
 target.netbios = source.netbios,
 target.dclass = source.dclass,
 target.manufacturer = source.manufacturer
 WHEN NOT MATCHED THEN
 INSERT (status,device_id,mtime,devicetype,ipaddr,os,os_level,subnetaddr,macaddr,slno,domain,workgroup,model,netbios,dclass,manufacturer)
 VALUES ('Found',source.device_id,source.mtime,source.devicetype,source.ipaddr,source.os,source.os_level,source.subnetaddr,source.macaddr,source.slno,source.domain,source.workgroup,source.model,source.netbios,source.dclass,source.manufacturer);

 UPDATE NETDEVICECONFIG
 SET status = 'Missing'
 where not exists (select 1 from NETDEVICETEMPCONFIG 
 where SUBNETIP = NETDEVICECONFIG.SUBNETADDR
 AND NETDEVICETEMPCONFIG.macaddr = NETDEVICECONFIG.macaddr) AND SUBNETIP = NETDEVICECONFIG.SUBNETADDR; 

 DELETE from 
 NETDEVICECONFIG 
 where exists (
 select 1 from Deviceconfig where
 NETDEVICECONFIG.IPADDR = DeviceConfig.ipaddr
 and NETDEVICECONFIG.SUBNETADDR = DeviceConfig.subnetaddr
 AND NETDEVICECONFIG.macaddr = DeviceConfig.macaddr
 );




 FOR data IN (SELECT * FROM NETDEVICETEMPCONFIG where subnetaddr = SUBNETIP)
 LOOP
 DBMS_OUTPUT.PUT_LINE('Column1: ' || data.IPADDR);
 END LOOP;
 
 
 DELETE FROM NETDEVICETEMPCONFIG where SUBNETADDR = SUBNETIP;
 commit;
end;
