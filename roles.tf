#ADMIN role

resource "snowflake_role" "admin"{
  name = "ADMIN"
}

resource "snowflake_role_grants" "adminmike"{
  role_name = snowflake_role.admin.name
  users = [snowflake_user.user1.name]
}
resource "snowflake_database_grant" "grantadminpro" {
  database_name = snowflake_database.db1.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  enable_multiple_grants = true
  with_grant_option = true
}
resource "snowflake_database_grant" "grantadmindev" {
  database_name = snowflake_database.db2.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  enable_multiple_grants = true
  with_grant_option = true
}
#Schemas GRANT ADMIN
resource "snowflake_schema_grant" "pro_m_admin"{
  schema_name = snowflake_schema.schemabprom.name
  database_name = snowflake_database.db1.name
  privilege = "ALL PRIVILEGES"
  roles = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_schema_grant" "pro_f_admin"{
  schema_name = snowflake_schema.schemabprof.name
  database_name = snowflake_database.db1.name
  privilege = "ALL PRIVILEGES"
  roles = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_schema_grant" "dev_m_admin"{
  schema_name = snowflake_schema.schemabdevm.name
  database_name = snowflake_database.db2.name
  privilege = "ALL PRIVILEGES"
  roles = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_schema_grant" "dev_f_admin"{
  schema_name = snowflake_schema.schemabdevf.name
  database_name = snowflake_database.db2.name
  privilege = "ALL PRIVILEGES"
  roles = [snowflake_role.admin.name]
  with_grant_option = true
}
#Tables  GRANT ADMIN and ONLYDEV access
resource "snowflake_table_grant" "table_prom_admin" {
    depends_on = [ snowflake_user.user1,snowflake_user.user3 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprom.name
  table_name    = snowflake_table.tableprom.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name,snowflake_role.onlydev.name]
  with_grant_option = true
  
}
resource "snowflake_table_grant" "table_prof_admin" {
    depends_on = [ snowflake_user.user1,snowflake_user.user3 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprof.name
  table_name    = snowflake_table.tableprof.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name,snowflake_role.onlydev.name]
  with_grant_option = true
  
}
resource "snowflake_table_grant" "table_devm_admin" {
    depends_on = [ snowflake_user.user1,snowflake_user.user3  ]
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevm.name
  table_name    = snowflake_table.tabledevm.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name,snowflake_role.onlydev.name]
  with_grant_option = true
  
}
resource "snowflake_table_grant" "table_devf_admin" {
    depends_on = [ snowflake_user.user1,snowflake_user.user3  ]
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevf.name
  table_name    = snowflake_table.tabledevf.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name,snowflake_role.onlydev.name]
  with_grant_option = true
  
}
#File Formats GRANT ADMIN
resource "snowflake_file_format_grant" "grant_admin_fileformat" {
  database_name    = snowflake_database.db1.name
  schema_name      = snowflake_schema.schemabprof.name
  file_format_name = snowflake_file_format.file_format.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_file_format_grant" "grant_admin_fileformat2" {
  database_name    = snowflake_database.db1.name
  schema_name      = snowflake_schema.schemabprom.name
  file_format_name = snowflake_file_format.file_format2.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_file_format_grant" "grant_Admin_fileformat3" {
  database_name    = snowflake_database.db2.name
  schema_name      = snowflake_schema.schemabdevf.name
  file_format_name = snowflake_file_format.file_format3.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_file_format_grant" "grant_admin_fileformat4" {
  database_name    = snowflake_database.db2.name
  schema_name      = snowflake_schema.schemabdevm.name
  file_format_name = snowflake_file_format.file_format4.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
#Stages GRANT ADMIN
resource "snowflake_stage_grant" "grant_admin_stage" {
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevf.name
  stage_name    = snowflake_stage.stage_hr_dev_f.name

  privilege = "ALL PRIVILEGES"

  roles = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_stage_grant" "grant_admin_stage2" {
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevm.name
  stage_name    = snowflake_stage.stage_hr_dev_m.name

  privilege = "ALL PRIVILEGES"

  roles = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_stage_grant" "grant_admin_stage3" {
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprom.name
  stage_name    = snowflake_stage.stage_hr_pro_m.name

  privilege = "ALL PRIVILEGES"

  roles = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_stage_grant" "grant_admin_stage4" {
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprof.name
  stage_name    = snowflake_stage.stage_hr_pro_f.name

  privilege = "ALL PRIVILEGES"

  roles = [snowflake_role.admin.name]
  with_grant_option = true
}
#TASKS GRANT ADMIN
resource "snowflake_task_grant" "grant_admin_task" {
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprof.name
  task_name     = snowflake_task.task1.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_task_grant" "grant_admin_task2" {
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprom.name
  task_name     = snowflake_task.task2.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_task_grant" "grant_admin_task3" {
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevf.name
  task_name     = snowflake_task.task3.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_task_grant" "grant_admin_task4" {
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevm.name
  task_name     = snowflake_task.task4.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
 #Views PRO M  GRANT ADMIN
resource "snowflake_view_grant" "grant_admin_blueeyesprom" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprom.name
  view_name     = snowflake_view.viewblueeyesprom.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_view_grant" "grant_admin_allheroesprom" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprom.name
  view_name     = snowflake_view.viewallheroesprom.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_view_grant" "grant_admin_allhairprom" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprom.name
  view_name     = snowflake_view.viewhairprom.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
#Views PRO F GRANT ADMIN
resource "snowflake_view_grant" "grant_admin_blueeyesprof" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprof.name
  view_name     = snowflake_view.viewblueeyesprof.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_view_grant" "grant_admin_allheroesprof" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprof.name
  view_name     = snowflake_view.viewallheroesprof.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_view_grant" "grant_admin_allhairprof" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprof.name
  view_name     = snowflake_view.viewhairprof.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
#Views DEV M GRANT ADMIN
resource "snowflake_view_grant" "grant_admin_blueeyesdevm" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevm.name
  view_name     = snowflake_view.viewblueeyesdevm.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_view_grant" "grant_admin_allheroesdevm" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevm.name
  view_name     = snowflake_view.viewallheroesdevm.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_view_grant" "grant_admin_allhairdevm" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevm.name
  view_name     = snowflake_view.viewhairdevm.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
#Views DEV F GRANT ADMIN
resource "snowflake_view_grant" "grant_admin_blueeyesdevf" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevf.name
  view_name     = snowflake_view.viewblueeyesdevm.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_view_grant" "grant_admin_allheroesdevf" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevf.name
  view_name     = snowflake_view.viewallheroesdevf.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}
resource "snowflake_view_grant" "grant_admin_allhairdevf" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevf.name
  view_name     = snowflake_view.viewhairdevf.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
}

#---------------------------------
#Schemas GRANT Just PRO
resource "snowflake_schema_grant" "pro_m_pro"{
  schema_name = snowflake_schema.schemabprom.name
  database_name = snowflake_database.db1.name
  privilege = "USAGE"
  roles = [snowflake_role.onlypro.name]
}
resource "snowflake_schema_grant" "pro_f_pro"{
  schema_name = snowflake_schema.schemabprof.name
  database_name = snowflake_database.db1.name
  privilege = "USAGE"
  roles = [snowflake_role.onlypro.name]
}


#---------------------------------------------------------------------
#Just PRO role

resource "snowflake_role" "onlypro"{
  name = "ONLYPRO"
}

resource "snowflake_role_grants" "onlyprojohnny"{
  role_name = snowflake_role.onlypro.name
  users = [snowflake_user.user2.name]
}
resource "snowflake_database_grant" "grantonlypro" {
  database_name = snowflake_database.db1.name

  privilege = "USAGE"
  roles     = [snowflake_role.onlypro.name]

  with_grant_option = false
}

#Tables GRANT just PRO
resource "snowflake_table_grant" "table_prom_onlypro_create" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprom.name
  table_name    = snowflake_table.tableprom.name

  privilege = "UPDATE"
  roles     = [snowflake_role.onlypro.name]
  with_grant_option = true
  
}
resource "snowflake_table_grant" "table_prom_onlypro_insert" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprom.name
  table_name    = snowflake_table.tableprom.name

  privilege = "INSERT"
  roles     = [snowflake_role.onlypro.name]
  with_grant_option = true
  
}
resource "snowflake_table_grant" "table_prof_onlyprov_create" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprof.name
  table_name    = snowflake_table.tableprof.name

  privilege = "UPDATE"
  roles     = [snowflake_role.onlypro.name]
  with_grant_option = true
  
}
resource "snowflake_table_grant" "table_prof_onlyprov_insert" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprof.name
  table_name    = snowflake_table.tableprof.name

  privilege = "INSERT"
  roles     = [snowflake_role.onlypro.name]
  with_grant_option = true
  
}

#---------------------------------------------------------------------
#Just DEV role

resource "snowflake_role" "onlydev"{
  name = "ONLYDEV"
}

resource "snowflake_role_grants" "onlydevsarah"{
  role_name = snowflake_role.onlydev.name
  users = [snowflake_user.user3.name]
}
resource "snowflake_database_grant" "grantonlydev_db2" {
  database_name = snowflake_database.db2.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.onlydev.name]

  with_grant_option = false
}
resource "snowflake_database_grant" "grantonlydev_db1" {
  database_name = snowflake_database.db1.name

  privilege = "USAGE"
  roles     = [snowflake_role.onlydev.name]

  with_grant_option = false
}

#---------------------------------
#Schemas GRANT Just DEV
resource "snowflake_schema_grant" "dev_m_devm"{
  schema_name = snowflake_schema.schemabdevm.name
  database_name = snowflake_database.db2.name
  privilege = "USAGE"
  roles = [snowflake_role.onlydev.name]
}
resource "snowflake_schema_grant" "dev_f_devf"{
  schema_name = snowflake_schema.schemabdevf.name
  database_name = snowflake_database.db2.name
  privilege = "USAGE"
  roles = [snowflake_role.onlydev.name]
}
resource "snowflake_schema_grant" "dev_m_prom"{
  schema_name = snowflake_schema.schemabprom.name
  database_name = snowflake_database.db1.name
  privilege = "USAGE"
  roles = [snowflake_role.onlydev.name]
}
resource "snowflake_schema_grant" "dev_f_prof"{
  schema_name = snowflake_schema.schemabprof.name
  database_name = snowflake_database.db1.name
  privilege = "USAGE"
  roles = [snowflake_role.onlydev.name]
}


