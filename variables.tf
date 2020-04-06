variable "instance_count" {
  default = 1
}

variable "key_name" {
  description = "Private key name to use with instance"
  default     = "ktbcs-key"
}

variable "instance_type" {
  description = "AWS instance type"
  default     = "t2.large"
}

variable "ami" {
  description = "Base AMI to launch the instances"
  # Ubuntu 18.x AMI
  default = "ami-02c4c96e0a37b397f"
}

variable "subnet_id" {
  description = "Default vpc subnet"
  default = "subnet-e33cdb85"
}


