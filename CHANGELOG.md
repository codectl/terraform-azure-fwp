# Changelog

## [5.0.0](https://github.com/CloudNationHQ/terraform-azure-fwp/compare/v4.1.0...v5.0.0) (2026-09-09)


### ⚠ BREAKING CHANGES

* this change causes recreates

### Features

* azurerm provider 5 upgrade ([#50](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/50)) ([987f4bc](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/987f4bc24e02859e8fbad82bfa0440e8da2bdbeb))

## [4.1.0](https://github.com/CloudNationHQ/terraform-azure-fwp/compare/v4.0.1...v4.1.0) (2026-07-10)


### Features

* **deps:** bump golang.org/x/crypto from 0.36.0 to 0.45.0 in /tests ([#41](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/41)) ([c12897d](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/c12897d4f3131a3e31554cc0f03d28803a764a95))
* **deps:** bump golang.org/x/crypto from 0.51.0 to 0.52.0 in /tests ([#48](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/48)) ([c7e5a50](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/c7e5a50f7a622c237c644d278e342e063c048069))
* **deps:** bump golang.org/x/net from 0.47.0 to 0.55.0 in /tests ([#47](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/47)) ([a351326](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/a351326069608fcbfc43eace6030e4cee66dce2f))

## [4.0.1](https://github.com/CloudNationHQ/terraform-azure-fwp/compare/v4.0.0...v4.0.1) (2026-01-28)


### Bug Fixes

* remove faulty validation collection rule groups ([#44](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/44)) ([7138b90](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/7138b90706b5864b7e23b5a62b3a52f36975127c))

## [4.0.0](https://github.com/CloudNationHQ/terraform-azure-fwp/compare/v3.2.0...v4.0.0) (2025-11-04)


### ⚠ BREAKING CHANGES

* this change expects to change the existing data structure

### Features

* restructure tls_certificate to include role assignment properties ([#38](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/38)) ([3503be5](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/3503be5a4482e12036bc293b95033fdc8a766f1d))

### Upgrade from v3.2.0 to v4.0.0:

- Update module reference to: version = "~> 4.0"
- The key_vault_id and principal_id properties are moved from config root level into the tls_certificate object.
   - Users must update their variable structure to nest these properties within tls_certificate.

## [3.2.0](https://github.com/CloudNationHQ/terraform-azure-fwp/compare/v3.1.0...v3.2.0) (2025-10-21)


### Features

* **deps:** bump github.com/cloudnationhq/az-cn-go-validor in /tests ([#35](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/35)) ([3914c47](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/3914c474abf702c1ed098395adafcf08c17bf95a))
* **deps:** bump github.com/ulikunitz/xz from 0.5.10 to 0.5.14 in /tests ([#32](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/32)) ([cd991e6](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/cd991e6f68f8f32afccf8f391d404242f6e836f6))
* use list syntax for optional dynamic blocks and remove redundant null defaults ([#36](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/36)) ([f627d78](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/f627d7882fb939027aac60a21cfd2e162b81d81e))

## [3.1.0](https://github.com/CloudNationHQ/terraform-azure-fwp/compare/v3.0.0...v3.1.0) (2025-07-07)


### Features

* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#26](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/26)) ([9465a0d](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/9465a0d946fcf4a87343e51de71481a1c69c743a))
* update firewall_policy_id handling and add validation for groups ([#29](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/29)) ([a4195a1](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/a4195a1f740727dc33ebe14056eefb96f3e12120))

## [3.0.0](https://github.com/CloudNationHQ/terraform-azure-fwp/compare/v2.3.0...v3.0.0) (2025-06-05)


### ⚠ BREAKING CHANGES

* The data structure changed, causing a recreate on existing resources.

### Features

* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#18](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/18)) ([63643d5](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/63643d5998a3aee6a81e1decd92bb99c83d3efe5))
* enhance role assignment with additional parameters and tags ([#19](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/19)) ([e6df8aa](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/e6df8aaba63c7a66462a5ca29f0d7256583df50b))
* small refactor ([#27](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/27)) ([558106d](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/558106d8b9edb1e4782b8b25838970583d079cac))

### Upgrade from v2.3.0 to v3.0.0:

- Update module reference to: `version = "~> 3.0"`
- The property and variable resource_group is renamed to resource_group_name
- The user assigned identity resource is removed, there is a dedicated module for this

## [2.3.0](https://github.com/CloudNationHQ/terraform-azure-fwp/compare/v2.2.0...v2.3.0) (2025-01-20)


### Features

* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#12](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/12)) ([424ff6b](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/424ff6bb6c2d6e250967789b7502760d1b5bb9ba))
* **deps:** bump golang.org/x/crypto from 0.29.0 to 0.31.0 in /tests ([#15](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/15)) ([5fe10cc](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/5fe10cc928ad6e225456884fe400d6df68529d26))
* **deps:** bump golang.org/x/net from 0.31.0 to 0.33.0 in /tests ([#16](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/16)) ([e4ef9bc](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/e4ef9bce7c550a3f2709ac4959a619c7c7b4bc64))
* remove temporary files when deployment tests fails ([#13](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/13)) ([8b553c3](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/8b553c3bf456c30a805dc125ff7b4e2704a8d8b0))

## [2.2.0](https://github.com/CloudNationHQ/terraform-azure-fwp/compare/v2.1.0...v2.2.0) (2024-11-11)


### Features

* enhance testing with sequential, parallel modes and flags for exceptions and skip-destroy ([#9](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/9)) ([19142dc](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/19142dc05bec0f0bcf2b50c2493896be7dce7110))

## [2.1.0](https://github.com/CloudNationHQ/terraform-azure-fwp/compare/v2.0.0...v2.1.0) (2024-10-11)


### Features

* auto generated docs and refine makefile ([#7](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/7)) ([75ba327](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/75ba327a3fa5dcc7f1d2b4af61aa5e1a1b77013d))
* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#6](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/6)) ([eaa683d](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/eaa683d08b8526b5f5386cd16b72f42d4d54fc28))

## [2.0.0](https://github.com/CloudNationHQ/terraform-azure-fwp/compare/v1.0.0...v2.0.0) (2024-09-25)


### ⚠ BREAKING CHANGES

* Version 4 of the azurerm provider includes breaking changes.

### Features

* upgrade azurerm provider to v4 ([#4](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/4)) ([18ec3fc](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/18ec3fcc38e5dee9b0870f26d4a78e734582577d))

### Upgrade from v1.0.0 to v2.0.0:

- Update module reference to: `version = "~> 2.0"`
- Rename variable in submodule ip-groups:
  - resourcegroup -> resource_group

## 1.0.0 (2024-09-17)


### Features

* add initial resources ([#2](https://github.com/CloudNationHQ/terraform-azure-fwp/issues/2)) ([1461e10](https://github.com/CloudNationHQ/terraform-azure-fwp/commit/1461e1018c92d3d35688e1457f9ba5c11e7a8829))
