json.extract! cart, :id, :created_at, :updated_at, :name
json.url cart_url(cart, format: :json)
