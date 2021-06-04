provider "aws" {
  region = var.aws_region
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "../Python/index.py"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "this" {
  function_name    = "SUP2VINCI-demo"
	s3_bucket				 = aws_s3_bucket.this.bucket
	s3_key					 = "lambda_function.zip"
  role             = aws_iam_role.this.arn
  handler          = "index.handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = var.runtime
}

resource "aws_s3_bucket" "this" {
  bucket = "sup2vincicode"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Lambda-SUP2VINCI"
  }
}

resource "aws_s3_bucket_object" "file_upload" {
  bucket = aws_s3_bucket.this.bucket
  key    = "lambda_function.zip"
  source = "${path.module}/lambda_function.zip"
  etag   = filemd5("${path.module}/lambda_function.zip")
}

resource "aws_iam_role" "this" {
  name = "SUP2VINCI-demo"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
