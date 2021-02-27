variable "instance_name" {
  description = "Name assigned to the instance.  An instance number will be appended to the name."
  type        = string
  default     = "STCv"
}

variable "instance_count" {
  description = "Number of STCv instances to create."
  type        = number
  default     = 2
}

variable "num_cpus" {
  description = "The total number of virtual processor cores to assign to STCv virtual machine"
  type        = number
  default     = "2"
}

variable "memory" {
  description = "The size of the virtual machine's memory, in MB."
  type        = number
  default     = "1024"
}

variable "template_name" {
  description = "Name of the template created from the OVA"
  type        = string
}

variable "datacenter" {
  description = "vSphere datacenter name"
  type        = string
}

variable "datastore" {
  description = "vSphere datastore name"
  type        = string
}

variable "resource_pool_id" {
  description = "vSphere resource pool ID"
  type        = string
}

variable "mgmt_plane_network_id" {
  description = "Management network ID"
  type        = string
}

variable "data_plane_network_id" {
  description = "Test or data plane network ID."
  type        = string
}

variable "user_data_file" {
  description = "Path to the file containing user data for the instance. See README for Spirent TestCenter Virtual cloud-init configuration parameters that are supported."
  type        = string
}