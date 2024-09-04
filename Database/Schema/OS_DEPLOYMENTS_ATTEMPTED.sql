--------------------------------------------------------
--  DDL for View OS_DEPLOYMENTS_ATTEMPTED
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SEN11CP2MSI164"."OS_DEPLOYMENTS_ATTEMPTED" ("MAX_EVENT_ID", "DEVICE_ID", "SERIAL_NO", "DEPLOYMENT_ID") AS 
  SELECT max(tbl.event_id) AS max_event_id, 
 tbl.device_id, tbl.serial_no,
 tbl.deployment_id
 FROM OSMEvents tbl 
 INNER JOIN
 (
 SELECT MAX(event_time) AS event_time, device_id, serial_no, deployment_id
 FROM OSMEvents
 GROUP BY device_id, serial_no, deployment_id
 )t2 ON tbl.event_time = t2.event_time 
 AND tbl.device_id = t2.device_id 
 AND tbl.serial_no = t2.serial_no
 group by tbl.device_id, tbl.serial_no, tbl.deployment_id

;
