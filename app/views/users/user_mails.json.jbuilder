json.array!(@users) do |user|
  json.extract! user, :id, :visible_name, :email, :current_avatar
end
