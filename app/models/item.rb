class Item < ApplicationRecord
  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  has_many :images
  belongs_to :brand, optional: true
  belongs_to :bigcategory, optional: true
  belongs_to :middlecategory, optional: true
  belongs_to :smallcategory, optional: true
  accepts_nested_attributes_for :images
end
