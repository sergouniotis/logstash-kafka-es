#!/bin/bash

file=$1
count=$2

for i in {1..$count}
        do
                (echo -n "$i:" && cat $file | jq -cM .) | docker exec -i events_kafka_1 kafka-console-producer.sh --bootstrap-server localhost:9092 --topic public.events --property "parse.key=true" --property "key.separator=:"
        done