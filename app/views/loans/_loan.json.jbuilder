json.extract! loan, :id, :principal, :date_payment_starts, :date_loan_given, :interest_on_loan_per_month, :loan_period_in_months, :payment_cadence, :payment_day, :loaner_id, :status, :created_at, :updated_at
json.url loan_url(loan, format: :json)
