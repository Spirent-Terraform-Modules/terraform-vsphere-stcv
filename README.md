# Run STCv traffic generator instances with public and test networks. Instances can be controlled by the Spirent TestCenter application.
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

## Outputs

| Name | Description |
|------|-------------|
| instance\_default\_ips | List of default IP addresses assigned to the instances, if applicable. |
| instance\_guest\_ips | List of guest IP addresses assigned to the instances, if applicable. |
| instance\_uuids | List of UUIDs assigned to the instances. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
