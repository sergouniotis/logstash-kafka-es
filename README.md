# Kafka to Elasticsearch ETL

This repository contains a Docker Compose file and scripts for setting up an ETL pipeline that ingests data from a Kafka topic and stores it in Elasticsearch.

## Prerequisites

- Docker
- jq
- Set VM Limits by running the following command : `sudo sysctl -w vm.max_map_count=262144`  ( https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html )

## Running the Docker Compose File

1. Clone this repository to your local machine
2. Navigate to the root directory of the repository
3. Run `docker-compose up` to start the ETL pipeline

## Sending Sample Messages to the Kafka Topic

A sample message named "event.json" is provided. You can send the provided message by executing the following command :

`(echo -n "1:" && cat event.json | jq -cM .) | docker exec -i events_kafka_1 kafka-console-producer.sh --bootstrap-server localhost:9092 --topic public.events --property "parse.key=true" --property "key.separator=:"`

## Verifying the Data in Elasticsearch

1. Open a web browser and go to `http://localhost:9200/_cat/indices`
2. You should see an index named "events". This is the index where the data from the Kafka topic is being stored in Elasticsearch.
3. You can use the Elasticsearch API to query the data in this index. For example, to retrieve all documents in the index, you can send a GET request to `http://localhost:9200/events/_search`.
