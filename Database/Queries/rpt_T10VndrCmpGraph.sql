SELECT 
  y.vendor as "category" ,
  SUM(CASE y.status WHEN 'Patched' THEN 1 ELSE 0 END ) as patched,
  SUM(CASE y.status WHEN 'Not Patched' THEN 1 ELSE 0 END ) as notpatched,
  SUM(CASE y.status WHEN 'Reboot Pending' THEN 1 ELSE 0 END ) as rebootpending
FROM (
	SELECT patchname,vendor,bulletin,name,
					CASE WHEN rebootpending>0 THEN 'Reboot Pending' 
						  WHEN notpatched>0 THEN 'Not Patched'
						  ELSE 'Patched' END as status FROM (
						SELECT patchname,vendor,bulletin,name,
								 SUM(CASE WHEN LOWER(status)='patched' THEN 1 ELSE 0 END) AS patched,
								 SUM(CASE WHEN LOWER(status)='missing' THEN 1 ELSE 0 END) AS notpatched,
								 SUM(CASE WHEN LOWER(status)='reboot pending' THEN 1 ELSE 0 END) AS rebootpending
						FROM patchadv a LEFT JOIN DeviceConfig b on LOWER(a.device_id)=LOWER(b.device_id) GROUP BY patchname,vendor,bulletin,name )t
)y
group by y.vendor order by notpatched desc