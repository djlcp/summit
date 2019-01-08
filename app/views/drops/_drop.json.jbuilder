json.extract! drop, :id, :title, :description, :created_at, :updated_at
json.url drop_url(drop, format: :json)
