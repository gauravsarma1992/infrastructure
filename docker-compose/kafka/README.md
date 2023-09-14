# Kafka connect

## Steps
- Run MongoDB as a replicaset
- Run Zookeeper and Kafka brokers
- Run Kafka connect
- Install Mongo Kafka jar with Kafka connect
- Create the required topics for Kafka connect, check if auto create is available
- Run the connector logic by running a POST command to the Kafka connect framework


### Data format to create the connector
```json
{
	"name": "mongo-source",
	"config": {
		"connector.class": "com.mongodb.kafka.connect.MongoSourceConnector",
		"connection.uri": "mongodb://mongodb:27017/?replicaSet=dbrs",
		"database": "defaultdb",
		"collection": "first_collection",
    "change.stream.full.document": "updateLookup",
		"pipeline": "[{\"$match\": {\"operationType\": \"insert\"}}]"
	}
}
```

### Curl command to create the connector
```bash
curl -XPOST http://connect:8083/connectors -H 'Content-Type: application/json' -d '{"name": "mongo-source", "config": { "connector.class": "com.mongodb.kafka.connect.MongoSourceConnector", "connection.uri": "mongodb://mongodb:27017/?replicaSet=dbrs", "database": "defaultdb", "collection": "first_collection", "change.stream.full.document": "updateLookup" }}'
```

### Kafka CLI helpers
Login to the `connect` container mentioned in the docker-compose file and run the following commands.

```bash
# To create a topic with name cdc-status
kafka-topics --bootstrap-server localhost:9092 --create --topic cdc-status --config cleanup.policy=compact
# List the topics created
kafka-topics --bootstrap-server localhost:9092 --list
# Describe a topic
kafka-topics --bootstrap-server localhost:9092 --describe --topic cdc-status
```
