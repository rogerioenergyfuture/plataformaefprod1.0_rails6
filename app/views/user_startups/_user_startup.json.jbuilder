json.extract! user_startup, :id, :name, :status, :user_id, :created_at, :updated_at
json.url user_startup_url(user_startup, format: :json)
