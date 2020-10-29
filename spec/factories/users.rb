FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number:2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name
    first_name
    family_name_katakana
    first_name_katakana
    birthday
  end
end