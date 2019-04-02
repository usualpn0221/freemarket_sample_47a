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
  accepts_nested_attributes_for :creditcards

  validates :nickname, presence: true,length: { maximum: 20 }
  validates :firstname, presence: true,length: { maximum: 35 }
  validates :lastname, presence: true,length: { maximum: 35 }
  validates :firstnamekana, presence: true,length: { maximum: 35 }
  validates :lastnamekana, presence: true,length: { maximum: 35 }
  validates :birthyear, presence: true
  validates :birthmonth, presence: true
  validates :birthday, presence: true
  validates :postnumber, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :shikuchouson,length: { maximum: 50 }
  validates :banchi,length: { maximum: 100 }
  validates :tatemonomei,length: { maximum: 100 }
  validates :phonenumber,presence: true,uniqueness: true, format: { with:  /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/}
  validates :number, presence: true, format: { with: /\A[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}\z/}
  validates :expyear, presence: true
  validates :expmonth, presence: true
  validates :securitycose, presence: true, format: {with: /\A[0-9]{3,4}\z/}

end
