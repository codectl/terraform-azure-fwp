# Ip Groups

This submodule focuses on the effective management of ip groups.

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

- [azurerm_ip_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/ip_group) (resource)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_ip_groups"></a> [ip\_groups](#input\_ip\_groups)

Description: Contains all ip groups configuration

Type:

```hcl
map(object({
    name                = optional(string)
    resource_group_name = optional(string)
    location            = optional(string)
    cidr                = any
    tags                = optional(map(string))
  }))
```

Default: `{}`

### <a name="input_location"></a> [location](#input\_location)

Description: contains the region

Type: `string`

Default: `null`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: contains the resource group name

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: tags to be added to the resources

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_groups"></a> [groups](#output\_groups)

Description: Contains all ip groups configuration
<!-- END_TF_DOCS -->
