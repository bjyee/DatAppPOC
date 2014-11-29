json.array!(@groups) do |group|
  json.extract! group, :id, :name, :image, :who_created_id, :datetime_created, :who_updated_id, :datetime_updated, :based_in_id
  json.url group_url(group, format: :json)
end
