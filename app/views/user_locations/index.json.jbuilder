json.array!(@user_locations) do |user_location|
  json.extract! user_location, :id, :user_id, :location_id
  json.url user_location_url(user_location, format: :json)
end
