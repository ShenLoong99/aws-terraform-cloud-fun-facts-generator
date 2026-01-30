# Define all facts in one place
locals {
  cloud_facts = {
    "1"  = "AWS S3 was one of the very first AWS services, launched in 2006."
    "2"  = "Netflix runs almost all of its infrastructure on AWS."
    "3"  = "Cloud computing can save companies up to 30% on IT costs."
    "4"  = "NASA uses AWS to store and share Mars mission data with the public."
    "5"  = "AWS has more than 200 fully featured services today."
    "6"  = "The 'cloud' doesn’t float in the sky, it’s made of giant data centers on Earth."
    "7"  = "More than 90% of Fortune 100 companies use AWS."
    "8"  = "AWS data centers are so secure that they require retina scans and 24/7 guards."
    "9"  = "Serverless doesn’t mean there are no servers, it just means you don’t manage them."
    "10" = "Each AWS Availability Zone has at least one independent power source and cooling system."
    "11" = "Amazon once accidentally took down parts of the internet when S3 had an outage in 2017."
    "12" = "The fastest-growing AWS service is Amazon SageMaker, used for Machine Learning."
    "13" = "The word 'cloud' became popular in the 1990s as a metaphor for the internet."
    "14" = "AWS Lambda can automatically scale from zero to thousands of requests per second."
    "15" = "More data is stored in the cloud today than in all personal computers combined."
    "16" = "AWS offers a free tier that includes 12 months of free access to many services."
  }
}

# Create DynamoDB Table (Terraform)
resource "aws_dynamodb_table" "cloud_facts" {
  name         = "CloudFacts"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "FactID"

  attribute {
    name = "FactID"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }

  tags = {
    Name        = "CloudFacts-Database"
    Component   = "Data-Layer"
    Environment = "dev"
  }
}

# Create one DynamoDB item resource using for_each
resource "aws_dynamodb_table_item" "cloud_facts" {
  for_each = local.cloud_facts

  table_name = aws_dynamodb_table.cloud_facts.name
  hash_key   = aws_dynamodb_table.cloud_facts.hash_key

  item = jsonencode({
    FactID   = { S = each.key }
    FactText = { S = each.value }
  })
}

# Update Lambda IAM Role (Least Privilege) Attach DynamoDB Read-Only Policy
resource "aws_iam_role_policy_attachment" "lambda_dynamodb_read" {
  role       = var.lambda_role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"
}
