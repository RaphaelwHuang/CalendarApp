json.extract! event, :id, :name, :starting_time, :ending_time, :start_day,  :end_day, :created_at, :updated_at
json.url event_url(event, format: :json)
