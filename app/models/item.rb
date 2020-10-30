class Item < ApplicationRecord
  with_options presence: true do
    validates :price,             numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
    validates :name,              length: { maximum: 40 }
    validates :text,              length: { maximum: 1000 }
    validates :category_id
    validates :detail_id
    validates :burden_id
    validates :shipment_source_id
    validates :number_of_days_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :detail_id
    validates :burden_id
    validates :shipment_source_id
    validates :number_of_days_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :detail
  belongs_to_active_hash :burden
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :number_of_day
end