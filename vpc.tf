resource "aws_vpc" "vpc-faktory" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet-faktory-1" {
  vpc_id = "${aws_vpc.vpc-faktory.id}"
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "faktory-1"
  }
}

resource "aws_subnet" "subnet-faktory-2" {
  vpc_id = "${aws_vpc.vpc-faktory.id}"
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "faktory-2"
  }
}
