json.extract! schedule, :id, :name, :start_time, :end_time, :start_day, :end_day, :created_at, :updated_at
json.url event_url(schedule, format: :json)
