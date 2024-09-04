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