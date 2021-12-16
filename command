#指令輸入
[student@localhost ~]$ cd /etc/zabbix/zabbix_agentd.d
[student@localhost zabbix_agentd.d]$ sudo vi template_db_mysql.conf

UserParameter =mysql.getTemp.N01S01[*],HOME=/var/lib/zabbix mysql -sNX -e "SELECT * FROM zabbix.sensor where Node_sensor='N01S01' order by Record_time desc limit 1;"

UserParameter =mysql.getTemp.N01S02[*],HOME=/var/lib/zabbix mysql -sNX -e "SELECT * FROM zabbix.sensor where Node_sensor='N01S02' order by Record_time desc limit 1;"

UserParameter =mysql.getTemp.N02S01[*],HOME=/var/lib/zabbix mysql -sNX -e "SELECT * FROM zabbix.sensor where Node_sensor='N02S01' order by Record_time desc limit 1;"


[student@localhost zabbix_agentd.d]$ sudo systemctl restart zabbix-server

[student@localhost zabbix_agentd.d]$ sudo systemctl restart zabbix-agent




