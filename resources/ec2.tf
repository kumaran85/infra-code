data "aws_ami" "images" {
  owners = ["060139604389"]
  most_recent = true
  
  filter { 
    name = "name"
    values = ["refinitiv-amzn2-hvm-*"]
  }
}

data "aws_vpc" "vpcs" { 

   filter {
      name  = "tag:tr:application-asset-insight-id"
      values = ["204161"]
  }
}

data "aws_subnet_ids" "subnet" { 

  vpc_id  = "${data.aws_vpc.vpcs.id}"
    filter {
       name = "tag:Name"
       values = ["*-enterprise-*"]
    }
}


data "aws_security_group" "bast" {
     filter { 
       name = "tag:Name"
       values = ["fromBastionSSH"]
     }
}

# creating EC2 resources

resource "aws_instance" "instan" {
   ami = "${data.aws_ami.images.id}"
   instance_type = "t2.micro"
   subnet_id = sort("${data.aws_subnet_ids.subnet.ids}")[0]
   vpc_security_group_ids = ["${data.aws_security_group.bast.id}", "${aws_security_group.allow-all.id}"]
   user_data = <<-EOF
                #!/bin/bash
                useradd a204161-CloudOps
                echo "a204161-CloudOps ALL=(ALL)NOPASSWD:ALL" >> /etc/sudoers.d/a204161-CloudOps
                yum install -y telnet
                EOF
   
   tags = local.tags
     
   
# Even If any changes on below attributes, TF will not trigger any EC2
   
  #lifecycle {
  #    create_before_destroy = true
  #    ignore_changes  = [
 #          tags,
 #          ami,
 #          instance_type,
           
#      ]
#  } 
}
