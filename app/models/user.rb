class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,

         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

  has_many :cards
  has_many :items
  has_many :trades
  has_many :creditcards
  has_many :comments
  has_many :uservaluations,foreign_key: "evaluateduser_id", class_name: "Uservaluation"
  has_one  :profile,dependent: :destroy
  has_one  :phonenumber,dependent: :destroy
  validates :nickname, presence: true,length: { maximum: 20 ,message: "20文字以下で入力してください"}
  validates :email,presence: true,uniqueness: { message: "メールアドレスに誤りがあります。ご確認いただき、正しく変更してください。" },format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*[a-zA-Z]+\z/, allow_blank: true, message: "フォーマットが不適切です" }
  validates :password,presence: true,format: { with: /\A(?=.*[^\d])+/, allow_blank: true, message: "数字のみのパスワードは設定できません" }
  validates :lastname, presence: true,length: { maximum: 35 , allow_blank: true, message: "姓 は 35 文字までです"},format: { with: /\A[^a-zA-Z0-9.!#$%&"'*+\/=?^_`{|}~-]+\z/, message: "姓 に数字や特殊文字は使用できません" }
  validates :firstname, presence: true,length: { maximum: 35, allow_blank: true, message: "名 は 35 文字までです" },format: { with: /\A[^a-zA-Z0-9.!#$%&'"*+\/=?^_`{|}~-]+\z/, message: "名 に数字や特殊文字は使用できません" }
  validates :lastnamekana, presence: true,length: { maximum: 35, allow_blank: true, message: "姓カナ は 35 文字までです" },format: { with:/\A[ア-ン]+\z/, message: "姓カナ に数字や特殊文字は使用できません" }
  validates :firstnamekana, presence: true,length: { maximum: 35, allow_blank: true, message: "名カナ は 35 文字までです" },format: { with:/\A[ア-ン]+\z/, message: "名カナ に数字や特殊文字は使用できません" }
  validates :birthyear,:birthmonth,:birthday,:password_confirmation, presence: true
  has_many :snsCredentials, dependent: :destroy
  def self.find_or_create_from_auth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = self.find_or_create_by(email: auth.info.email) do |user|
            user.nickname = auth.info.name
            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]
      end
          SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
    end
    return user
  end
end
