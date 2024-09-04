--------------------------------------------------------
--  DDL for View CRITERIAELEMENTSASC
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SEN11CP2MSI164"."CRITERIAELEMENTSASC" ("CRITERIANAME_ID", "ELEMENT_ID", "CRITERIASQL") AS 
  SELECT CriteriaName_id, Element_id, 
 CriteriaSQL 
FROM rcaCriteriaSQLElements
ORDER BY CriteriaName_id, Element_id
;
