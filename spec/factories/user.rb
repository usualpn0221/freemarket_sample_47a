FactoryBot.define do
  factory :user do
    nickname              { 'neko' }
    sequence(:email) {Faker::Internet.email}
    password              { 'nekoneko' }
    password_confirmation { 'nekoneko' }
    lastname              { 'ネコネコ' }
    firstname              { 'ネコネコ' }
    lastnamekana              { 'ネコ' }
    firstnamekana              { 'ネコネコ' }
    birthyear              { '2000' }
    birthmonth              { '4' }
    birthday              { '23' }
  end
end



