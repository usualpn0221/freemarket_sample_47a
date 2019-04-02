FactoryBot.define do
  factory :user do
    nickname              {"testname"}
    email                 {"test@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    lastname              {"testlastnam}"
    firstname             {"testfirstname"}
    lastnamekana         {"testlastname_kana"}
    firstnamekana        {"testfirstname_kana"}
    postnumber            {"000-0000"}
    prefecture            {"千葉県"}
    shikuchouson          {"市川市"}
    banchi                 {"テスト町"}}
    tatemonomei              {"テストビル"}
    birthday                {"2"}
    birthmonth              {"4"}
    birthyear              {"2019"}
    phone_number          {"080-1234-5678"}
    number           {"0000-0000-0000-0000"}
    expyear          {"1950"}
    expmonth         {"7"}
    sequritycode     {"111"}
  end
end
