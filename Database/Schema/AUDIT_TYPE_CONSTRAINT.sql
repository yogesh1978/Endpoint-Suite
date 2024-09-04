--------------------------------------------------------
--  Constraints for Table AUDIT_TYPE
--------------------------------------------------------

  ALTER TABLE "SEN11CP2MSI164"."AUDIT_TYPE" ADD PRIMARY KEY ("AUDITTYPEKEY")
  USING INDEX  ENABLE;
  ALTER TABLE "SEN11CP2MSI164"."AUDIT_TYPE" ADD UNIQUE ("AUDITTYPEKEY", "TYPE")
  USING INDEX  ENABLE;
