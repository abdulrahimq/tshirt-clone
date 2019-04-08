json.array! @tshirts do |tshirt|
  json.extract! tshirt, :name, :description
end
