resource "aws_s3_bucket" "test" {
  bucket = "aka-terraform-test-${random_id.id.hex}"
}

resource "random_id" "id" {
  byte_length = 4
}
