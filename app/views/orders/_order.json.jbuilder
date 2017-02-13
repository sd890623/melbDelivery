json.extract! item, :id, :phone, :address, :delivery_time, :delivery_method, :note
json.url item_url(item.shop, item, format: :json)
