/* ORACLE PreReq Script Version 7.2 for Oracle 10g and 11g */
/* */
/* Notes */
/* This script MUST be run as the schema owner/userid that will be used for your Client Automation Inventory data.*/
/* Replace the CMDATA value in ALTER SESSION with your schema owner/userid as well to run this script in the correct context. */
/* */
/* Revision History */
/* 20080110: Added rrs_devicecache support and removed rrs_devicelist stored procedure */
/*         : Changed main tablespace from RADIA to CMDATA */
/*         : If you are still using RADIA as your table space, you will need to replace CMDATA with RADIA */

ALTER SESSION SET CURRENT_SCHEMA="CMDATA";
/
CREATE OR REPLACE FUNCTION "FN_PATCHSTATUS" (
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

        if nRPEN = 0 and nERROR = 0 and nOTHER = 0  and nWARN = 0 and nOK = 0 THEN
	   RETURN 'Not Applicable';
	END IF;

  RETURN 'Other';
  
END;
/

CREATE OR REPLACE FUNCTION "fn_msservicing" (nservicing_types varchar)
RETURNS varchar  AS  
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
/
CREATE OR REPLACE FUNCTION "FN_PATCHSTATUSFORWIN10" (
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

        if nRPEN = 0 and nERROR = 0 and nOTHER = 0  and nWARN = 0 and nOK = 0 THEN
	   RETURN 'Not Applicable';
	END IF;

  RETURN 'Other';
  
END;
/
DECLARE tbl_exist PLS_INTEGER;
BEGIN
SELECT COUNT(*) INTO tbl_exist FROM user_tables WHERE table_name = 'RRS_SESSION';
IF tbl_exist = 1 THEN
execute immediate 'DROP TABLE RRS_SESSION';
END IF;
END;
/
CREATE TABLE RRS_SESSION (sessionid varchar2(32), sessiondate date)
/
CREATE UNIQUE INDEX RRS_SESSIONIdx on RRS_SESSION (sessionid, sessiondate)
/
DECLARE tbl_exist PLS_INTEGER;
BEGIN
SELECT COUNT(*) INTO tbl_exist FROM user_tables WHERE table_name = 'RRS_DEVICETABLE';
IF tbl_exist = 1 THEN
execute immediate 'DROP TABLE RRS_DEVICETABLE';
END IF;
END;
/
CREATE TABLE RRS_DEVICETABLE (devicename varchar2(128), sessionid varchar2(32))
/
CREATE UNIQUE INDEX RRS_DEVICETABLEIdx on RRS_DEVICETABLE (devicename, sessionid)
/
CREATE UNIQUE INDEX RRS_DEVICETABLEIdx2 on RRS_DEVICETABLE (upper(devicename), sessionid)
/
DECLARE tbl_exist PLS_INTEGER;
BEGIN
SELECT COUNT(*) INTO tbl_exist FROM user_tables WHERE table_name = 'RRS_DEVICECACHE';
IF tbl_exist = 1 THEN
execute immediate 'DROP TABLE RRS_DEVICECACHE';
END IF;
END;
/
CREATE TABLE RRS_DEVICECACHE (sessionid NVARCHAR2(128) NOT NULL, filtername NVARCHAR2(128) NOT NULL, filtervalue NVARCHAR2(768), devicename NVARCHAR2(128) NOT NULL, cachetime NUMBER(10,0) NOT NULL, source NVARCHAR2(20) NOT NULL)
/
CREATE INDEX idx_RRS_DEVICECACHE1 on RRS_DEVICECACHE (sessionid, filtername, filtervalue)
/
CREATE INDEX idx_RRS_DEVICECACHE2 on RRS_DEVICECACHE (sessionid, filtername, filtervalue, source)
/
CREATE INDEX idx_RRS_DEVICECACHE3 on RRS_DEVICECACHE (cachetime)
/

CREATE OR REPLACE Procedure DELETE_HPPATCH_DEVICE
  (
   Var_devname IN NVARCHAR2
 )
 AS
 BEGIN
       DELETE FROM NVD_DESTATUS WHERE NVD_ZOBJDEV = Var_devname;
       DELETE FROM NVD_BUSTATUS WHERE NVD_ZOBJDEV = Var_devname;
       DELETE FROM NVD_RESTATUS WHERE NVD_ZOBJDEV = Var_devname;
       DELETE FROM NVD_PASTATUS WHERE NVD_ZOBJDEV = Var_devname;
       DELETE FROM NVD_DEERROR  WHERE NVD_ZOBJDEV = Var_devname;
 END DELETE_HPPATCH_DEVICE;
/


CREATE OR REPLACE FUNCTION FN_WUAVERSION (Curr_wuaver IN Char) RETURN VARCHAR  IS
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
 elsif  To_Number(substr(Curr_wuaver,1,(Var_WUA_STRPOS1-1))) = TO_NUMBER(substr(Var_MediaWUA,1,(Var_MED_STRPOS1-1))) then

  Select INSTR(Curr_wuaver,'.',(Var_WUA_STRPOS1+1)) into Var_WUA_STRPOS2 from dual;
  Select INSTR(Var_MediaWUA,'.',(Var_MED_STRPOS1+1))  into Var_MED_STRPOS2 from dual;

  if To_Number(substr(Curr_wuaver,(Var_WUA_STRPOS1+1),(Var_WUA_STRPOS2-(Var_WUA_STRPOS1+1)))) <    TO_NUMBER(substr(Var_MediaWUA,(Var_MED_STRPOS1+1),(Var_MED_STRPOS2-(Var_MED_STRPOS1+1)))) then
   Return 'Non Compliant';
  elsif To_Number(substr(Curr_wuaver,(Var_WUA_STRPOS1+1),(Var_WUA_STRPOS2-(Var_WUA_STRPOS1+1)))) =      TO_NUMBER(substr(Var_MediaWUA,(Var_MED_STRPOS1+1),(Var_MED_STRPOS2-(Var_MED_STRPOS1+1)))) then

   Select INSTR(Curr_wuaver,'.',(Var_WUA_STRPOS2+1)) into Var_WUA_STRPOS3 from dual;
   Select INSTR(Var_MediaWUA,'.',(Var_MED_STRPOS2+1))  into Var_MED_STRPOS3 from dual;

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
/


