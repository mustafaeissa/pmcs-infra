resource "azurerm_virtual_machine" "vmone" {
  name                  = "vmone"
  location              = "${azurerm_resource_group.rgone.location}"
  resource_group_name   = "${azurerm_resource_group.rgone.name}"
  network_interface_ids = ["${azurerm_network_interface.vmone-nic1.id}"]
  vm_size               = "Standard_DS1_v2"
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"

  }
  storage_os_disk {
    name              = "vmone-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }
  os_profile {
    computer_name  = "vmone"
    admin_username = "c9admin"
    admin_password = "C9superC0mpl3x"
  }
  os_profile_linux_config {
    disable_password_authentication = false
    ssh_keys {
      path     = "/home/c9admin/.ssh/authorized_keys"
      key_data = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBlS0XJITBaLXiN3UTiKlMPjY9i/fOOpb3TEnIs+M4oI kim0@Kamal-MBP-7.local"
    }
  }

}

resource "azurerm_network_interface" "vmone-nic1" {
  name                = "vmone-nic1"
  location            = "${azurerm_resource_group.rgone.location}"
  resource_group_name = "${azurerm_resource_group.rgone.name}"

  ip_configuration {
    name                          = "vmoneipcfg1"
    subnet_id                     = "${azurerm_subnet.mgmt.id}"
    private_ip_address_allocation = "dynamic"
  }
}


resource "azurerm_managed_disk" "vmone-disk1" {
  name                 = "vmone-disk1"
  location             = "${azurerm_resource_group.rgone.location}"
  resource_group_name  = "${azurerm_resource_group.rgone.name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "vmone-disk1" {
  managed_disk_id    = "${azurerm_managed_disk.vmone-disk1.id}"
  virtual_machine_id = "${azurerm_virtual_machine.vmone.id}"
  lun                = "1"
  caching            = "ReadWrite"
}


resource "azurerm_managed_disk" "vmone-disk2" {
  name                 = "vmone-disk2"
  location             = "${azurerm_resource_group.rgone.location}"
  resource_group_name  = "${azurerm_resource_group.rgone.name}"
  storage_account_type = "StandardSSD_LRS"
  create_option        = "Empty"
  disk_size_gb         = 20
}

resource "azurerm_virtual_machine_data_disk_attachment" "vmone-disk2" {
  managed_disk_id    = "${azurerm_managed_disk.vmone-disk2.id}"
  virtual_machine_id = "${azurerm_virtual_machine.vmone.id}"
  lun                = "2"
  caching            = "ReadWrite"
}


resource "azurerm_virtual_machine" "vmtwo" {
  name                  = "vmtwo"
  location              = "${azurerm_resource_group.rgtwo.location}"
  resource_group_name   = "${azurerm_resource_group.rgtwo.name}"
  network_interface_ids = ["${azurerm_network_interface.vmtwo-nic1.id}"]
  vm_size               = "Standard_DS1_v2"
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"

  }
  storage_os_disk {
    name              = "vmtwo-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }
  os_profile {
    computer_name  = "vmtwo"
    admin_username = "c9admin"
    admin_password = "C9superC0mpl3x"
  }
  os_profile_linux_config {
    disable_password_authentication = false
    ssh_keys {
      path     = "/home/c9admin/.ssh/authorized_keys"
      key_data = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBlS0XJITBaLXiN3UTiKlMPjY9i/fOOpb3TEnIs+M4oI kim0@Kamal-MBP-7.local"
    }
  }

}

resource "azurerm_network_interface" "vmtwo-nic1" {
  name                = "vmtwo-nic1"
  location            = "${azurerm_resource_group.rgtwo.location}"
  resource_group_name = "${azurerm_resource_group.rgtwo.name}"

  ip_configuration {
    name                          = "vmtwoipcfg1"
    subnet_id                     = "${azurerm_subnet.mgmt.id}"
    private_ip_address_allocation = "dynamic"
  }
}


resource "azurerm_managed_disk" "vmtwo-disk1" {
  name                 = "vmtwo-disk1"
  location             = "${azurerm_resource_group.rgtwo.location}"
  resource_group_name  = "${azurerm_resource_group.rgtwo.name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 30
}

resource "azurerm_virtual_machine_data_disk_attachment" "vmtwo-disk1" {
  managed_disk_id    = "${azurerm_managed_disk.vmtwo-disk1.id}"
  virtual_machine_id = "${azurerm_virtual_machine.vmtwo.id}"
  lun                = "1"
  caching            = "ReadWrite"
}


