json.array!(@locations) do |location|
  json.extract! location, :id, :longitude, :latitude, :address, :city, :state
  json.url location_url(location, format: :json)
end
