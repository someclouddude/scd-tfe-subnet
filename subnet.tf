data "terraforom_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "SomeCloudDude"

    workspaces {
      name = "scd/scd-tfe-vpc"
  }
}
}

resource "aws_subnet" "test" {
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
  cidr_block = "10.51.3.0/25"
}
