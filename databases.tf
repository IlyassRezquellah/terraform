#---------------------------------------------------------------
#DB
resource "snowflake_database" "db1" {
  name = "BD_HR_PRO"
  data_retention_time_in_days = 0
}
resource "snowflake_database" "db2" {
  name = "BD_HR_DEV"
  data_retention_time_in_days = 0
}


#-----------------------------------------------------------
#Schemas de BD_HR_PRO
resource "snowflake_schema" "schemabprom" {
  database = snowflake_database.db1.name
  name     = "SC_HR_PRO_M"
  comment  = "A schema."

}
resource "snowflake_schema" "schemabprof" {
  database = snowflake_database.db1.name
  name     = "SC_HR_PRO_F"
  comment  = "A schema."

}

#-----------------------------------------------------------
#Schemas de BD_HR_DEV
resource "snowflake_schema" "schemabdevm" {
  database = snowflake_database.db2.name
  name     = "SC_HR_DEV_M"
  comment  = "A schema."

}
resource "snowflake_schema" "schemabdevf" {
  database = snowflake_database.db2.name
  name     = "SC_HR_DEV_F"
  comment  = "A schema."

}

resource "snowflake_table" "tableprom" {
  database                    = snowflake_database.db1.name
  schema                      = snowflake_schema.schemabprom.name
  name                        = "TB_HR_PRO_HEROES"
  comment                     = "A table."
  

  column {
    name     = "Name"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Identity"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Publisher"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Gender"
    type     = "text"
    nullable = true
  }
  column {
    name     = "First appearance"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Eye color"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Hair color"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Strength"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Intelligence"
    type     = "text"
    nullable = true
  }

}

resource "snowflake_table" "tableprof" {
  database                    = snowflake_database.db1.name
  schema                      = snowflake_schema.schemabprof.name
  name                        = "TB_HR_PRO_HEROES"
  comment                     = "A table."
  

 column {
    name     = "Name"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Identity"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Publisher"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Gender"
    type     = "text"
    nullable = true
  }
  column {
    name     = "First appearance"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Eye color"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Hair color"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Strength"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Intelligence"
    type     = "text"
    nullable = true
  }

}
resource "snowflake_table" "tabledevm" {
  database                    = snowflake_database.db2.name
  schema                      = snowflake_schema.schemabdevm.name
  name                        = "TB_HR_DEV_HEROES"
  comment                     = "A table."
  

  column {
    name     = "Name"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Identity"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Publisher"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Gender"
    type     = "text"
    nullable = true
  }
  column {
    name     = "First appearance"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Eye color"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Hair color"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Strength"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Intelligence"
    type     = "text"
    nullable = true
  }

}

resource "snowflake_table" "tabledevf" {
  database                    = snowflake_database.db2.name
  schema                      = snowflake_schema.schemabdevf.name
  name                        = "TB_HR_DEV_HEROES"
  comment                     = "A table."
  

  column {
    name     = "Name"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Identity"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Publisher"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Gender"
    type     = "text"
    nullable = true
  }
  column {
    name     = "First appearance"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Eye color"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Hair color"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Strength"
    type     = "text"
    nullable = true
  }
  column {
    name     = "Intelligence"
    type     = "text"
    nullable = true
  }

} 

