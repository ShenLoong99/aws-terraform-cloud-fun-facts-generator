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

echo "🌐 Testing Website: $SITE_URL"
# Retry logic: wait up to 60 seconds for CloudFront to propagate
for i in {1..6}; do
  # We check for 200 OK. We also check if the body contains "Cloud Fun Facts" 
  # to ensure the correct page is actually loading.
  SITE_RESPONSE=$(curl -s -L -w "%{http_code}" "$SITE_URL" -o /tmp/site_output.html)
  SITE_STATUS=$(tail -c 3 <<< "$SITE_RESPONSE")

  if [ "$SITE_STATUS" -eq 200 ]; then
    if grep -q "Cloud Fun Facts" /tmp/site_output.html; then
      echo "✅ Website check passed (Status: $SITE_STATUS)"
    else
      echo "⚠️ Website loaded but content 'Cloud Fun Facts' not found."
      exit 1
    fi
  else
    echo "❌ Website check failed (Status: $SITE_STATUS)"
    exit 1
  fi
done

echo "🎉 All health checks passed!"
exit 0