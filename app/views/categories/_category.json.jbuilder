json.extract! category, :id, :name, :description
json.url shop_category_url(category.shop, category, format: :json)
