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

module "analytics" {
  source  = "codectl/law/azure"
  version = "~> 1.0"

  workspace = {
    name                = module.naming.log_analytics_workspace.name_unique
    resource_group_name = module.rg.groups.demo.name
    location            = module.rg.groups.demo.location
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

    insights = {
      enabled                            = true
      default_log_analytics_workspace_id = module.analytics.workspace.id
      retention_in_days                  = 30

      log_analytics_workspace = {
        westeurope = {
          id                = module.analytics.workspace.id
          firewall_location = module.rg.groups.demo.location
        }
      }
    }
  }
}
