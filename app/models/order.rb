class Order < ApplicationRecord
  acts_as_paranoid

  belongs_to :shop
  has_many :items_orders
  has_many :items

  validates :phone, presence: true
  validates :address, presence: true
  validates :delivery_time, presence: true
  validates :delivery_method, presence: true

  def add_items(cart)
    cart.each do |cart_item|
      items_orders.create! item_id: cart_item[:item_id], quantity: cart_item[:quantity]
    end
  end

  def delivery_options
    shop.takeaway_only ? %w(delivery) : %w(self delivery)
  end
end
