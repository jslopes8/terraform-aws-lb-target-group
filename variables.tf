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
    type    = map(string)
    default = {}
}
variable "health_check" {
    type    = list(map(string))
    default = []
}
variable "default_tags" {
    type    = map(string)
}
