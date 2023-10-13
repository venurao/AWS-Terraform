variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
}
variable "instance_tenancy" {
  type = string
  default = "default"
}

variable "enable_dns_hostnames" {
  type = bool
 default = true 
}

variable "enable_dns_support" {
  type = bool
  default = true
}

variable "tags" {
    type = map(string)
    default = {
      "Name" = "Timing-vpc"
      "Terraform"="true"
      "Environment"="Dev"
   }
  
}

variable "postgress_port" {
  type = number
  default = 5432
}

variable "cidr_list" {

    type = list
    default = ["10.0.1.0/24","10.0.2.0/24"]
  
}

variable "instance_names" {
  
  type = list
  default = ["web-server","api-server","db-server"]

}

#Condition
variable "isProd" {
  type = bool
  default = true
  
}