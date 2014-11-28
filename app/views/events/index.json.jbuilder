json.array!(@events) do |event|
  json.extract! event, :id, :group_id, :what, :when, :why, :where, :who_created, :datetime_created, :who_updated, :datetime_updated
  json.url event_url(event, format: :json)
end
