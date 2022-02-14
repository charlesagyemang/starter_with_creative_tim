json.extract! investor, :id, :first_name, :last_name, :email, :phone_number, :position, :details, :occupation, :created_at, :updated_at
json.url investor_url(investor, format: :json)
