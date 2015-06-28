json.array!(@locations) do |location|
  json.extract! location, :id, :name, :province, :description
  json.url location_url(location, format: :json)
end
