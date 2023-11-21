json.extract! artwork, :id, :title, :description, :user_id, :created_at, :updated_at
json.url artwork_url(artwork, format: :json)
