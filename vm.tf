  resource "azurerm_virtual_machine" "vmone" {
    name                  = "vmone"
    location              = "${azurerm_resource_group.rgmgmt.location}"
    resource_group_name   = "${azurerm_resource_group.rgmgmt.name}"
    network_interface_ids = ["${azurerm_network_interface.vmone-nic1.id}"]
    vm_size               = "Standard_DS1_v2"
  
  storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "7.2"
    version   = "7.2.2017090716"

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
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBnPLyd7zNmso5Y6k1vMSGEPy1pVhlg1yAOylNKRpi1GtAKjGIv5QTcmaBOspGxFN/JC6P6HYJvRuBQxgNXvLZMJwEBKAQaLY11xvmSY0hhzij5zNMfQKiY5U3HMFKfuvc/KNlArF90zFM03sky/YQeMhKXzuWErMST5NnZV7BvkRSKjDjZRV6A4s2F2snfN8Zz6PKjZB2v+Ce29BBn1z1YHJjK9j/yPIjzq+DatAcHF8pt6VGtKnGJyykij0paxKTTTieZYR6EAajdwP9lW7y1/eP7ExMfGNwFi9FUPlJ1Q6jpfsh9zN7f8q4GGBv5FieUuQdP5uIEueLwfnXAAFx kim0@kimo.local"
    }
  }
  
}

resource "azurerm_network_interface" "vmone-nic1" {
  name                = "vmone-nic1"
  location            = "${azurerm_resource_group.rgmgmt.location}"
  resource_group_name = "${azurerm_resource_group.rgmgmt.name}"

  ip_configuration {
    name                          = "vmoneipcfg1"
    subnet_id                     = "${azurerm_subnet.mgmtsbnt.id}"
    private_ip_address_allocation = "dynamic"
}
}

resource "azurerm_managed_disk" "vmone-disk1" {
  name                 = "vmone-disk1"
  location             = "${azurerm_resource_group.rgmgmt.location}"
  resource_group_name  = "${azurerm_resource_group.rgmgmt.name}"
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
  location             = "${azurerm_resource_group.rgmgmt.location}"
  resource_group_name  = "${azurerm_resource_group.rgmgmt.name}"
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
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "7.2"
    version   = "7.2.2017090716"

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
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBnPLyd7zNmso5Y6k1vMSGEPy1pVhlg1yAOylNKRpi1GtAKjGIv5QTcmaBOspGxFN/JC6P6HYJvRuBQxgNXvLZMJwEBKAQaLY11xvmSY0hhzij5zNMfQKiY5U3HMFKfuvc/KNlArF90zFM03sky/YQeMhKXzuWErMST5NnZV7BvkRSKjDjZRV6A4s2F2snfN8Zz6PKjZB2v+Ce29BBn1z1YHJjK9j/yPIjzq+DatAcHF8pt6VGtKnGJyykij0paxKTTTieZYR6EAajdwP9lW7y1/eP7ExMfGNwFi9FUPlJ1Q6jpfsh9zN7f8q4GGBv5FieUuQdP5uIEueLwfnXAAFx kim0@kimo.local"
    }
  }
  
}

resource "azurerm_network_interface" "vmtwo-nic1" {
  name                = "vmtwo-nic1"
  location            = "${azurerm_resource_group.rgtwo.location}"
  resource_group_name = "${azurerm_resource_group.rgtwo.name}"

  ip_configuration {
    name                          = "vmtwoipcfg1"
    subnet_id                     = "${azurerm_subnet.mgmtsbnt.id}"
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
  resource "azurerm_virtual_machine" "dc01" {
    name                  = "dc01"
    location              = "${azurerm_resource_group.rgmgmt.location}"
    resource_group_name   = "${azurerm_resource_group.rgmgmt.name}"
    network_interface_ids = ["${azurerm_network_interface.dc01-nic1.id}"]
    vm_size               = "Standard_DS1_v2"
  
  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"

  }
  storage_os_disk {
    name              = "dc01-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }
  os_profile {
    computer_name  = "dc01"
    admin_username = "c9admin"
    admin_password = "C9superC0mpl3x"
  }
    os_profile_windows_config {
    provision_vm_agent = true
    enable_automatic_upgrades = true
  }
  
}

resource "azurerm_network_interface" "dc01-nic1" {
  name                = "dc01-nic1"
  location            = "${azurerm_resource_group.rgmgmt.location}"
  resource_group_name = "${azurerm_resource_group.rgmgmt.name}"

  ip_configuration {
    name                          = "dc01ipcfg1"
    subnet_id                     = "${azurerm_subnet.mgmtsbnt.id}"
    private_ip_address_allocation = "static"
    private_ip_address = "10.0.1.10"
}
}

  resource "azurerm_virtual_machine" "dc02" {
    name                  = "dc02"
    location              = "${azurerm_resource_group.rgmgmt.location}"
    resource_group_name   = "${azurerm_resource_group.rgmgmt.name}"
    network_interface_ids = ["${azurerm_network_interface.dc02-nic1.id}"]
    vm_size               = "Standard_DS1_v2"
  
  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"

  }
  storage_os_disk {
    name              = "dc02-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }
  os_profile {
    computer_name  = "dc02"
    admin_username = "c9admin"
    admin_password = "C9superC0mpl3x"
  }
    os_profile_windows_config {
    provision_vm_agent = true
    enable_automatic_upgrades = true
  }
  
}

resource "azurerm_network_interface" "dc02-nic1" {
  name                = "dc02-nic1"
  location            = "${azurerm_resource_group.rgmgmt.location}"
  resource_group_name = "${azurerm_resource_group.rgmgmt.name}"

  ip_configuration {
    name                          = "dc02ipcfg1"
    subnet_id                     = "${azurerm_subnet.mgmtsbnt.id}"
    private_ip_address_allocation = "static"
    private_ip_address = "10.0.1.11"
}
}

