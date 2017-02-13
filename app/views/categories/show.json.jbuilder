json.extract! @category, :id, :name, :description
json.url shop_category_url(@category.shop, @category, format: :json)
json.items(@category.items) do |item|
  json.extract! item, :id, :name, :description, :price, :stock, :image
  json.url item_url(item)
end
