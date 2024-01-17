terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.16"
        }
    }
    required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.awsRegion
}

resource "aws_route53_record" "entries" {
    for_each = { for asset in local.entries_csv : asset.entry => asset }
    zone_id = var.route53_zoneid
    name    = each.value.entry
    type    = each.value.type
    ttl     = 300
    records = [each.value.data]
}