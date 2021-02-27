variable "vsphere_server" {
  description = "The vSphere server."
  default     = "example.calenglab.org.com"
}

variable "vsphere_user" {
  description = "vSphere user name."
  default     = "administrator@vsphere.local"
}

variable "vsphere_password" {
  description = "vSphere user password."
  default     = "VspherePassword"
}

variable "datacenter" {
  description = "vSphere datacenter name."
  default     = "dc"
}

variable "datastore" {
  description = "vSphere datastore name."
  default     = "ds"
}

variable "compute_cluster" {
  description = "vSphere Cluster name into which resources will be created."
  default     = "cluster1"
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
  default     = "Host Network"
}

variable "data_plane_network" {
  description = "Data network name."
  default     = "Test Network"
}