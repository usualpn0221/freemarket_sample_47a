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
  validates_associated :images
  validates_associated :trade
  def set_ladies_items
    @ladies_items = Item.where(category_id:1).includes(:user).limit(4).order("created_at DESC")
  end
  def set_mens_items
    @mens_items = Item.where(category_id:2).includes(:user).limit(4).order("created_at DESC")
  end
  def set_kids_items
    @kids_items = Item.where(category_id:3).includes(:user).limit(4).order("created_at DESC")
  end
  def set_cosme_items
    @cosme_items = Item.where(category_id:7).includes(:user).limit(4).order("created_at DESC")
  end
end
