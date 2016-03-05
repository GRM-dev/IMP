json.array!(@users) do |user|
  json.extract! user, :id, :visible_name, :email, :password_digest, :was_activated, :active
  json.url user_url(user, format: :json)
end
