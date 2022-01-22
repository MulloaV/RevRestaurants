json.extract! restaurant, :id, :name, :address, :rating, :chef_name, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
