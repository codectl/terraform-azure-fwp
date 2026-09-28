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

module "analytics" {
  source  = "cloudnationhq/law/azure"
  version = "~> 4.0"

  workspace = {
    name                = module.naming.log_analytics_workspace.name_unique
    resource_group_name = module.rg.groups.demo.name
    location            = module.rg.groups.demo.location
  }
}

module "fw_policy" {
  source  = "cloudnationhq/fwp/azure"
  version = "~> 5.0"

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
