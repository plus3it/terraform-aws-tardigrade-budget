module "budget" {
  source = "../.."

  budget = {
    name         = "tardigrade-test-budget-${local.id}"
    limit_amount = "100"

    notifications = [
      {
        comparison_operator = "GREATER_THAN"
        threshold           = "80"
        threshold_type      = "PERCENTAGE"
        notification_type   = "ACTUAL"
        subscriber_email_addresses = [
          "tardigrade-test@example.com",
        ]
      }
    ]
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
