--------------------------------------------------------
--  Constraints for Table OSMEVENTS
--------------------------------------------------------

  ALTER TABLE "SEN11CP2MSI164"."OSMEVENTS" ADD PRIMARY KEY ("EVENT_ID", "DEVICE_ID", "SERIAL_NO")
  USING INDEX  ENABLE;
