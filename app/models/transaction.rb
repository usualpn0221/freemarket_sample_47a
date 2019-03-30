class Transaction < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :buyer, class_name: "User"
end
