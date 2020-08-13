#!/usr/bin/env bash

PORT=8000
echo "Port: $PORT"

# First POST method predict
curl -d @prediction_1.json -X POST -H "Content-Type: application/json"  http://localhost:$PORT/predict

# 2do POST method predict
curl -d @prediction_2.json -X POST -H "Content-Type: application/json"  http://localhost:$PORT/predict