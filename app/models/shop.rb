class Shop < ApplicationRecord
  acts_as_paranoid

  has_many :items, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :orders
  has_many :reviews

  mount_uploader :image, ShopImageUploader

  validates :name, presence: true
  validates :mobile, presence: true
  validates :address_street, presence: true
  validates :address_suburb, presence: true

  def address
    [address_street, address_suburb].join ','
  end
end
