class Item < ApplicationRecord
  belongs_to :user
  has_one :trade
  has_many :images
  # belongs_to :brand
  # belongs_to :category
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :trade

  validates :item_images, length: { minimum: 1, maximum: 10}
end
