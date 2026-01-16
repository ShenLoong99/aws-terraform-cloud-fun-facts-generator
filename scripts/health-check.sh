#!/bin/bash

# --- Part 1: API Health Check ---
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

# --- Part 2: CloudFront Website Health Check ---
echo "🔍 Testing Frontend Website..."

if [ -z "$SITE_URL" ]; then
  echo "❌ Error: SITE_URL environment variable is not set."
  exit 1
fi

if [[ ! $SITE_URL =~ ^http ]]; then
  SITE_URL="https://$SITE_URL"
fi

echo "🌐 Testing Website: $SITE_URL"

# Increased Retry Logic: 10 attempts every 15 seconds (2.5 minutes total)
for i in {1..10}; do
  # Use --connect-timeout to avoid hanging on Status 00
  SITE_RESPONSE=$(curl -s -L --connect-timeout 5 -w "%{http_code}" "$SITE_URL" -o /tmp/site_output.html)
  SITE_STATUS=$(tail -c 3 <<< "$SITE_RESPONSE")

  if [ "$SITE_STATUS" -eq 200 ]; then
    if grep -q "Cloud Fun Facts" /tmp/site_output.html; then
      echo "✅ Website check passed (Status: $SITE_STATUS)"
      exit 0
    else
      echo "⚠️ Content not found. Retrying..."
    fi
  else
    echo "⏳ Connection failed or status $SITE_STATUS. Retrying in 15s... ($i/10)"
  fi
  echo "⏳ Waiting for CloudFront... (Attempt $i/10)"
  sleep 15
done

echo "❌ Website check timed out after 10 attempts."
exit 1

echo "🎉 All health checks passed!"
exit 0