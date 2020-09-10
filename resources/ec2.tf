# creating EC2 resources

resource "aws_instance" "instan" {
   ami = "${var.image}"
   instance_type = "t2.micro"
   subnet_id = "${var.subnet}"
   #vpc_security_group_ids = "${var.sg}"
   user_data = <<-EOF
                #!/bin/bash
                useradd a204161-CloudOps
                echo "a204161-CloudOps ALL=(ALL)NOPASSWD:ALL" >> /etc/sudoers.d/a204161-CloudOps
                EOF

   tags = {
     Name = "a204161-CloudOps_testing"
     "tr:application-asset-insight-id" = "a204161-CloudOps"
     "tr:environment" = "Prod"
     "tr:resource-owner" = "Kumaran.M"
   }

}  
