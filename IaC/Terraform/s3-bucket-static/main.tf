// Configura o provedor AWS e define a região
provider "aws" {
    region = "sa-east-1"
}

// Declara a variável para o nome do bucket
variable "bucket_name" {
    type = string
}

// Define o recurso do bucket S3 para o site estático
resource "aws_s3_bucket" "static_site_bucket" {
    bucket = "static-site-${var.bucket_name}"
    
    // Configura o bucket para hospedar um site estático
    website {
        index_document = "index.html"
        error_document = "404.html"
    }

    // Adiciona tags ao bucket
    tags = {
        Name = "Static Site Bucket"
        Enviroment = "Production"
    }
}

// Configura as políticas de acesso público do bucket S3
resource "aws_s3_bucket_public_access_block" "static_site_bucket" {
    bucket = aws_s3_bucket.static_site_bucket.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

// Define a ACL do bucket S3 para permitir acesso público de leitura
resource "aws_s3_bucket_acl" "static_site_bucket" {
    depends_on = [
        aws_s3_bucket_public_access_block.static_site_bucket,
        aws_s3_bucket_ownership_controls.static_site_bucket,
    ]

    bucket = aws_s3_bucket.static_site_bucket.id
    acl    = "public-read"
}