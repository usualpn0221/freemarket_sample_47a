FactoryBot.define do


  factory :item do
    name                 { 'neko' }
    description          { 'nekonekoneko' }
    status               { 1 }
    price                { 1000 }
    # saler_id             { 1 }
    state                { 0 }
    # category_id          { 1 }
    # brand_id             { 1 }
    user
    saizu                { 'M' }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end
