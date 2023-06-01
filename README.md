### Запуск контейнеров
- `mongodb/run.sh`
- `clickhouse/run.sh`

### Остановка контейнеров
- `docker-compose -p mongo-kafka down`
- `docker-compose -p clickhouse-kafka down`

### Остановка контейнеров и удаление образов
- `docker-compose -p mongo-kafka down --rmi all`
- `docker-compose -p clickhouse-kafka down --rmi all`

### Подключение к узлам mongoDB
Source:
- `docker exec -it mongo1 /bin/bash`
- `mongosh "mongodb://mongo1"`

Target:
- `docker exec -it mongo2 /bin/bash`
- `mongosh "mongodb://mongo2"`

### Ввод данных mongoDB
`db.users.insertOne({ _id: 123, firstname: "Barney", lastname: "Stinson", age: 36, email: "daddy@gmail.com", sex: "M" })`

### Чтение данных mongoDB
`db.users.find({})`

### Подключение к clickhouse
`docker exec -it clickhouse-kafka-server-1 clickhouse-client`

### Чтение данных clickhouse
`SELECT * FROM metrics;`

Запись данных в kafka происходит в скрипте `run.sh`
