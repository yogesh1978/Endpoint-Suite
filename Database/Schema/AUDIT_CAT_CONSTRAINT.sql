--------------------------------------------------------
--  Constraints for Table AUDIT_CAT
--------------------------------------------------------

  ALTER TABLE "SEN11CP2MSI164"."AUDIT_CAT" ADD PRIMARY KEY ("AUDITCATKEY")
  USING INDEX  ENABLE;
  ALTER TABLE "SEN11CP2MSI164"."AUDIT_CAT" ADD UNIQUE ("AUDITCATKEY", "CATEGORY")
  USING INDEX  ENABLE;
