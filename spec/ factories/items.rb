FactoryBot.define do

factory :item do
    name
    description
    trade_status
    price
    user_id
    item_condition
    category_id
    brand_id
    created_at
    updated_at

    # created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    # text {"hello!"}
    # image {"hoge.png"}
    user
  end
end

