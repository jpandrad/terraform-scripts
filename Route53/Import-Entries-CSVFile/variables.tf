variable "awsRegion" {
    type = string
    description = "AWS Default Region"
    default = "<YOUR_AWS_REGION>"
}

variable "route53_zoneid" {
    type = string
    description = "Route 53 Zone ID"
    default = "<YOUR_HOSTED_ZONE_ID>"
}

locals {
    entries_csv = csvdecode(file("entries.csv"))
}