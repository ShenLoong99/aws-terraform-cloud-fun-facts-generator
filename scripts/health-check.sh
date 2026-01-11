#!/bin/bash
# A simple health check script to verify deployment

API_URL=$(terraform output -raw api_invoke_url)
CF_URL=$(terraform output -raw cloudfront_url)

echo "Testing API Gateway..."
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" $API_URL)

if [ $STATUS_CODE -eq 200 ]; then
    echo "✅ API is online (Status: $STATUS_CODE)"
else
    echo "❌ API check failed (Status: $STATUS_CODE)"
    exit 1
fi

echo "Testing CloudFront URL..."
CF_STATUS=$(curl -s -o /dev/null -w "%{http_code}" $CF_URL)
if [ $CF_STATUS -eq 200 ]; then
    echo "✅ Website is live!"
else
    echo "❌ Website check failed"
    exit 1
fi