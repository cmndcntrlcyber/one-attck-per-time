# [13::System Audit Policy Was Changed::Reyes-R13-System Audit Policy Was Changed}

# To Change
auditpol /set /category:"System" /subcategory:"System Integrity" /failure:enable

# To Return to Original
auditpol /set /category:"System" /subcategory:"System Integrity" /success:enable
