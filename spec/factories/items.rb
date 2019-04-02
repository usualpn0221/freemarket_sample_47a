FactoryBot.define do


  factory :item do
    name                 { 'neko' }
    description          { 'nekonekoneko' }
    trade_status         { 1 }
    price                { 1000 }
    item_condition       { 0 }
    category_id          { 1 }
    brand_id             { 1 }
    user
    saizu                { 'M' }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end
