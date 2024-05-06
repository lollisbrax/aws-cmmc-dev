resource "aws_budgets_budget" "budget" {
  name          = "Monthly Budget"
  budget_type   = "COST"
  limit_amount  = "1000"
  limit_unit    = "USD"

  time_period_start = "2023-01-01_00:00"
  time_unit         = "MONTHLY"
}