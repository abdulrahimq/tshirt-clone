json.array! @tshirts do |tshirt|
  json.extract! tshirt, :name, :description, :price
  json.url tshirt_path(tshirt, format: :json)
end
