terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
  }
}

#
provider "snowflake" {
  role = "ACCOUNTADMIN"
}


#---------------------------------------------------------------------------
#RESOURCES 

#Warehouses
resource "snowflake_warehouse" "warehouse1" {
  name           = "WH_HR_PRO"
  warehouse_size = "xsmall"
  auto_suspend   = 1
  initially_suspended = true
  max_cluster_count = 1
}


#Monitors
resource "snowflake_resource_monitor" "monitor1" {
  name         = "RM_HR_PRO"
  credit_quota = 15
  frequency       = "DAILY"
  start_timestamp = "2023-12-29 00:00"
  end_timestamp   = "2024-12-07 00:00"

  notify_users = ["ILYASS"]
  warehouses = ["WH_HR_PRO"]

}

#-----