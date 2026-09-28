# ip groups
resource "azurerm_ip_group" "this" {
  for_each = var.ip_groups

  name = coalesce(
    each.value.name,
    each.key
  )

  resource_group_name = coalesce(
    each.value.resource_group_name, var.resource_group_name
  )

  location = coalesce(
    each.value.location, var.location
  )

  cidrs = can(
    tolist(each.value.cidr)
  ) ? tolist(each.value.cidr) : values(each.value.cidr)

  tags = coalesce(
    each.value.tags, var.tags
  )
}
