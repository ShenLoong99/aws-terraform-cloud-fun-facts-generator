# Create S3 Bucket for Frontend
resource "aws_s3_bucket" "frontend_bucket" {
  bucket        = "cloud-fun-facts-frontend-${random_id.bucket_id.hex}"
  force_destroy = true

  tags = {
    Name      = "Frontend-Static-Assets"
    Component = "Frontend"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

# S3 Storage Lifecycle Policies
resource "aws_s3_bucket_lifecycle_configuration" "frontend_lifecycle" {
  bucket = aws_s3_bucket.frontend_bucket.id

  rule {
    id     = "cleanup-old-files"
    status = "Enabled"

    # This empty filter tells AWS the rule applies to the WHOLE bucket
    filter {}

    # Example 1: Permanently delete objects after 30 days
    expiration {
      days = 30
    }

    # Abort failed uploads after 7 days to save money
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }

    # Example 2: If you enabled versioning, delete non-current versions after 7 days
    noncurrent_version_expiration {
      noncurrent_days = 7
    }
  }
}

# Upload index.html
# Commented out to allow GitHub Actions to handle the upload with the correct API URL
# resource "aws_s3_object" "frontend_index" {
#   bucket       = aws_s3_bucket.frontend_bucket.id
#   key          = "index.html"
#   content_type = "text/html"

#   # Use templatefile to inject the API URL dynamically
#   content = templatefile("${path.module}/frontend/index.html", {
#     api_url = aws_apigatewayv2_stage.default.invoke_url
#   })

#   # This forces a re-upload if the content changes
#   etag = md5(templatefile("${path.module}/frontend/index.html", {
#     api_url = aws_apigatewayv2_stage.default.invoke_url
#   }))
# }

# Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "versioning_frontend_bucket" {
  bucket = aws_s3_bucket.frontend_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.frontend_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block all public access to the bucket
resource "aws_s3_bucket_public_access_block" "frontend_bucket_access" {
  bucket = aws_s3_bucket.frontend_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
