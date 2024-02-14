#------------------------------
##### variables for cloud #####
#------------------------------ 

variable "yc_token_id" {
 type = string
}

variable "yc_cloud_id" {
  type        = string
  description = "Cloud ID"
}

variable "yc_folder_id" {
  type        = string
  description = "Folder ID"
}

variable "yc_zone" {
  type        = string
  description = "Name cloud zone"
}

variable "ssh_key" {
  type        = string
  description = "ssh public key"
}

variable "nat_image_id" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
}

#----------------------------
##### variables for VMs #####
#----------------------------
#variable "platform_id" {
#  type        = string
#  description = "platform_id"
#}

variable "custom_vms" {
  description = "Create VMs"
  type = list(object(
    {
      name        = string
      ip_address  = string
      nat         = optional(bool)
    })
  )
  default = [
    { name = "private-vm", ip_address = "192.168.20.254" },
    { name = "public-vm", ip_address = "192.168.10.254", nat = true },
  ]
}

#-----------------------------------
###### variables for networks ######
#-----------------------------------

variable "subnet-zones" {
  type    = list(string)
  default = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
}

variable "cidr" {
  type    = map(list(string))
  default = {
    stage = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]    
  }
}
