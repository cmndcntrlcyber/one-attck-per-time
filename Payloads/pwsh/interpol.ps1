# To Change
auditpol /set /category:"System" /subcategory:"System Integrity" /failure:enable

# To Return to Original
auditpol /set /category:"System" /subcategory:"System Integrity" /success:enable
