
resource "snowflake_stage" "stage_hr_pro_f" {
  name        = "STG_HR_PRO_F"
  database    = snowflake_database.db1.name
  schema      = snowflake_schema.schemabprof.name
}
resource "snowflake_stage" "stage_hr_pro_m" {
  name        = "STG_HR_PRO_M"
  database    = snowflake_database.db1.name
  schema      = snowflake_schema.schemabprom.name
}
resource "snowflake_stage" "stage_hr_dev_f" {
  name        = "STG_HR_DEV_F"
  database    = snowflake_database.db2.name
  schema      = snowflake_schema.schemabdevf.name
}
resource "snowflake_stage" "stage_hr_dev_m" {
  name        = "STG_HR_DEV_M"
  database    = snowflake_database.db2.name
  schema      = snowflake_schema.schemabdevm.name
}

#-----------------------------------------------------------
#File format 
resource "snowflake_file_format" "file_format" {
  name        = "contact_ff_puntocoma"
  database    = snowflake_database.db1.name
  schema      = snowflake_schema.schemabprof.name
  format_type = "CSV"
  field_delimiter = ";"
}
resource "snowflake_file_format" "file_format2" {
  name        = "contact_ff_puntocoma"
  database    = snowflake_database.db1.name
  schema      = snowflake_schema.schemabprom.name
  format_type = "CSV"
  field_delimiter = ";"
}
resource "snowflake_file_format" "file_format3" {
  name        = "contact_ff_puntocoma"
  database    = snowflake_database.db2.name
  schema      = snowflake_schema.schemabdevf.name
  format_type = "CSV"
  field_delimiter = ";"
}
resource "snowflake_file_format" "file_format4" {
  name        = "contact_ff_puntocoma"
  database    = snowflake_database.db2.name
  schema      = snowflake_schema.schemabdevm.name
  format_type = "CSV"
  field_delimiter = ";"
}

#-----------------------------------------------------------
#Task
resource "snowflake_task" "task1" {
  depends_on = [ snowflake_database.db1,snowflake_schema.schemabprof,snowflake_table.tableprof ]
  comment = "my task PRO F"
  database  = snowflake_database.db1.name
  schema    = snowflake_schema.schemabprof.name

  name          = "task"
  schedule      = "120 MINUTE"
  sql_statement = "copy into TB_HR_PRO_HEROES from @STG_HR_PRO/heroes.csv file_format = contact_ff_puntocoma;"
  enabled       = true
}
resource "snowflake_task" "task2" {
  depends_on = [ snowflake_database.db1,snowflake_schema.schemabprom,snowflake_table.tableprom ]
  comment = "my task PRO M"
  database  = snowflake_database.db1.name
  schema    = snowflake_schema.schemabprom.name

  name          = "task"
  schedule      = "120 MINUTE"
  sql_statement = "copy into TB_HR_PRO_HEROES from @STG_HR_PRO/heroes.csv file_format = contact_ff_puntocoma;"
  enabled       = true
}
resource "snowflake_task" "task3" {
  depends_on = [ snowflake_database.db2,snowflake_schema.schemabdevf,snowflake_table.tabledevf ]
  comment = "my task DEV F"
  database  = snowflake_database.db2.name
  schema    = snowflake_schema.schemabdevf.name

  name          = "task"
  schedule      = "120 MINUTE"
  sql_statement = "copy into TB_HR_DEV_HEROES from @STG_HR_PRO/heroes.csv file_format = contact_ff_puntocoma;"
  enabled       = true
}
resource "snowflake_task" "task4" {
  depends_on = [ snowflake_database.db2,snowflake_schema.schemabdevm,snowflake_table.tabledevm ]
  comment = "my task DEV M"
  database  = snowflake_database.db2.name
  schema    = snowflake_schema.schemabdevm.name

  name          = "task"
  schedule      = "120 MINUTE"
  sql_statement = "copy into TB_HR_DEV_HEROES from @STG_HR_PRO/heroes.csv file_format = contact_ff_puntocoma;"
  enabled       = true
}