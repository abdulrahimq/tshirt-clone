json.array! @tshirts do |tshirt|
  json.extract! tshirt, :name, :description
  json.photoUrl url_for(tshirt.photo)
end
