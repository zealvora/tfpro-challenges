
variable "environment" {
  type = number
}

variable "s3_buckets" {
    type = list(strings)
}

variable "s3_base_object" {}

variable "org-name" {}

variable "region" {}