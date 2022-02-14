json.extract! contribution, :id, :references, :principal, :period_start, :period_end, :interest, :amount, :created_at, :updated_at
json.url contribution_url(contribution, format: :json)
