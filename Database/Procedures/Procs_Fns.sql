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
--------------------------------------------------------
--  DDL for Procedure SP_FLAGCURRENTCOMPUTERS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_FLAGCURRENTCOMPUTERS" 
(vDaysNonCurrent IN INTEGER, vDaysCurrent IN INTEGER)
IS

BEGIN UPDATE rcaWindowsComputerUsers
SET CurrentComputer = 1
WHERE WindowsComputerUser_id IN
(SELECT tData.WindowsComputerUser_id
FROM
(SELECT U.WindowsComputerUser_id
FROM rcaWindowsComputerUsers U, rcaWindowsComputers C
WHERE (U.WindowsComputer_id = C.WindowsComputer_id) AND (C.LastCollection >= (SYSDATE - vDaysCurrent))) tData); UPDATE rcaWindowsComputerUsers
SET CurrentComputer = 0
WHERE WindowsComputerUser_id IN
(SELECT tSet1.WindowsComputerUser_id
FROM
(SELECT U.WindowsComputerUser_id, C.ComputerName_id, C.LastCollection
FROM rcaWindowsComputerUsers U, rcaWindowsComputers C, rcaComputerNames N
WHERE (U.WindowsComputer_id = C.WindowsComputer_id) AND (C.ComputerName_id = N.ComputerName_id) AND N.ComputerName_id IN 
(SELECT ComputerName_id FROM (SELECT ComputerName_id, COUNT(WindowsSid_id) x FROM rcaWindowsComputers Group by ComputerName_id) t2 WHERE t2.x > 1)
) tSet1,
(SELECT C.ComputerName_id, MAX(C.LastCollection) MaxCollection 
FROM rcaWindowsComputerUsers U, rcaWindowsComputers C, rcaComputerNames N
WHERE (U.WindowsComputer_id = C.WindowsComputer_id) AND (C.ComputerName_id = N.ComputerName_id) AND N.ComputerName_id IN 
(SELECT ComputerName_id FROM (SELECT ComputerName_id, COUNT(WindowsSid_id) x FROM rcaWindowsComputers Group by ComputerName_id) t2 WHERE t2.x > 1)
GROUP BY C.ComputerName_id) tSet2
WHERE (tSet1.ComputerName_id = tSet2.ComputerName_id) AND (tSet1.LastCollection < tSet2.MaxCollection)); UPDATE rcaWindowsComputerUsers
SET CurrentComputer = 0
WHERE WindowsComputerUser_id IN
(SELECT tData.WindowsComputerUser_id
FROM
(SELECT U.WindowsComputerUser_id
FROM rcaWindowsComputerUsers U, rcaWindowsComputers C
WHERE (U.WindowsComputer_id = C.WindowsComputer_id) AND (C.LastCollection < (SYSDATE - vDaysNonCurrent))) tData);


END;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCACOMPUTERNAMES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCACOMPUTERNAMES" 
(
 Var_name IN NVARCHAR2,
 Var_ComputerName_id OUT Number
)
AS
BEGIN SELECT ComputerName_id into Var_ComputerName_id FROM rcaComputerNames WHERE Name = Var_name;
 If Var_ComputerName_id is Null or Var_ComputerName_id = 0 Then
 Begin
 INSERT INTO rcaComputerNames(Name) VALUES (Var_name);
 Select S_rcaComputerNames.currval into Var_ComputerName_id from dual;
 Dbms_Output.Put_Line('Data Inserted');
 end;
 Else 
 begin
 Var_ComputerName_id:= Var_ComputerName_id;
 Dbms_Output.Put_Line('Data Selected');
 end;
 end if;
EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaComputerNames(Name) VALUES (Var_name);
 Select S_rcaComputerNames.currval into Var_ComputerName_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
END SP_INS_rcaComputerNames;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCACONCURRENTINTERVALS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCACONCURRENTINTERVALS" 
( 
 Var_Interval_ IN INTEGER,
 Var_Year_ IN INTEGER,
 Var_Month_ IN INTEGER,
 Var_Day_ IN INTEGER,
 Var_Hour_ IN INTEGER,
 Var_Minute_ IN INTEGER,
 Var_Time_ IN NCHAR,
 Var_GMTInterval_id IN INTEGER,
 Var_Used00To06 IN INTEGER,
 Var_Used06To12 IN INTEGER,
 Var_Used12To18 IN INTEGER,
 Var_Used18To24 IN INTEGER
) 
AS
Loc_Var_Interval_ INTEGER;
BEGIN SELECT Interval_ INTO Loc_Var_Interval_ FROM RCACONCURRENTINTERVALS WHERE Interval_ = Var_Interval_;
 
 IF Loc_Var_Interval_ IS NULL OR Loc_Var_Interval_ = 0 THEN
 BEGIN
 INSERT INTO RCACONCURRENTINTERVALS(Interval_,Year_,Month_,Day_,Hour_,Minute_,Time_,GMTInterval_id,Used00To06,Used06To12,Used12To18,Used18To24) VALUES (Var_Interval_,Var_Year_,Var_Month_,Var_Day_,Var_Hour_,Var_Minute_, Var_Time_,Var_GMTInterval_id,Var_Used00To06,Var_Used06To12,Var_Used12To18,Var_Used18To24);
 Dbms_Output.Put_Line('Inserted'); 
 END;
 ELSE 
 BEGIN
 Dbms_Output.Put_Line('Selected'); 
 END;
 END IF;
 EXCEPTION
 WHEN NO_DATA_FOUND THEN 
 BEGIN
 Dbms_Output.Put_Line('No Data Selected');
 END;
 WHEN OTHERS THEN
 BEGIN
 RAISE_APPLICATION_ERROR(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 END; 
END Sp_Ins_Rcaconcurrentintervals;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCADOMAINNAMES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCADOMAINNAMES" 
(
 Var_name IN NVARCHAR2,
 Var_DomainName_id OUT NUMBER
 )
AS
BEGIN SELECT DomainName_id into Var_DomainName_id FROM rcaDomainNames WHERE Name = Var_name;
 If Var_DomainName_id is Null or Var_DomainName_id = 0 then
 Begin
 INSERT INTO rcaDomainNames(Name) VALUES (Var_name);
 Select S_rcaDomainNames.currval into Var_DomainName_id from dual;
 Dbms_Output.Put_Line('Data Inserted');
 end;
 Else 
 begin
 Var_DomainName_id:=Var_DomainName_id;
 Dbms_Output.Put_Line('Data Selected');
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaDomainNames(Name) VALUES (Var_name);
 Select S_rcaDomainNames.currval into Var_DomainName_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
 
END SP_INS_rcaDomainNames;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAFILENAMES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAFILENAMES" 
(
 Var_name IN NVARCHAR2,
 Var_FileName_id OUT Number
)
AS
BEGIN SELECT FileName_id into Var_FileName_id from rcaFileNames WHERE Name = Var_name;
 If Var_FileName_id is Null or Var_FileName_id = 0 then
 Begin
 INSERT INTO rcaFileNames(Name) VALUES (Var_name);
 Select s_rcaFileNames.currval into Var_FileName_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 end;
 Else 
 begin
 Var_FileName_id:=Var_FileName_id;
 Dbms_Output.Put_Line('Data Selected');
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaFileNames(Name) VALUES (Var_name);
 Select s_rcaFileNames.currval into Var_FileName_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
 
END SP_INS_rcaFileNames;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAFILEPATHS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAFILEPATHS" 
(
 Var_name IN NVARCHAR2,
 Var_FilePath_id OUT Number
)
AS
BEGIN SELECT FilePath_id into Var_FilePath_id FROM rcaFilePaths WHERE Name = Var_name;
 If Var_FilePath_id is Null or Var_FilePath_id = 0 then
 Begin
 INSERT INTO rcaFilePaths(Name) VALUES (Var_name);
 Select S_rcaFilePaths.currval into Var_FilePath_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 end;
 Else 
 begin
 Var_FilePath_id:=Var_FilePath_id;
 Dbms_Output.Put_Line('Data Selected');
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaFilePaths(Name) VALUES (Var_name);
 Select S_rcaFilePaths.currval into Var_FilePath_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
END SP_INS_rcaFilePaths;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAFILEPROPERTIES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAFILEPROPERTIES" 
(
 Var_FilePropertyName_id IN Number,
 Var_FilePropertyValue_id IN Number,
 Var_FileProperty_id OUT int
) 
AS
BEGIN SELECT FileProperty_id into Var_FileProperty_id FROM rcaFileProperties 
 WHERE FilePropertyName_id = Var_FilePropertyName_id AND FilePropertyValue_id = Var_FilePropertyValue_id;
 If Var_FileProperty_id is Null or Var_FileProperty_id = 0 then
 Begin
 INSERT INTO rcaFileProperties(FilePropertyName_id,FilePropertyValue_id) VALUES 
 (Var_FilePropertyName_id,Var_FilePropertyValue_id);
 Select S_rcaFileProperties.currval into Var_FileProperty_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 end;
 Else 
 begin
 Var_FileProperty_id:=Var_FileProperty_id;
 Dbms_Output.Put_Line('Data Selected');
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaFileProperties(FilePropertyName_id,FilePropertyValue_id) VALUES 
 (Var_FilePropertyName_id,Var_FilePropertyValue_id);
 Select S_rcaFileProperties.currval into Var_FileProperty_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
END SP_INS_rcaFileProperties;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAFILEPROPERTYNAMES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAFILEPROPERTYNAMES" 
(
 Var_Name IN NVARCHAR2,
 Var_FilePropertyName_id OUT Number
) 
AS
BEGIN Select FilePropertyName_id into Var_FilePropertyName_id FROM rcaFilePropertyNames WHERE Name = Var_Name;
 If Var_FilePropertyName_id is Null or Var_FilePropertyName_id = 0 Then
 Begin
 INSERT INTO rcaFilePropertyNames(Name) VALUES (Var_Name);
 Select S_rcaFilePropertyNames.currval into Var_FilePropertyName_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 end;
 Else 
 begin
 Var_FilePropertyName_id:= Var_FilePropertyName_id;
 Dbms_Output.Put_Line('Data Selected');
 end;
 End if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaFilePropertyNames(Name) VALUES (Var_Name);
 Select S_rcaFilePropertyNames.currval into Var_FilePropertyName_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
END SP_INS_rcaFilePropertyNames;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAFILEPROPERTYVALUES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAFILEPROPERTYVALUES" 
(
 Var_Value_ IN NVARCHAR2,
 Var_FilePropertyValue_id OUT Number
) 
AS
BEGIN SELECT FilePropertyValue_id into Var_FilePropertyValue_id FROM rcaFilePropertyValues WHERE Value_ = Var_Value_;
 If Var_FilePropertyValue_id is Null or Var_FilePropertyValue_id = 0 then
 Begin
 INSERT INTO rcaFilePropertyValues(Value_) VALUES (Var_Value_);
 select s_rcaFilePropertyValues.currval into Var_FilePropertyValue_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 end;
 Else 
 begin
 Var_FilePropertyValue_id:= Var_FilePropertyValue_id;
 Dbms_Output.Put_Line('Data Selected');
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaFilePropertyValues(Value_) VALUES (Var_Value_);
 select s_rcaFilePropertyValues.currval into Var_FilePropertyValue_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
 
END SP_INS_rcaFilePropertyValues;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAFILEROOTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAFILEROOTS" 
(
Var_Filename IN NVARCHAR2,
Var_FileRoot_id OUT NVARCHAR2
)
AS
 BEGIN Var_FileRoot_id:=0;
 SELECT FileRoot_id INTO Var_FileRoot_id
 FROM rcaFileRoots WHERE Name = Var_Filename;
 IF Var_FileRoot_id IS NULL OR Var_FileRoot_id = 0 THEN
 INSERT INTO rcaFileRoots(Name) VALUES (Var_Filename);
 DBMS_Output.Put_Line('Data Inserted');
 SELECT S_RCAFILEROOTS.currval INTO Var_FileRoot_id from dual;
 END IF;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 BEGIN
 INSERT INTO rcaFileRoots(Name) VALUES (Var_Filename);
 COMMIT;
 DBMS_Output.Put_Line('Data Inserted');
 SELECT S_RCAFILEROOTS.currval INTO Var_FileRoot_id from dual;
 END;
 WHEN OTHERS THEN
 BEGIN
 RAISE_APPLICATION_ERROR(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 END;
END SP_INS_Rcafileroots;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAFILESIGNATURES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAFILESIGNATURES" 
(
 Var_MD5Hash IN NVARCHAR2,
 Var_FileSize IN Number,
 Var_Vendor IN NVARCHAR2,
 Var_ProductName IN NVARCHAR2,
 Var_ProductVer IN NVARCHAR2,
 Var_ApplicationVer IN NVARCHAR2,
 Var_ApplicationDesc IN NVARCHAR2,
 Var_OriginalFileName IN NVARCHAR2,
 Var_FileCRC IN NVARCHAR2,
 Var_ModCRC IN NVARCHAR2,
 Var_FileSignature_id OUT int
 )
AS
BEGIN SELECT FileSignature_id into Var_FileSignature_id FROM rcaFileSignatures WHERE 
 MD5Hash =Var_MD5Hash AND FileSize = Var_FileSize;
 If Var_FileSignature_id is Null or Var_FileSignature_id = 0 then
 Begin
 INSERT INTO rcaFileSignatures(MD5Hash,FileSize,Vendor,ProductName,ProductVer,ApplicationVer,ApplicationDesc,OriginalFileName,FileCRC,ModCRC) 
 VALUES (Var_MD5Hash,Var_FileSize,Var_Vendor,Var_ProductName,Var_ProductVer,Var_ApplicationVer,Var_ApplicationDesc,Var_OriginalFileName,Var_FileCRC,Var_ModCRC);
 Select S_rcaFileSignatures.currval into Var_FileSignature_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaFileSignatures(MD5Hash,FileSize,Vendor,ProductName,ProductVer,ApplicationVer,ApplicationDesc,OriginalFileName,FileCRC,ModCRC) 
 VALUES (Var_MD5Hash,Var_FileSize,Var_Vendor,Var_ProductName,Var_ProductVer,Var_ApplicationVer,Var_ApplicationDesc,Var_OriginalFileName,Var_FileCRC,Var_ModCRC);
 Select S_rcaFileSignatures.currval into Var_FileSignature_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
END SP_INS_rcaFileSignatures;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAFILESIGNPROPERTIES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAFILESIGNPROPERTIES" 
(
 Var_FileProperty_id IN Number,
 Var_FileSignature_id IN int
) 
AS
Var_Flag int;
BEGIN SELECT FileSignature_id into Var_Flag FROM rcaFileSignatureProperties WHERE 
 FileSignature_id = Var_FileSignature_id AND FileProperty_id = Var_FileProperty_id;
 If Var_Flag is Null or Var_Flag = 0 then
 Begin
 INSERT INTO rcaFileSignatureProperties(FileSignature_id,FileProperty_id) VALUES 
 (Var_FileSignature_id,Var_FileProperty_id);
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaFileSignatureProperties(FileSignature_id,FileProperty_id) VALUES 
 (Var_FileSignature_id,Var_FileProperty_id);
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
END SP_INS_rcaFileSignProperties;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAFULLFILENAMES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAFULLFILENAMES" 
(
 Var_FolderFileRoot_id IN Number,
 Var_FilePath_id IN Number,
 Var_FileName_id IN Number,
 Var_FilePathLogicalCRC IN Number,
 Var_FullFileName_id OUT int
)
AS
BEGIN SELECT FullFileName_id into Var_FullFileName_id FROM rcaFullFileNames 
 WHERE FolderFileRoot_id = Var_FolderFileRoot_id AND 
 FilePath_id = Var_FilePath_id AND 
 FileName_id = Var_FileName_id;
 If Var_FullFileName_id is Null or Var_FullFileName_id = 0 then
 Begin
 INSERT INTO rcaFullFileNames(FolderFileRoot_id,FilePath_id,FileName_id,FilePathLogicalCRC) VALUES 
 (Var_FolderFileRoot_id,Var_FilePath_id,Var_FileName_id,Var_FilePathLogicalCRC);
 select S_rcaFullFileNames.currval into Var_FullFileName_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 end;
 Else 
 begin
 Dbms_Output.Put_Line('Data Selected');
 Var_FullFileName_id:=Var_FullFileName_id;
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaFullFileNames(FolderFileRoot_id,FilePath_id,FileName_id,FilePathLogicalCRC) VALUES 
 (Var_FolderFileRoot_id,Var_FilePath_id,Var_FileName_id,Var_FilePathLogicalCRC);
 select S_rcaFullFileNames.currval into Var_FullFileName_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
END SP_INS_rcaFullFileNames;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAUSAGEINTERVALS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAUSAGEINTERVALS" 
(
 Var_Interval_ IN Number,
 Var_IntervalType IN Number,
 Var_Year_ IN Number,
 Var_Month_ IN Number,
 Var_Day_ IN Number,
 Var_Date_ IN NVARCHAR2,
 Var_UsageInterval_id OUT Number
)
AS
BEGIN SELECT UsageInterval_id into Var_UsageInterval_id FROM rcaUsageIntervals WHERE Interval_ = Var_Interval_;
 If Var_UsageInterval_id is Null or Var_UsageInterval_id = 0 then
 Begin
 INSERT INTO rcaUsageIntervals(Interval_,IntervalType,Year_,Month_,Day_,Date_) 
 VALUES (Var_Interval_,Var_IntervalType,Var_Year_,Var_Month_,Var_Day_,Var_Date_);
 Select S_rcaUsageIntervals.currval into Var_UsageInterval_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 end;
 Else 
 begin
 Var_UsageInterval_id:=Var_UsageInterval_id;
 Dbms_Output.Put_Line('Data Selected');
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaUsageIntervals(Interval_,IntervalType,Year_,Month_,Day_,Date_) 
 VALUES (Var_Interval_,Var_IntervalType,Var_Year_,Var_Month_,Var_Day_,Var_Date_);
 Select S_rcaUsageIntervals.currval into Var_UsageInterval_id from dual; 
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
END SP_INS_rcaUsageIntervals;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAUSERNAMES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAUSERNAMES" 
(
 Var_name IN NVARCHAR2,
 Var_UserName_id OUT int
)
AS
BEGIN SELECT UserName_id into Var_UserName_id FROM rcaUserNames WHERE Name = Var_name;
 If Var_UserName_id is Null or Var_UserName_id = 0 then
 Begin
 INSERT INTO rcaUserNames(Name) VALUES (Var_name);
 Select S_rcaUserNames.currval into Var_UserName_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 end;
 Else 
 begin
 Var_UserName_id:=Var_UserName_id;
 Dbms_Output.Put_Line('Data Selected'); 
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaUserNames(Name) VALUES (Var_name);
 Select S_rcaUserNames.currval into Var_UserName_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
END SP_INS_rcaUserNames;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAWINDOWSCOMPUTERS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAWINDOWSCOMPUTERS" 
(
 Var_DomainName_id IN Number,
 Var_ComputerName_id IN Number,
 Var_WindowsSid_id IN Number,
 Var_WindowsOSVersion_id IN Number,
 Var_WindowsComputer_id OUT int
)
AS
BEGIN SELECT WindowsComputer_id into Var_WindowsComputer_id FROM rcaWindowsComputers WHERE 
 DomainName_id = Var_DomainName_id AND ComputerName_id = Var_ComputerName_id AND WindowsSid_id = Var_WindowsSid_id;
 IF Var_WindowsComputer_id IS Null or Var_WindowsComputer_id = 0 then
 begin
 INSERT INTO rcaWindowsComputers(DomainName_id,ComputerName_id,WindowsSid_id,WindowsOSVersion_id,FirstCollection,LastCollection) 
 VALUES (Var_DomainName_id,Var_ComputerName_id,Var_WindowsSid_id,Var_WindowsOSVersion_id,GETUTCDATE(),GETUTCDATE());
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 Select S_rcaWindowsComputers.currval into Var_WindowsComputer_id From Dual;
 end;
 
 Else 
 Begin
 UPDATE rcaWindowsComputers SET WindowsOSVersion_id = Var_WindowsOSVersion_id ,LastCollection = GETUTCDATE() 
 WHERE DomainName_id = Var_DomainName_id AND ComputerName_id = Var_ComputerName_id AND WindowsSid_id = Var_WindowsSid_id;
 Dbms_Output.Put_Line('Data Updated');
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaWindowsComputers(DomainName_id,ComputerName_id,WindowsSid_id,WindowsOSVersion_id,FirstCollection,LastCollection) 
 VALUES (Var_DomainName_id,Var_ComputerName_id,Var_WindowsSid_id,Var_WindowsOSVersion_id,GETUTCDATE(),GETUTCDATE());
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 Select S_rcaWindowsComputers.currval into Var_WindowsComputer_id From Dual;
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
 
END SP_INS_rcaWindowsComputers;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAWINDOWSCOMPUTERUSERS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAWINDOWSCOMPUTERUSERS" 
(
 Var_WindowsComputer_id IN Number,
 Var_WindowsUser_id IN Number,
 Var_ComputerDomain IN NVARCHAR2,
 Var_ComputerName IN NVARCHAR2,
 Var_UserDomain IN NVARCHAR2, 
 Var_UserName IN NVARCHAR2,
 Var_WindowsComputerUser_id OUT int
)
AS
BEGIN SELECT WindowsComputerUser_id into Var_WindowsComputerUser_id FROM rcaWindowsComputerUsers WHERE 
 WindowsComputer_id = Var_WindowsComputer_id AND WindowsUser_id = Var_WindowsUser_id;
 IF Var_WindowsComputerUser_id IS Null or Var_WindowsComputerUser_id = 0 then
 begin
 INSERT INTO rcaWindowsComputerUsers(WindowsComputer_id,WindowsUser_id,ComputerDomain,ComputerName,UserDomain,UserName) 
 VALUES (Var_WindowsComputer_id,Var_WindowsUser_id,Var_ComputerDomain,Var_ComputerName,Var_UserDomain,Var_UserName);
 select S_rcaWindowsComputerUsers.currval into Var_WindowsComputerUser_id from dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 end; 
 Else 
 Begin
 UPDATE rcaWindowsComputerUsers SET ComputerDomain = Var_ComputerDomain,ComputerName = Var_ComputerName,UserDomain = Var_UserDomain,UserName = Var_UserName
 WHERE WindowsComputer_id = Var_WindowsComputer_id AND WindowsUser_id = Var_WindowsUser_id;
 commit;
 Dbms_Output.Put_Line('Data Updated');
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaWindowsComputerUsers(WindowsComputer_id,WindowsUser_id,ComputerDomain,ComputerName,UserDomain,UserName) 
 VALUES (Var_WindowsComputer_id,Var_WindowsUser_id,Var_ComputerDomain,Var_ComputerName,Var_UserDomain,Var_UserName);
 commit;
 select S_rcaWindowsComputerUsers.currval into Var_WindowsComputerUser_id from dual;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end;
END SP_INS_rcaWindowsComputerUsers;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAWINDOWSCONCURRUSAGE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAWINDOWSCONCURRUSAGE" 
(
 Var_WindowsComputerUser_id IN INTEGER,
 Var_WindowsFileInstance_id IN INTEGER,
 Var_GMTInterval_id IN INTEGER,
 Var_Used00To06 IN INTEGER,
 Var_Used06To12 IN INTEGER,
 Var_Used12To18 IN INTEGER,
 Var_Used18To24 IN INTEGER
 )
 AS
 Var_Loc_Var_Userid INTEGER;

BEGIN SELECT WindowsComputerUser_id INTO Var_Loc_Var_Userid FROM RCAWINDOWSCONCURRENTUSAGE WHERE
 WindowsComputerUser_id = Var_WindowsComputerUser_id AND
 WindowsFileInstance_id = Var_WindowsFileInstance_id AND
 GMTInterval_id = Var_GMTInterval_id;

 IF Var_Loc_Var_Userid IS NULL OR Var_Loc_Var_Userid = 0 THEN
 BEGIN
 INSERT INTO RCAWINDOWSCONCURRENTUSAGE(WindowsComputerUser_id,WindowsFileInstance_id,GMTInterval_id,Used00To06,Used06To12,Used12To18,Used18To24) VALUES
 (Var_WindowsComputerUser_id,Var_WindowsFileInstance_id,Var_GMTInterval_id,Var_Used00To06,Var_Used06To12,Var_Used12To18,Var_Used18To24);
 DBMS_OUTPUT.PUT_LINE('Inserted');
 END;
 ELSE
 BEGIN
 UPDATE RCAWINDOWSCONCURRENTUSAGE SET Used00To06 = Fn_Xsqlor(Used00To06,0),
 Used06To12 = Fn_Xsqlor(Used06To12,56),
 Used12To18 = Fn_Xsqlor(Used12To18,0),
 Used18To24 = Fn_Xsqlor(Used18To24,0)
 WHERE WindowsComputerUser_id = Var_WindowsComputerUser_id AND
 WindowsFileInstance_id = Var_WindowsFileInstance_id AND
 GMTInterval_id=Var_GMTInterval_id;
 END;
 END IF;
 EXCEPTION
 WHEN NO_DATA_FOUND THEN 
 BEGIN
 Dbms_Output.Put_Line('No Data Selected');
 END;
 WHEN OTHERS THEN
 BEGIN
 RAISE_APPLICATION_ERROR(-20001,'An error was encountered - '||SQLCODE||' -ERRO
'||SQLERRM);
 END; 
END Sp_Ins_Rcawindowsconcurrusage;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAWINDOWSFILEINSTANCES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAWINDOWSFILEINSTANCES" 
(
 Var_WindowsFile_id IN Number,
 Var_FileSignature_id IN Number,
 Var_LastUsedInterval IN Number,
 Var_FirstInvnInterval_id IN Number,
 Var_UninstalledInterval_id IN Number,
 Var_FirstUsedInterval_id IN Number,
 Var_LastUsedInterval_id IN Number,
 Var_WindowsFileInstance_id OUT int
) 
AS
BEGIN Select WindowsFileInstance_id into Var_WindowsFileInstance_id FROM rcaWindowsFileInstances WHERE 
 WindowsFile_id = Var_WindowsFile_id AND FileSignature_id = Var_FileSignature_id;
 IF Var_WindowsFileInstance_id IS Null or Var_WindowsFileInstance_id = 0 then
 begin
 INSERT INTO rcaWindowsFileInstances(WindowsFile_id,FileSignature_id,LastUsedInterval,FirstInvnInterval_id,UninstalledInterval_id,FirstUsedInterval_id,LastUsedInterval_id) 
 VALUES (Var_WindowsFile_id,Var_FileSignature_id,Var_LastUsedInterval,Var_FirstInvnInterval_id,Var_UninstalledInterval_id,Var_FirstUsedInterval_id,Var_LastUsedInterval_id);
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 Select S_rcaWindowsFileInstances.currval into Var_WindowsFileInstance_id From Dual;
 
 
 UPDATE rcaWindowsFiles SET CurrentFileInstance_id = Var_WindowsFileInstance_id 
 WHERE WindowsFile_id = Var_WindowsFile_id; 
 commit;
 Dbms_Output.Put_Line('Data Updated');
 
 
 end; 
 Else 
 Begin
 UPDATE rcaWindowsFileInstances SET LastUsedInterval = Var_LastUsedInterval,FirstInvnInterval_id = Var_FirstInvnInterval_id,UninstalledInterval_id = Var_UninstalledInterval_id,FirstUsedInterval_id = Var_FirstUsedInterval_id,LastUsedInterval_id = Var_LastUsedInterval_id 
 WHERE WindowsFile_id = Var_WindowsFile_id AND FileSignature_id = Var_FileSignature_id;
 commit;
 Dbms_Output.Put_Line('Data Updated');
 
 UPDATE rcaWindowsFiles SET CurrentFileInstance_id = Var_WindowsFileInstance_id 
 WHERE WindowsFile_id = Var_WindowsFile_id; 
 commit;
 Dbms_Output.Put_Line('Data Updated');
 
 
 
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then
 Begin
 INSERT INTO rcaWindowsFileInstances(WindowsFile_id,FileSignature_id,LastUsedInterval,FirstInvnInterval_id,UninstalledInterval_id,FirstUsedInterval_id,LastUsedInterval_id) 
 VALUES (Var_WindowsFile_id,Var_FileSignature_id,Var_LastUsedInterval,Var_FirstInvnInterval_id,Var_UninstalledInterval_id,Var_FirstUsedInterval_id,Var_LastUsedInterval_id);
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 Select S_rcaWindowsFileInstances.currval into Var_WindowsFileInstance_id From Dual; 
 
 UPDATE rcaWindowsFiles SET CurrentFileInstance_id = Var_WindowsFileInstance_id 
 WHERE WindowsFile_id = Var_WindowsFile_id; 
 commit;
 Dbms_Output.Put_Line('Data Updated');
 
 
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end; 
END SP_INS_rcaWindowsFileInstances;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAWINDOWSFILEROOTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAWINDOWSFILEROOTS" 
( 
 Var_WindowsComputerUser_id IN Number,
 Var_FolderFileRoot_id IN Number,
 Var_PathFileRoot_id IN int
)
AS
Loc_Var_WindowsCompUser_id int;
 row_count NUMBER;
BEGIN UPDATE rcaWindowsFileRoots SET PathFileRoot_id = Var_PathFileRoot_id 
 WHERE WindowsComputerUser_id = Var_WindowsComputerUser_id AND FolderFileRoot_id = Var_FolderFileRoot_id;
 
 row_count := sql%rowcount;
 commit;
 Dbms_Output.Put_Line('Data Updated');
 If (row_count = 0) Then 
 Begin
 INSERT INTO rcaWindowsFileRoots(WindowsComputerUser_id,FolderFileRoot_id,PathFileRoot_id) 
 VALUES (Var_WindowsComputerUser_id,Var_FolderFileRoot_id,Var_PathFileRoot_id);
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 end if;
END SP_INS_rcaWindowsFileRoots;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAWINDOWSFILES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAWINDOWSFILES" 
( 
 Var_WindowsComputerUser_id IN Number,
 Var_FullFileName_id IN Number,
 Var_Inventoried IN Number,
 Var_UsageFilterInclude IN Number,
 Var_UsageFilterReason IN Number,
 Var_LastUsedInterval IN Number,
 Var_FirstInvnInterval_id IN Number,
 Var_UninstalledInterval_id IN Number,
 Var_FirstUsedInterval_id IN Number,
 Var_LastUsedInterval_id IN Number,
 Var_WindowsFile_id OUT int
)
AS
BEGIN SELECT WindowsFile_id INTO Var_WindowsFile_id FROM rcaWindowsFiles WHERE 
 WindowsComputerUser_id = Var_WindowsComputerUser_id AND FullFileName_id = Var_FullFileName_id;
 IF Var_WindowsFile_id IS Null or Var_WindowsFile_id = 0 THEN
 Begin
 INSERT INTO rcaWindowsFiles(WindowsComputerUser_id,FullFileName_id,Inventoried,UsageFilterInclude,UsageFilterReason,LastUsedInterval,FirstInvnInterval_id,UninstalledInterval_id,FirstUsedInterval_id,LastUsedInterval_id) 
 VALUES (Var_WindowsComputerUser_id,Var_FullFileName_id,Var_Inventoried,Var_UsageFilterInclude,Var_UsageFilterReason,Var_LastUsedInterval,Var_FirstInvnInterval_id,Var_UninstalledInterval_id,Var_FirstUsedInterval_id,Var_LastUsedInterval_id);
 select S_rcaWindowsFiles.currval into Var_WindowsFile_id From Dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted'); 
 End; 
 Else 
 Begin
 UPDATE rcaWindowsFiles SET Inventoried = Var_Inventoried,UsageFilterInclude = Var_UsageFilterInclude,UsageFilterReason = Var_UsageFilterReason,LastUsedInterval = Var_LastUsedInterval,FirstInvnInterval_id = Var_FirstInvnInterval_id,UninstalledInterval_id = Var_UninstalledInterval_id,FirstUsedInterval_id = Var_FirstUsedInterval_id,LastUsedInterval_id = Var_LastUsedInterval_id 
 WHERE WindowsComputerUser_id = Var_WindowsComputerUser_id AND FullFileName_id = Var_FullFileName_id;
 commit;
 Dbms_Output.Put_Line('Data Updated');
 End;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then 
 Begin
 INSERT INTO rcaWindowsFiles(WindowsComputerUser_id,FullFileName_id,Inventoried,UsageFilterInclude,UsageFilterReason,LastUsedInterval,FirstInvnInterval_id,UninstalledInterval_id,FirstUsedInterval_id,LastUsedInterval_id) 
 VALUES (Var_WindowsComputerUser_id,Var_FullFileName_id,Var_Inventoried,Var_UsageFilterInclude,Var_UsageFilterReason,Var_LastUsedInterval,Var_FirstInvnInterval_id,Var_UninstalledInterval_id,Var_FirstUsedInterval_id,Var_LastUsedInterval_id);
 select S_rcaWindowsFiles.currval into Var_WindowsFile_id From Dual;
 commit;
 Dbms_Output.Put_Line('Data Inserted'); 
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end; 
END SP_INS_rcaWindowsFiles;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAWINDOWSFILEUSAGE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAWINDOWSFILEUSAGE" 
 (
 Var_WINDOWSCOMPUTERUSER_ID IN NUMBER,
 Var_WINDOWSFILEINSTANCE_ID IN NUMBER,
 Var_USAGEINTERVAL_ID IN NUMBER,
 Var_USAGECOUNT IN NUMBER,
 Var_USAGESECONDS IN NUMBER,
 Var_FOCUSSECONDS IN NUMBER
 )
 AS
 Loc_var_WINDOWSCOMPUTERUSER_ID NUMBER;
 row_count NUMBER;
 BEGIN UPDATE rcaWindowsFileUsage SET
 UsageCount= UsageCount + Var_USAGECOUNT,
 UsageSeconds= UsageSeconds + Var_USAGESECONDS,
 FocusSeconds= FocusSeconds + Var_FOCUSSECONDS
 WHERE
 WindowsComputerUser_id = Var_WINDOWSCOMPUTERUSER_ID AND
 WindowsFileInstance_id = Var_WINDOWSFILEINSTANCE_ID AND
 UsageInterval_id = Var_USAGEINTERVAL_ID;
 
 row_count := sql%rowcount;
 Commit;
 Dbms_Output.Put_Line('Data Updated');
 If (row_count = 0) Then
 Begin
 INSERT INTO rcaWindowsFileUsage(WindowsComputerUser_id,WindowsFileInstance_id,UsageInterval_id,
 UsageCount,UsageSeconds,FocusSeconds)
 VALUES (Var_WINDOWSCOMPUTERUSER_ID,Var_WINDOWSFILEINSTANCE_ID,Var_USAGEINTERVAL_ID,
 Var_USAGECOUNT, Var_USAGESECONDS, Var_FocusSeconds);
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 End;
 end if;
 END SP_INS_rcaWindowsFileUsage;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAWINDOWSOSVERSIONS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAWINDOWSOSVERSIONS" 
( 
 Var_PlatformId IN Number,
 Var_MajorVersion IN Number,
 Var_MinorVersion IN Number,
 Var_BuildNumber IN Number,
 Var_ServicePackMajor IN Number,
 Var_ServicePackMinor IN Number,
 Var_SuiteMask IN Number,
 Var_ProductType IN Number,
 Var_Platform IN NVARCHAR2,
 Var_CSDVersion IN NVARCHAR2,
 Var_WindowsOsVersion_id OUT int
 )
AS
BEGIN SELECT WindowsOSVersion_id into Var_WindowsOsVersion_id FROM rcaWindowsOSVersions 
 WHERE PlatformId = Var_PlatformId AND MajorVersion = Var_MajorVersion AND MinorVersion = Var_MinorVersion AND BuildNumber = Var_BuildNumber AND ServicePackMajor = Var_ServicePackMajor AND ServicePackMinor = Var_ServicePackMinor AND SuiteMask = Var_SuiteMask AND ProductType = Var_ProductType;
 IF Var_WindowsOsVersion_id IS Null or Var_WindowsOsVersion_id = 0 then
 begin
 Insert into rcaWindowsOSVersions(PlatformId,MajorVersion,MinorVersion,BuildNumber,ServicePackMajor,ServicePackMinor,SuiteMask,ProductType,Platform,CSDVersion) Values
 (Var_PlatformId,Var_MajorVersion,Var_MinorVersion,Var_BuildNumber,Var_ServicePackMajor,Var_ServicePackMinor,Var_SuiteMask,Var_ProductType,Var_Platform,Var_CSDVersion); 
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 Select S_rcaWindowsOSVersions.currval into Var_WindowsOsVersion_id From Dual;
 end;
 Else 
 Begin
 UPDATE rcaWindowsOSVersions SET Platform = Var_Platform,CSDVersion = Var_CSDVersion 
 WHERE PlatformId = Var_PlatformId AND MajorVersion = Var_MajorVersion AND MinorVersion = Var_MinorVersion AND BuildNumber = Var_BuildNumber AND ServicePackMajor = Var_ServicePackMajor AND ServicePackMinor = Var_ServicePackMinor AND SuiteMask = Var_SuiteMask AND ProductType = Var_ProductType;
 commit;
 Dbms_Output.Put_Line('Data Updated');
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then 
 Begin
 Insert into rcaWindowsOSVersions(PlatformId,MajorVersion,MinorVersion,BuildNumber,ServicePackMajor,ServicePackMinor,SuiteMask,ProductType,Platform,CSDVersion) Values
 (Var_PlatformId,Var_MajorVersion,Var_MinorVersion,Var_BuildNumber,Var_ServicePackMajor,Var_ServicePackMinor,Var_SuiteMask,Var_ProductType,Var_Platform,Var_CSDVersion); 
 Commit;
 Dbms_Output.Put_Line('Data Inserted');
 Select S_rcaWindowsOSVersions.currval into Var_WindowsOsVersion_id From Dual;
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end; 
END SP_INS_rcaWindowsOSVersions;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAWINDOWSSIDS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAWINDOWSSIDS" 
(
 Var_Name IN NVARCHAR2,
 Var_WindowsSid_id OUT Number
)
AS
BEGIN SELECT WindowsSid_id into Var_WindowsSid_id FROM rcaWindowsSids WHERE Name = Var_Name;
 If Var_WindowsSid_id is Null or Var_WindowsSid_id = 0 then
 Begin
 INSERT INTO rcaWindowsSids(Name) VALUES (Var_Name);
 commit;
 Dbms_Output.Put_Line('Data Inserted'); 
 Select S_rcaWindowsSids.currval into Var_WindowsSid_id From Dual;
 end;
 Else 
 begin
 Var_WindowsSid_id:=Var_WindowsSid_id;
 Dbms_Output.Put_Line('Data Selected');
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then 
 Begin
 INSERT INTO rcaWindowsSids(Name) VALUES (Var_Name);
 commit;
 Dbms_Output.Put_Line('Data Inserted'); 
 Select S_rcaWindowsSids.currval into Var_WindowsSid_id From Dual; 
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end; 
END SP_INS_rcaWindowsSids;
--------------------------------------------------------
--  DDL for Procedure SP_INS_RCAWINDOWSUSERS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_INS_RCAWINDOWSUSERS" 
(
 Var_DomainName_id IN Number,
 Var_UserName_id IN Number,
 Var_WindowsSid_id IN Number,
 Var_WindowsUser_id OUT Number
)
AS
BEGIN SELECT WindowsUser_id into Var_WindowsUser_id FROM rcaWindowsUsers WHERE 
 DomainName_id = Var_DomainName_id AND UserName_id = Var_UserName_id AND WindowsSid_id = Var_WindowsSid_id;
 IF Var_WindowsUser_id IS Null or Var_WindowsUser_id = 0 then
 begin
 INSERT INTO rcaWindowsUsers(DomainName_id,UserName_id,WindowsSid_id,FirstCollection,LastCollection) 
 VALUES (Var_DomainName_id,Var_UserName_id,Var_WindowsSid_id,GETUTCDATE(),GETUTCDATE());
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 Select S_rcaWindowsUsers.currval into Var_WindowsUser_id From Dual;
 end;
 Else 
 Begin
 UPDATE rcaWindowsUsers SET LastCollection = GETUTCDATE() 
 WHERE DomainName_id = Var_DomainName_id AND UserName_id = Var_UserName_id AND WindowsSid_id = Var_WindowsSid_id;
 Dbms_Output.Put_Line('Data Updated');
 end;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then 
 Begin
 INSERT INTO rcaWindowsUsers(DomainName_id,UserName_id,WindowsSid_id,FirstCollection,LastCollection) 
 VALUES (Var_DomainName_id,Var_UserName_id,Var_WindowsSid_id,GETUTCDATE(),GETUTCDATE());
 commit;
 Dbms_Output.Put_Line('Data Inserted');
 Select S_rcaWindowsUsers.currval into Var_WindowsUser_id From Dual;
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end; 
END SP_INS_rcaWindowsUsers;
--------------------------------------------------------
--  DDL for Procedure SP_OSM_REPORTING
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_OSM_REPORTING" (
 deployment_id IN VARCHAR2 DEFAULT NULL,
 device_id IN VARCHAR2 DEFAULT NULL,
 serial_no IN VARCHAR2 DEFAULT NULL,
 roms_server IN VARCHAR2 DEFAULT NULL,
 comp_name IN VARCHAR2 DEFAULT NULL,
 eos_name IN VARCHAR2 DEFAULT NULL,
 tos_name IN VARCHAR2 DEFAULT NULL,
 ipaddress IN VARCHAR2 DEFAULT NULL,
 subnetmask IN VARCHAR2 DEFAULT NULL,
 subnetid IN VARCHAR2 DEFAULT NULL,
 region IN VARCHAR2 DEFAULT NULL,
 jobid IN VARCHAR2 DEFAULT NULL,
 event_name IN VARCHAR2 DEFAULT NULL,
 event_type IN VARCHAR2 DEFAULT NULL,
 event_subtype IN VARCHAR2 DEFAULT NULL,
 drivemap IN VARCHAR2 DEFAULT NULL,
 with_pbr IN VARCHAR2 DEFAULT NULL,
 timezone IN VARCHAR2 DEFAULT NULL,
 event_time IN VARCHAR2 DEFAULT NULL,
 dep_stime IN VARCHAR2 DEFAULT NULL,
 dep_etime IN VARCHAR2 DEFAULT NULL,
 subevent IN VARCHAR2 DEFAULT NULL,
 status IN VARCHAR2 DEFAULT NULL,
 progress_overall IN VARCHAR2 DEFAULT NULL,
 errormsg IN VARCHAR2 DEFAULT NULL )
AS
 old_deployment_id VARCHAR2(100);
 old_device_id VARCHAR2(50);
 old_serial_no VARCHAR2(100);
 old_roms_server VARCHAR2(20);
 old_comp_name VARCHAR2(100);
 old_eos_name VARCHAR2(100);
 old_tos_name VARCHAR2(100);
 old_ipaddress VARCHAR2(20);
 old_subnetmask VARCHAR2(50);
 old_subnetid VARCHAR2(20);
 old_region VARCHAR2(100);
 old_jobid VARCHAR2(100);
 old_event_name VARCHAR2(30);
 old_event_type VARCHAR2(30);
 old_event_subtype VARCHAR2(30);
 old_drivemap VARCHAR2(50);
 old_with_pbr VARCHAR2(10);
 old_timezone VARCHAR2(20);
 old_event_time DATE;
 old_dep_stime DATE;
 old_dep_etime DATE;
 old_subevent VARCHAR2(200);
 old_status VARCHAR2(50);
 old_progress_overall VARCHAR2(10);
 old_errormsg VARCHAR2(200);
 nextid NUMERIC;
 old_progress NUMERIC(10,3);
 new_progress NUMERIC(10,3);
 temp_maxeventid NUMERIC(10,3);
 v_progress_overall VARCHAR2(10);
BEGIN
 
 sp_OSM_REPORTING.v_progress_overall := progress_overall;
 
 BEGIN
 FOR REC IN
 (SELECT deployment_id,
 device_id,
 serial_no,
 roms_server,
 comp_name,
 eos_name,
 tos_name,
 ipaddress,
 subnetmask,
 subnetid,
 region,
 jobid,
 event_name,
 event_type,
 event_subtype,
 drivemap,
 with_pbr,
 timezone,
 event_time,
 dep_stime,
 dep_etime,
 subevent,
 status,
 progress_overall,
 errormsg
 FROM tOSMEvent
 WHERE device_id = sp_OSM_REPORTING.device_id
 AND SERIAL_NO = sp_OSM_REPORTING.serial_no
 )
 LOOP
 sp_OSM_REPORTING.old_deployment_id := REC.deployment_id;
 sp_OSM_REPORTING.old_device_id := REC.device_id;
 sp_OSM_REPORTING.old_serial_no := REC.serial_no;
 sp_OSM_REPORTING.old_roms_server := REC.roms_server;
 sp_OSM_REPORTING.old_comp_name := REC.comp_name;
 sp_OSM_REPORTING.old_eos_name := REC.eos_name;
 sp_OSM_REPORTING.old_tos_name := REC.tos_name;
 sp_OSM_REPORTING.old_ipaddress := REC.ipaddress;
 sp_OSM_REPORTING.old_subnetmask := REC.subnetmask;
 sp_OSM_REPORTING.old_subnetid := REC.subnetid;
 sp_OSM_REPORTING.old_region := REC.region;
 sp_OSM_REPORTING.old_jobid := REC.jobid;
 sp_OSM_REPORTING.old_event_name := REC.event_name;
 sp_OSM_REPORTING.old_event_type := REC.event_type;
 sp_OSM_REPORTING.old_event_subtype := REC.event_subtype;
 sp_OSM_REPORTING.old_drivemap := REC.drivemap;
 sp_OSM_REPORTING.old_with_pbr := REC.with_pbr;
 sp_OSM_REPORTING.old_timezone := REC.timezone;
 sp_OSM_REPORTING.old_event_time := REC.event_time;
 sp_OSM_REPORTING.old_dep_stime := REC.dep_stime;
 sp_OSM_REPORTING.old_dep_etime := REC.dep_etime;
 sp_OSM_REPORTING.old_subevent := REC.subevent;
 sp_OSM_REPORTING.old_status := REC.status;
 sp_OSM_REPORTING.old_progress_overall := REC.progress_overall;
 sp_OSM_REPORTING.old_errormsg := REC.errormsg; 
 END LOOP;
 END;
 IF(old_deployment_id IS NOT NULL) THEN
 BEGIN
 OLD_PROGRESS := SUBSTR(old_progress_overall, 1, INSTR(old_progress_overall, '/') -1);
 NEW_PROGRESS := SUBSTR(progress_overall, 1, INSTR(progress_overall, '/') -1);
 IF (NVL(errormsg, ' ') != ' ' ) THEN
 BEGIN
 sp_OSM_REPORTING.NEW_PROGRESS := (sp_OSM_REPORTING.OLD_PROGRESS + 0.1);
 sp_OSM_REPORTING.v_progress_overall := sp_OSM_REPORTING.NEW_PROGRESS || '/';
 END;
 END IF;
 IF((OLD_PROGRESS >= NEW_PROGRESS) AND ( sp_OSM_REPORTING.old_event_time < sp_OSM_REPORTING.event_time) AND (sp_OSM_REPORTING.subevent NOT LIKE 'Policy resolved as%')) THEN
 BEGIN
 IF(sp_OSM_REPORTING.old_subevent != 'Invoking pre-reboot exit point') THEN
 old_status := 'Failed';
 END IF;
 DELETE
 FROM tOSMEvent
 WHERE device_id = sp_OSM_REPORTING.device_id
 AND SERIAL_NO = sp_OSM_REPORTING.serial_no;
 UPDATE osmevents
 SET dep_etime = sp_OSM_REPORTING.event_time,
 duration = ((FLOOR(((CAST(sp_OSM_REPORTING.event_time AS DATE) - sp_OSM_REPORTING.old_dep_stime))* DECODE('HH', 'SS', 24*60*60, 'MI', 24*60, 'HH', 24, NULL ))
 || ' hr '
 || mod(FLOOR(((CAST(sp_OSM_REPORTING.event_time AS DATE) - sp_OSM_REPORTING.old_dep_stime))* DECODE('MI', 'SS', 24*60*60, 'MI', 24*60, 'HH', 24, NULL )),60)
 || ' min')) 
 , status = sp_OSM_REPORTING.old_status
 WHERE event_id =
 (SELECT MAX(event_id) FROM osmevents WHERE deployment_id = old_deployment_id
 );
 old_deployment_id := NULL;
 END;
 END IF;
 END;
 ELSE
 
 BEGIN
 
 BEGIN
 FOR REC IN
 (SELECT max_event_id
 FROM Latest_OS_Deployment
 WHERE device_id = sp_OSM_REPORTING.device_id
 AND serial_no = sp_OSM_REPORTING.serial_no
 )
 LOOP
 sp_OSM_REPORTING.temp_maxeventid := REC.max_event_id;
 END LOOP;
 END;
 
 
 BEGIN
 FOR REC IN
 (SELECT deployment_id,
 device_id,
 serial_no,
 roms_server,
 comp_name,
 eos_name,
 tos_name,
 ipaddress,
 subnetmask,
 subnetid,
 region,
 jobid,
 event_name,
 event_type,
 event_subtype,
 drivemap,
 with_pbr,
 timezone,
 event_time,
 dep_stime,
 dep_etime,
 subevent,
 status,
 progress_overall,
 errormsg
 FROM OSMEvents
 WHERE event_id = sp_OSM_REPORTING.temp_maxeventid
 )
 LOOP
 sp_OSM_REPORTING.old_deployment_id := REC.deployment_id;
 sp_OSM_REPORTING.old_device_id := REC.device_id;
 sp_OSM_REPORTING.old_serial_no := REC.serial_no;
 sp_OSM_REPORTING.old_roms_server := REC.roms_server;
 sp_OSM_REPORTING.old_comp_name := REC.comp_name;
 sp_OSM_REPORTING.old_eos_name := REC.eos_name;
 sp_OSM_REPORTING.old_tos_name := REC.tos_name;
 sp_OSM_REPORTING.old_ipaddress := REC.ipaddress;
 sp_OSM_REPORTING.old_subnetmask := REC.subnetmask;
 sp_OSM_REPORTING.old_subnetid := REC.subnetid;
 sp_OSM_REPORTING.old_region := REC.region;
 sp_OSM_REPORTING.old_jobid := REC.jobid;
 sp_OSM_REPORTING.old_event_name := REC.event_name;
 sp_OSM_REPORTING.old_event_type := REC.event_type;
 sp_OSM_REPORTING.old_event_subtype := REC.event_subtype;
 sp_OSM_REPORTING.old_drivemap := REC.drivemap;
 sp_OSM_REPORTING.old_with_pbr := REC.with_pbr;
 sp_OSM_REPORTING.old_timezone := REC.timezone;
 sp_OSM_REPORTING.old_event_time := REC.event_time;
 sp_OSM_REPORTING.old_dep_stime := REC.dep_stime;
 sp_OSM_REPORTING.old_dep_etime := REC.dep_etime;
 sp_OSM_REPORTING.old_subevent := REC.subevent;
 sp_OSM_REPORTING.old_status := REC.status;
 sp_OSM_REPORTING.old_progress_overall := REC.progress_overall;
 sp_OSM_REPORTING.old_errormsg := REC.errormsg; 
 END LOOP;
 END;
 
 
 OLD_PROGRESS := SUBSTR(old_progress_overall, 1, INSTR(old_progress_overall, '/') -1);
 NEW_PROGRESS := SUBSTR(progress_overall, 1, INSTR(progress_overall, '/') -1);
 
 
 IF(sp_OSM_REPORTING.old_event_time > sp_OSM_REPORTING.event_time) THEN
 BEGIN
 BEGIN
 FOR REC IN
 (SELECT (1 + NVL(MAX(event_id), 0)) TEMP_ALIAS_3 FROM OSMEvents
 )
 LOOP
 sp_OSM_REPORTING.nextid := REC.TEMP_ALIAS_3;
 END LOOP;
 END;
 
 
 
 INSERT
 INTO OSMEvents
 (
 event_id ,
 deployment_id ,
 device_id ,
 serial_no ,
 roms_server ,
 comp_name ,
 eos_name ,
 tos_name ,
 ipaddress ,
 subnetmask ,
 subnetid ,
 region ,
 jobid ,
 event_name ,
 event_type ,
 event_subtype ,
 drivemap ,
 with_pbr ,
 timezone ,
 event_time ,
 dep_stime ,
 dep_etime ,
 duration ,
 subevent ,
 status ,
 progress_overall ,
 errormsg
 )
 VALUES
 (
 sp_OSM_REPORTING.nextid ,
 sp_OSM_REPORTING.old_deployment_id ,
 sp_OSM_REPORTING.device_id ,
 sp_OSM_REPORTING.serial_no ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.roms_server,' ') = ' '
 THEN sp_OSM_REPORTING.old_roms_server
 ELSE sp_OSM_REPORTING.roms_server
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.comp_name,' ') = ' '
 THEN sp_OSM_REPORTING.old_comp_name
 ELSE sp_OSM_REPORTING.comp_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.eos_name,' ') = ' '
 THEN sp_OSM_REPORTING.old_eos_name
 ELSE sp_OSM_REPORTING.eos_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.tos_name,' ') = ' '
 THEN sp_OSM_REPORTING.old_tos_name
 ELSE sp_OSM_REPORTING.tos_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.ipaddress,' ') = ' '
 THEN sp_OSM_REPORTING.old_ipaddress
 ELSE sp_OSM_REPORTING.ipaddress
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.subnetmask,' ') = ' '
 THEN sp_OSM_REPORTING.old_subnetmask
 ELSE sp_OSM_REPORTING.subnetmask
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.subnetid,' ') = ' '
 THEN sp_OSM_REPORTING.old_subnetid
 ELSE sp_OSM_REPORTING.subnetid
 END ,
 sp_OSM_REPORTING.region ,
 NVL(sp_OSM_REPORTING.jobid, sp_OSM_REPORTING.old_jobid) ,
 sp_OSM_REPORTING.event_name ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.event_type,' ') = ' '
 THEN sp_OSM_REPORTING.old_event_type
 ELSE sp_OSM_REPORTING.event_type
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.event_subtype,' ') = ' '
 THEN sp_OSM_REPORTING.old_event_subtype
 ELSE sp_OSM_REPORTING.event_subtype
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.drivemap,' ') = ' '
 THEN sp_OSM_REPORTING.old_drivemap
 ELSE sp_OSM_REPORTING.drivemap
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.with_pbr, ' ') = ' '
 THEN sp_OSM_REPORTING.old_with_pbr
 ELSE sp_OSM_REPORTING.with_pbr
 END ,
 sp_OSM_REPORTING.timezone ,
 sp_OSM_REPORTING.event_time ,
 sp_OSM_REPORTING.old_dep_stime ,
 NULL ,
 NULL ,
 sp_OSM_REPORTING.subevent ,
 sp_OSM_REPORTING.status ,
 sp_OSM_REPORTING.v_progress_overall ,
 sp_OSM_REPORTING.errormsg
 );
 RETURN;
 END;
 END IF;
 old_deployment_id := NULL;
 END;
 
END IF;


BEGIN
 FOR REC IN
 ( SELECT (1 + NVL(MAX(event_id), 0)) TEMP_ALIAS_0 FROM OSMEvents
 )
 LOOP
 sp_OSM_REPORTING.nextid := REC.TEMP_ALIAS_0;
 END LOOP;
END;
IF(NVL(sp_OSM_REPORTING.old_deployment_id, ' ') = ' ') THEN
 BEGIN
 IF( (NVL(errormsg,' ') != ' ') OR (subevent = 'Setting Desired state') ) THEN
 BEGIN
 INSERT
 INTO OSMEvents
 (
 event_id ,
 deployment_id ,
 device_id ,
 serial_no ,
 roms_server ,
 comp_name ,
 eos_name ,
 tos_name ,
 ipaddress ,
 subnetmask ,
 subnetid ,
 region ,
 jobid ,
 event_name ,
 event_type ,
 event_subtype ,
 drivemap ,
 with_pbr ,
 timezone ,
 event_time ,
 dep_stime ,
 dep_etime ,
 duration ,
 subevent ,
 status ,
 progress_overall ,
 errormsg
 )
 VALUES
 (
 sp_OSM_REPORTING.nextid ,
 sp_OSM_REPORTING.deployment_id ,
 sp_OSM_REPORTING.device_id ,
 sp_OSM_REPORTING.serial_no ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.roms_server,' ') = ' '
 THEN sp_OSM_REPORTING.old_roms_server
 ELSE sp_OSM_REPORTING.roms_server
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.comp_name,' ') = ' '
 THEN sp_OSM_REPORTING.old_comp_name
 ELSE sp_OSM_REPORTING.comp_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.eos_name,' ') = ' '
 THEN sp_OSM_REPORTING.old_eos_name
 ELSE sp_OSM_REPORTING.eos_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.tos_name,' ') = ' '
 THEN sp_OSM_REPORTING.old_tos_name
 ELSE sp_OSM_REPORTING.tos_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.ipaddress,' ') = ' '
 THEN sp_OSM_REPORTING.old_ipaddress
 ELSE sp_OSM_REPORTING.ipaddress
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.subnetmask,' ') = ' '
 THEN sp_OSM_REPORTING.old_subnetmask
 ELSE sp_OSM_REPORTING.subnetmask
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.subnetid,' ') = ' '
 THEN sp_OSM_REPORTING.old_subnetid
 ELSE sp_OSM_REPORTING.subnetid
 END ,
 sp_OSM_REPORTING.region ,
 NVL(sp_OSM_REPORTING.jobid, sp_OSM_REPORTING.old_jobid) ,
 sp_OSM_REPORTING.event_name ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.event_type,' ') = ' '
 THEN sp_OSM_REPORTING.old_event_type
 ELSE sp_OSM_REPORTING.event_type
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.event_subtype,' ') = ' '
 THEN sp_OSM_REPORTING.old_event_subtype
 ELSE sp_OSM_REPORTING.event_subtype
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.drivemap,' ') = ' '
 THEN sp_OSM_REPORTING.old_drivemap
 ELSE sp_OSM_REPORTING.drivemap
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.with_pbr, ' ') = ' '
 THEN sp_OSM_REPORTING.old_with_pbr
 ELSE sp_OSM_REPORTING.with_pbr
 END ,
 sp_OSM_REPORTING.timezone ,
 sp_OSM_REPORTING.event_time ,
 sp_OSM_REPORTING.event_time ,
 sp_OSM_REPORTING.event_time ,
 (FLOOR(((sp_OSM_REPORTING.event_time - sp_OSM_REPORTING.event_time))* DECODE('HH', 'SS', 24*60*60, 'MI', 24*60, 'HH', 24, NULL ))
 || ' hr '
 || mod(FLOOR(((sp_OSM_REPORTING.event_time - sp_OSM_REPORTING.event_time))* DECODE('MI', 'SS', 24*60*60, 'MI', 24*60, 'HH', 24, NULL )),60)
 || ' min') ,
 sp_OSM_REPORTING.subevent ,
 sp_OSM_REPORTING.status ,
 sp_OSM_REPORTING.v_progress_overall ,
 sp_OSM_REPORTING.errormsg
 );
 END;
 ELSE
 BEGIN
 INSERT
 INTO OSMEvents
 (
 event_id ,
 deployment_id ,
 device_id ,
 serial_no ,
 roms_server ,
 comp_name ,
 eos_name ,
 tos_name ,
 ipaddress ,
 subnetmask ,
 subnetid ,
 region ,
 jobid ,
 event_name ,
 event_type ,
 event_subtype ,
 drivemap ,
 with_pbr ,
 timezone ,
 event_time ,
 dep_stime ,
 dep_etime ,
 duration ,
 subevent ,
 status ,
 progress_overall ,
 errormsg
 )
 VALUES
 (
 sp_OSM_REPORTING.nextid ,
 sp_OSM_REPORTING.deployment_id ,
 sp_OSM_REPORTING.device_id ,
 sp_OSM_REPORTING.serial_no ,
 sp_OSM_REPORTING.roms_server ,
 sp_OSM_REPORTING.comp_name ,
 sp_OSM_REPORTING.eos_name ,
 sp_OSM_REPORTING.tos_name ,
 sp_OSM_REPORTING.ipaddress ,
 sp_OSM_REPORTING.subnetmask ,
 sp_OSM_REPORTING.subnetid ,
 sp_OSM_REPORTING.region ,
 sp_OSM_REPORTING.jobid ,
 sp_OSM_REPORTING.event_name ,
 sp_OSM_REPORTING.event_type ,
 sp_OSM_REPORTING.event_subtype ,
 sp_OSM_REPORTING.drivemap ,
 sp_OSM_REPORTING.with_pbr ,
 sp_OSM_REPORTING.timezone ,
 sp_OSM_REPORTING.event_time ,
 sp_OSM_REPORTING.event_time ,
 NULL ,
 NULL ,
 sp_OSM_REPORTING.subevent ,
 sp_OSM_REPORTING.status ,
 sp_OSM_REPORTING.v_progress_overall ,
 sp_OSM_REPORTING.errormsg
 );
 INSERT
 INTO tOSMEvent
 (
 deployment_id ,
 device_id ,
 serial_no ,
 roms_server ,
 comp_name ,
 eos_name ,
 tos_name ,
 ipaddress ,
 subnetmask ,
 subnetid ,
 region ,
 jobid ,
 event_name ,
 event_type ,
 event_subtype ,
 drivemap ,
 with_pbr ,
 timezone ,
 event_time ,
 dep_stime ,
 dep_etime ,
 subevent ,
 status ,
 progress_overall ,
 errormsg
 )
 VALUES
 (
 sp_OSM_REPORTING.deployment_id ,
 sp_OSM_REPORTING.device_id ,
 sp_OSM_REPORTING.serial_no ,
 sp_OSM_REPORTING.roms_server ,
 sp_OSM_REPORTING.comp_name ,
 sp_OSM_REPORTING.eos_name ,
 sp_OSM_REPORTING.tos_name ,
 sp_OSM_REPORTING.ipaddress ,
 sp_OSM_REPORTING.subnetmask ,
 sp_OSM_REPORTING.subnetid ,
 sp_OSM_REPORTING.region ,
 sp_OSM_REPORTING.jobid ,
 sp_OSM_REPORTING.event_name ,
 sp_OSM_REPORTING.event_type ,
 sp_OSM_REPORTING.event_subtype ,
 sp_OSM_REPORTING.drivemap ,
 sp_OSM_REPORTING.with_pbr ,
 sp_OSM_REPORTING.timezone ,
 sp_OSM_REPORTING.event_time ,
 sp_OSM_REPORTING.event_time ,
 NULL ,
 sp_OSM_REPORTING.subevent ,
 sp_OSM_REPORTING.status ,
 sp_OSM_REPORTING.v_progress_overall ,
 sp_OSM_REPORTING.errormsg
 );
 END;
 END IF;
 END;
ELSE
 BEGIN
 IF((NVL(errormsg,' ') != ' ') OR (subevent = 'Setting Desired state')) THEN
 BEGIN
 DELETE
 FROM tOSMEvent
 WHERE device_id = sp_OSM_REPORTING.device_id
 AND SERIAL_NO = sp_OSM_REPORTING.serial_no;
 INSERT
 INTO OSMEvents
 (
 event_id ,
 deployment_id ,
 device_id ,
 serial_no ,
 roms_server ,
 comp_name ,
 eos_name ,
 tos_name ,
 ipaddress ,
 subnetmask ,
 subnetid ,
 region ,
 jobid ,
 event_name ,
 event_type ,
 event_subtype ,
 drivemap ,
 with_pbr ,
 timezone ,
 event_time ,
 dep_stime ,
 dep_etime ,
 duration ,
 subevent ,
 status ,
 progress_overall ,
 errormsg
 )
 VALUES
 (
 sp_OSM_REPORTING.nextid ,
 sp_OSM_REPORTING.old_deployment_id ,
 sp_OSM_REPORTING.device_id ,
 sp_OSM_REPORTING.serial_no ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.roms_server, ' ') = ' '
 THEN sp_OSM_REPORTING.old_roms_server
 ELSE sp_OSM_REPORTING.roms_server
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.comp_name, ' ') = ' '
 THEN sp_OSM_REPORTING.old_comp_name
 ELSE sp_OSM_REPORTING.comp_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.eos_name, ' ') = ' '
 THEN sp_OSM_REPORTING.old_eos_name
 ELSE sp_OSM_REPORTING.eos_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.tos_name, ' ') = ' '
 THEN sp_OSM_REPORTING.old_tos_name
 ELSE sp_OSM_REPORTING.tos_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.ipaddress, ' ') = ' '
 THEN sp_OSM_REPORTING.old_ipaddress
 ELSE sp_OSM_REPORTING.ipaddress
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.subnetmask, ' ') = ' '
 THEN sp_OSM_REPORTING.old_subnetmask
 ELSE sp_OSM_REPORTING.subnetmask
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.subnetid, ' ') = ' '
 THEN sp_OSM_REPORTING.old_subnetid
 ELSE sp_OSM_REPORTING.subnetid
 END ,
 sp_OSM_REPORTING.region ,
 NVL(sp_OSM_REPORTING.jobid, sp_OSM_REPORTING.old_jobid) ,
 sp_OSM_REPORTING.event_name ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.event_type, ' ') = ' '
 THEN sp_OSM_REPORTING.old_event_type
 ELSE sp_OSM_REPORTING.event_type
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.event_subtype, ' ') = ' '
 THEN sp_OSM_REPORTING.old_event_subtype
 ELSE sp_OSM_REPORTING.event_subtype
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.drivemap, ' ') = ' '
 THEN sp_OSM_REPORTING.old_drivemap
 ELSE sp_OSM_REPORTING.drivemap
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.with_pbr, ' ') = ' '
 THEN sp_OSM_REPORTING.old_with_pbr
 ELSE sp_OSM_REPORTING.with_pbr
 END ,
 sp_OSM_REPORTING.timezone ,
 sp_OSM_REPORTING.event_time ,
 sp_OSM_REPORTING.old_dep_stime ,
 sp_OSM_REPORTING.event_time ,
 (FLOOR(((CAST(sp_OSM_REPORTING.event_time AS DATE) - sp_OSM_REPORTING.old_dep_stime))* DECODE('HH', 'SS', 24*60*60, 'MI', 24*60, 'HH', 24, NULL ))
 || ' hr '
 || mod(FLOOR(((CAST(sp_OSM_REPORTING.event_time AS DATE) - sp_OSM_REPORTING.old_dep_stime))* DECODE('MI', 'SS', 24*60*60, 'MI', 24*60, 'HH', 24, NULL )),60)
 || ' min') ,
 sp_OSM_REPORTING.subevent ,
 sp_OSM_REPORTING.status ,
 sp_OSM_REPORTING.v_progress_overall ,
 sp_OSM_REPORTING.errormsg
 );
 END;
 ELSE
 BEGIN
 IF( subevent = 'Invoking pre-reboot exit point') THEN
 BEGIN
 UPDATE tOSMEvent
 SET DEVICE_ID = sp_OSM_REPORTING.device_id,
 serial_no = sp_OSM_REPORTING.serial_no,
 roms_server = sp_OSM_REPORTING.roms_server,
 comp_name = sp_OSM_REPORTING.comp_name,
 eos_name = sp_OSM_REPORTING.eos_name,
 tos_name = sp_OSM_REPORTING.tos_name,
 ipaddress = sp_OSM_REPORTING.ipaddress,
 subnetmask = sp_OSM_REPORTING.subnetmask,
 subnetid = sp_OSM_REPORTING.subnetid,
 region = sp_OSM_REPORTING.region,
 jobid = sp_OSM_REPORTING.jobid,
 event_name = sp_OSM_REPORTING.event_name,
 event_type = sp_OSM_REPORTING.event_type,
 event_subtype = sp_OSM_REPORTING.event_subtype,
 drivemap = sp_OSM_REPORTING.drivemap,
 with_pbr = sp_OSM_REPORTING.with_pbr,
 timezone = sp_OSM_REPORTING.timezone,
 event_time = sp_OSM_REPORTING.event_time,
 subevent = sp_OSM_REPORTING.subevent,
 status = sp_OSM_REPORTING.status,
 progress_overall = sp_OSM_REPORTING.progress_overall,
 errormsg = sp_OSM_REPORTING.errormsg
 WHERE device_id = sp_OSM_REPORTING.device_id
 AND SERIAL_NO = sp_OSM_REPORTING.serial_no;
 INSERT
 INTO OSMEvents
 (
 event_id ,
 deployment_id ,
 device_id ,
 serial_no ,
 roms_server ,
 comp_name ,
 eos_name ,
 tos_name ,
 ipaddress ,
 subnetmask ,
 subnetid ,
 region ,
 jobid ,
 event_name ,
 event_type ,
 event_subtype ,
 drivemap ,
 with_pbr ,
 timezone ,
 event_time ,
 dep_stime ,
 dep_etime ,
 duration ,
 subevent ,
 status ,
 progress_overall ,
 errormsg
 )
 VALUES
 (
 sp_OSM_REPORTING.nextid ,
 sp_OSM_REPORTING.old_deployment_id ,
 sp_OSM_REPORTING.device_id ,
 sp_OSM_REPORTING.serial_no ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.roms_server, ' ') = ' '
 THEN sp_OSM_REPORTING.old_roms_server
 ELSE sp_OSM_REPORTING.roms_server
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.comp_name, ' ') = ' '
 THEN sp_OSM_REPORTING.old_comp_name
 ELSE sp_OSM_REPORTING.comp_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.eos_name, ' ') = ' '
 THEN sp_OSM_REPORTING.old_eos_name
 ELSE sp_OSM_REPORTING.eos_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.tos_name, ' ') = ' '
 THEN sp_OSM_REPORTING.old_tos_name
 ELSE sp_OSM_REPORTING.tos_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.ipaddress, ' ') = ' '
 THEN sp_OSM_REPORTING.old_ipaddress
 ELSE sp_OSM_REPORTING.ipaddress
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.subnetmask, ' ') = ' '
 THEN sp_OSM_REPORTING.old_subnetmask
 ELSE sp_OSM_REPORTING.subnetmask
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.subnetid, ' ') = ' '
 THEN sp_OSM_REPORTING.old_subnetid
 ELSE sp_OSM_REPORTING.subnetid
 END ,
 sp_OSM_REPORTING.region ,
 NVL(sp_OSM_REPORTING.jobid, sp_OSM_REPORTING.old_jobid) ,
 sp_OSM_REPORTING.event_name ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.event_type, ' ') = ' '
 THEN sp_OSM_REPORTING.old_event_type
 ELSE sp_OSM_REPORTING.event_type
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.event_subtype, ' ') = ' '
 THEN sp_OSM_REPORTING.old_event_subtype
 ELSE sp_OSM_REPORTING.event_subtype
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.drivemap, ' ') = ' '
 THEN sp_OSM_REPORTING.old_drivemap
 ELSE sp_OSM_REPORTING.drivemap
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.with_pbr, ' ') = ' '
 THEN sp_OSM_REPORTING.old_with_pbr
 ELSE sp_OSM_REPORTING.with_pbr
 END ,
 sp_OSM_REPORTING.timezone ,
 sp_OSM_REPORTING.event_time ,
 sp_OSM_REPORTING.old_dep_stime ,
 sp_OSM_REPORTING.event_time ,
 (FLOOR(((CAST(sp_OSM_REPORTING.event_time AS DATE) - sp_OSM_REPORTING.old_dep_stime))* DECODE('HH', 'SS', 24*60*60, 'MI', 24*60, 'HH', 24, NULL ))
 || ' hr '
 || mod(FLOOR(((CAST(sp_OSM_REPORTING.event_time AS DATE) - sp_OSM_REPORTING.old_dep_stime))* DECODE('MI', 'SS', 24*60*60, 'MI', 24*60, 'HH', 24, NULL )),60)
 || ' min') ,
 sp_OSM_REPORTING.subevent ,
 sp_OSM_REPORTING.status ,
 sp_OSM_REPORTING.v_progress_overall ,
 sp_OSM_REPORTING.errormsg
 );
 END;
 ELSE
 UPDATE tOSMEvent
 SET DEVICE_ID = sp_OSM_REPORTING.device_id,
 serial_no = sp_OSM_REPORTING.serial_no,
 roms_server = (
 CASE
 WHEN NVL(sp_OSM_REPORTING.roms_server,' ') = ' '
 THEN sp_OSM_REPORTING.old_roms_server
 ELSE sp_OSM_REPORTING.roms_server
 END),
 comp_name = (
 CASE
 WHEN NVL(sp_OSM_REPORTING.comp_name,' ') = ' '
 THEN sp_OSM_REPORTING.old_comp_name
 ELSE sp_OSM_REPORTING.comp_name
 END),
 eos_name = (
 CASE
 WHEN NVL(sp_OSM_REPORTING.eos_name,' ') = ' '
 THEN sp_OSM_REPORTING.old_eos_name
 ELSE sp_OSM_REPORTING.eos_name
 END),
 tos_name = (
 CASE
 WHEN NVL(sp_OSM_REPORTING.tos_name,' ') = ' '
 THEN sp_OSM_REPORTING.old_tos_name
 ELSE sp_OSM_REPORTING.tos_name
 END),
 ipaddress = (
 CASE
 WHEN NVL(sp_OSM_REPORTING.ipaddress,' ') = ' '
 THEN sp_OSM_REPORTING.old_ipaddress
 ELSE sp_OSM_REPORTING.ipaddress
 END),
 subnetmask = (
 CASE
 WHEN NVL(sp_OSM_REPORTING.subnetmask,' ') = ' '
 THEN sp_OSM_REPORTING.old_subnetmask
 ELSE sp_OSM_REPORTING.subnetmask
 END),
 subnetid = (
 CASE
 WHEN NVL(sp_OSM_REPORTING.subnetid,' ') = ' '
 THEN sp_OSM_REPORTING.old_subnetid
 ELSE sp_OSM_REPORTING.subnetid
 END),
 region = sp_OSM_REPORTING.region,
 jobid = sp_OSM_REPORTING.jobid,
 event_name = sp_OSM_REPORTING.event_name,
 event_type = (
 CASE
 WHEN NVL(sp_OSM_REPORTING.event_type,' ') = ' '
 THEN sp_OSM_REPORTING.old_event_type
 ELSE sp_OSM_REPORTING.event_type
 END),
 event_subtype = (
 CASE
 WHEN NVL(sp_OSM_REPORTING.event_subtype,' ') = ' '
 THEN sp_OSM_REPORTING.old_event_subtype
 ELSE sp_OSM_REPORTING.event_subtype
 END),
 drivemap = (
 CASE
 WHEN NVL(sp_OSM_REPORTING.drivemap,' ') = ' '
 THEN sp_OSM_REPORTING.old_drivemap
 ELSE sp_OSM_REPORTING.drivemap
 END ),
 with_pbr = (
 CASE
 WHEN NVL(sp_OSM_REPORTING.with_pbr,' ') = ' '
 THEN sp_OSM_REPORTING.old_with_pbr
 ELSE sp_OSM_REPORTING.with_pbr
 END ),
 timezone = sp_OSM_REPORTING.timezone,
 event_time = sp_OSM_REPORTING.event_time,
 subevent = sp_OSM_REPORTING.subevent,
 status = sp_OSM_REPORTING.status,
 progress_overall = sp_OSM_REPORTING.v_progress_overall,
 errormsg = sp_OSM_REPORTING.errormsg
 WHERE device_id = sp_OSM_REPORTING.device_id
 AND SERIAL_NO = sp_OSM_REPORTING.serial_no;
 INSERT
 INTO OSMEvents
 (
 event_id ,
 deployment_id ,
 device_id ,
 serial_no ,
 roms_server ,
 comp_name ,
 eos_name ,
 tos_name ,
 ipaddress ,
 subnetmask ,
 subnetid ,
 region ,
 jobid ,
 event_name ,
 event_type ,
 event_subtype ,
 drivemap ,
 with_pbr ,
 timezone ,
 event_time ,
 dep_stime ,
 dep_etime ,
 duration ,
 subevent ,
 status ,
 progress_overall ,
 errormsg
 )
 VALUES
 (
 sp_OSM_REPORTING.nextid ,
 sp_OSM_REPORTING.old_deployment_id ,
 sp_OSM_REPORTING.device_id ,
 sp_OSM_REPORTING.serial_no ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.roms_server,' ') = ' '
 THEN sp_OSM_REPORTING.old_roms_server
 ELSE sp_OSM_REPORTING.roms_server
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.comp_name,' ') = ' '
 THEN sp_OSM_REPORTING.old_comp_name
 ELSE sp_OSM_REPORTING.comp_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.eos_name,' ') = ' '
 THEN sp_OSM_REPORTING.old_eos_name
 ELSE sp_OSM_REPORTING.eos_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.tos_name,' ') = ' '
 THEN sp_OSM_REPORTING.old_tos_name
 ELSE sp_OSM_REPORTING.tos_name
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.ipaddress,' ') = ' '
 THEN sp_OSM_REPORTING.old_ipaddress
 ELSE sp_OSM_REPORTING.ipaddress
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.subnetmask,' ') = ' '
 THEN sp_OSM_REPORTING.old_subnetmask
 ELSE sp_OSM_REPORTING.subnetmask
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.subnetid,' ') = ' '
 THEN sp_OSM_REPORTING.old_subnetid
 ELSE sp_OSM_REPORTING.subnetid
 END ,
 sp_OSM_REPORTING.region ,
 NVL(sp_OSM_REPORTING.jobid, sp_OSM_REPORTING.old_jobid) ,
 sp_OSM_REPORTING.event_name ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.event_type,' ') = ' '
 THEN sp_OSM_REPORTING.old_event_type
 ELSE sp_OSM_REPORTING.event_type
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.event_subtype,' ') = ' '
 THEN sp_OSM_REPORTING.old_event_subtype
 ELSE sp_OSM_REPORTING.event_subtype
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.drivemap,' ') = ' '
 THEN sp_OSM_REPORTING.old_drivemap
 ELSE sp_OSM_REPORTING.drivemap
 END ,
 CASE
 WHEN NVL(sp_OSM_REPORTING.with_pbr,' ') = ' '
 THEN sp_OSM_REPORTING.old_with_pbr
 ELSE sp_OSM_REPORTING.with_pbr
 END ,
 sp_OSM_REPORTING.timezone ,
 sp_OSM_REPORTING.event_time ,
 sp_OSM_REPORTING.old_dep_stime ,
 NULL ,
 NULL ,
 sp_OSM_REPORTING.subevent ,
 sp_OSM_REPORTING.status ,
 sp_OSM_REPORTING.v_progress_overall ,
 sp_OSM_REPORTING.errormsg
 );
 END IF;
 END;
 END IF;
 END;
END IF;
END;
--------------------------------------------------------
--  DDL for Procedure SP_PURGEDUPLICATECOMPUTERS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_PURGEDUPLICATECOMPUTERS" 
IS

BEGIN DELETE rcaWindowsConcurrentUsage
WHERE WindowsComputerUser_id IN
(SELECT tSet1.WindowsComputerUser_id
FROM
(SELECT U.WindowsComputerUser_id, C.ComputerName_id, C.LastCollection
FROM rcaWindowsComputerUsers U, rcaWindowsComputers C, rcaComputerNames N
WHERE (U.WindowsComputer_id = C.WindowsComputer_id) AND (C.ComputerName_id = N.ComputerName_id) AND N.ComputerName_id IN 
(SELECT ComputerName_id FROM (SELECT ComputerName_id, COUNT(WindowsSid_id) x FROM rcaWindowsComputers Group by ComputerName_id) t2 WHERE t2.x > 1)
) tSet1,
(SELECT C.ComputerName_id, MAX(C.LastCollection) MaxCollection 
FROM rcaWindowsComputerUsers U, rcaWindowsComputers C, rcaComputerNames N
WHERE (U.WindowsComputer_id = C.WindowsComputer_id) AND (C.ComputerName_id = N.ComputerName_id) AND N.ComputerName_id IN 
(SELECT ComputerName_id FROM (SELECT ComputerName_id, COUNT(WindowsSid_id) x FROM rcaWindowsComputers Group by ComputerName_id) t2 WHERE t2.x > 1)
GROUP BY C.ComputerName_id) tSet2
WHERE (tSet1.ComputerName_id = tSet2.ComputerName_id) AND (tSet1.LastCollection < tSet2.MaxCollection)); DELETE rcaWindowsComputerUsers
WHERE WindowsComputerUser_id IN
(SELECT tSet1.WindowsComputerUser_id
FROM
(SELECT U.WindowsComputerUser_id, C.ComputerName_id, C.LastCollection
FROM rcaWindowsComputerUsers U, rcaWindowsComputers C, rcaComputerNames N
WHERE (U.WindowsComputer_id = C.WindowsComputer_id) AND (C.ComputerName_id = N.ComputerName_id) AND N.ComputerName_id IN 
(SELECT ComputerName_id FROM (SELECT ComputerName_id, COUNT(WindowsSid_id) x FROM rcaWindowsComputers Group by ComputerName_id) t2 WHERE t2.x > 1)
) tSet1,
(SELECT C.ComputerName_id, MAX(C.LastCollection) MaxCollection 
FROM rcaWindowsComputerUsers U, rcaWindowsComputers C, rcaComputerNames N
WHERE (U.WindowsComputer_id = C.WindowsComputer_id) AND (C.ComputerName_id = N.ComputerName_id) AND N.ComputerName_id IN 
(SELECT ComputerName_id FROM (SELECT ComputerName_id, COUNT(WindowsSid_id) x FROM rcaWindowsComputers Group by ComputerName_id) t2 WHERE t2.x > 1)
GROUP BY C.ComputerName_id) tSet2
WHERE (tSet1.ComputerName_id = tSet2.ComputerName_id) AND (tSet1.LastCollection < tSet2.MaxCollection));


END;
--------------------------------------------------------
--  DDL for Procedure SP_PURGENONCURRENTCOMPUTERS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_PURGENONCURRENTCOMPUTERS" 
(vDaysNonCurrent IN INTEGER)
IS

BEGIN DELETE rcaWindowsConcurrentUsage
WHERE WindowsComputerUser_id IN
(SELECT tData.WindowsComputerUser_id
FROM
(SELECT U.WindowsComputerUser_id
FROM rcaWindowsComputerUsers U, rcaWindowsComputers C
WHERE (U.WindowsComputer_id = C.WindowsComputer_id) AND (C.LastCollection < (SYSDATE - vDaysNonCurrent))) tData); DELETE rcaWindowsComputerUsers
WHERE WindowsComputerUser_id IN
(SELECT tData.WindowsComputerUser_id
FROM
(SELECT U.WindowsComputerUser_id
FROM rcaWindowsComputerUsers U, rcaWindowsComputers C
WHERE (U.WindowsComputer_id = C.WindowsComputer_id) AND (C.LastCollection < (SYSDATE - vDaysNonCurrent))) tData);


END;
--------------------------------------------------------
--  DDL for Procedure SP_PURGE_USAGE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_PURGE_USAGE" 
(vDays IN INTEGER, vMonths IN INTEGER, vYears IN INTEGER)

IS


v_thedate DATE;

v_d DATE;
v_YYinterval NUMBER;
v_MMinterval NUMBER;
v_DDinterval NUMBER;

v_YYCCinterval NUMBER;
v_MMCCinterval NUMBER;
v_DDCCinterval NUMBER;


v_day NUMBER;
v_month NUMBER;
v_year NUMBER;


v_mulType NUMBER;
v_mulYear NUMBER;
v_mulMonth NUMBER;
v_mulDay NUMBER;


BEGIN

v_mulType := 268435456;
v_mulYear := 1048576;
v_mulMonth := 65536;
v_mulDay := 2048;


v_DDinterval := 0;
v_MMinterval := 0;
v_YYinterval := 0;


v_DDCCinterval := 0;
v_MMCCinterval := 0;
v_YYCCinterval := 0;



v_theDate := SYSDATE;

IF vYears > -1
THEN

v_d := ADD_MONTHS(v_thedate, ((vYears * 12) * -1));



v_year := to_number(substr(to_nchar(v_d, 'yyyymmdd'), 1, 4));
v_month := to_number(substr(to_nchar(v_d, 'yyyymmdd'), 5, 2));
v_day := to_number(substr(to_nchar(v_d, 'yyyymmdd'), 7, 2));


v_YYinterval := ((v_year - 2000) * v_mulYear) + (1 * v_mulType);
v_YYCCinterval := ((v_year - 2000) * v_mulYear) + (6 * v_mulType);


DBMS_OUTPUT.PUT_LINE('Years');
DBMS_OUTPUT.PUT_LINE(TO_nCHAR(v_year));
DBMS_OUTPUT.PUT_LINE(TO_nCHAR(v_month));
DBMS_OUTPUT.PUT_LINE(TO_nCHAR(v_day));
DBMS_OUTPUT.PUT_LINE(TO_nCHAR(v_YYInterval));

END IF;




IF vMonths > -1
THEN

v_d := ADD_MONTHS(v_thedate, (vMonths * -1));


v_year := to_number(substr(to_nchar(v_d, 'yyyymmdd'), 1, 4));
v_month := to_number(substr(to_nchar(v_d, 'yyyymmdd'), 5, 2));
v_day := to_number(substr(to_nchar(v_d, 'yyyymmdd'), 7, 2));


v_MMinterval := ((v_year - 2000) * v_mulYear) + (v_month * v_mulMonth) + (2 * v_mulType);
v_MMCCinterval := ((v_year - 2000) * v_mulYear) + (v_month * v_mulMonth) + (6 * v_mulType);


DBMS_OUTPUT.PUT_LINE('Months');
DBMS_OUTPUT.PUT_LINE(TO_nCHAR(v_year));
DBMS_OUTPUT.PUT_LINE(TO_nCHAR(v_month));
DBMS_OUTPUT.PUT_LINE(TO_nCHAR(v_day));
DBMS_OUTPUT.PUT_LINE(TO_nCHAR(v_MMInterval));


END IF;



IF vDays > -1
THEN
v_d := to_date(v_thedate) - vDays;


v_year := to_number(substr(to_nchar(v_d, 'yyyymmdd'), 1, 4));
v_month := to_number(substr(to_nchar(v_d, 'yyyymmdd'), 5, 2));
v_day := to_number(substr(to_nchar(v_d, 'yyyymmdd'), 7, 2));


v_DDinterval := ((v_year - 2000) * v_mulYear) + (v_month * v_mulMonth) + (v_day * v_mulDay) + (3 * v_mulType);
v_DDCCinterval := ((v_year - 2000) * v_mulYear) + (v_month * v_mulMonth) + (v_day * v_mulDay) + (6 * v_mulType);


DBMS_OUTPUT.PUT_LINE('Days');
DBMS_OUTPUT.PUT_LINE(TO_nCHAR(v_year));
DBMS_OUTPUT.PUT_LINE(TO_nCHAR(v_month));
DBMS_OUTPUT.PUT_LINE(TO_nCHAR(v_day));
DBMS_OUTPUT.PUT_LINE(TO_nCHAR(v_DDInterval));


END IF;

IF vYears > -1 OR vMonths > -1 OR vDays > -1
THEN

/*******************************************************************************
Step 1 Delete UserNames that are not in WindowsUsers
********************************************************************************/
DELETE rcaUserNames
WHERE UserName_id
IN (SELECT DISTINCT A.UserName_id from rcaUserNames A, rcaWindowsUsers B
WHERE B.UserName_id (+) = A.UserName_id AND B.UserName_id IS NULL);


/*******************************************************************************
Step 2 Delete WindowsFileUsage WHERE IntervalType = x and Interval_ < y
 Delete WindowsConcurrentUsage WHERE Interval_ < z
********************************************************************************/
IF vYears > -1
THEN
DELETE FROM rcaWindowsFileUsage
WHERE UsageInterval_id IN
(SELECT UsageInterval_id FROM rcaUsageIntervals WHERE IntervalType = 1 AND Interval_ < v_YYinterval);

DELETE FROM rcaWindowsConcurrentUsage WHERE (GMTInterval_id) IN
(SELECT GMTInterval_id FROM rcaConcurrentIntervals WHERE Interval_ < v_YYCCinterval);

END IF;

IF vMonths > -1
THEN
DELETE FROM rcaWindowsFileUsage
WHERE UsageInterval_id IN
(SELECT UsageInterval_id FROM rcaUsageIntervals WHERE IntervalType = 2 AND Interval_ < v_MMinterval);

DELETE FROM rcaWindowsConcurrentUsage WHERE (GMTInterval_id) IN
(SELECT GMTInterval_id FROM rcaConcurrentIntervals WHERE Interval_ < v_MMCCinterval);
END IF;


IF vDays > -1
THEN
DELETE FROM rcaWindowsFileUsage
WHERE UsageInterval_id IN
(SELECT UsageInterval_id FROM rcaUsageIntervals WHERE IntervalType = 3 AND Interval_ < v_DDinterval);

DELETE FROM rcaWindowsConcurrentUsage WHERE (GMTInterval_id) IN
(SELECT GMTInterval_id FROM rcaConcurrentIntervals WHERE Interval_ < v_DDCCInterval);

END IF;

/*******************************************************************************
Step 3 Delete WindowsFileInstances WHERE WindowsFileInstance_id
is in WindowsFileInstances without Usage and WindowsFileInstances that are not current.
********************************************************************************/

DELETE FROM rcaWindowsFileInstances
WHERE WindowsFileInstance_id IN
(SELECT I.WindowsFileInstance_id FROM rcaWindowsFileInstances I, rcaWindowsFileUsage U
WHERE U.WindowsFileInstance_id (+) = I.WindowsFileInstance_id AND U.WindowsFileInstance_id IS NULL) AND
WindowsFileInstance_id IN
(SELECT I.WindowsFileInstance_id FROM rcaWindowsFileInstances I, rcaWindowsFiles F
WHERE F.CurrentFileInstance_id (+) = I.WindowsFileInstance_id AND F.CurrentFileInstance_id IS NULL);


/*******************************************************************************
Step 4 Delete WindowsFiles WHERE the WindowsFile_id is in
the set of WindowsFileInstances without WindowsFile_id's.
********************************************************************************/
DELETE FROM rcaWindowsFiles
WHERE WindowsFile_id
IN
(SELECT F.WindowsFile_id FROM rcaWindowsFiles F , rcaWindowsFileInstances I 
WHERE I.WindowsFile_id (+) = F.WindowsFile_id AND I.WindowsFile_id IS NULL);



/*******************************************************************************
Step 5 Delete WindowsComputerUsers that are in the set of
ComputerUsers without WindowsFiles
ComputerUsers without WindowsFileUsage
ComputerUsers without WindowsFileRoots
********************************************************************************/

DELETE rcaWindowsComputerUsers
WHERE
WindowsComputerUser_id IN
(SELECT DISTINCT A.WindowsComputerUser_id from rcaWindowsComputerUsers A, rcaWindowsFiles B WHERE B.WindowsComputerUser_id (+) = A.WindowsComputerUser_id AND B.WindowsComputerUser_id IS NULL)
AND WindowsComputerUser_id IN
(SELECT DISTINCT A.WindowsComputerUser_id from rcaWindowsComputerUsers A, rcaWindowsFileUsage B WHERE B.WindowsComputerUser_id (+) = A.WindowsComputerUser_id AND B.WindowsComputerUser_id IS NULL)
AND WindowsComputerUser_id IN
(SELECT DISTINCT A.WindowsComputerUser_id from rcaWindowsComputerUsers A, rcaWindowsFileRoots B WHERE B.WindowsComputerUser_id (+) = A.WindowsComputerUser_id  AND B.WindowsComputerUser_id IS NULL);



DELETE rcaWindowsFileRoots
WHERE
WindowsComputerUser_id IN
(SELECT DISTINCT A.WindowsComputerUser_id from rcaWindowsFileRoots A, rcaWindowsFiles B WHERE B.WindowsComputerUser_id (+) = A.WindowsComputerUser_id  AND B.WindowsComputerUser_id IS NULL)
AND WindowsComputerUser_id IN
(SELECT DISTINCT A.WindowsComputerUser_id from rcaWindowsFileRoots A, rcaWindowsComputerUsers B WHERE B.WindowsComputerUser_id (+) = A.WindowsComputerUser_id  AND B.WindowsComputerUser_id IS NULL)
AND WindowsComputerUser_id IN
(SELECT DISTINCT A.WindowsComputerUser_id from rcaWindowsFileRoots A, rcaWindowsFileUsage B WHERE B.WindowsComputerUser_id (+) = A.WindowsComputerUser_id  AND B.WindowsComputerUser_id IS NULL)
AND WindowsComputerUser_id IN
(SELECT DISTINCT A.WindowsComputerUser_id from rcaWindowsFileRoots A, rcaWindowsConcurrentUsage B WHERE B.WindowsComputerUser_id (+) = A.WindowsComputerUser_id  AND B.WindowsComputerUser_id IS NULL);


END IF;


END;
--------------------------------------------------------
--  DDL for Procedure SP_UPD_RCAWINDOWSFILES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SP_UPD_RCAWINDOWSFILES" 
(
 Var_WindowsFile_id IN Number,
 Var_WindowsComputerUser_id IN Number,
 Var_FullFileName_id IN Number,
 Var_CurrentFileInstance_id IN int
)
AS
Loc_Var_WinFile_Id int;
BEGIN SELECT WindowsFile_id into Loc_Var_WinFile_Id FROM rcaWindowsFiles WHERE 
 WindowsComputerUser_id = Var_WindowsComputerUser_id AND FullFileName_id = Var_FullFileName_id;
 if Loc_Var_WinFile_Id is NOT NULL or Loc_Var_WinFile_Id > 0 then
 Begin
 UPDATE rcaWindowsFiles SET CurrentFileInstance_id = Var_CurrentFileInstance_id 
 WHERE WindowsComputerUser_id = Var_WindowsComputerUser_id AND FullFileName_id = Var_FullFileName_id;
 commit;
 Dbms_Output.Put_Line('Data Updated');
 End;
 end if;
 EXCEPTION
 WHEN NO_DATA_FOUND Then 
 Begin
 Dbms_Output.Put_Line('No Data Selected');
 End;
 WHEN OTHERS THEN
 Begin
 raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
 end; 
END SP_UPD_rcaWindowsFiles;
--------------------------------------------------------
--  DDL for Function FN_DATAALIAS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_DATAALIAS" 
(
nTABLE IN varchar, 
nCOLUMN IN varchar, 
nVALUE IN varchar
)
RETURN varchar AS 
BEGIN if nTABLE = 'rWin32_SystemEnclosure' OR nTABLE = 'SMBIOSINFO' THEN
 if nCOLUMN = 'wChassisTypes' or nCOLUMN = 'enc_type' THEN
 if nVALUE = '1' or nVALUE = '0x01' THEN
 return 'Other';
 END IF;
 if nVALUE = '2' or nVALUE = '0x02' THEN
 return 'Unknown';
 END IF;
 if nVALUE = '3' or nVALUE = '0x03'THEN
 return 'Desktop';
 END IF;
 if nVALUE = '4' or nVALUE = '0x04'THEN
 return 'Low Profile Desktop';
 END IF;
 if nVALUE = '5' or nVALUE = '0x05'THEN
 return 'Pizza Box';
 END IF;
 if nVALUE = '6' or nVALUE = '0x06'THEN
 return 'Mini Tower';
 END IF;
 if nVALUE = '7' or nVALUE = '0x07'THEN
 return 'Tower';
 END IF;
 if nVALUE = '8' or nVALUE = '0x08'THEN
 return 'Portable';
 END IF;
 if nVALUE = '9' or nVALUE = '0x09'THEN
 return 'Laptop';
 END IF;
 if nVALUE = '10' or nVALUE = '0x0A'THEN
 return 'Notebook';
 END IF;
 if nVALUE = '11' or nVALUE = '0x0B'THEN
 return 'Handheld';
 END IF;
 if nVALUE = '12' or nVALUE = '0x0C'THEN
 return 'Docking Station';
 END IF;
 if nVALUE = '13' or nVALUE = '0x0D'THEN
 return 'All in One';
 END IF;
 if nVALUE = '14' or nVALUE = '0x0E'THEN
 return 'Sub Notebook';
 END IF;
 if nVALUE = '15' or nVALUE = '0x0F'THEN
 return 'Space-Saving';
 END IF;
 if nVALUE = '16' or nVALUE = '0x10'THEN
 return 'Lunch Box';
 END IF;
 if nVALUE = '17' or nVALUE = '0x11'THEN
 return 'Main System Chassis';
 END IF;
 if nVALUE = '18' or nVALUE = '0x12'THEN
 return 'Expansion Chassis';
 END IF;
 if nVALUE = '19' or nVALUE = '0x13'THEN
 return 'SubChassis';
 END IF;
 if nVALUE = '20' or nVALUE = '0x14'THEN
 return 'Bus Expansion Chassis';
 END IF;
 if nVALUE = '21' or nVALUE = '0x15'THEN
 return 'Peripheral Chassis';
 END IF;
 if nVALUE = '22' or nVALUE = '0x16'THEN
 return 'Storage Chassis';
 END IF;
 if nVALUE = '23' or nVALUE = '0x17'THEN
 return 'Rack Mount Chassis';
 END IF;
 if nVALUE = '24' or nVALUE = '0x18'THEN
 return 'Sealed-Case PC';
 END IF;
 if nVALUE = '50' or nVALUE = '0x50'THEN
 return 'Phone';
 END IF;
 if nVALUE = '51' or nVALUE = '0x51'THEN
 return 'Tablets';
 END IF;
 END IF;
 END IF;
RETURN 'N/A';
END;
--------------------------------------------------------
--  DDL for Function FN_DEVICEPLATFORM
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_DEVICEPLATFORM" 
(
 nVALUE IN varchar
)
RETURN varchar AS 
BEGIN 
 if nVALUE = 'Windows Phone' or nVALUE = 'Windows' THEN
 return 'windows_logo';
 END IF;
 if nVALUE = 'iOS' THEN
 return 'apple_logo';
 END IF;
 if nVALUE = 'Android' THEN
 return 'android_logo';
 END IF;
 if SUBSTR(nVALUE,1,9) = 'Microsoft' THEN
 return 'win_log';
 END IF;
 if INSTR(nVALUE,'windowsphone') != 0 THEN
 return 'windows_logo';
 END IF;
 if INSTR(nVALUE,'Android') != 0 THEN
 return 'android_logo';
 END IF;
 if INSTR(nVALUE,'iOS') != 0 THEN
 return 'apple_logo';
 END IF;

RETURN 'N/A';
END;
--------------------------------------------------------
--  DDL for Function FN_DEVICETYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_DEVICETYPE" 
(
 nVALUE IN varchar
)
RETURN varchar AS 
BEGIN 
 if nVALUE = 'Phone' THEN
 return 'phone';
 END IF;
 if nVALUE = 'Tablet' THEN
 return 'tablet';
 END IF; 
 if INSTR(nVALUE,'Phone') != 0 THEN
 return 'phone';
 END IF;
 if INSTR(nVALUE,'Tablet') != 0 THEN
 return 'tablet';
 END IF;

RETURN 'N/A';
END;
--------------------------------------------------------
--  DDL for Function FN_MANAGEDSTATUS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_MANAGEDSTATUS" 
(
 nPCT IN NUMBER
)
RETURN varchar AS 
BEGIN 
 if nPCT = 0 THEN
 return 'Managed_000';
 END IF;

 if nPCT > 0 and nPCT < 20 THEN
 return 'Managed_010';
 END IF;

 if nPCT >= 20 and nPCT < 40 THEN
 return 'Managed_030';
 END IF;

 if nPCT >= 40 and nPCT < 60 THEN
 return 'Managed_050';
 END IF;

 if nPCT >= 60 and nPCT < 80 THEN
 return 'Managed_070';
 END IF;

 if nPCT >= 80 and nPCT < 100 THEN
 return 'Managed_090';
 END IF;

 if nPCT = 100 THEN
 return 'Managed_100';
 END IF;
 RETURN -1;
END;
--------------------------------------------------------
--  DDL for Function FN_PATCHSTATUS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_PATCHSTATUS" (
 nOK IN NUMBER,
 nWARN IN NUMBER,
 nRPEN IN NUMBER,
 nERROR IN NUMBER,
 nOTHER IN NUMBER
)
RETURN varchar AS 
BEGIN 
 if nRPEN > 0 THEN
 RETURN 'Reboot Pending';
 END IF;
 
 if nRPEN = 0 and nERROR > 0 THEN
 RETURN 'Not Patched';
 END IF;

 if nRPEN = 0 and nERROR = 0 and nOTHER > 0 THEN
 RETURN 'Other';
 END IF;

 if nRPEN = 0 and nERROR = 0 and nOTHER = 0 and nWARN > 0 THEN 
 RETURN 'Warning';
 END IF;

 if nRPEN = 0 and nERROR = 0 and nOTHER = 0 and nWARN = 0 and nOK > 0 THEN
 RETURN 'Patched';
 END IF;

 if nRPEN = 0 and nERROR = 0 and nOTHER = 0 and nWARN = 0 and nOK = 0 THEN
 RETURN 'Not Applicable';
 END IF;

 RETURN 'Other';
 
END;
--------------------------------------------------------
--  DDL for Function FN_PATCHSTATUSFORWIN10
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_PATCHSTATUSFORWIN10" (
 nOK IN NUMBER,
 nWARN IN NUMBER,
 nRPEN IN NUMBER,
 nERROR IN NUMBER,
 nOTHER IN NUMBER,
 nDEFERRED IN NUMBER
)
RETURN varchar AS 
BEGIN 
 if nRPEN > 0 THEN
 RETURN 'Reboot Pending';
 END IF;
 
 if nRPEN = 0 and nERROR > 0 THEN
 RETURN 'Not Patched';
 END IF;

 if nRPEN = 0 and nERROR = 0 and nOTHER > 0 THEN
 RETURN 'Other';
 END IF;
 
 if nRPEN = 0 and nERROR = 0 and nOTHER = 0 and nDEFERRED >0 THEN
 RETURN 'deferred';
 END IF;

 if nRPEN = 0 and nERROR = 0 and nOTHER = 0 and nWARN > 0 THEN 
 RETURN 'Warning';
 END IF;

 if nRPEN = 0 and nERROR = 0 and nOTHER = 0 and nWARN = 0 and nOK > 0 THEN
 RETURN 'Patched';
 END IF;

 if nRPEN = 0 and nERROR = 0 and nOTHER = 0 and nWARN = 0 and nOK = 0 THEN
 RETURN 'Not Applicable';
 END IF;

 RETURN 'Other';
 
END;
--------------------------------------------------------
--  DDL for Function FN_USAGESTATUS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_USAGESTATUS" ( nPCT IN NUMBER ) RETURN NVARCHAR2 IS
BEGIN 
 if nPCT = 0 THEN
 return 'Usage_000';
 END IF;

 if nPCT > 0 and nPCT < 20 THEN
 return 'Usage_010';
 END IF;

 if nPCT >= 20 and nPCT < 40 THEN
 return 'Usage_030';
 END IF;

 if nPCT >= 40 and nPCT < 60 THEN
 return 'Usage_050';
 END IF;

 if nPCT >= 60 and nPCT < 80 THEN
 return 'Usage_070';
 END IF;

 if nPCT >= 80 and nPCT < 100 THEN
 return 'Usage_090';
 END IF;

 if nPCT = 100 THEN
 return 'Usage_100';
 END IF;

 RETURN -1;
 
END;
--------------------------------------------------------
--  DDL for Function FN_WUAVERSION
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_WUAVERSION" (Curr_wuaver IN Char) RETURN VARCHAR IS
 Var_MediaWUA CHAR(30);
 Var_WUA_STRPOS1 Number;
 Var_MED_STRPOS1 NUMBER;
 Var_WUA_STRPOS2 Number;
 Var_MED_STRPOS2 NUMBER;
 Var_WUA_STRPOS3 Number;
 Var_MED_STRPOS3 NUMBER;
 BEGIN

 select NVD_RELEASE into Var_MediaWUA from NVD_PACKAGE where NVD_ZOBJNAME='WUA_MEDIA_SCANDATA';
 Select instr(Curr_wuaver,'.') into Var_WUA_STRPOS1 from dual;
 select instr(Var_MediaWUA,'.') into Var_MED_STRPOS1 from dual;

 if Curr_wuaver is not null and Curr_wuaver!='Not Applicable' then
 if To_Number(substr(Curr_wuaver,1,(Var_WUA_STRPOS1-1))) < TO_NUMBER(substr(Var_MediaWUA,1,(Var_MED_STRPOS1-1))) then
 Return 'Non Compliant';
 elsif To_Number(substr(Curr_wuaver,1,(Var_WUA_STRPOS1-1))) = TO_NUMBER(substr(Var_MediaWUA,1,(Var_MED_STRPOS1-1))) then

 Select INSTR(Curr_wuaver,'.',(Var_WUA_STRPOS1+1)) into Var_WUA_STRPOS2 from dual;
 Select INSTR(Var_MediaWUA,'.',(Var_MED_STRPOS1+1)) into Var_MED_STRPOS2 from dual;

 if To_Number(substr(Curr_wuaver,(Var_WUA_STRPOS1+1),(Var_WUA_STRPOS2-(Var_WUA_STRPOS1+1)))) < TO_NUMBER(substr(Var_MediaWUA,(Var_MED_STRPOS1+1),(Var_MED_STRPOS2-(Var_MED_STRPOS1+1)))) then
 Return 'Non Compliant';
 elsif To_Number(substr(Curr_wuaver,(Var_WUA_STRPOS1+1),(Var_WUA_STRPOS2-(Var_WUA_STRPOS1+1)))) = TO_NUMBER(substr(Var_MediaWUA,(Var_MED_STRPOS1+1),(Var_MED_STRPOS2-(Var_MED_STRPOS1+1)))) then

 Select INSTR(Curr_wuaver,'.',(Var_WUA_STRPOS2+1)) into Var_WUA_STRPOS3 from dual;
 Select INSTR(Var_MediaWUA,'.',(Var_MED_STRPOS2+1)) into Var_MED_STRPOS3 from dual;

 if To_Number(substr(Curr_wuaver,(Var_WUA_STRPOS2+1),(Var_WUA_STRPOS3-(Var_WUA_STRPOS2+1))))
 < TO_NUMBER(substr(Var_MediaWUA,(Var_MED_STRPOS2+1),(Var_MED_STRPOS3-(Var_MED_STRPOS2+1)))) then
 Return 'Non Compliant';
 Elsif To_Number(substr(Curr_wuaver,(Var_WUA_STRPOS2+1),(Var_WUA_STRPOS3-(Var_WUA_STRPOS2+1))))
 = TO_NUMBER(substr(Var_MediaWUA,(Var_MED_STRPOS2+1),(Var_MED_STRPOS3-(Var_MED_STRPOS2+1)))) then

 if To_Number(substr(Curr_wuaver,(Var_WUA_STRPOS3+1)))
 < TO_NUMBER(substr(Var_MediaWUA,(Var_MED_STRPOS3+1))) then
 Return 'Non Compliant';
 elsif To_Number(substr(Curr_wuaver,(Var_WUA_STRPOS3+1))) = TO_NUMBER(substr(Var_MediaWUA,(Var_MED_STRPOS3+1))) then
 Return 'Compliant';
 else
 Return 'Compliant';
 end if;
 else
 Return 'Compliant';
 end if;

 else
 Return 'Compliant';
 end if;

 else
 Return 'Compliant';
 end if;
elsif Curr_wuaver ='Not Applicable' then
 RETURN 'Not Applicable';
else
 RETURN 'Unknown';
end if;
 end;
--------------------------------------------------------
--  DDL for Function FN_XSQLAND
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_XSQLAND" (vA IN NUMBER, vB IN NUMBER) RETURN NUMBER IS

BEGIN

RETURN bitand(vA, vB) + 0;

END;
--------------------------------------------------------
--  DDL for Function FN_XSQLANYBIT
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_XSQLANYBIT" (vA IN NUMBER, vB IN NUMBER, vC IN NUMBER) RETURN NUMBER IS

XBIT NUMBER;
XBITS NUMBER;

BEGIN

XBIT := 0;
XBITS := 0;


WHILE XBITS < vC
LOOP

 XBIT := POWER(2,XBITS);


 IF FN_XSQLAND(vA, XBIT) > 0 AND FN_XSQLAND(vB, XBIT) > 0 THEN
 RETURN 1;
 END IF;



 XBITS := XBITS + 1;
END LOOP;



RETURN 0;

END;
--------------------------------------------------------
--  DDL for Function FN_XSQLHMS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_XSQLHMS" (vSeconds IN NUMBER) RETURN NCHAR IS

vHours NUMBER;
vMins NUMBER;
vSecs NUMBER;
vSHours NCHAR(12);
vSMins NCHAR(2);
vSSecs NCHAR(2);
vhms NCHAR(18);

BEGIN

vHours := TRUNC((vSeconds / 3600), 0);
vMins := TRUNC(((vSeconds - (vHours * 3600)) / 60), 0);
vSecs := TRUNC((vSeconds - (vHours * 3600) - (vMins * 60)), 0);


vSHours := TO_NCHAR(vHours);


IF LENGTH(TRIM(TO_NCHAR(vMins))) = 1 THEN
 vSMins := N'0' || TRIM(TO_NCHAR(vMins));
ELSE
 vSMins := TRIM(TO_NCHAR(vMins));
END IF;


IF LENGTH(TRIM(TO_NCHAR(vSecs))) = 1 THEN
 vSSecs := N'0' || TRIM(TO_NCHAR(vSecs));
ELSE
 vSSecs := TRIM(TO_NCHAR(vSecs));
END IF;


vhms := TRIM(vSHours) || N':' || TRIM(vSMins) || N':' || TRIM(vSSecs);


return vhms;

END;
--------------------------------------------------------
--  DDL for Function FN_XSQLOR
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_XSQLOR" (vA IN NUMBER, vB IN NUMBER) RETURN NUMBER IS

BEGIN

RETURN vA - bitand(vA, vB) + vB;

END;
--------------------------------------------------------
--  DDL for Function FN_XSQLUSAGEINTERVAL
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_XSQLUSAGEINTERVAL" (nIntervalType IN INTEGER, nDate IN DATE) RETURN INTEGER AS

Days INTEGER;
Months INTEGER;
YEARS INTEGER;

THEDATE DATE;
D DATE;

 
YYinterval INTEGER;
MMinterval INTEGER;
DDinterval INTEGER;

 
YYCCinterval INTEGER;
MMCCinterval INTEGER;
DDCCinterval INTEGER;


mulType INTEGER;
mulYear INTEGER;
mulMonth INTEGER;
mulDay INTEGER;

BEGIN
Days:= 0;
Months:= 0;
Years:= 0;

 
 
 
 
 
 
 
 
 
 
 
 
 

mulType := 268435456;
mulYear := 1048576;
mulMonth:= 65536;
 mulDay:= 2048;


 
 IF nIntervalType = 1
 THEN
 
 YYinterval := (((extract(year from (nDate)) - 2000) * mulYear) + (1 * mulType));
 RETURN YYinterval;
 END IF;


 IF nIntervalType = 2
 THEN
 
 MMinterval := (((extract(YEAR from (nDate)) - 2000) * mulYear) + (extract (MONTH from (nDate)) * mulMonth) + (2 * mulType));
 RETURN MMinterval;
 END IF;



 IF nIntervalType = 3
 THEN
 
 DDinterval := (((extract (YEAR from (nDate)) - 2000) * mulYear) + (extract(MONTH from (nDate)) * mulMonth) + (extract(DAY from (nDate)) * mulDay) + (3 * mulType));
 RETURN DDinterval;
 END IF;

 RETURN -1;
END;
--------------------------------------------------------
--  DDL for Function FN_XSQLYMDHMS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "FN_XSQLYMDHMS" (vSeconds IN NUMBER) RETURN NCHAR IS

vHours NUMBER;
vMins NUMBER;
vSecs NUMBER;
vYears NUMBER;
vMonths NUMBER;
vDays NUMBER;
vSYears NCHAR(12);
vSMonths NCHAR(12);
vSDays NCHAR(12);
vSHours NCHAR(12);
vSMins NCHAR(12);
vSSecs NCHAR(12);
vhms NCHAR(500);
vchkarray NCHAR(1000);

BEGIN


vYears := TRUNC((vSeconds / 3600), 0);
vMonths := TRUNC(((vSeconds - (vHours * 3600)) / 60), 0);
vDays := TRUNC((vSeconds - (vHours * 3600) - (vMins * 60)), 0);
vHours := TRUNC((vSeconds / 3600), 0);
vMins := TRUNC(((vSeconds - (vHours * 3600)) / 60), 0);
vSecs := TRUNC((vSeconds - (vHours * 3600) - (vMins * 60)), 0);

vYears := TRUNC((vSeconds / (3600 * 24 * 365)), 0);
vMonths := TRUNC(((vSeconds - (vYears * 3600 * 24 * 365)) / (30 * 3600 * 24)), 0);
vDays := TRUNC(((vSeconds - (vYears * 3600 * 24 * 365) - (vMonths * 30 * 3600 *24)) / (24 * 3600) ), 0);

vHours := TRUNC(((vSeconds - (vYears * 3600 * 24 * 365) - (vMonths * 30 * 3600 *24) - (vDays * 24 *3600 )) / 3600), 0);
vMins := TRUNC(((vSeconds - (vYears * 3600 * 24 * 365) - (vMonths * 30 * 3600 *24) - (vDays * 24 *3600 ) - (vHours * 3600)) / 60), 0);
vSecs := TRUNC((vSeconds - (vYears * 3600 * 24 * 365) - (vMonths * 30 * 3600 *24) - (vDays * 24 *3600 ) -(vHours * 3600) - (vMins * 60)), 0);



vSYears := TO_NCHAR(vYears);

IF LENGTH(TRIM(TO_NCHAR(vMonths))) = 1 THEN
 vSMonths := N'0' || TRIM(TO_NCHAR(vMonths));
ELSE
 vSMonths := TRIM(TO_NCHAR(vMonths));
END IF;


IF LENGTH(TRIM(TO_NCHAR(vDays))) = 1 THEN
 vSDays := N'0' || TRIM(TO_NCHAR(vDays));
ELSE
 vSDays := TRIM(TO_NCHAR(vDays));
END IF;

IF LENGTH(TRIM(TO_NCHAR(vHours))) = 1 THEN
 vSHours := N'0' || TRIM(TO_NCHAR(vHours));
ELSE
 vSHours := TRIM(TO_NCHAR(vHours));
END IF;

IF LENGTH(TRIM(TO_NCHAR(vMins))) = 1 THEN
 vSMins := N'0' || TRIM(TO_NCHAR(vMins));
ELSE
 vSMins := TRIM(TO_NCHAR(vMins));
END IF;


IF LENGTH(TRIM(TO_NCHAR(vSecs))) = 1 THEN
 vSSecs := N'0' || TRIM(TO_NCHAR(vSecs));
ELSE
 vSSecs := TRIM(TO_NCHAR(vSecs));
END IF;

vhms := N'';

IF vSSecs > 0 THEN
 vchkarray := vhms;
 vhms := TRIM(vSSecs) || N'sec(s) ' || TRIM(vchkarray) ;
END IF;

IF vSMins > 0 THEN 
 vchkarray := vhms;
 vhms := TRIM(vSMins) || N' Min(s) ' || TRIM(vchkarray) ;
END IF;

IF vSHours > 0 THEN
 vchkarray := vhms; 
 vhms := TRIM(vSHours) || N' Hour(s) '|| TRIM(vchkarray);
END IF;

IF vSDays > 0 THEN
 vchkarray := vhms; 
 vhms := TRIM(vSDays) || N' Day(s) '|| TRIM(vchkarray);
END IF;

IF vSMonths > 0 THEN
 vchkarray := vhms;
 vhms := TRIM(vSMonths) || N' Month(s) '|| TRIM(vchkarray);
END IF;

IF vSYears > 0 THEN
 vchkarray := vhms;
 vhms := TRIM(vSYears) || N' Year(s) '|| TRIM(vchkarray); 
END IF;


If TRIM(vhms) is Null Then
 vhms := N'0'; 
END IF;


return vhms;

END;
--------------------------------------------------------
--  DDL for Function GETDATE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "GETDATE" RETURN DATE IS 
BEGIN
RETURN SYSDATE;
END;
--------------------------------------------------------
--  DDL for Function GETUTCDATE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "GETUTCDATE" RETURN DATE IS
BEGIN RETURN NEW_TIME(SYSDATE, 'GMT', 'GMT');

END;
--------------------------------------------------------
--  DDL for Function GETUTCDATE2
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "GETUTCDATE2" (vlocaldate IN DATE) RETURN DATE IS
BEGIN RETURN NEW_TIME(vlocaldate, 'GMT', 'GMT');

END;
--------------------------------------------------------
--  DDL for Function fn_msservicing
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "fn_msservicing" (nservicing_types varchar)
RETURNS varchar AS 
BEGIN 

if nservicing_types = '@Not Applicable'
 BEGIN
 RETURN '@NA';
 END IF;
 
 if nservicing_types = '@Quality Rollups'
 BEGIN
 RETURN '@QR';
 END IF;
 
 if nservicing_types = '@Security Only'
 BEGIN
 RETURN '@SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Quality Rollups'
 BEGIN
 RETURN '@NA%QR';
 END IF;
 
 if nservicing_types = '@Not Applicable,Security Only' 
 BEGIN
 RETURN '@NA%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN 'NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups'
 BEGIN
 RETURN '@NA||QR';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only'
 BEGIN
 RETURN '@NA||SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Quality Rollups'
 BEGIN
 RETURN '@NA||NA%QR';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Security Only'
 BEGIN
 RETURN '@NA||NA%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Quality Rollups,Security Only'
 BEGIN
 RETURN '@NA||NA%QR%SO';
 END IF; 
 
 if nservicing_types = '@Not Applicable||Security Only'
 BEGIN
 RETURN '@NA||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only' 
 BEGIN
 RETURN '@NA||QR||SO';
 END IF; 
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Not Applicable,Quality Rollups' 
 BEGIN
 RETURN '@NA||QR||NA%QR';
 END IF; 
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Not Applicable,Security Only' 
 BEGIN
 RETURN '@NA||QR||NA%SO';
 END IF; 
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||NA%QR%SO';
 END IF; 
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only||Not Applicable,Quality Rollups' 
 BEGIN
 RETURN '@NA||SO||NA%QR';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only||Not Applicable,Security Only' 
 BEGIN
 RETURN '@NA||SO||NA%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Quality Rollups||Not Applicable,Security Only' 
 BEGIN
 RETURN '@NA||NA%QR||NA%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Quality Rollups||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||NA%QR||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||NA%QR||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Quality Rollups' 
 BEGIN
 RETURN '@NA||QR||SO||NA%QR';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%QR%SO';
 END IF; 
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||QR%SO';
 END IF; 
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Not Applicable,Quality Rollups||Not Applicable,Security Only' 
 BEGIN
 RETURN '@NA||QR||NA%QR||NA%SO';
 END IF; 
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||NA%QR||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Not Applicable,Quality Rollups||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||NA%QR||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only' 
 BEGIN
 RETURN '@NA||SO||NA%QR||NA%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only||Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||SO||NA%QR||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only||Not Applicable,Quality Rollups||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||SO||NA%QR||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||NA%QR||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||NA%QR||NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Quality Rollups||Not Applicable,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||NA%QR||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%QR||NA%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%QR||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Quality Rollups||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%QR||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||NA%QR||NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Not Applicable,Quality Rollups||Not Applicable,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||NA%QR||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||SO||NA%QR||NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||SO||NA%QR||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||SO||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||SO||NA%QR||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||NA%QR||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%QR||NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Quality Rollups|||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%QR||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%QR||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||NA%QR||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||SO||NA%QR||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable||Quality Rollups||Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA||QR||SO||NA%QR||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@QR||SO||NA%QR||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@QR||SO||NA%QR||NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@QR||SO||NA%QR||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@QR||SO||NA%QR||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@QR||SO||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@QR||NA%QR||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only' 
 BEGIN
 RETURN '@QR||SO||NA%QR||NA%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||SO||NA%QR||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Quality Rollups||Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||SO||NA%QR||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||SO||NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Security Only||Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||SO||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||NA%QR||NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Quality Rollups||Not Applicable,Security Only||Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||NA%QR||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||NA%QR||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Quality Rollups'
 BEGIN
 RETURN '@QR||SO||NA%QR';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Security Only'
 BEGIN
 RETURN '@QR||SO||NA%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Not Applicable,Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only||Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Quality Rollups||Not Applicable,Security Only'
 BEGIN
 RETURN '@QR||NA%QR||NA%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||NA%QR||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Quality Rollups||Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||NA%QR||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Security Only||Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Security Only'
 BEGIN
 RETURN '@QR||SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Quality Rollups'
 BEGIN
 RETURN '@QR||NA%QR';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Security Only'
 BEGIN
 RETURN '@QR||NA%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Not Applicable,Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Quality Rollups||Quality Rollups,Security Only'
 BEGIN
 RETURN '@QR||QR%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@SO||NA%QR||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@SO||NA%QR||NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@SO||NA%QR||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@SO||NA%QR||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@SO||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Quality Rollups||Not Applicable,Security Only' 
 BEGIN
 RETURN '@SO||NA%QR||NA%SO||';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@SO||NA%QR||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Quality Rollups||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@SO||NA%QR||QR%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@SO||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@SO||NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Quality Rollups' 
 BEGIN
 RETURN '@SO||NA%QR';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Security Only||' 
 BEGIN
 RETURN '@SO||NA%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA%QR||NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Quality Rollups||Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA%QR||NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Quality Rollups||Not Applicable,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA%QR||NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA%QR||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Quality Rollups||Not Applicable,Security Only' 
 BEGIN
 RETURN '@NA%QR||NA%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Quality Rollups||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA%QR||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Quality Rollups||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA%QR||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA%SO||NA%QR%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Security Only||Not Applicable,Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA%SO||NA%QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA%SO||QR%SO';
 END IF;
 
 if nservicing_types = '@Not Applicable,Quality Rollups,Security Only||Quality Rollups,Security Only' 
 BEGIN
 RETURN '@NA%QR%SO||QR%SO';
 END IF;

END;
