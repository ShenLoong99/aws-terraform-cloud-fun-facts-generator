# Create S3 Bucket for Frontend
resource "aws_s3_bucket" "frontend_bucket" {
  bucket        = "cloud-fun-facts-frontend-${random_id.bucket_id.hex}"
  force_destroy = true # optional: auto-delete objects on destroy

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

    # Example 2: If you enabled versioning, delete non-current versions after 7 days
    noncurrent_version_expiration {
      noncurrent_days = 7
    }
  }
}

# Add the S3 Bucket Policy
resource "aws_s3_bucket_policy" "frontend_bucket_policy" {
  bucket = aws_s3_bucket.frontend_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipalReadOnly"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.frontend_bucket.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.frontend_cdn.arn
          }
        }
      }
    ]
  })
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
