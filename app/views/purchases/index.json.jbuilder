json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :number_of_reservations, :price
  json.url purchase_url(purchase, format: :json)
end
