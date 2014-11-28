json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :firstname, :lastname, :is_admin, :is_editor, :is_viewer
  json.url user_url(user, format: :json)
end
