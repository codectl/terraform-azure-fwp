# Firewall Policy

This Terraform module streamlines azure firewall policy management with customizable rule groups, collections, rules, and ip groups for scalable, secure network policies

## Features

Streamlined support for creating and managing firewall policies

Multiple collection groups, collections and rules support

Optional ip group integration in collection rule groups

Utilization of terratest for robust validation.

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

- [azurerm_firewall_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy) (resource)
- [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_firewall_policy"></a> [firewall\_policy](#input\_firewall\_policy)

Description: Contains all firewall policy configuration

Type:

```hcl
object({
    name                              = string
    resource_group_name               = optional(string)
    location                          = optional(string)
    private_ip_ranges                 = optional(list(string))
    sku                               = optional(string)
    sql_redirect_allowed              = optional(bool)
    threat_intelligence_mode          = optional(string)
    base_policy_id                    = optional(string)
    auto_learn_private_ranges_enabled = optional(bool)
    tags                              = optional(map(string))
    dns = optional(object({
      proxy_enabled = optional(bool)
      servers       = optional(list(string))
    }))
    intrusion_detection = optional(object({
      mode           = optional(string)
      private_ranges = optional(list(string))
      traffic_bypass = optional(map(object({
        protocol              = string
        description           = optional(string)
        destination_addresses = optional(list(string))
        destination_ip_groups = optional(list(string))
        destination_ports     = optional(list(string))
        source_addresses      = optional(list(string))
        source_ip_groups      = optional(list(string))
      })), {})
      signature_overrides = optional(map(object({
        id    = optional(string)
        state = optional(string)
      })), {})
    }))
    identity = optional(object({
      type         = string
      identity_ids = list(string)
    }))
    tls_certificate = optional(object({
      key_vault_secret_id = string
      name                = string
    }))
    role_assignments = optional(map(object({
      scope                                  = string
      principal_id                           = string
      name                                   = optional(string)
      role_definition_name                   = optional(string)
      role_definition_id                     = optional(string)
      description                            = optional(string)
      principal_type                         = optional(string)
      condition                              = optional(string)
      condition_version                      = optional(string)
      delegated_managed_identity_resource_id = optional(string)
      skip_service_principal_aad_check       = optional(bool)
    })), {})
    explicit_proxy = optional(object({
      enabled         = optional(bool)
      http_port       = optional(number)
      https_port      = optional(number)
      enable_pac_file = optional(bool)
      pac_file        = optional(string)
      pac_file_port   = optional(number)
    }))
    threat_intelligence_allowlist = optional(object({
      fqdns        = optional(list(string))
      ip_addresses = optional(list(string))
    }))
    insights = optional(object({
      enabled                            = bool
      default_log_analytics_workspace_id = string
      retention_in_days                  = optional(number)
      log_analytics_workspace = optional(map(object({
        id                = string
        firewall_location = string
      })), {})
    }))
  })
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_location"></a> [location](#input\_location)

Description: default azure region to be used.

Type: `string`

Default: `null`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: default resource group to be used.

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: tags to be added to the resources

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_firewall_policy"></a> [firewall\_policy](#output\_firewall\_policy)

Description: Contains all firewall policy configuration
<!-- END_TF_DOCS -->

## Goals

For more information, please see our [goals and non-goals](./GOALS.md).

## Testing

For more information, please see our testing [guidelines](./TESTING.md)

## Notes

Using a dedicated module, we've developed a naming convention for resources that's based on specific regular expressions for each type, ensuring correct abbreviations and offering flexibility with multiple prefixes and suffixes.

Full examples detailing all usages, along with integrations with dependency modules, are located in the examples directory.

Role assignments in `firewall_policy.role_assignments` are created before the firewall policy so the policy's identity has access to the key vault holding the `tls_certificate` at creation time. Because of this ordering, the policy's own id cannot be used as a `scope`; assign roles on the policy itself outside this module.

To update the module's documentation run `make doc`

## Contributors

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued.

For more information, please see our contribution [guidelines](./CONTRIBUTING.md).

## License

MIT Licensed. See [LICENSE](./LICENSE) for full details.

## References

- [Documentation](https://learn.microsoft.com/en-us/azure/firewall/policy-rule-sets)
- [Rest Api](https://learn.microsoft.com/en-us/rest/api/virtualnetwork/firewall-policies)
