class Review < ApplicationRecord
  belongs_to :shop

  validates :comment, presence: true
  validates :rating, presence: true # TODO: only 1 to 5 integer
  validates :time, presence: true
end
