variable "groups" {
  description = "Contains all firewall policy rule collection groups config"
  type = map(object({
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
}

variable "firewall_policy_id" {
  description = "The ID of the Firewall Policy to which rule collection groups will be applied."
  type        = string
  default     = null
}
