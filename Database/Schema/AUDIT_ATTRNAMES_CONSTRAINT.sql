--------------------------------------------------------
--  Constraints for Table AUDIT_ATTRNAMES
--------------------------------------------------------

  ALTER TABLE "SEN11CP2MSI164"."AUDIT_ATTRNAMES" ADD PRIMARY KEY ("ATTRNAMEKEY")
  USING INDEX  ENABLE;
  ALTER TABLE "SEN11CP2MSI164"."AUDIT_ATTRNAMES" ADD UNIQUE ("ATTRNAMEKEY", "ATTRIBUTE")
  USING INDEX  ENABLE;
