json.array!(@suggested_events) do |suggested_event|
  json.extract! suggested_event, :id, :location_id, :category_id, :what, :when, :datetime_created
  json.url suggested_event_url(suggested_event, format: :json)
end
