variable "vsphere_server" {
  description = "The vSphere server."
  type        = string
  default     = ""
}

variable "vsphere_user" {
  description = "The user to access vSphere."
  type        = string
  default     = ""
}

variable "vsphere_password" {
  description = "The password for the current vSphere user."
  type        = string
  default     = ""
}

variable "vsphere_datacenter" {
  description = "The name of the vSphere Datacenter into which resources will be created."
  type        = string
  default     = ""
}

variable "vsphere_datastore" {
  description = "The name of the vSphere Datastore into which resources will be created."
  type        = string
  default     = ""
}

variable "vsphere_host" {
  description = "Host name on the vSphere server."
  type        = string
  default     = ""
}

variable "vsphere_compute_cluster" {
  description = "The vSphere Cluster into which resources will be created."
  type        = string
  default     = ""
}

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
  default     = ""
}

variable "datacenter_id" {
  description = "vSphere datacenter ID."
  type        = string
  default     = ""
}

variable "datastore_id" {
  description = "vSphere datastore ID."
  type        = string
  default     = ""
}

variable "resource_pool_id" {
  description = "vSphere resource pool ID."
  type        = string
  default     = ""
}

variable "mgmt_plane_network_id" {
  description = "Management network ID."
  type        = string
  default     = ""
}

variable "data_plane_network_id" {
  description = "Test or data plane network ID."
  type        = string
  default     = ""
}