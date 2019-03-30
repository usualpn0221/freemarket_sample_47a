class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  has_one  :transaction
  has_many :images
  belongs_to :brand
  belongs_to :category
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :transaction
end
