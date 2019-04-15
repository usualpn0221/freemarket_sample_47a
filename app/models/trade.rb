class Trade < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :buyer, class_name: "User", optional: true

  validates :postage, :delivery,:region, :shipping_date,presence: true
end
