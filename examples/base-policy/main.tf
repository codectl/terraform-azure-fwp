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

module "parent_policy" {
  source  = "codectl/fwp/azure"
  version = "~> 1.0"

  firewall_policy = {
    name                     = "${module.naming.firewall_policy.name}-parent"
    resource_group_name      = module.rg.groups.demo.name
    location                 = module.rg.groups.demo.location
    sku                      = "Standard"
    threat_intelligence_mode = "Alert"
  }
}

module "child_policy" {
  source  = "codectl/fwp/azure"
  version = "~> 1.0"

  firewall_policy = {
    name                     = "${module.naming.firewall_policy.name}-child"
    resource_group_name      = module.rg.groups.demo.name
    location                 = module.rg.groups.demo.location
    sku                      = "Standard"
    base_policy_id           = module.parent_policy.firewall_policy.id
    threat_intelligence_mode = "Deny"
  }
}
