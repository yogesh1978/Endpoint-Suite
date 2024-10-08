SELECT COUNT(*) as "count" FROM ( 
select  
		device_id,
		person,
		ipaddr,
		subnet_addr,
		product_count,
		patch_count,
		patched,
		notpatched,
		rebootpending,
		mtime,
		os,
		status, 
		total,
		compdn,
		devicename
	from ( select  case 
		when rebootpending>0 then 'Reboot Pending'
		when notpatched>0 then 'Not Patched'
		else 'Patched'
		end  as status, 
		ipaddr,
		device_id,
		os,
		subnet_addr,
		person,
		mtime,
		product_count,
		patch_count,
		patched,
		notpatched,
		rebootpending,
		patch_count as total,
		compdn,
		devicename
	from (

SELECT 
		a.device_id AS device_id,
		b.devicename AS devicename,
		c.compdn AS compdn,
		(SELECT ipaddr
			FROM deviceconfig
			WHERE  LOWER(device_id)=LOWER(a.device_id) ) as ipaddr,
		(SELECT person
			FROM deviceconfig
			WHERE  LOWER(device_id)=LOWER(a.device_id) ) as person,
		(SELECT os
			FROM deviceconfig
			WHERE  LOWER(device_id)=LOWER(a.device_id) ) as os,
		(SELECT subnetaddr
			FROM deviceconfig
			WHERE  LOWER(device_id)=LOWER(a.device_id) ) as subnet_addr,
		max(a.mtime) AS mtime,         
		(SELECT count( distinct name)
			FROM patchadv
			<<TABLELEVELFILTERSTRING>> AND  LOWER(device_id)= LOWER(a.device_id) ) as product_count,
		   (SELECT count(name)
			FROM patchadv
			<<TABLELEVELFILTERSTRING>> AND  LOWER(device_id)= LOWER(a.device_id) ) as patch_count,    
		(SELECT COUNT(status)
			FROM patchadv
			<<TABLELEVELFILTERSTRING>> AND  LOWER(status) ='patched' AND LOWER(device_id)= LOWER(a.device_id) ) as patched,
		(SELECT COUNT(status)
			FROM patchadv
			<<TABLELEVELFILTERSTRING>> AND  LOWER(status) ='missing' AND LOWER(device_id)= LOWER(a.device_id)  ) as notpatched,
		(SELECT COUNT(status)
			FROM patchadv
			<<TABLELEVELFILTERSTRING>> AND  LOWER(status) ='reboot pending' AND LOWER(device_id)= LOWER(a.device_id)  ) as rebootpending
FROM    patchadv a
LEFT OUTER JOIN 
        deviceconfig b
ON LOWER(a.device_id) = LOWER(b.device_id)  
	LEFT OUTER JOIN ADInfo c
    ON  LOWER(a.device_id) = LOWER(c.device_id)	<<INNERFILTERSTRING>>
	group by a.device_id,b.devicename,c.compdn
	
	) tb1 )tb2 <<OUTERFILTERSTRING>> AND LOWER(status)!='patched'
)cnt
	
