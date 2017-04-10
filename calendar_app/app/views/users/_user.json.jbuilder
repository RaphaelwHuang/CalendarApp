json.extract! user, :id, :email, :password, :fname, :lname, :calendar_id, :created_at, :updated_at
json.url user_url(user, format: :json)
