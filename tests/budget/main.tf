module "budget" {
  source = "../.."

  budget = {
    name         = "tardigrade-test-budget-${local.id}"
    limit_amount = "100"
  }
}

locals {
  id = random_string.this.result
}

resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
  numeric = false
}
