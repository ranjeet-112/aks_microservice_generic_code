variable "rgs" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "rg_tags" {
  description = "Common tags for all resource groups"
  type        = map(string)
  default     = {}
}