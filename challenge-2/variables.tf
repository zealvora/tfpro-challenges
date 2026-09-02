
variable "environment" {
  type = string
}

variable "s3_buckets" {
    type = set(string)
}

variable "s3_base_object" {}

variable "org-name" {}

variable "region" {}

variable "sg_name" {}