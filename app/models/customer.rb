class Customer < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :prefecture,      numericality: { only_integer: true, other_than: 1, greater_than_or_equal_to: 2, less_than_or_equal_to: 48 }
    validates :city
    validates :house_number
    validates :phone_number
    validates :purchase_record
  end
  
  belongs_to :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture_id
end
