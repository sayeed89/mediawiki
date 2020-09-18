variable "region" {
        default = "us-east-1"
}

variable "cidr_block" {
        default = "172.32.0.0/16"
}

variable "subnet_cidr" {
        default = "172.32.48.0/20"
}

variable "availability_zone" {
        default = "us-east-1a"
}

variable "ami" {
        default = "ami-02354e95b39ca8dec"
}

variable "instance_type" {
        default = "t2.micro"
}

variable "key" {
        default = "key_name"
}
