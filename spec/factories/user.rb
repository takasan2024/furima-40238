FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {Faker::Name.name}
    last_name_kana {Faker::Name.name}
    first_name {Faker::Name.name}
    first_name_kana {Faker::Name.name}
    date_of_birth {Faker::Date.birthday}
    nickname {Faker::Name.name}
  end
end