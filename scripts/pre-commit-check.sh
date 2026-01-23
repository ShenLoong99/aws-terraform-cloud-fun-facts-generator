#!/bin/bash
echo "🔍 Running local pre-flight checks..."

# Check Terraform
terraform fmt
terraform validate

# Check Python (Lambda)
if [ -d "lambda" ]; then
    cd lambda
    python3 -m py_compile lambda_function.py
    echo "✅ Python syntax check passed"
    cd ..
fi

echo "🚀 Ready to push!"
