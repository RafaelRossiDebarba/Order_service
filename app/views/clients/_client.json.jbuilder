json.extract! client, :id, :name, :address, :city, :created_at, :updated_at
json.url client_url(client, format: :json)
