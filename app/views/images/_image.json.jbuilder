json.extract! image, :id, :url, :is_featured, :created_at, :updated_at
json.url image_url(image, format: :json)