variable "budget" {
  description = "Object of inputs for AWS Budget configuration"
  type = object({
    name         = string
    limit_amount = string

    account_id        = optional(string)
    budget_type       = optional(string, "COST")
    limit_unit        = optional(string, "USD")
    time_period_end   = optional(string)
    time_period_start = optional(string)
    time_unit         = optional(string, "MONTHLY")

    auto_adjust_data = optional(object({
      auto_adjust_type      = string
      last_auto_adjust_time = optional(string)

      historical_options = optional(object({
        budget_adjustment_period   = string
        lookback_available_periods = optional(string)
      }))
    }))

    cost_filters = optional(list(object({
      name   = string
      values = list(string)
    })), [])

    cost_types = optional(object({
      include_credit             = optional(bool, true)
      include_discount           = optional(bool, true)
      include_other_subscription = optional(bool, true)
      include_recurring          = optional(bool, true)
      include_refund             = optional(bool, true)
      include_subscription       = optional(bool, true)
      include_support            = optional(bool, true)
      include_tax                = optional(bool, true)
      include_upfront            = optional(bool, true)
      use_amortized              = optional(bool, false)
      use_blended                = optional(bool, false)
    }), {})

    notifications = optional(list(object({
      comparison_operator        = string
      threshold                  = string
      threshold_type             = string
      notification_type          = string
      subscriber_email_addresses = optional(list(string))
      subscriber_sns_topic_arns  = optional(list(string))
    })), [])

    planned_limits = optional(list(object({
      amount     = string
      start_time = string
      unit       = string
    })), [])
  })
}
