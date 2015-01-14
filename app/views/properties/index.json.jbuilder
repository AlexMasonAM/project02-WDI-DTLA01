json.array!(@properties) do |property|
  json.extract! property, :id, :address, :list_price, :sale_price, :fix_costs, :time_held
  json.url property_url(property, format: :json)
end
