

# create a topic with 3 partitions
kafka-topics.sh --command-config playerA.config --bootstrap-server cluster.playerA.cdkt.io --topic third_topic --create --partitions 3 

# start one consumer
kafka-console-consumer.sh --command-config playerA.config --bootstrap-server cluster.playerA.cdkt.io --topic third_topic --group my-first-application

# start one producer and start producing 
kafka-console-producer.sh --producer.config playerA.config --booststrap-server cluster.playerA.cdkt.io --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic third_topic


# start another consumer part of the same group see messages being consumed by both consumers
kafka-console-consumer.sh --command-config playerA.config --bootstrap-server cluster.playerA.cdkt.io:9092 --topic third_topic --group my-first-application