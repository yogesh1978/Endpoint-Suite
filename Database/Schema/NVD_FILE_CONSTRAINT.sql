--------------------------------------------------------
--  Constraints for Table NVD_FILE
--------------------------------------------------------

  ALTER TABLE "SEN11CP2MSI164"."NVD_FILE" MODIFY ("NVD_ZOBJNAME" NOT NULL ENABLE);
  ALTER TABLE "SEN11CP2MSI164"."NVD_FILE" MODIFY ("NVD_ZOBJDATE" NOT NULL ENABLE);
  ALTER TABLE "SEN11CP2MSI164"."NVD_FILE" MODIFY ("NVD_ZOBJTIME" NOT NULL ENABLE);
  ALTER TABLE "SEN11CP2MSI164"."NVD_FILE" ADD PRIMARY KEY ("NVD_ZOBJNAME")
  USING INDEX  ENABLE;
