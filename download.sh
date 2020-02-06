#!/bin/bash
docker pull hyperledger/fabric-tools:latest
docker pull hyperledger/fabric-peer:latest
docker pull hyperledger/fabric-orderer:latest
docker pull hyperledger/fabric-ccenv:latest
docker pull hyperledger/fabric-baseos:latest
docker pull hyperledger/fabric-javaenv:latest
docker pull hyperledger/fabric-nodeenv:latest
docker pull hyperledger/fabric-ca:latest
docker pull hyperledger/fabric-zookeeper:latest
docker pull hyperledger/fabric-kafka:latest
docker pull hyperledger/fabric-couchdb:latest

docker pull hyperledger/fabric-tools:2.0
docker pull hyperledger/fabric-peer:2.0
docker pull hyperledger/fabric-orderer:2.0
docker pull hyperledger/fabric-ccenv:2.0
docker pull hyperledger/fabric-baseos:2.0
docker pull hyperledger/fabric-javaenv:2.0
docker pull hyperledger/fabric-nodeenv:2.0
docker pull hyperledger/fabric-ca:1.4
docker pull hyperledger/fabric-zookeeper:0.4
docker pull hyperledger/fabric-kafka:0.4
docker pull hyperledger/fabric-couchdb:0.4

docker pull hyperledger/fabric-tools:2.0.0
docker pull hyperledger/fabric-peer:2.0.0
docker pull hyperledger/fabric-orderer:2.0.0
docker pull hyperledger/fabric-ccenv:2.0.0
docker pull hyperledger/fabric-baseos:2.0.0
docker pull hyperledger/fabric-javaenv:2.0.0
docker pull hyperledger/fabric-nodeenv:2.0.0
docker pull hyperledger/fabric-ca:1.4.4
docker pull hyperledger/fabric-zookeeper:0.4.18
docker pull hyperledger/fabric-kafka:0.4.18
docker pull hyperledger/fabric-couchdb:0.4.18

docker images                                        
