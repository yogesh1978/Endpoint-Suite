--------------------------------------------------------
--  Constraints for Table NVD_PASTORE
--------------------------------------------------------

  ALTER TABLE "SEN11CP2MSI164"."NVD_PASTORE" MODIFY ("NVD_ZOBJNAME" NOT NULL ENABLE);
  ALTER TABLE "SEN11CP2MSI164"."NVD_PASTORE" MODIFY ("NVD_ZOBJDATE" NOT NULL ENABLE);
  ALTER TABLE "SEN11CP2MSI164"."NVD_PASTORE" MODIFY ("NVD_ZOBJTIME" NOT NULL ENABLE);
  ALTER TABLE "SEN11CP2MSI164"."NVD_PASTORE" ADD PRIMARY KEY ("NVD_ZOBJNAME")
  USING INDEX  ENABLE;
