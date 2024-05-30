provider "aws"{
        alias="insta1"
        region="us-east-1"
}
provider "aws"{
        alias="insta2"
        region="us-east-1"
}
resource "aws_instance" "example1"{
        ami= "ami-04b70fa74e45c3917"
        instance_type="t2.large"
        provider=aws.insta1
        key_name= "aws-sign"
        tags={
        Name="master1"
        }
}
resource "aws_instance" "example2"{
        ami= "ami-04b70fa74e45c3917"
        instance_type="t2.large"
        provider=aws.insta2
        key_name= "aws-sign"
        tags={
        Name="worker"
        }
}

output "private_ips"{
        value={
        master=aws_instance.example1.private_ip
        worker=aws_instance.example2.private_ip
        }
}
