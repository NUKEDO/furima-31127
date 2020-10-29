FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '123abc' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_katakana  { 'ヤマダ' }
    first_name_katakana   { 'タロウ' }
    birthday              { '1990-10-29' }
  end
end
