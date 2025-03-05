#!/bin/bash
while true; do
    current_time=$(date +"%H:%M:%S")
    echo "{\"text\": \"$current_time\"}"
    sleep 1
done

