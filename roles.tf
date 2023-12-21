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
#Tables  GRANT ADMIN
resource "snowflake_table_grant" "table_prom_admin" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprom.name
  table_name    = snowflake_table.tableprom.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
  
}
resource "snowflake_table_grant" "table_prof_admin" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db1.name
  schema_name   = snowflake_schema.schemabprof.name
  table_name    = snowflake_table.tableprof.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
  
}
resource "snowflake_table_grant" "table_devm_admin" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevm.name
  table_name    = snowflake_table.tabledevm.name

  privilege = "ALL PRIVILEGES"
  roles     = [snowflake_role.admin.name]
  with_grant_option = true
  
}
resource "snowflake_table_grant" "table_devf_admin" {
    depends_on = [ snowflake_user.user1 ]
  database_name = snowflake_database.db2.name
  schema_name   = snowflake_schema.schemabdevf.name
  table_name    = snowflake_table.tabledevf.name

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