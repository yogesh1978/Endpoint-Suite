--------------------------------------------------------
--  DDL for View CRITERIA
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SEN11CP2MSI164"."CRITERIA" ("CRITERIANAME_ID", "CRITERIAVIEWNAME_ID", "CRITERIANAME", "COLUMNNAME", "CONDITION", "OPERATOR", "CRITERIAVALUETYPEID", "CRITERIAVALUE", "CRITERIASQL", "DATABASETYPE_ID", "CRITERIAOPERATOR", "CRITERIASEARCHTYPEID") AS 
  SELECT rcaCriteria.CriteriaName_id, 
 rcaCriteria.CriteriaViewName_id, 
 rcaCriteriaNames.CriteriaName, 
 rcaCriteriaColumnNames.ColumnName, 
 rcaCriteriaConditions.Condition, 
 rcaCriteriaOperators.Operator, 
 rcaCriteriaValues.CriteriaValueTypeID, 
 rcaCriteriaValues.CriteriaValue, 
 rcaCriteriaSQL.CriteriaSQL, 
 rcaCriteriaSQL.DatabaseType_id, 
 rcaCriteriaOperators_1.Operator CriteriaOperator,
 rcaCriteria.CriteriaSearchTypeID
 FROM rcaCriteriaColumnNames, 
 rcaCriteria, 
 rcaCriteriaColumns, 
 rcaCriteriaConditions, 
 rcaCriteriaOperators,
 rcaCriteriaNames,
 rcaCriteriaValues, 
 rcaCriteriaColumnValues, 
 rcaCriteriaSQL, 
 rcaCriteriaOperators rcaCriteriaOperators_1 
WHERE (rcaCriteria.CriteriaName_id = rcaCriteriaColumns.CriteriaName_id) 
 AND (rcaCriteriaColumns.CriteriaCondition_id = rcaCriteriaConditions.CriteriaCondition_id) 
 AND (rcaCriteriaColumns.CriteriaOperator_id = rcaCriteriaOperators.CriteriaOperator_id) 
 AND (rcaCriteriaColumns.CriteriaName_id = rcaCriteriaNames.CriteriaName_id)
 AND (rcaCriteriaColumnNames.CriteriaColumnName_id = rcaCriteriaColumns.CriteriaColumnName_id) 
 AND (rcaCriteriaValues.CriteriaValue_id = rcaCriteriaColumnValues.CriteriaValue_id) 
 AND (rcaCriteriaColumns.CriteriaName_id = rcaCriteriaColumnValues.CriteriaName_id 
 AND rcaCriteriaColumns.CriteriaColumnName_id = rcaCriteriaColumnValues.CriteriaColumnName_id)
 AND (rcaCriteria.CriteriaName_id = rcaCriteriaSQL.CriteriaName_id) 
 AND (rcaCriteria.CriteriaOperator_id = rcaCriteriaOperators_1.CriteriaOperator_id)
;
