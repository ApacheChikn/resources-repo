variable "bucket-name1" {
  description = "the name for bucket 1"
  type        = string
  default     = "apachechikn-bucket"
}

variable "bucket-name2" {
  description = "the name for bucket 2"
  type        = string
  default     = "kamikazechikn-bucket"
}

variable "bucket-name3" {
  description = "the name for bucket 3"
  type        = string
  default     = "super-natural_devops_engineer"
}

variable "bucket-name4" {
  description = "the name for bucket 4"
  type        = string
  default     = "project-state-bucket-102"
}

variable "vm-name" {
  description = "The name of my vm"
  type        = string
  default     = "feltmate-test-server-99"
}

variable "machine-type" {
  description = "The machine type to use when creating the vm"
  type        = string
  default     = "e2-medium"
}

variable "zone" {
  description = "Where our resource(s) will be created"
  type        = string
  default     = "us-central1-a"
}
