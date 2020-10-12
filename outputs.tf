output "private-ip-address" {
   value = "${module.local.private-ip}"
}

output "vpcidsexist" {
   value = "${module.local.vpcids}"
}
