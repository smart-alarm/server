json.array!(@user_history_records) do |user_history_record|
  json.extract! user_history_record, :id
  json.url user_history_record_url(user_history_record, format: :json)
end
