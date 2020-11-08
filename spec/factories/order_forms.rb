FactoryBot.define do
  factory :order_form do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '980-0001' }
    prefecture_id { '5' }
    city          { 'S市' }
    house_number  { '杜王町' }
    building_name { 'アンジェロ岩' }
    phone_number  { '0212345678' }
    user_id       { '8' }
    item_id       { '5' }
  end
end
