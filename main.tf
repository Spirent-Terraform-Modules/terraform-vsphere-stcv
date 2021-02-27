data "vsphere_datacenter" "stcv" {
  name = var.datacenter
}

data "vsphere_datastore" "stcv" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.stcv.id
}

data "vsphere_virtual_machine" "template_stcv" {
  name          = var.template_name
  datacenter_id = data.vsphere_datacenter.stcv.id
}

resource "vsphere_virtual_machine" "stcv" {
  count               = var.instance_count
  name                = "${var.instance_name}-${count.index}"
  num_cpus            = var.num_cpus
  memory              = var.memory

  resource_pool_id    = var.resource_pool_id
  datastore_id        = data.vsphere_datastore.stcv.id
  guest_id            = data.vsphere_virtual_machine.template_stcv.guest_id
  scsi_type           = data.vsphere_virtual_machine.template_stcv.scsi_type

  network_interface {
    network_id        = var.mgmt_plane_network_id
    adapter_type      = data.vsphere_virtual_machine.template_stcv.network_interface_types[0]
  }
  network_interface {
    network_id        = var.data_plane_network_id
    adapter_type      = data.vsphere_virtual_machine.template_stcv.network_interface_types[0]
  }
  disk {
    name              = "${var.instance_name}.vmdk"
    size              = data.vsphere_virtual_machine.template_stcv.disks.0.size
    thin_provisioned  = data.vsphere_virtual_machine.template_stcv.disks.0.thin_provisioned
  }
  clone {
    template_uuid     = data.vsphere_virtual_machine.template_stcv.id
  }

  extra_config = {
    "guestinfo.userdata"          = base64encode(file(var.user_data_file))
    "guestinfo.userdata.encoding" = "base64"
  }
}