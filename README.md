# terraform-azurerm-mysql-flexible
Terraform module that can be used to create an Azure MySQL Flex.

## Usage
See `examples` folders for usage of this module.

## Requirements

| Name | Version |
|------|---------|
| terraform | 1.5.3 |
| azurerm | 3.66.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | 3.66.0 |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:------:|:---------:|:--------:|
| location | The Azure Region where the MySQL Flexible Server should exist. Changing this forces a new MySQL Flexible Server to be created. | `string` | n/a | yes |
| mysqlflex_admin_password | The Password associated with the administrator_login for the MySQL Flexible Server. Required when create_mode is Default. | `string` | null | no |
| mysqlflex_admin_username | The Administrator Login for the MySQL Flexible Server. Required when create_mode is Default. Changing this forces a new MySQL Flexible Server to be created. | `string` | null | no |
| mysqlflex_auto_grow_enabled | Should Storage Auto Grow be enabled? Defaults to true. | `bool` | `true` | no |
| mysqlflex_backup_retention_days | The backup retention days for the MySQL Flexible Server. Possible values are between 7 and 35 days. Defaults to 7. | `number` | `7` | no |
| mysqlflex_charset | Specifies the Charset for the MySQL Database, which needs to be a valid MySQL Charset. Changing this forces a new resource to be created. | `string` | "utf8" | no |
| mysqlflex_collation | Specifies the Collation for the MySQL Database, which needs to be a valid MySQL Collation. Changing this forces a new resource to be created. | `string` | "utf8_unicode_ci" | no |
| mysqlflex_configuration | Specifies the name and value of the MySQL Flexible Server Configuration, which needs to be a valid MySQL configuration name. | `map` | `{}` | no |
| mysqlflex_create_mode | The creation mode which can be used to restore or replicate existing servers. Possible values are Default, PointInTimeRestore, GeoRestore, and Replica. Changing this forces a new MySQL Flexible Server to be created. | `string` | "Default" | no |
| mysqlflex_database_name | Specifies the name of the MySQL Database, which needs to be a valid MySQL identifier. Changing this forces a new resource to be created. | `string` | n/a | yes |
| mysqlflex_day_of_week | Unspecified description. | `string` | null | no |
| mysqlflex_delegated_subnet_id | The ID of the virtual network subnet to create the MySQL Flexible Server. Changing this forces a new MySQL Flexible Server to be created. | `string` | null | no |
| mysqlflex_firewall_rules | Specifies the name, start_ip_address and end_ip_address of the MySQL Firewall Rule. Changing this forces a new resource to be created. | `map` | null | no |
| mysqlflex_geo_redundant_backup_enabled | Should geo redundant backup enabled? Defaults to false. Changing this forces a new MySQL Flexible Server to be created. | `bool` | `false` | no |
| mysqlflex_iops | The storage IOPS for the MySQL Flexible Server. Possible values are between 360 and 20000. | `number` | `360` | no |
| mysqlflex_mode | The high availability mode for the MySQL Flexible Server. Possibles values are SameZone and ZoneRedundant. | `string` | "SameZone" | no |
| mysqlflex_high_availability_enabled | Enabled high availability mode for the MySQL Flexible Server. | `bool` | `false` | no |
| mysqlflex_name | The name which should be used for this MySQL Flexible Server. Changing this forces a new MySQL Flexible Server to be created. | `string` | n/a | yes |
| mysqlflex_point_in_time_restore_time_in_utc | The point in time to restore from creation_source_server_id when create_mode is PointInTimeRestore. Changing this forces a new MySQL Flexible Server to be created. UTCDateTime format : YYYY-MM-DD, YYYY-MM-DDThh:mm<TZDSuffix> or YYYY-MM-DDThh:mm:ss<TZDSuffix>. | `string` | null | no |
| mysqlflex_private_dns_zone_id | The ID of the private dns zone to create the MySQL Flexible Server. Changing this forces a new MySQL Flexible Server to be created. | `string` | null | no |
| mysqlflex_random_password_length | The length of random admin password. | `number` | `16` | no |
| mysqlflex_replication_role | The replication role. Possible value is None. | `string` | null | no |
| mysqlflex_size_gb | The max storage allowed for the MySQL Flexible Server. Possible values are between 20 and 16384. | `number` | `20` | no |
| mysqlflex_sku_name | The SKU Name for the MySQL Flexible Server (continued). List: Standard_D2ds_v4 Standard_D32ds_v4 Standard_D48ds_v4 Standard_D4ds_v4 Standard_D64ds_v4 Standard_D8ds_v4 Standard_E16ds_v4 Standard_E2ds_v4 Standard_E32ds_v4 Standard_E48ds_v4 Standard_E4ds_v4 Standard_E64ds_v4 Standard_E8ds_v4 | string | "Standard_B1ms" | no | | mysqlflex_standby_availability_zone | The availability zone of the standby Flexible Server. Possible values are 1, 2 and 3. | number | 1 | no | | mysqlflex_start_hour | The start hour for maintenance window. Defaults to 0. | number | 0 | no | | mysqlflex_start_minute | The start minute for maintenance window. Defaults to 0. | number | 0 | no | | mysqlflex_version | The version of the MySQL Flexible Server to use. Possible values are 5.7, and 8.0.21. Changing this forces a new MySQL Flexible Server to be created. | string | "5.7" | no | | mysqlflex_zone | The availability zone information of the MySQL Flexible Server. Possible values are 1, 2 and 3. | number | 1 | no | | resource_group_name | The name of the Resource Group where the MySQL Flexible Server should exist. Changing this forces a new MySQL Flexible Server to be created. | string | n/a | yes | | tags | A map of tags to add to all resources. | map | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The resource ID of the MySQL Server. |
| fqdn | The FQDN of the MySQL Server. |
| database_id | The resource ID of the MySQL Database. |
| database_name | The database name of the MySQL Database. |
| administrator_login | The administrator login of the MySQL Database. |
| administrator_password | The administrator password of the MySQL Database. |
