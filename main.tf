data "vsphere_virtual_machine" "template_stcv" {
  name          = var.template_name
  datacenter_id = var.datacenter_id
}

resource "vsphere_virtual_machine" "stcv" {
  count               = var.instance_count
  name                = "${var.instance_name}${count.index}"
  resource_pool_id    = var.resource_pool_id
  datastore_id        = var.datastore_id
  num_cpus            = var.num_cpus
  memory              = var.memory
  guest_id            = data.vsphere_virtual_machine.template_stcv.guest_id
  scsi_type           = data.vsphere_virtual_machine.template_stcv.scsi_type
  network_interface {
    network_id        = var.mgmt_plane_network_id
    #adapter_type = data.vsphere_virtual_machine.template_stcv.network_interface_types[0]
  }
  network_interface {
    network_id        = var.data_plane_network_id
    #adapter_type = data.vsphere_virtual_machine.template_stcv.network_interface_types[0]
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
    "guestinfo.userdata"          = base64encode(file("${path.module}/templates/userdata.yaml"))
    "guestinfo.userdata.encoding" = "base64"
  }
}