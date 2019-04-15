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
