module ShopsHelper
  def shop_status(shop)
    label_type = open?(shop) ? 'primary' : 'danger'
    status = open?(shop) ? '营业中' : '结束营业'
    content_tag :span, status, class: "label label-#{label_type}"
  end

  def shop_delivery_method(shop)
    '墨尔本送餐配送'
  end

  private

  def open?(shop)
    current_hour = Time.now.hour.to_i
    current_hour.between? shop.open_hour, shop.close_hour
  end
end
