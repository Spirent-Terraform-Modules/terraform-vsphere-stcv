variable "vsphere_server" {
  description = "The vSphere server."
  default     = "example-vc.testlab.org.com"
}

variable "vsphere_user" {
  description = "The user to access vSphere."
  default     = "example@vsphere.local"
}

variable "vsphere_password" {
  description = "The password for the current vSphere user."
  default     = "example"
}

variable "vsphere_datacenter" {
  description = "The name of the vSphere Datacenter into which resources will be created."
  default     = "example-dc"
}

variable "vsphere_datastore" {
  description = "The name of the vSphere Datastore into which resources will be created."
  default     = "example-01.local"
}

variable "vsphere_compute_cluster" {
  description = "The vSphere Cluster into which resources will be created."
  default     = "example-cluster"
}

variable "vsphere_host" {
  description = "Host name on the vSphere server."
  default     = "example-01.testlab.org.com"
}

variable "instance_count" {
  description = "Number of STCv instances to create."
  type        = number
  default     = 2
}

variable "num_cpus" {
  description = "The total number of virtual processor cores to assign to STCv virtual machine"
  default     = "2"
}

variable "memory" {
  description = "The size of the virtual machine's memory, in MB."
  default     = "1024"
}

variable "template_name" {
  description = "Name of the template created from the OVF or OVA"
  default     = "template_from_ovf"
}

variable "mgmt_plane_subnet_id" {
  description = "Management network ID."
  default     = ""
}

variable "test_plane_subnet_id" {
  description = "Test or data plane network ID."
  default     = ""
}