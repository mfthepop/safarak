json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :city, :province, :date_of_birth
  json.url profile_url(profile, format: :json)
end
