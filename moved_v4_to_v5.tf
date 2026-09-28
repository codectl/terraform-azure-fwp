moved {
  from = azurerm_firewall_policy.policy
  to   = azurerm_firewall_policy.this
}

moved {
  from = azurerm_role_assignment.role
  to   = azurerm_role_assignment.this
}

moved {
  from = azurerm_firewall_policy_rule_collection_group.group
  to   = azurerm_firewall_policy_rule_collection_group.this
}

moved {
  from = azurerm_ip_group.ipgroup
  to   = azurerm_ip_group.this
}
