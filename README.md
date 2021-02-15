# Run STCv traffic generator instances with public and test networks. Instances can be controlled by the Spirent TestCenter application.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| vsphere | 1.24.3 |

## Providers

| Name | Version |
|------|---------|
| vsphere | 1.24.3 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| data\_plane\_network\_id | Test or data plane network ID. | `string` | `""` | no |
| datacenter\_id | vSphere datacenter ID. | `string` | `""` | no |
| datastore\_id | vSphere datastore ID. | `string` | `""` | no |
| instance\_count | Number of STCv instances to create. | `number` | `2` | no |
| instance\_name | Name assigned to the instance.  An instance number will be appended to the name. | `string` | `"STCv"` | no |
| memory | The size of the virtual machine's memory, in MB. | `number` | `"1024"` | no |
| mgmt\_plane\_network\_id | Management network ID. | `string` | `""` | no |
| num\_cpus | The total number of virtual processor cores to assign to STCv virtual machine | `number` | `"2"` | no |
| resource\_pool\_id | vSphere resource pool ID. | `string` | `""` | no |
| template\_name | Name of the template created from the OVA | `string` | `""` | no |
| vsphere\_compute\_cluster | The vSphere Cluster into which resources will be created. | `string` | `""` | no |
| vsphere\_datacenter | The name of the vSphere Datacenter into which resources will be created. | `string` | `""` | no |
| vsphere\_datastore | The vSphere Datastore into which resources will be created. | `string` | `""` | no |
| vsphere\_host | Host name on the vSphere server. | `string` | `""` | no |
| vsphere\_password | The password for the current vSphere user. | `string` | `""` | no |
| vsphere\_server | The vSphere server. | `string` | `""` | no |
| vsphere\_user | The user to access vSphere. | `string` | `""` | no |
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
| netmask | IPv4 netmask (static mode) | IPv4 netmaks | -
| gwaddress | IPv4 gateway address (static mode) | IPv4 gateway address | -
| ipv6mode | IPv6 address mode | none, static, dhcp | none
| ipv6address | IPv4 address (static mode) | IPv4 address | -
| ipv6prefixlen | IPv6 prefix length (static mode) | IPv4 netmaks | -
| ipv6gwaddress | IPv4 gateway address (static mode) | IPv6 gateway address | -
| gvtap | Turn Gigamon gvtap agent on or off| off, on | off
