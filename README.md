# Spirent TestCenter Virtual Terraform

## Description
# Run STCv traffic generator instances with public and test networks. 

Instances can be controlled by the Spirent TestCenter application.

## Prerequisites

Prior to running Terraform the following must be completed:
1.  [Install govc](#install-govc)
2.  [Create STCv image vSphere Template](#create-stcv-image-vsphere-template)

### Install govc
[govc](https://github.com/vmware/govmomi/tree/master/govc) is a vSphere command line interface (CLI). Follow installation instructions [here](https://github.com/vmware/govmomi/tree/master/govc#Installation).

Set govc environmental variables specific to your vSphere: `GOVC_URL`, `GOVC_INSECURE`, `GOVC_USERNAME`, `GOVC_PASSWORD`

Verify vSphere list inventory works:
```
govc ls -l "*"
```

### Create STCv image vSphere Template
Create vSphere STCv template using the following commands:
```
1. govc import.ova -dc=example-dc -ds=example-01.local -name=template_from_ovf Spirent_TestCenter_Virtual_ESX_x.xx.xxxx.ova
2. govc vm.markastemplate -dc=example-dc template_from_ovf
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| vsphere | 1.24.3 |

## Providers

| Name | Version |
|------|---------|
| template | n/a |
| vsphere | 1.24.3 |

## Resources

| Name |
|------|
| [vsphere_datacenter](https://registry.terraform.io/providers/hashicorp/vsphere/1.24.3/docs/data-sources/datacenter) |
| [vsphere_datastore](https://registry.terraform.io/providers/hashicorp/vsphere/1.24.3/docs/data-sources/datastore) |
| [vsphere_virtual_machine](https://registry.terraform.io/providers/hashicorp/vsphere/1.24.3/docs/data-sources/virtual_machine) |
| [vsphere_virtual_machine](https://registry.terraform.io/providers/hashicorp/vsphere/1.24.3/docs/resources/virtual_machine) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| data\_plane\_network\_id | Test or data plane network ID. | `string` | n/a | yes |
| datacenter | vSphere datacenter name | `string` | n/a | yes |
| datastore | vSphere datastore name | `string` | n/a | yes |
| instance\_count | Number of STCv instances to create. | `number` | `2` | no |
| instance\_name | Name assigned to the instance.  An instance number will be appended to the name. | `string` | `"STCv"` | no |
| memory | The size of the virtual machine's memory, in MB. | `number` | `"1024"` | no |
| mgmt\_plane\_network\_id | Management network ID | `string` | n/a | yes |
| num\_cpus | The total number of virtual processor cores to assign to STCv virtual machine | `number` | `"2"` | no |
| resource\_pool\_id | vSphere resource pool ID | `string` | n/a | yes |
| template\_name | Name of the template created from the OVA | `string` | n/a | yes |
| user\_data\_file | Path to the file containing user data for the instance. See README for Spirent TestCenter Virtual cloud-init configuration parameters that are supported. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| instance\_default\_ips | List of default IP addresses assigned to the instances, if applicable. |
| instance\_guest\_ips | List of guest IP addresses assigned to the instances, if applicable. |
| instance\_uuids | List of UUIDs assigned to the instances. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## User Data (cloud-init)

### Example
```
#cloud-config
spirent:
  driver: dpdk
  speed: 10G
```

### Parameters

| Name | Description |  Type | Default
|------|-------------|-------------|-------------
| speed | Maximum network interface speed | 1G, 5G, 10G, 25G, 50G, 100G | 1G
| driver | Network driver interface | sockets, dpdk | dpdk (for supported cloud provider instances)
| rxq | RX queue size for dpdk driver | 1-N | 1
| benchmark | Turn benchmark rate mode on or off for dpdk driver| off, on | off
| ntp | NTP server | IP address | x.x.x.x (cloud provider recommended)
| ipv4mode | IPv4 address mode | none, static, dhcp | dhcp
| ipaddress | IPv4 address (static mode) | IPv4 address | -
| netmask | IPv4 netmask (static mode) | IPv4 netmask | -
| gwaddress | IPv4 gateway address (static mode) | IPv4 gateway address | -
| ipv6mode | IPv6 address mode | none, static, dhcp | none
| ipv6address | IPv6 address (static mode) | IPv6 address | -
| ipv6prefixlen | IPv6 prefix length (static mode) | IPv6 prefix length | -
| ipv6gwaddress | IPv6 gateway address (static mode) | IPv6 gateway address | -
| gvtap | Turn Gigamon gvtap agent on or off| off, on | off
