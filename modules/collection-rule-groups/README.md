# Collection Rule Groups

This submodule illustrates how to manage collection groups through the use of IP groups within secure virtual hubs.

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 5.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (~> 5.0)

## Resources

The following resources are used by this module:

- [azurerm_firewall_policy_rule_collection_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy_rule_collection_group) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_groups"></a> [groups](#input\_groups)

Description: Contains all firewall policy rule collection groups config

Type:

```hcl
map(object({
    name               = optional(string)
    firewall_policy_id = optional(string)
    priority           = number
    network_rule_collections = optional(map(object({
      name     = optional(string)
      priority = number
      action   = string
      rules = map(object({
        name                  = optional(string)
        description           = optional(string)
        protocols             = list(string)
        destination_ports     = list(string)
        destination_addresses = optional(list(string))
        destination_fqdns     = optional(list(string))
        source_addresses      = optional(list(string))
        source_ip_groups      = optional(list(string))
        destination_ip_groups = optional(list(string))
      }))
    })), {})
    application_rule_collections = optional(map(object({
      name     = optional(string)
      priority = number
      action   = string
      rules = map(object({
        name                  = optional(string)
        description           = optional(string)
        source_addresses      = optional(list(string))
        source_ip_groups      = optional(list(string))
        destination_addresses = optional(list(string))
        destination_urls      = optional(list(string))
        destination_fqdns     = optional(list(string))
        destination_fqdn_tags = optional(list(string))
        terminate_tls         = optional(bool)
        web_categories        = optional(list(string))
        protocols = optional(list(object({
          type = string
          port = number
        })), [])
        http_headers = optional(list(object({
          name  = string
          value = string
        })), [])
      }))
    })), {})
    nat_rule_collections = optional(map(object({
      name     = optional(string)
      priority = number
      action   = string
      rules = map(object({
        name                = optional(string)
        description         = optional(string)
        protocols           = list(string)
        source_addresses    = optional(list(string))
        source_ip_groups    = optional(list(string))
        destination_address = optional(string)
        destination_ports   = optional(list(string))
        translated_address  = optional(string)
        translated_fqdn     = optional(string)
        translated_port     = optional(string)
      }))
    })), {})
  }))
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_firewall_policy_id"></a> [firewall\_policy\_id](#input\_firewall\_policy\_id)

Description: The ID of the Firewall Policy to which rule collection groups will be applied.

Type: `string`

Default: `null`

## Outputs

No outputs.
<!-- END_TF_DOCS -->
