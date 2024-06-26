#!/bin/bash


CONTAINER_NAME = "tulip-fork-assembler-1"

PCAP_DIR = "/traffic"

PCAP_FILE = $(ls $PCAP_DIR/log.pcap.*)

COMMAND = "./assembler $PCAP_FILE"

docker exec -i -t $CONTAINER_NAME $COMMAND
