#!/bin/bash

# List all API Gateway IDs and Names
apis=$(aws apigateway get-rest-apis --query "items[].{ID:id, Name:name}" --output json)

echo "Listing stages for all APIs:"
for row in $(echo "$apis" | jq -c '.[]'); do
  api_id=$(echo "$row" | jq -r '.ID')
  api_name=$(echo "$row" | jq -r '.Name')

  echo "API Name: $api_name"
  echo "API ID: $api_id"

  # List stages for the API
  aws apigateway get-stages --rest-api-id "$api_id" --query "item[].{StageName:stageName, InvokeUrl:invokeUrl}" --output table
  echo ""
done
