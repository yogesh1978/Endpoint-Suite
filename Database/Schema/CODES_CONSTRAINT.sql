--------------------------------------------------------
--  Constraints for Table CODES
--------------------------------------------------------

  ALTER TABLE "SEN11CP2MSI164"."CODES" MODIFY ("CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "SEN11CP2MSI164"."CODES" MODIFY ("CODETYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "SEN11CP2MSI164"."CODES" ADD CONSTRAINT "XPKCODES" PRIMARY KEY ("CODETYPE_ID", "CODE_ID")
  USING INDEX  ENABLE;
