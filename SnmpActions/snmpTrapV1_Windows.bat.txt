
set community=%1%
set trapDestinationIP=%2%
set enterpriseOID=%3%
set trapSourceIP=%4%
set genericTrapID=%5%
set specificTrapID=%6%
set systemUpTime="%7%"

snmptrap -v 1 -c %community% %trapDestinationIP% %enterpriseOID% %trapSourceIP% %genericTrapID% %specificTrapID% %systemUpTime%