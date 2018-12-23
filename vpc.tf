resource "aws_vpc" "faktory-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "faktory-submet-1a" {
  vpc_id = "${aws_vpc.faktory-vpc.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "faktory-submet-1a"
  }
}

resource "aws_subnet" "faktory-submet-1c" {
  vpc_id = "${aws_vpc.faktory-vpc.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "faktory-submet-1c"
  }
}

resource "aws_internet_gateway" "faktory-gw" {
  vpc_id = "${aws_vpc.faktory-vpc.id}"
}

resource "aws_route_table" "faktory-rt" {
  vpc_id = "${aws_vpc.faktory-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.faktory-gw.id}"
  }
}

resource "aws_route_table_association" "faktory-rt-assoc-1a" {
  subnet_id      = "${aws_subnet.faktory-submet-1a.id}"
  route_table_id = "${aws_route_table.faktory-rt.id}"
}

resource "aws_route_table_association" "faktory-rt-assoc-1c" {
  subnet_id      = "${aws_subnet.faktory-submet-1c.id}"
  route_table_id = "${aws_route_table.faktory-rt.id}"
}
