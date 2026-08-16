rgs = {
  rg1 = {
    name     = "rg-aedp-preprod"
    location = "centralindia"
  }
  rg2 = {
    name     = "rg-aedp-preprod-2"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-aedp-preprod"
    location            = "centralindia"
    resource_group_name = "rg-aedp-preprod"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  snet1 = {
    name                 = "snet-aedp-preprod-frontend"
    resource_group_name  = "rg-aedp-preprod"
    virtual_network_name = "vnet-aedp-preprod"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    name                 = "snet-aedp-preprod-backend"
    resource_group_name  = "rg-aedp-preprod"
    virtual_network_name = "vnet-aedp-preprod"
    address_prefixes     = ["10.0.2.0/24"]
  }
  snet3 = {
    name                 = "snet-aedp-preprod-database"
    resource_group_name  = "rg-aedp-preprod"
    virtual_network_name = "vnet-aedp-preprod"
    address_prefixes     = ["10.0.3.0/24"]
  }
  snet4 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-aedp-preprod"
    virtual_network_name = "vnet-aedp-preprod"
    address_prefixes     = ["10.0.4.0/26"]
  }
  snet5 = {
    name                 = "AppGatewaySubnet"
    resource_group_name  = "rg-aedp-preprod"
    virtual_network_name = "vnet-aedp-preprod"
    address_prefixes     = ["10.0.5.0/24"]
  }
}

public_ips = {
  pip_bastion = {
    public_ip_name      = "pip-aedp-preprod-bastion"
    resource_group_name = "rg-aedp-preprod"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip_appgw = {
    public_ip_name      = "pip-aedp-preprod-appgw"
    resource_group_name = "rg-aedp-preprod"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

vms = {
  frontend_1 = {
    nic_name        = "frontend-vm-nic-1-dev"
    location        = "centralindia"
    rg_name         = "rg-aedp-preprod"
    nic_subnet_name = "snet-aedp-preprod-frontend"
    nic_vnet_name   = "vnet-aedp-preprod"
    vm_name         = "vm-aedp-preprod-frontend-01"
    vm_size         = "Standard_B1s"
    admin_username  = "devopsadmin"
    key_vault_name  = "kv-aedp-preprod-001"
    secret_name     = "admin-password"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
  frontend_2 = {
    nic_name        = "frontend-vm-nic-2-dev"
    location        = "centralindia"
    rg_name         = "rg-aedp-preprod"
    nic_subnet_name = "snet-aedp-preprod-frontend"
    nic_vnet_name   = "vnet-aedp-preprod"
    vm_name         = "vm-aedp-preprod-frontend-02"
    vm_size         = "Standard_B1s"
    admin_username  = "devopsadmin"
    key_vault_name  = "kv-aedp-preprod-001"
    secret_name     = "admin-password"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
  backend_1 = {
    nic_name        = "backend-vm-nic-1-dev"
    location        = "centralindia"
    rg_name         = "rg-aedp-preprod"
    nic_subnet_name = "snet-aedp-preprod-backend"
    nic_vnet_name   = "vnet-aedp-preprod"
    vm_name         = "vm-aedp-preprod-backend-01"
    vm_size         = "Standard_B1s"
    admin_username  = "devopsadmin"
    key_vault_name  = "kv-aedp-preprod-001"
    secret_name     = "admin-password"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
  backend_2 = {
    nic_name        = "backend-vm-nic-2-dev"
    location        = "centralindia"
    rg_name         = "rg-aedp-preprod"
    nic_subnet_name = "snet-aedp-preprod-backend"
    nic_vnet_name   = "vnet-aedp-preprod"
    vm_name         = "vm-aedp-preprod-backend-02"
    vm_size         = "Standard_B1s"
    admin_username  = "devopsadmin"
    key_vault_name  = "kv-aedp-preprod-001"
    secret_name     = "admin-password"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
  database_1 = {
    nic_name        = "database-vm-nic-dev"
    location        = "centralindia"
    rg_name         = "rg-aedp-preprod"
    nic_subnet_name = "snet-aedp-preprod-database"
    nic_vnet_name   = "vnet-aedp-preprod"
    vm_name         = "vm-aedp-preprod-database-01"
    vm_size         = "Standard_B2s"
    admin_username  = "devopsadmin"
    key_vault_name  = "kv-aedp-preprod-001"
    secret_name     = "admin-password"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
}

bastions = {
  bastion1 = {
    name           = "bas-aedp-preprod"
    location       = "centralindia"
    rg_name        = "rg-aedp-preprod"
    subnet_name    = "AzureBastionSubnet"
    vnet_name      = "vnet-aedp-preprod"
    public_ip_name = "pip-aedp-preprod-bastion"
  }
}

app_gateways = {
  appgw1 = {
    name           = "agw-aedp-preprod"
    location       = "centralindia"
    rg_name        = "rg-aedp-preprod"
    subnet_name    = "AppGatewaySubnet"
    vnet_name      = "vnet-aedp-preprod"
    public_ip_name = "pip-aedp-preprod-appgw"
  }
}

load_balancers = {
  lb1 = {
    name        = "lb-aedp-preprod-backend"
    location    = "centralindia"
    rg_name     = "rg-aedp-preprod"
    subnet_name = "snet-aedp-preprod-backend"
    vnet_name   = "vnet-aedp-preprod"
  }
}

key_vaults = {
  kv1 = {
    name        = "kv-aedp-preprod-001"
    location    = "centralindia"
    rg_name     = "rg-aedp-preprod"
    secret_name = "admin-password"
  }
}
