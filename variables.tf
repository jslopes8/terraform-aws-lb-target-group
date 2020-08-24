variable "create" {
    type = bool 
    default = true
}
variable "name" {
    type    = string
}
variable "port" {
    type    = number
}
variable "protocol" {
    type    = string
}
variable "vpc_id" {
    type    = string
}
variable "stickiness" {
    type    = any
    default = {}
}
variable "health_check" {
    type    = any
    default = []
}
variable "default_tags" {
    type    = map(string)
}
