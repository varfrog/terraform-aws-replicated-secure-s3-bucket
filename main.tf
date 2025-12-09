data "aws_caller_identity" "a" {
  provider = aws.a
}
data "aws_caller_identity" "b" {
  provider = aws.b
}
data "aws_region" "a" {
  provider = aws.a
}
data "aws_region" "b" {
  provider = aws.b
}

locals {
  region_a = var.region_a == null ? data.aws_region.a.region : var.region_a
  region_b = var.region_b == null ? data.aws_region.b.region : var.region_b
}
