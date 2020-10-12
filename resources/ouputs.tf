output "private-ip" {
  value = "${aws_instance.instan.private_ip}"
}

output "vpcids" {
   value = "${data.aws_vpc.vpcs.id}"
}
