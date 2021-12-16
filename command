#指令輸入
[student@localhost ~]$ cd /etc/zabbix/zabbix_agentd.d
[student@localhost zabbix_agentd.d]$ sudo vi template_db_mysql.conf

Z]Xa+*oHB2C1ygm#[client]
#host='localhost'
#user='zabbix'
#password='Ihaveadream99!'

UserParameter=mysql.ping[*], mysqladmin -h"$1" -P"$2" ping
UserParameter=mysql.get_status_variables[*], mysql -h"$1" -P"$2" -sNX -e "show global status"
UserParameter=mysql.version[*], mysqladmin -s -h"$1" -P"$2" version
UserParameter=mysql.db.discovery[*], mysql -h"$1" -P"$2" -sN -e "show databases"
UserParameter=mysql.dbsize[*], mysql -h"$1" -P"$2" -sN -e "SELECT COALESCE(SUM(DATA_LENGTH + INDEX_LENGTH),0) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='$3'"
UserParameter=mysql.replication.discovery[*], mysql -h"$1" -P"$2" -sNX -e "show slave status"
UserParameter=mysql.slave_status[*], mysql -h"$1" -P"$2" -sNX -e "show slave status"

UserParameter =mysql.getTemp.N01S01[*],HOME=/var/lib/zabbix mysql -sNX -e "SELECT * FROM zabbix.sensor where Node_sensor='N01S01' order by Record_time desc limit 1;"


[student@localhost zabbix_agentd.d]$ sudo systemctl restart zabbix-server

[student@localhost zabbix_agentd.d]$ sudo systemctl restart zabbix-agent




