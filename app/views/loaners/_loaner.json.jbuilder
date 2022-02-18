json.extract! loaner, :id, :first_name, :last_name, :phone_number, :email, :occupation, :id_type, :id_number, :address, :is_verified, :status, :created_at, :updated_at
json.url loaner_url(loaner, format: :json)
