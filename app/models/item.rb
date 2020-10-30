class Item < ApplicationRecord
  with_options precense: true do
    validates :price
    validates :name
    validates :text
    validates :category_id
    validates :detail_id
    validates :burden_id
    validates :shipment_source_id
    validates :number_of_days_id
  end

  belongs_to :user
  has_one_attached :image
end