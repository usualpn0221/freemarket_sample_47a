class Phonenumber < ApplicationRecord
  belongs_to :user
  validates :phonenumber,presence: true,uniqueness: true, format: { with:  /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/}
end
