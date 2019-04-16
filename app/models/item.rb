class Item < ApplicationRecord
  belongs_to :user
  has_one :trade
  has_many :images
  # belongs_to :brand
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :trade, update_only: true
  validates :name, :description,:price,:item_condition, presence: true
  validates :name,length: { in: 1..40 }
  validates :description,length: { in: 1..1000 }
  validates :price, numericality: true
  # validates :price, numericality: { greater_than_or_equal_to: 300}
  validates_associated :images
  validates_associated :trade
end
