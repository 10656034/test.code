MYSQL=`zabbix`
MYSQL_HOST=l27.0.0.1
MYSQL_USER=zabbix
MYSQL_PASSWORD="Ihaveadream99!"
MYSQL_PORT=3306
IA=`$MYSQL -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD -P$MYSQL_PORT -e "SELECT Sensor_id,Message FROM zabbix.sensor
WHERE Record_time <= NOW() ORDER BY  Record_time DESC LIMIT 1;"` echo $IA | awk '{print $2}'
