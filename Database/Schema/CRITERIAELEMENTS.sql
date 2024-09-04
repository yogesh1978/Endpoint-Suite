--------------------------------------------------------
--  DDL for View CRITERIAELEMENTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SEN11CP2MSI164"."CRITERIAELEMENTS" ("CRITERIANAME_ID", "CRITERIAVIEWNAME_ID", "CRITERIANAME", "COLUMNNAME", "CONDITION", "OPERATOR", "CRITERIAVALUETYPEID", "CRITERIAVALUE", "DATABASETYPE_ID", "CRITERIAOPERATOR", "CRITERIASEARCHTYPEID", "ELEMENT_ID", "CRITERIASQL") AS 
  SELECT rcaCriteria.CriteriaName_id, 
 rcaCriteria.CriteriaViewName_id, 
 rcaCriteriaNames.CriteriaName, 
 rcaCriteriaColumnNames.ColumnName, 
 rcaCriteriaConditions.Condition, 
 rcaCriteriaOperators.Operator, 
 rcaCriteriaValues.CriteriaValueTypeID, 
 rcaCriteriaValues.CriteriaValue, 
 rcaCriteriaSQL.DatabaseType_id, 
 rcaCriteriaOperators_1.Operator CriteriaOperator, 
 rcaCriteria.CriteriaSearchTypeID, 
 rcaCriteriaSQLElements.Element_id, 
 rcaCriteriaSQLElements.CriteriaSQL
FROM rcaCriteriaColumnNames 
 INNER JOIN rcaCriteria 
 INNER JOIN rcaCriteriaColumns ON rcaCriteria.CriteriaName_id = rcaCriteriaColumns.CriteriaName_id 
 INNER JOIN rcaCriteriaConditions ON rcaCriteriaColumns.CriteriaCondition_id = rcaCriteriaConditions.CriteriaCondition_id 
 INNER JOIN rcaCriteriaOperators ON rcaCriteriaColumns.CriteriaOperator_id = rcaCriteriaOperators.CriteriaOperator_id 
 INNER JOIN rcaCriteriaNames ON rcaCriteriaColumns.CriteriaName_id = rcaCriteriaNames.CriteriaName_id ON rcaCriteriaColumnNames.CriteriaColumnName_id = rcaCriteriaColumns.CriteriaColumnName_id 
 INNER JOIN rcaCriteriaValues 
 INNER JOIN rcaCriteriaColumnValues ON rcaCriteriaValues.CriteriaValue_id = rcaCriteriaColumnValues.CriteriaValue_id ON rcaCriteriaColumns.CriteriaName_id = rcaCriteriaColumnValues.CriteriaName_id AND rcaCriteriaColumns.CriteriaColumnName_id = rcaCriteriaColumnValues.CriteriaColumnName_id 
 INNER JOIN rcaCriteriaSQL ON rcaCriteria.CriteriaName_id = rcaCriteriaSQL.CriteriaName_id 
 INNER JOIN rcaCriteriaOperators rcaCriteriaOperators_1 ON rcaCriteria.CriteriaOperator_id = rcaCriteriaOperators_1.CriteriaOperator_id 
 INNER JOIN rcaCriteriaSQLElements ON rcaCriteria.CriteriaName_id = rcaCriteriaSQLElements.CriteriaName_id
;
