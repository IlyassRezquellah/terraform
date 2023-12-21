#---------------------------------------------------------------
#Views PRO M
resource "snowflake_view" "viewblueeyesprom" {
depends_on = [ snowflake_database.db1,snowflake_schema.schemabprom,snowflake_table.tableprom ]
  database = snowflake_database.db1.name
  schema   = snowflake_schema.schemabprom.name
  name     = "viewblueeyes"

  comment = "comment"

  statement  = <<-SQL
    SELECT "Name", "Identity", "Publisher", "Eye color"
FROM BD_HR_PRO.SC_HR_PRO_M.TB_HR_PRO_HEROES
WHERE "Publisher" = 'Marvel Comics' AND "Eye color" = 'Blue';
SQL
}
resource "snowflake_view" "viewallheroesprom" {
    depends_on = [ snowflake_database.db1,snowflake_schema.schemabprom,snowflake_table.tableprom ]
  database = snowflake_database.db1.name
  schema   = snowflake_schema.schemabprom.name
  name     = "viewallheroes"

  comment = "comment"

  statement  = <<-SQL
    SELECT "Name", "Identity"
FROM BD_HR_PRO.SC_HR_PRO_M.TB_HR_PRO_HEROES
WHERE "Publisher" = 'DC Comics';
SQL
}
resource "snowflake_view" "viewhairprom" {
    depends_on = [ snowflake_database.db1,snowflake_schema.schemabprom,snowflake_table.tableprom ]
  database = snowflake_database.db1.name
  schema   = snowflake_schema.schemabprom.name
  name     = "viewhair"

  comment = "comment"

  statement  = <<-SQL
    SELECT "Name", "Identity"
FROM BD_HR_PRO.SC_HR_PRO_M.TB_HR_PRO_HEROES
WHERE "Hair color" = 'Black';

SQL
}

#---------------------------------------------------------------
#Views PRO F
resource "snowflake_view" "viewblueeyesprof" {
depends_on = [ snowflake_database.db1,snowflake_schema.schemabprom,snowflake_table.tableprof ]
  database = snowflake_database.db1.name
  schema   = snowflake_schema.schemabprof.name
  name     = "viewblueeyes"

  comment = "comment"

  statement  = <<-SQL
    SELECT "Name", "Identity", "Publisher", "Eye color"
FROM BD_HR_PRO.SC_HR_PRO_M.TB_HR_PRO_HEROES
WHERE "Publisher" = 'Marvel Comics' AND "Eye color" = 'Blue';
SQL
}
resource "snowflake_view" "viewallheroesprof" {
    depends_on = [ snowflake_database.db1,snowflake_schema.schemabprom,snowflake_table.tableprof ]
  database = snowflake_database.db1.name
  schema   = snowflake_schema.schemabprof.name
  name     = "viewallheroes"

  comment = "comment"

  statement  = <<-SQL
    SELECT "Name", "Identity"
FROM BD_HR_PRO.SC_HR_PRO_M.TB_HR_PRO_HEROES
WHERE "Publisher" = 'DC Comics';
SQL
}
resource "snowflake_view" "viewhairprof" {
    depends_on = [ snowflake_database.db1,snowflake_schema.schemabprom,snowflake_table.tableprof ]
  database = snowflake_database.db1.name
  schema   = snowflake_schema.schemabprof.name
  name     = "viewhair"

  comment = "comment"

  statement  = <<-SQL
    SELECT "Name", "Identity"
FROM BD_HR_PRO.SC_HR_PRO_M.TB_HR_PRO_HEROES
WHERE "Hair color" = 'Black';

SQL
}
#---------------------------------------------------------------
#Views DEV M
resource "snowflake_view" "viewblueeyesdevm" {
depends_on = [ snowflake_database.db2,snowflake_schema.schemabdevm,snowflake_table.tabledevm ]
  database = snowflake_database.db2.name
  schema   = snowflake_schema.schemabdevm.name
  name     = "viewblueeyes"

  comment = "comment"

  statement  = <<-SQL
    SELECT "Name", "Identity", "Publisher", "Eye color"
FROM BD_HR_DEV.SC_HR_DEV_F.TB_HR_DEV_HEROES
WHERE "Publisher" = 'Marvel Comics' AND "Eye color" = 'Blue';
SQL
}
resource "snowflake_view" "viewallheroesdevm" {
    depends_on = [ snowflake_database.db2,snowflake_schema.schemabprom,snowflake_table.tabledevm ]
  database = snowflake_database.db2.name
  schema   = snowflake_schema.schemabdevm.name
  name     = "viewallheroes"

  comment = "comment"

  statement  = <<-SQL
    SELECT "Name", "Identity"
FROM BD_HR_DEV.SC_HR_DEV_F.TB_HR_DEV_HEROES
WHERE "Publisher" = 'DC Comics';
SQL
}
resource "snowflake_view" "viewhairdevm" {
    depends_on = [ snowflake_database.db2,snowflake_schema.schemabprom,snowflake_table.tabledevm ]
  database = snowflake_database.db2.name
  schema   = snowflake_schema.schemabdevm.name
  name     = "viewhair"

  comment = "comment"

  statement  = <<-SQL
    SELECT "Name", "Identity"
FROM BD_HR_DEV.SC_HR_DEV_F.TB_HR_DEV_HEROES
WHERE "Hair color" = 'Black';

SQL
}
#---------------------------------------------------------------
#Views DEV F
resource "snowflake_view" "viewblueeyesdevf" {
depends_on = [ snowflake_database.db2,snowflake_schema.schemabdevm,snowflake_table.tabledevf ]
  database = snowflake_database.db2.name
  schema   = snowflake_schema.schemabdevf.name
  name     = "viewblueeyes"

  comment = "comment"

  statement  = <<-SQL
    SELECT "Name", "Identity", "Publisher", "Eye color"
FROM BD_HR_DEV.SC_HR_DEV_F.TB_HR_DEV_HEROES
WHERE "Publisher" = 'Marvel Comics' AND "Eye color" = 'Blue';
SQL
}
resource "snowflake_view" "viewallheroesdevf" {
    depends_on = [ snowflake_database.db2,snowflake_schema.schemabprom,snowflake_table.tabledevf ]
  database = snowflake_database.db2.name
  schema   = snowflake_schema.schemabdevf.name
  name     = "viewallheroes"

  comment = "comment"

  statement  = <<-SQL
    SELECT "Name", "Identity"
FROM BD_HR_DEV.SC_HR_DEV_F.TB_HR_DEV_HEROES
WHERE "Publisher" = 'DC Comics';
SQL
}
resource "snowflake_view" "viewhairdevf" {
    depends_on = [ snowflake_database.db2,snowflake_schema.schemabprom,snowflake_table.tabledevf ]
  database = snowflake_database.db2.name
  schema   = snowflake_schema.schemabdevf.name
  name     = "viewhair"

  comment = "comment"

  statement  = <<-SQL
    SELECT "Name", "Identity"
FROM BD_HR_DEV.SC_HR_DEV_F.TB_HR_DEV_HEROES
WHERE "Hair color" = 'Black';

SQL
}