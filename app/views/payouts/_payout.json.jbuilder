json.extract! payout, :id, :investor_id, :contribution_id, :amount, :date, :created_at, :updated_at
json.url payout_url(payout, format: :json)
