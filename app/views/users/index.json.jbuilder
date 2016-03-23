json.array!(@users) do |user|
  json.extract! user, :id, :account, :password
  json.url user_url(user, format: :json)
end
