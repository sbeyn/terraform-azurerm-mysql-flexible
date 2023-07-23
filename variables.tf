variable "location" {
  description = "(Required) The Azure Region where the MySQL Flexible Server should exist. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
}
variable "mysqlflex_admin_password" {
  description = "(Optional) The Password associated with the administrator_login for the MySQL Flexible Server. Required when create_mode is Default."
  default     = null
  type        = string
}
variable "mysqlflex_admin_username" {
  description = "(Optional) The Administrator Login for the MySQL Flexible Server. Required when create_mode is Default. Changing this forces a new MySQL Flexible Server to be created."
  default     = null
  type        = string
}
variable "mysqlflex_auto_grow_enabled" {
  description = "(Optional) Should Storage Auto Grow be enabled? Defaults to true."
  default     = true
  type        = bool
}
variable "mysqlflex_backup_retention_days" {
  description = "(Optional) The backup retention days for the MySQL Flexible Server. Possible values are between 7 and 35 days. Defaults to 7."
  default     = 7
  type        = number
}
variable "mysqlflex_charset" {
  description = "(Required) Specifies the Charset for the MySQL Database, which needs to be a valid MySQL Charset. Changing this forces a new resource to be created."
  default     = "utf8"
  type        = string
}
variable "mysqlflex_collation" {
  description = "(Required) Specifies the Collation for the MySQL Database, which needs to be a valid MySQL Collation. Changing this forces a new resource to be created."
  default     = "utf8_unicode_ci" 
  type        = string
}
variable "mysqlflex_configuration" {
  description = "Specifies the name and value of the MySQL Flexible Server Configuration, which needs to be a valid MySQL configuration name."
  default     = {}
  type        = map
}
variable "mysqlflex_create_mode" {
  description = "(Optional)The creation mode which can be used to restore or replicate existing servers. Possible values are Default, PointInTimeRestore, GeoRestore, and Replica. Changing this forces a new MySQL Flexible Server to be created."
  default     = "Default"
  type        = string
}
variable "mysqlflex_database_name" {
  description = "(Required) Specifies the name of the MySQL Database, which needs to be a valid MySQL identifier. Changing this forces a new resource to be created."
  type        = string
}
variable "mysqlflex_day_of_week" {
  description = ""
  default     = null
  type        = string
}
variable "mysqlflex_delegated_subnet_id" {
  description = "(Optional) The ID of the virtual network subnet to create the MySQL Flexible Server. Changing this forces a new MySQL Flexible Server to be created."
  default     = null
  type        = string
}
variable "mysqlflex_firewall_rules" {
  description = "Specifies the name, start_ip_address and end_ip_address of the MySQL Firewall Rule. Changing this forces a new resource to be created."
  default     = null
  type        = map
}
variable "mysqlflex_geo_redundant_backup_enabled" {
  description = "(Optional) Should geo redundant backup enabled? Defaults to false. Changing this forces a new MySQL Flexible Server to be created."
  default     = false
  type        = bool
}
variable "mysqlflex_iops" {
  description = "(Optional) The storage IOPS for the MySQL Flexible Server. Possible values are between 360 and 20000."
  default     = 360
  type        = number
}
variable "mysqlflex_mode" {
  description = "(Required) The high availability mode for the MySQL Flexible Server. Possibles values are SameZone and ZoneRedundant."
  default     = "SameZone"
  type        = string
}
variable "mysqlflex_high_availability_enabled" {
  description = "Enabled high availability mode for the MySQL Flexible Server."
  default     = false
  type        = bool
}
variable "mysqlflex_name" {
  description = "(Required) The name which should be used for this MySQL Flexible Server. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
}
variable "mysqlflex_point_in_time_restore_time_in_utc" {
  description = "(Optional) The point in time to restore from creation_source_server_id when create_mode is PointInTimeRestore. Changing this forces a new MySQL Flexible Server to be created. UTCDateTime format : YYYY-MM-DD, YYYY-MM-DDThh:mm<TZDSuffix> or YYYY-MM-DDThh:mm:ss<TZDSuffix>."
  default     = null
  type        = string
}
variable "mysqlflex_private_dns_zone_id" {
  description = "(Optional) The ID of the private dns zone to create the MySQL Flexible Server. Changing this forces a new MySQL Flexible Server to be created."
  default     = null
  type        = string
}
variable "mysqlflex_random_password_length" {
  description = "The length of random admin password."
  default     = 16
  type        = number
}
variable "mysqlflex_replication_role" {
  description = "The replication role. Possible value is None."
  default     = null
  type        = string
}
variable "mysqlflex_size_gb" {
  description = "(Optional) The max storage allowed for the MySQL Flexible Server. Possible values are between 20 and 16384."
  default     = 20
  type        = number
}
variable "mysqlflex_sku_name" {
  description = "(Optional) The SKU Name for the MySQL Flexible Server. should start with SKU tier B (Burstable), GP (General Purpose), MO (Memory Optimized) like B_Standard_B1s."
  default     = "B_Standard_B1s"
  type        = string
}
variable "mysqlflex_standby_availability_zone" {
  description = "(Optional) The availability zone of the standby Flexible Server. Possible values are 1, 2 and 3."
  default     = 1
  type        = number
}
variable "mysqlflex_start_hour" {
  description = "(Optional) The start hour for maintenance window. Defaults to 0."
  default     = 0
  type        = number
}
variable "mysqlflex_start_minute" {
  description = "(Optional) The start minute for maintenance window. Defaults to 0."
  default     = 0
  type        = number
}
variable "mysqlflex_version" {
  description = "(Optional) The version of the MySQL Flexible Server to use. Possible values are 5.7, and 8.0.21. Changing this forces a new MySQL Flexible Server to be created."
  default     = "5.7"
  type        = string
}
variable "mysqlflex_zone" {
  description = "(Optional) The availability zone information of the MySQL Flexible Server. Possible values are 1, 2 and 3."
  default     = 1
  type        = number
}
variable "resource_group_name" {
  description = "(Required) The name of the Resource Group where the MySQL Flexible Server should exist. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
