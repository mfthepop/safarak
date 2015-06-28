json.array!(@tours) do |tour|
  json.extract! tour, :id, :departure_date, :departure_time, :departure_location, :quorum
  json.url tour_url(tour, format: :json)
end
