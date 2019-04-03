FactoryBot.define do
  factory :user do
    nickname              { 'neko' }
    sequence(:email) {Faker::Internet.email}
    password              { 'nekoneko' }
    password_confirmation { 'nekoneko' }
  end
end



