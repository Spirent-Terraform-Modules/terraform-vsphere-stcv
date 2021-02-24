variable "vsphere_server" {
  description = "The vSphere server."
  default     = "virttest-vc.calenglab.spirentcom.com"
}

variable "vsphere_user" {
  description = "vSphere user name."
  default     = "administrator@vsphere.local"
}

variable "vsphere_password" {
  description = "vSphere user password."
  default     = "Sp!rent01"
}

variable "datacenter" {
  description = "vSphere datacenter name."
  default     = "Benchmarking"
}

variable "datastore" {
  description = "vSphere datastore name."
  default     = "VirtTest-05.local"
}

variable "compute_cluster" {
  description = "vSphere Cluster name into which resources will be created."
  default     = "Testing"
}

variable "instance_count" {
  description = "Number of STCv instances to create."
  type        = number
  default     = 2
}

variable "num_cpus" {
  description = "The total number of virtual processor cores to assign to STCv virtual machine."
  default     = "2"
}

variable "memory" {
  description = "The size of the virtual machine's memory, in MB."
  default     = "1024"
}

variable "template_name" {
  description = "Name of the template created from the OVA."
  default     = "template_from_ovf"
}

variable "mgmt_plane_network" {
  description = "Management network name."
  default     = "Host Network - A1"
}

variable "data_plane_network" {
  description = "Data network name."
  default     = "OSE_Testing"
}