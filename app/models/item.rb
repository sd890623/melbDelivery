class Item < ApplicationRecord
  belongs_to :shop
  belongs_to :category
  has_many :orders
  has_many :items_orders

  mount_uploader :image, ShopImageUploader

  validates :name, presence: true
  validates :price, presence: true, numericality: { greate_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { greate_than_or_equal_to: 0 }

  def available_categories
    shop.categories
  end
end
