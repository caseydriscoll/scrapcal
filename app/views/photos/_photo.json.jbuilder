json.extract! photo, :id, :title, :caption, :user_id, :date, :created_at, :updated_at
json.url photo_url(photo, format: :json)
