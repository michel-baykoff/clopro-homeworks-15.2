variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default = "b1gl64e88ikeen8dirm0"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default = "b1gp9jvqe20q1f94c6c3"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

#variable "rucentral1b" {
#  type        = string
#  default     = "ru-central1-b"
#  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
#}

variable "vpc_name" {
  type        = string
  default     = "netology"
  description = "VPC network"
}

variable "vpc_subnet_public" {
  type        = string
  default     = "public"
  description = "VPC network"
}

#variable "vpc_subnet_private" {
#  type        = string
#  default     = "private"
#  description = "VPC network"
#}

variable "vpc_subnet_public_cidr" {
  type        = list(string)
  default     = ["10.0.0.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

#variable "vpc_subnet_private_cidr" {
#  type        = list(string)
#  default     = ["192.168.20.0/24"]
#  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
#}

#variable "vm_public_image" {
#  type        = string
#  default     = "ubuntu-2004-lts"
#  description = "Image for VM"
#} 

variable "yandex_compute_instance_groupvms" {
  type        = list(object({
    name = string
    cores = number
    memory = number
    core_fraction = number
    platform_id = string
  }))

  default = [{
      name = "lamp-group"
      cores         = 2
      memory        = 2
      core_fraction = 100
      platform_id = "standard-v1"
    }]
}

variable "boot_disk" {
  type        = list(object({
    size = number
    type = string
    image_id = string
    }))
    default = [ {
    size = 20
    type = "network-hdd"
    image_id = "fd827b91d99psvq5fjit"
  }]
}

variable "vm_public_image_id" {
  type        = string
  default     = ""
  description = "Image for VM"
} 

variable "file_key" {
  type        = string
  default     = "cat_in_the_hat.jpg"
  description = "file name"
}

variable "file_source" {
   type        = string
  default     = "../../cat-in-the-hat.jpg"
  description = "file path"
}

locals {
  ssh-keys = file("~/.ssh/ed25519.pub")
  ssh-private-keys = file("~/.ssh/ed25519")
}

#Set bucket name as name plus date
locals {
    date = timestamp()
    cur_date = formatdate("DD-MM-YYYY", local.date)
    bucket_name = "baykovms-${local.cur_date}"
}
