class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :trades
  has_many :creditcards
  has_many :comments
  has_many :uservaluations,foreign_key: "evaluateduser_id", class_name: "Uservaluation"
  has_one  :profile,dependent: :destroy
  has_one  :phonenumber,dependent: :destroy
end
