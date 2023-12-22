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
resource "snowflake_warehouse" "warehouse_hr_pro" {
  name           = "WH_HR_PRO"
  warehouse_size = "medium"
  auto_suspend   = 1
  initially_suspended = true
  max_cluster_count = 1
}
#Warehouses
resource "snowflake_warehouse" "warehouse_hr_dev" {
  name           = "WH_HR_DEV"
  warehouse_size = "xsmall"
  auto_suspend   = 1
  initially_suspended = true
  max_cluster_count = 1
}


#Monitors
resource "snowflake_resource_monitor" "monitor_hr_pro" {
  name         = "RM_HR_PRO"
  credit_quota = 14
  frequency       = "DAILY"
  start_timestamp = "2023-12-29 00:00"
  end_timestamp   = "2024-12-07 00:00"
  #No podemos usar el argumento de abajo debido a que para notificar a los usuarios,
  #estos han de verificar sus correos electronicos antes y estos no pueden por que los correos no existen
  #En un proyecto real se haria esto
  #notify_users = ["ILYASS",snowflake_user.user1.name,snowflake_user.user2.name]
  notify_users = ["ILYASS"]
  warehouses = ["WH_HR_PRO"]

}
resource "snowflake_resource_monitor" "monitor_hr_dev" {
  name         = "RM_HR_DEV"
  credit_quota = 6
  frequency       = "DAILY"
  start_timestamp = "2023-12-29 00:00"
  end_timestamp   = "2024-12-07 00:00"
  #No podemos usar el argumento de abajo debido a que para notificar a los usuarios,
  #estos han de verificar sus correos electronicos antes y estos no pueden por que los correos no existen
  #En un proyecto real se haria esto
  #notify_users = [snowflake_user.user1.name,snowflake_user.user3.name]
  notify_users = ["ILYASS"]
  warehouses = ["WH_HR_DEV"]

}

#-----