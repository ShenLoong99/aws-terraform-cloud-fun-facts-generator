#!/bin/bash

echo "🔍 Locating API Gateway..."

# Find the API ID by the name defined in main.tf
API_ID=$(aws apigatewayv2 get-apis --query "Items[?Name=='FunfactsAPI'].ApiId" --output text)

if [ -z "$API_ID" ] || [ "$API_ID" == "None" ]; then
  echo "❌ Error: Could not find API Gateway named 'FunfactsAPI'"
  exit 1
fi

# Construct the default invoke URL
# Format: https://{api-id}.execute-api.{region}.amazonaws.com
URL="https://${API_ID}.execute-api.${AWS_REGION}.amazonaws.com/funfact"

echo "🌐 Testing API: $URL"

# Run the health check
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$STATUS" -eq 200 ]; then
  echo "✅ API check passed (Status: $STATUS)"
  exit 0
else
  echo "❌ API check failed (Status: $STATUS)"
  exit 1
fi