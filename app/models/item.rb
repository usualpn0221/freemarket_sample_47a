class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :images
  belongs_to :brand
  belongs_to :bigcategory
  belongs_to :middlecategory
  belongs_to :smallcategory
end
