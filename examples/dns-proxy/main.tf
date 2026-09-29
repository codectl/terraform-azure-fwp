module "naming" {
  source  = "codectl/naming/azure"
  version = "~> 0.1"

  suffix = ["demo", "dev"]
}

module "regions" {
  source  = "codectl/locations/azure"
  version = "~> 1.0"

  location = {
    primary = "westeurope"
  }
}

module "rg" {
  source  = "codectl/rg/azure"
  version = "~> 1.0"

  groups = {
    demo = {
      name     = module.naming.resource_group.name_unique
      location = module.regions.location.primary.name
    }
  }
}

module "fw_policy" {
  source  = "codectl/fwp/azure"
  version = "~> 1.0"

  firewall_policy = {
    name                = module.naming.firewall_policy.name
    resource_group_name = module.rg.groups.demo.name
    location            = module.rg.groups.demo.location
    sku                 = "Standard"

    private_ip_ranges                 = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
    auto_learn_private_ranges_enabled = false

    dns = {
      proxy_enabled = true
      servers       = ["10.0.0.4", "10.0.0.5"]
    }
  }
}
