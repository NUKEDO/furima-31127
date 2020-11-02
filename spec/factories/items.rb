FactoryBot.define do
  factory :item do
    price               { '800000' }
    name                { '遊戯王カード' }
    text                { '画像のカード１枚の出品です。画像で状態をご確認の上、ノークレームノーリターンでお願いします。' }
    category_id         { '4' }
    detail_id           { '3' }
    burden_id           { '2' }
    shipment_source_id  { '15' }
    number_of_days_id   { '2' }
    association :user
  end
end
