FactoryBot.define do
  factory :user do
    nickname              { 'neko' }
    sequence(:email) {Faker::Internet.email}
    password              { 'nekoneko' }
    password_confirmation { 'nekoneko' }
    # created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    # updated_at { Faker::Time.between(Time.now, :all) }
  end
end



