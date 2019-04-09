json.array! @items do |item|
    json.extract! item, :quantity, :tshirt_id
end