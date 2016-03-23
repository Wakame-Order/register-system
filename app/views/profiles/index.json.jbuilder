json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :gender, :status_flag, :enter_year, :major
  json.url profile_url(profile, format: :json)
end
