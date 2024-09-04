SELECT * FROM (
SELECT  b.device_id,
		b.devicename,
		b.mtime,
		b.ipaddr,
		person,
		os,
		subnetaddr,
		compdn
FROM patchadv a LEFT OUTER JOIN   deviceconfig b   ON a.device_id = b.device_id  
LEFT OUTER JOIN ADInfo c  ON  a.device_id = c.device_id  <<INNERFILTERSTRING>>
)t  <<OUTERFILTERSTRING>>
group by 
        
		device_id,
		mtime,
		ipaddr,
		person,
		devicename,
		os,
		subnetaddr,
		compdn