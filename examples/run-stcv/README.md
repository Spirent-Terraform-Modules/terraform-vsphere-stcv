## Description
This Terraform module deploys Spirent TestCenter Virtual Machines from a template created from the ova file.
The example requires the user to provide an already existing datacenter , datastore, network , OVF template details .
It deploys Spirent TestCenter Virtual traffic generator instances with public and test networks.
Instances can be controlled by the Spirent TestCenter application.

## Usage
To run this example you need to execute:

    $ terraform init
    $ terraform plan
    $ terraform apply

_Note: [Prerequisites](../../README.md#Prerequisites) are also required._

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

## Modules

| Name | Source | Version |
|------|--------|---------|
| stcv | ../.. |  |

## Resources

| Name |
|------|
| [vsphere_compute_cluster](https://registry.terraform.io/providers/hashicorp/vsphere/1.24.3/docs/data-sources/compute_cluster) |
| [vsphere_datacenter](https://registry.terraform.io/providers/hashicorp/vsphere/1.24.3/docs/data-sources/datacenter) |
| [vsphere_network](https://registry.terraform.io/providers/hashicorp/vsphere/1.24.3/docs/data-sources/network) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| compute\_cluster | vSphere Cluster name into which resources will be created. | `string` | `"cluster1"` | no |
| data\_plane\_network | Data network name. | `string` | `"Test Network"` | no |
| datacenter | vSphere datacenter name. | `string` | `"dc"` | no |
| datastore | vSphere datastore name. | `string` | `"ds"` | no |
| instance\_count | Number of STCv instances to create. | `number` | `2` | no |
| memory | The size of the virtual machine's memory, in MB. | `string` | `"1024"` | no |
| mgmt\_plane\_network | Management network name. | `string` | `"Host Network"` | no |
| num\_cpus | The total number of virtual processor cores to assign to STCv virtual machine. | `string` | `"2"` | no |
| template\_name | Name of the template created from the OVA. | `string` | `"template_from_ovf"` | no |
| vsphere\_password | vSphere user password. | `string` | `"VspherePassword"` | no |
| vsphere\_server | The vSphere server. | `string` | `"example.calenglab.org.com"` | no |
| vsphere\_user | vSphere user name. | `string` | `"administrator@vsphere.local"` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_default\_ips | List of default IP addresses assigned to the instances, if applicable. |
| instance\_guest\_ips | List of guest IP addresses assigned to the instances, if applicable. |
| instance\_uuids | List of UUIDs assigned to the instances. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
