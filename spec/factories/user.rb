FactoryBot.define do
  factory :user do
    email {'1a'+Faker::Internet.email}
    password  {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {"佐藤"}
    last_name_kana {"サトウ"}
    first_name {"一郎"}
    first_name_kana {"イチロウ"}
    date_of_birth {Faker::Date.birthday}
    nickname {Faker::Name.name}
  end
end