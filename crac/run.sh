#!/bin/bash

java -Dspring.context.checkpoint=onRefresh -XX:CRaCCheckpointTo=target/tmp_checkpoint -jar target/java-serverless-0.0.1-SNAPSHOT.jar