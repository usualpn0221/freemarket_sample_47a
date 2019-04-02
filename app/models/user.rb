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
  has_one  :profile

  accepts_nested_attributes_for :profile
  validates :nickname, presence: true,length: { maximum: 20 }
  validates :firstname, presence: true,length: { maximum: 35 }
  validates :lastname, presence: true,length: { maximum: 35 }
  validates :firstnamekana, presence: true,length: { maximum: 35 }
  validates :lastnamekana, presence: true,length: { maximum: 35 }
  validates :birthdyear, presence: true,
  validates :birthmonth, presence: true,
  validates :birthday, presence: true,
  validates :postnumber,length:, format: {with: /^[0-9]{3}-[0-9]{4}$/}
  validates :shikuchouson,length: { maximum: 50 }
  validates :banchi,length: { maximum: 100 }
  validates :tatemonomei,length: { maximum: 100 }
  validates :phonenumber,presence: true,uniqueness: true, format: { with:  /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/}
end
