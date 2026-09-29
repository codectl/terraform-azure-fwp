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
  }
}

module "collection_rule_groups" {
  source  = "codectl/fwp/azure//modules/collection-rule-groups"
  version = "~> 1.0"

  groups = local.collection_rule_groups
}

module "ip_groups" {
  source  = "codectl/fwp/azure//modules/ip-groups"
  version = "~> 1.0"

  resource_group_name = module.rg.groups.demo.name
  location            = module.rg.groups.demo.location
  ip_groups           = local.ip_groups
}
