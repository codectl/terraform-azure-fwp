# collection groups
resource "azurerm_firewall_policy_rule_collection_group" "this" {
  for_each = var.groups

  name = coalesce(
    each.value.name, format("fwrcg-%s", each.key)
  )

  firewall_policy_id = coalesce(
    each.value.firewall_policy_id, var.firewall_policy_id
  )

  priority = each.value.priority

  dynamic "network_rule_collection" {
    for_each = each.value.network_rule_collections

    content {
      name = coalesce(
        network_rule_collection.value.name, network_rule_collection.key
      )

      priority = network_rule_collection.value.priority
      action   = network_rule_collection.value.action

      dynamic "rule" {
        for_each = network_rule_collection.value.rules

        content {
          name = coalesce(
            rule.value.name, rule.key
          )

          description           = rule.value.description
          protocols             = rule.value.protocols
          destination_ports     = rule.value.destination_ports
          destination_addresses = rule.value.destination_addresses
          destination_fqdns     = rule.value.destination_fqdns
          source_addresses      = rule.value.source_addresses
          source_ip_groups      = rule.value.source_ip_groups
          destination_ip_groups = rule.value.destination_ip_groups
        }
      }
    }
  }

  dynamic "application_rule_collection" {
    for_each = each.value.application_rule_collections

    content {
      name = coalesce(
        application_rule_collection.value.name, application_rule_collection.key
      )

      priority = application_rule_collection.value.priority
      action   = application_rule_collection.value.action

      dynamic "rule" {
        for_each = application_rule_collection.value.rules

        content {
          name = coalesce(
            rule.value.name, rule.key
          )

          description           = rule.value.description
          source_addresses      = rule.value.source_addresses
          source_ip_groups      = rule.value.source_ip_groups
          destination_addresses = rule.value.destination_addresses
          destination_urls      = rule.value.destination_urls
          destination_fqdns     = rule.value.destination_fqdns
          destination_fqdn_tags = rule.value.destination_fqdn_tags
          terminate_tls         = rule.value.terminate_tls
          web_categories        = rule.value.web_categories

          dynamic "http_headers" {
            for_each = rule.value.http_headers

            content {
              name  = http_headers.value.name
              value = http_headers.value.value
            }
          }

          dynamic "protocols" {
            for_each = rule.value.protocols

            content {
              type = protocols.value.type
              port = protocols.value.port
            }
          }
        }
      }
    }
  }

  dynamic "nat_rule_collection" {
    for_each = each.value.nat_rule_collections

    content {
      name = coalesce(
        nat_rule_collection.value.name, nat_rule_collection.key
      )

      priority = nat_rule_collection.value.priority
      action   = nat_rule_collection.value.action

      dynamic "rule" {
        for_each = nat_rule_collection.value.rules

        content {
          name = coalesce(
            rule.value.name, rule.key
          )

          description         = rule.value.description
          protocols           = rule.value.protocols
          source_addresses    = rule.value.source_addresses
          source_ip_groups    = rule.value.source_ip_groups
          destination_address = rule.value.destination_address
          destination_ports   = rule.value.destination_ports
          translated_address  = rule.value.translated_address
          translated_fqdn     = rule.value.translated_fqdn
          translated_port     = rule.value.translated_port
        }
      }
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}
