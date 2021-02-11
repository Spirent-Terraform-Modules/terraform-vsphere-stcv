## Description
This Terraform module deploys Spirent TestCenter Virtual Machines from a template created from the ova file.
The example requires the user to provide an already existing datacenter , datastore, network , OVF template details .
It deploys Spirent TestCenter Virtual traffic generator instances with public and test networks.
Instances can be controlled by the Spirent TestCenter application.

User needs to use vSphere CLI (govc) to create a template from the STCv ova image , as shown in below example providing the datacenter, datastore and ova file:
1. govc import.ova -dc=example-dc -ds=example-01.local -name=template_from_ovf Spirent_TestCenter_Virtual_ESX_x.xx.xxxx.ova
2. govc vm.markastemplate -dc=example-dc template_from_ovf

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| vsphere | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| instance\_count | Number of STCv instances to create. | `number` | `2` | no |
| memory | The size of the virtual machine's memory, in MB. | `string` | `"1024"` | no |
| mgmt\_plane\_subnet\_id | Management network ID. | `string` | `""` | no |
| num\_cpus | The total number of virtual processor cores to assign to STCv virtual machine | `string` | `"2"` | no |
| template\_name | Name of the template created from the OVF or OVA | `string` | `"template_from_ovf"` | no |
| test\_plane\_subnet\_id | Test or data plane network ID. | `string` | `""` | no |
| vsphere\_compute\_cluster | The vSphere Cluster into which resources will be created. | `string` | `"example-cluster"` | no |
| vsphere\_datacenter | The name of the vSphere Datacenter into which resources will be created. | `string` | `"example-dc"` | no |
| vsphere\_datastore | The vSphere Datastore into which resources will be created. | `string` | `"example-01.local"` | no |
| vsphere\_host | Host name on the vSphere server. | `string` | `"example-vc.testlab.org.com"` | no |
| vsphere\_password | The password for the current vSphere user. | `string` | `"example"` | no |
| vsphere\_server | The vSphere server. | `string` | `"example-vc.testlab.org.com"` | no |
| vsphere\_user | The user to access vSphere. | `string` | `"example@vsphere.local"` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_default\_ips | List of default IP addresses assigned to the instances, if applicable. |
| instance\_guest\_ips | List of guest IP addresses assigned to the instances, if applicable. |
| instance\_uuids | List of UUIDs assigned to the instances. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
