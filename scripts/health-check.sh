#!/bin/bash

# --- API Health Check ---
echo "🔍 Testing API endpoint from Terraform outputs..."

# Guard: Ensure the API_URL variable was passed correctly
if [ -z "$API_URL" ]; then
  echo "❌ Error: API_URL environment variable is not set."
  exit 1
fi

# Ensure the URL is properly formatted for the endpoint
# If your Terraform output doesn't include the path, add it here
API_TEST_URL="${API_URL}/funfact"
echo "🌐 Testing API: $API_TEST_URL"

# Run the health check
API_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$API_TEST_URL")

if [ "$API_STATUS" -eq 200 ]; then
  echo "✅ API check passed (Status: $API_STATUS)"
else
  echo "❌ API check failed (Status: $API_STATUS)"
  exit 1
fi
