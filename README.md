# terraform-aws-tardigrade-budget
Terraform module for managing an AWS Budget

<!-- BEGIN TFDOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_budget"></a> [budget](#input\_budget) | Object of inputs for AWS Budget configuration | <pre>object({<br>    name         = string<br>    limit_amount = string<br><br>    account_id        = optional(string)<br>    budget_type       = optional(string, "COST")<br>    limit_unit        = optional(string, "USD")<br>    time_period_end   = optional(string)<br>    time_period_start = optional(string)<br>    time_unit         = optional(string, "MONTHLY")<br><br>    auto_adjust_data = optional(object({<br>      auto_adjust_type      = string<br>      last_auto_adjust_time = optional(string)<br><br>      historical_options = optional(object({<br>        budget_adjustment_period   = string<br>        lookback_available_periods = optional(string)<br>      }))<br>    }))<br><br>    cost_filters = optional(list(object({<br>      name   = string<br>      values = list(string)<br>    })), [])<br><br>    cost_types = optional(object({<br>      include_credit             = optional(bool, true)<br>      include_discount           = optional(bool, true)<br>      include_other_subscription = optional(bool, true)<br>      include_recurring          = optional(bool, true)<br>      include_refund             = optional(bool, true)<br>      include_subscription       = optional(bool, true)<br>      include_support            = optional(bool, true)<br>      include_tax                = optional(bool, true)<br>      include_upfront            = optional(bool, true)<br>      use_amortized              = optional(bool, false)<br>      use_blended                = optional(bool, false)<br>    }), {})<br><br>    notifications = optional(list(object({<br>      comparison_operator        = string<br>      threshold                  = string<br>      threshold_type             = string<br>      notification_type          = string<br>      subscriber_email_addresses = optional(list(string))<br>      subscriber_sns_topic_arns  = optional(list(string))<br>    })), [])<br><br>    planned_limits = optional(list(object({<br>      amount     = string<br>      start_time = string<br>      unit       = string<br>    })), [])<br>  })</pre> | n/a | yes |

## Outputs

No outputs.

<!-- END TFDOCS -->
