#!/usr/bin/env bash

PORT=8000
echo "Port: $PORT"

# POST method predict with multiple predictions
curl -X POST -H "Content-Type: application/json" -d @predictions.json http://localhost:$PORT/predict
