json.array!(@events) do |event|
  json.extract! event, :id, :group_id_id, :what, :when, :why, :where, :who_created_id, :datetime_created, :who_updated_id, :datetime_updated
  json.url event_url(event, format: :json)
end
