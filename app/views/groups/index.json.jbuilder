json.array!(@groups) do |group|
  json.extract! group, :id, :name, :image, :datetime_create, :datetime_updated, :who_created, :who_updated, :based_in
  json.url group_url(group, format: :json)
end
