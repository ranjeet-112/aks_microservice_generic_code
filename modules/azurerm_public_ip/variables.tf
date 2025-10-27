variable "public_ips" {
  description = "A map of public IP configurations"
  type = map(object({
	name                = string
	resource_group_name = string
	location            = string
	allocation_method   = string
	sku                 = string
	tags                = map(string)
  }))
}

variable "public_ip_tags" {
  description = "A map of tags to assign to the public IPs"
  type        = map(string)
  default     = {}
}