resource "aws_budgets_budget" "this" {
  name         = var.budget.name
  budget_type  = var.budget.budget_type
  limit_amount = var.budget.limit_amount
  limit_unit   = var.budget.limit_unit
  time_unit    = var.budget.time_unit

  account_id        = var.budget.account_id
  time_period_end   = var.budget.time_period_end
  time_period_start = var.budget.time_period_start

  cost_types {
    include_credit             = var.budget.cost_types.include_credit
    include_discount           = var.budget.cost_types.include_discount
    include_other_subscription = var.budget.cost_types.include_other_subscription
    include_recurring          = var.budget.cost_types.include_recurring
    include_refund             = var.budget.cost_types.include_refund
    include_subscription       = var.budget.cost_types.include_subscription
    include_support            = var.budget.cost_types.include_support
    include_tax                = var.budget.cost_types.include_tax
    include_upfront            = var.budget.cost_types.include_upfront
    use_amortized              = var.budget.cost_types.use_amortized
    use_blended                = var.budget.cost_types.use_blended
  }

  dynamic "auto_adjust_data" {
    for_each = var.budget.auto_adjust_data != null ? [var.budget.auto_adjust_data] : []

    content {
      auto_adjust_type      = auto_adjust_data.value.auto_adjust_type
      last_auto_adjust_time = auto_adjust_data.value.last_auto_adjust_time

      dynamic "historical_options" {
        for_each = auto_adjust_data.value.historical_options != null ? [auto_adjust_data.value.historical_options] : []

        content {
          budget_adjustment_period   = historical_options.value.budget_adjustment_period
          lookback_available_periods = historical_options.value.lookback_available_periods
        }
      }
    }
  }

  dynamic "cost_filter" {
    for_each = var.budget.cost_filters

    content {
      name   = cost_filter.value.name
      values = cost_filter.value.values
    }
  }

  dynamic "notification" {
    for_each = var.budget.notifications

    content {
      comparison_operator        = notification.value.comparison_operator
      notification_type          = notification.value.notification_type
      threshold                  = notification.value.threshold
      threshold_type             = notification.value.threshold_type
      subscriber_email_addresses = notification.value.subscriber_email_addresses
      subscriber_sns_topic_arns  = notification.value.subscriber_sns_topic_arns
    }
  }

  dynamic "planned_limit" {
    for_each = var.budget.planned_limits

    content {
      amount     = planned_limit.value.amount
      start_time = planned_limit.value.start_time
      unit       = planned_limit.value.unit
    }
  }
}
