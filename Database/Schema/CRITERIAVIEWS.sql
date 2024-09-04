--------------------------------------------------------
--  DDL for View CRITERIAVIEWS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SEN11CP2MSI164"."CRITERIAVIEWS" ("CRITERIANAME_ID", "CRITERIANAME", "CRITERIAVIEWNAME_ID", "VIEWNAME") AS 
  SELECT rcaCriteria.CriteriaName_id, rcaCriteriaNames.CriteriaName, rcaCriteriaViewNames.CriteriaViewName_id, 
 rcaCriteriaViewNames.ViewName
FROM rcaCriteria, rcaCriteriaViewNames, rcaCriteriaNames 
WHERE rcaCriteria.CriteriaViewName_id = rcaCriteriaViewNames.CriteriaViewName_id AND
 rcaCriteria.CriteriaName_id = rcaCriteriaNames.CriteriaName_id
 GROUP BY rcaCriteria.CriteriaName_id, rcaCriteriaViewNames.ViewName, rcaCriteriaViewNames.CriteriaViewName_id, rcaCriteriaNames.CriteriaName
;
