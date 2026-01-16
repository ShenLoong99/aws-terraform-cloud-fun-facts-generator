#!/bin/bash

# --- API Health Check ---
echo "🔍 Locating API Gateway..."
API_ID=$(aws apigatewayv2 get-apis --query "Items[?Name=='FunfactsAPI'].ApiId" --output text)

if [ -z "$API_ID" ] || [ "$API_ID" == "None" ]; then
  echo "❌ Error: Could not find API Gateway named 'FunfactsAPI'"
  exit 1
fi

API_TEST_URL="https://${API_ID}.execute-api.${AWS_REGION}.amazonaws.com/funfact"
echo "🌐 Testing API: $API_TEST_URL"

API_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$API_TEST_URL")

if [ "$API_STATUS" -eq 200 ]; then
  echo "✅ API check passed (Status: $API_STATUS)"
else
  echo "❌ API check failed (Status: $API_STATUS)"
  exit 1
fi
