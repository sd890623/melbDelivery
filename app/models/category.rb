class Category < ApplicationRecord
  belongs_to :shop
  has_many :items

  validates :name, presence: true
end
