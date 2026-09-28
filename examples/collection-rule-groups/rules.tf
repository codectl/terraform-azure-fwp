locals {
  collection_rule_groups = {
    default = {
      priority           = 1000
      firewall_policy_id = module.fw_policy.firewall_policy.id
      network_rule_collections = {
        netw_rules = {
          name     = "netwrules"
          priority = 7000
          action   = "Allow"
          rules = {
            rule1 = {
              protocols             = ["TCP"]
              destination_ports     = ["*"]
              destination_addresses = ["10.0.1.0/8"]
              source_addresses      = ["10.0.0.0/8"]
            }
            rule2 = {
              protocols             = ["TCP"]
              destination_ports     = ["*"]
              destination_addresses = ["12.0.1.0/8"]
              source_addresses      = ["12.0.0.0/8"]
            }
          }
        }
        netw_rules2 = {
          name     = "netwrules2"
          priority = 7001
          action   = "Allow"
          rules = {
            rule1 = {
              protocols             = ["TCP"]
              destination_ports     = ["*"]
              destination_addresses = ["10.0.3.0/8"]
              source_addresses      = ["10.0.0.0/8"]
            }
            rule2 = {
              protocols             = ["TCP"]
              destination_ports     = ["*"]
              destination_addresses = ["12.0.1.0/8"]
              source_addresses      = ["12.0.0.0/8"]
            }
          }
        }
      }
      application_rule_collections = {
        app_rules = {
          name     = "apprules"
          priority = 6000
          action   = "Deny"
          rules = {
            rule1 = {
              source_addresses  = ["10.0.0.1"]
              destination_fqdns = ["*.microsoft.com"]
              protocols = [
                {
                  type = "Https"
                  port = 443
                }
              ]
            }
            rule2 = {
              source_addresses  = ["10.0.0.1"]
              destination_fqdns = ["*.bing.com"]
              protocols = [
                {
                  type = "Https"
                  port = 443
                }
              ]
            }
          }
        }
      }
    }
  }
}
