# Variables

variable "ya_token" {
  type = string
}

variable "ya_cloud_id" {
  type = string
}

variable "ya_folder_id" {
  type = string
}

variable "ya_region" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
  default = "1.15"
}

variable "cluster_release_channel" {
  type = string
  default = "STABLE"
}

variable "network_policy_provider" {
  type = string
  default = "CALICO"
}
