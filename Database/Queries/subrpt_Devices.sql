SELECT * FROM (
SELECT  b.device_id,
		b.mtime,
		b.ipaddr,
		person,
		os,
		subnetaddr,
		compdn,
		name,
		patchname,
		bulletin,
		patchuid,
		vendor,
		prodfamily,
		CASE to_char(severity) 
            WHEN '1' THEN 'Critical'
            WHEN '2' THEN 'Important'
            WHEN '3' THEN 'Moderate'
            WHEN '4' THEN 'Low'
            Else 'Unknown'
        	END AS severity,
		sqnumber,
		a.language,
		prodid,
		CASE LOWER(to_char(a.status)) WHEN 'patched' THEN 'Patched'
 					WHEN 'missing' THEN 'Not Patched'
 					WHEN 'reboot pending ' THEN 'Reboot Pending'
 					WHEN 'warning' THEN 'Warning'
 					END as status,
 		CASE to_char(aq.state)
		    WHEN 'Success' THEN 'Yes'
            Else 'No'
  			END as acqstate,
			b.devicename
FROM patchadv a LEFT OUTER JOIN   deviceconfig b   ON LOWER(a.device_id) = LOWER(b.device_id)  
LEFT OUTER JOIN ADInfo c  ON  LOWER(a.device_id) = LOWER(c.device_id) 
LEFT OUTER JOIN (select distinct patch_name,state,patch_uid from pa_patch_acq_details ) aq ON LOWER(aq.patch_uid)= LOWER(a.patchuid)
<<INNERFILTERSTRING>> 
)t <<OUTERFILTERSTRING>>
group by 
        name,
		patchname,
		bulletin,
		patchuid,
		vendor,
		prodfamily,
		severity,
		sqnumber,
		device_id,
		mtime,
		ipaddr,
		person,
		os,
		subnetaddr,
		compdn,
		language,
		prodid,status,acqstate,devicename