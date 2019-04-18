class Profile < ApplicationRecord
  belongs_to :user

  validates :lastname,:firstname, presence: true,length: { maximum: 35 , allow_blank: true, message: "35文字以下で入力してください"}
  validates :lastnamekana,:firstnamekana, presence: true,length: { maximum: 35, message: "35文字以下で入力してください"},format: { with:/\A[ア-ン]+\z/, message: "全角カタカナ以外は使用できません" }
  validates :postnumber, presence: true,format: { with:/\A[0-9]{3}-[0-9]{4}\z/, message: "フォーマットが不適切です"}
  validates :shikuchouson, presence: true,length: {maximum: 50 ,message: "50文字以下で入力してください"}
  validates :banchi, presence: true,length: {maximum: 100 ,message: "100文字以下で入力してください"}
  validates :tatemonomei,length: {maximum: 100 ,message: "100文字以下で入力してください"}
  validates :phonenumber,format: {with:/\A[0-9]*\z/, message:"フォーマットが不適切です"}
end
