--------------------------------------------------------
--  Constraints for Table APPRNPEVENT
--------------------------------------------------------

  ALTER TABLE "SEN11CP2MSI164"."APPRNPEVENT" ADD PRIMARY KEY ("DEVICE_ID", "ZOBJCLAS", "ZOBJDOMN", "ZOBJNAME")
  USING INDEX  ENABLE;
