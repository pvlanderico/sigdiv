json.extract! transaction_type, :id, :name, :operator, :created_at, :updated_at
json.url transaction_type_url(transaction_type, format: :json)
