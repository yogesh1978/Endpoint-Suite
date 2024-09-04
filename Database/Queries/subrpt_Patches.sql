SELECT * FROM (
SELECT  
		name,
		patchname,
		bulletin,
		title,vendor_info_page,
		patchuid,
		vendor,
		pb.date_posted,
		prodfamily, 
		prvpatch,
		CASE to_char(a.severity) 
            WHEN '1' THEN 'Critical'
            WHEN '2' THEN 'Important'
            WHEN '3' THEN 'Moderate'
            WHEN '4' THEN 'Low'
            Else 'Unknown'
        	END AS severity,
		sqnumber,
		a.language,
		l.languagecode,
		l.lang_name,
		a.device_id,
		pd.architecture,
		a.patchtyp as type,
		prodid,
		CASE LOWER(to_char(a.status)) WHEN 'patched' THEN 'Patched'
 					WHEN 'missing' THEN 'Not Patched'
 					WHEN 'reboot pending' THEN 'Reboot Pending'
 					WHEN 'warning' THEN 'Warning'
 					END as status,
 		 (CASE to_char(pfa.preference)
		   WHEN '1' THEN 'Yes'
		   Else 'No'
		   END) AS preference,
 		CASE to_char(aq.state)
		    WHEN 'Success' THEN 'Yes'
            Else 'No'
  			END as acqstate
FROM patchadv a LEFT OUTER JOIN   deviceconfig b   ON LOWER(a.device_id) = LOWER(b.device_id)  
LEFT OUTER JOIN ADInfo c  ON  LOWER(a.device_id) = LOWER(c.device_id) 
left join (select state,patch_uid  from pa_patch_acq_details where state='Success' AND isDeleted <> '1' group by patch_uid,state) aq on LOWER(a.patchuid) = LOWER(aq.patch_uid) 
left OUTER join pa_patch pt on LOWER(a.patchuid) = LOWER(pt.patch_uid)
left join pa_product_detail pd on LOWER(a.prodid) = LOWER(pd.product_id)
LEFT OUTER JOIN pa_bulletin pb ON LOWER(pt.bulletin_id) = LOWER(pb.bulletin_id)
left join (SELECT distinct region,languagecode,lang_name FROM pa_language Union SELECT '0','All','Default' FROM pa_language )l on LOWER(a.language) = LOWER(l.region)
left join pa_family pfa on LOWER(pfa.family_name)= LOWER(a.prodfamily)
<<INNERFILTERSTRING>> 
)t <<OUTERFILTERSTRING>>
group by 
        name,
		patchname,
		prvpatch,
		bulletin,
		patchuid,
		vendor,
		architecture,
		type,
		date_posted,
		prodfamily,
		severity,
		sqnumber,
		language,
		lang_name,
		languagecode,
		title,vendor_info_page,
		preference,
		prodid,status,acqstate,device_id
