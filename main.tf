# This is a Terraform configuration file that will create two EC2 instances in AWS

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"  
}

resource "aws_instance" "polkadot_node" {
  count = 2

  # Ubuntu 22.04 LTS - adjust ami based on region (aws ec2 describe-images --owners self amazon)
  ami           = "ami-0c94855ba95c574c8"  
  instance_type = "c6i.4xlarge"
 
  key_name        = "<KEY_PAIR_NAME>"
  security_groups = ["<SECURITY_GROUP_ID>"]

  tags = {
    Name = "PolkadotFullNode-${count.index}"
  }

  root_block_device {
    volume_type = "gp3"
    volume_size = 1024  # 1TB to meet the storage requirement
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "gp3"
    volume_size = 32    # To ensure there is enough space for swap and other system needs
  }
}

