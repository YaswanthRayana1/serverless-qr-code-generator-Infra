variable "user_table_name" {
  type = string
}
variable "user_hash_key" {
  type = string
}
variable "user_tag" {
  type = map(string)
  default = {
    "info" = "user table"
  }
}