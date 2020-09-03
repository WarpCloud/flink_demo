#!/bin/bash

NS=flinktest
kubectl create ns ${NS}
kubectl -n ${NS} create configmap flink-config --from-file=flink-conf.yaml --from-file=log4j-console.properties
kubectl -n ${NS} apply -f jobmanager-rest-service.yaml 
kubectl -n ${NS} apply -f jobmanager-service.yaml 
kubectl -n ${NS} apply -f taskmanager-query-state-service.yaml
kubectl -n ${NS} apply -f jobmanager-session-deployment.yaml  
kubectl -n ${NS} apply -f taskmanager-session-deployment.yaml
