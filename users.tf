
#-------------------------------------------------------------
#USERS
resource "snowflake_user" "user1" {
  name         = "mike"
  login_name   = "mike"
  comment      = "Primer usuario - mike"
  password     = "password"
  email        = "mike@heroes.com"
  default_role            = "ADMIN"

  must_change_password = false
}

resource "snowflake_user" "user2" {
  name         = "johnny"
  login_name   = "johnny"
  comment      = "Segundo usuario - johnny"
  password     = "password"
  email        = "johnny@heroes.com"
  default_role            = "ONLYPRO"

  must_change_password = false
}

resource "snowflake_user" "user3" {
  name         = "sarah"
  login_name   = "sarah"
  comment      = "Tercer usuario - Sarah"
  password     = "password"
  email        = "sarah@heroes.com"
  default_role            = "ONLYDEV"

  must_change_password = false
}
