json.extract! profile, :id, :user_name, :professional_bio, :personal_bio, :created_at, :updated_at
json.url profile_url(profile, format: :json)
