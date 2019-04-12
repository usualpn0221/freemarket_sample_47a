class Item < ApplicationRecord
  belongs_to :user
  has_one :trade
  has_many :images
  # belongs_to :brand
  # belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :trade
end
