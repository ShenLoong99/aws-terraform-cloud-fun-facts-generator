#!/bin/bash

# --- Frontend Website Smoke Test ---
echo "🔍 Testing Frontend Website..."

if [ -z "$SITE_URL" ]; then
  echo "❌ Error: SITE_URL environment variable is not set."
  exit 1
else
  if [[ ! $SITE_URL =~ ^http ]]; then
    SITE_URL="https://$SITE_URL"
  fi
fi

echo "🌐 Testing Website: $SITE_URL"

# Increased Retry Logic: 10 attempts every 15 seconds (2.5 minutes total)
for i in {1..10}; do
  # Use --connect-timeout to avoid hanging on Status 00
  SITE_RESPONSE=$(curl -s -L --connect-timeout 5 -w "%{http_code}" "$SITE_URL" -o /tmp/site_output.html)
  # Extract only the last 3 digits (the HTTP status)
    SITE_STATUS="${SITE_RESPONSE: -3}"

  if [ "$SITE_STATUS" -eq 200 ]; then
    if grep -q "Cloud Fun Facts" /tmp/site_output.html; then
      echo "✅ Website check passed (Status: $SITE_STATUS)"
      exit 0
    else
      echo "⚠️ Status 200 but expected content not found. (CloudFront may be serving old cache)"
    fi
  else
    echo "⏳ Connection failed or status $SITE_STATUS. Retrying in 15s... ($i/10)"
  fi
  sleep 15
done

echo "❌ Website check timed out after 10 attempts."
exit 1