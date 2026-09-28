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

module "fw_policy" {
  source  = "cloudnationhq/fwp/azure"
  version = "~> 5.0"

  firewall_policy = {
    name                     = module.naming.firewall_policy.name
    resource_group_name      = module.rg.groups.demo.name
    location                 = module.rg.groups.demo.location
    sku                      = "Premium"
    threat_intelligence_mode = "Deny"

    intrusion_detection = {
      mode           = "Alert"
      private_ranges = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]

      traffic_bypass = {
        lb_health_probes = {
          protocol              = "TCP"
          description           = "Bypass IDPS for Azure Load Balancer health probes"
          source_addresses      = ["168.63.129.16"]
          destination_addresses = ["10.1.0.0/24"]
          destination_ports     = ["80", "443"]
        }
      }

      signature_overrides = {
        ms_ise_rule = {
          id    = "2024897"
          state = "Off"
        }
      }
    }

    threat_intelligence_allowlist = {
      fqdns        = ["*.microsoft.com", "*.windowsupdate.com"]
      ip_addresses = ["40.126.1.100", "40.126.1.101"]
    }
  }
}
