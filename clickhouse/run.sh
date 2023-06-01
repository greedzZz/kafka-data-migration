#!/bin/bash

declare -r HOST="http://connect:8083/connectors"
attempt_counter=0
max_attempts=5
docker-compose -p clickhouse-kafka up -d --force-recreate       
sleep 5
docker exec -i connect /bin/bash -c "kafka-topics \
--bootstrap-server broker:29092 \
--topic metrics \
--create --partitions 6 \
--replication-factor 1"
docker cp init_db.sql clickhouse-kafka-server-1:/docker-entrypoint-initdb.d/init_db.sql
docker exec -i clickhouse-kafka-server-1 /bin/bash -c "clickhouse-client -n < /docker-entrypoint-initdb.d/init_db.sql"
docker exec -i connect /bin/bash -c "kafka-console-producer --broker-list broker:29092 --topic metrics <<END
1	100	15.2	9.7
2	200.55	120	7.77
3	300.16	14.10	33.4
4	444.2	8.3	6
5	32.32	430.11	71.5
END"
