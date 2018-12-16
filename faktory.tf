data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
}

resource "aws_ecs_task_definition" "esmpub-faktory-server-task" {
  family = "faktory-task"
  container_definitions = "${file("faktory/container_definitions.json")}"

  execution_role_arn = "${data.aws_iam_role.ecs_task_execution_role.arn}" #"arn:aws:iam::548673361492:role/ecsTaskExecutionRole"
  network_mode = "awsvpc"
  cpu = 256
  memory = 512
  requires_compatibilities = [
    "FARGATE"
  ]
}

resource "aws_ecs_cluster" "esmpub-faktory-server-cluster" {
  name = "faktory-cluster"
}
