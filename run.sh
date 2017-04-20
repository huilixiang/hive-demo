##创建外部表，表与数据存储分隔开来，删除表不会删除数据
hive -e "CREATE EXTERNAL TABLE IF NOT EXISTS colleagues(\
	id INT, name STRING, chip INT, dt STRING) \
	PARTITIONED BY (year STRING, month STRING, day STRING) \
	ROW FORMAT DELIMITED \
	FIELDS TERMINATED BY '\1' 
	LOCATION '/user/huajie/demo/hive/' ;"
##向表中添加分区
hive -e "ALTER TABLE colleagues ADD IF NOT EXISTS PARTITION (year='2017', month='04', day='19') \
	LOCATION '2017/04/19';"
hive -e "ALTER TABLE colleagues ADD IF NOT EXISTS PARTITION (year='2017', month='04', day='20') \
	LOCATION '2017/04/20';"
