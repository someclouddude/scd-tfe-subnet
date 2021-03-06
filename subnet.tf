data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "SomeCloudDude"

    workspaces {
      name = "scd-tfe-vpc"
  }
}
}

resource "aws_subnet" "test" {
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
  cidr_block = "10.51.32.0/25"
}
