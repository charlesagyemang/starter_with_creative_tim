json.extract! loan_payment, :id, :loaner_id, :loan_id, :mode, :amount, :status, :next_payment_date, :created_at, :updated_at
json.url loan_payment_url(loan_payment, format: :json)
