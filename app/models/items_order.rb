class ItemsOrder < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?

  belongs_to :item
  belongs_to :order

  validates :quantity, presence: true

  private

  def set_defaults
    self.quantity ||= 0
  end
end
