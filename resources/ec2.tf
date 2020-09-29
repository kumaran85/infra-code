# creating EC2 resources

resource "aws_instance" "instan" {
   ami = "${var.image}"
   instance_type = "t2.micro"
   subnet_id = "${var.subnet}"
   vpc_security_group_ids = ["sg-0450a2eeea7f130f9"]
   user_data = <<-EOF
                #!/bin/bash
                useradd a204161-CloudOps
                echo "a204161-CloudOps ALL=(ALL)NOPASSWD:ALL" >> /etc/sudoers.d/a204161-CloudOps
                EOF

   tags = {
     Name = "a204161-CloudOps-testing"
     "tr:application-asset-insight-id" = "a204161-CloudOps"
     "tr:environment" = "pre-prod"
     "tr:resource-owner" = "Kumaran.M"
     "Action" = "To be deleted"
   }

}  
