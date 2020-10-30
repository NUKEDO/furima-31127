class Item < ApplicationRecord
  with_options presence: true do
    validates :price
    validates :name
    validates :text
    validates :category
    validates :detail
    validates :burden
    validates :shipment_source
    validates :number_of_days
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
  
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end