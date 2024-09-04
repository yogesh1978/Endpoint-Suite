--------------------------------------------------------
--  Constraints for Table NVD_MSGCAT
--------------------------------------------------------

  ALTER TABLE "SEN11CP2MSI164"."NVD_MSGCAT" MODIFY ("NVD_MSGTAG" NOT NULL ENABLE);
  ALTER TABLE "SEN11CP2MSI164"."NVD_MSGCAT" MODIFY ("NVD_MSGLANG" NOT NULL ENABLE);
  ALTER TABLE "SEN11CP2MSI164"."NVD_MSGCAT" ADD PRIMARY KEY ("NVD_MSGTAG", "NVD_MSGLANG")
  USING INDEX  ENABLE;
