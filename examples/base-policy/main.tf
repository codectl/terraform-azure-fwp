module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.32"

  suffix = ["demo", "dev"]
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 3.0"

  groups = {
    demo = {
      name     = module.naming.resource_group.name_unique
      location = "westeurope"
    }
  }
}

module "parent_policy" {
  source  = "cloudnationhq/fwp/azure"
  version = "~> 5.0"

  firewall_policy = {
    name                     = "${module.naming.firewall_policy.name}-parent"
    resource_group_name      = module.rg.groups.demo.name
    location                 = module.rg.groups.demo.location
    sku                      = "Standard"
    threat_intelligence_mode = "Alert"
  }
}

module "child_policy" {
  source  = "cloudnationhq/fwp/azure"
  version = "~> 5.0"

  firewall_policy = {
    name                     = "${module.naming.firewall_policy.name}-child"
    resource_group_name      = module.rg.groups.demo.name
    location                 = module.rg.groups.demo.location
    sku                      = "Standard"
    base_policy_id           = module.parent_policy.firewall_policy.id
    threat_intelligence_mode = "Deny"
  }
}
