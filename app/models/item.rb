class Item < ApplicationRecord
  with_options presence: true do
    validates :price,             numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10_000_000 }
    validates :name,              length: { maximum: 40 }
    validates :text,              length: { maximum: 1000 }
    validates :category_id
    validates :detail_id
    validates :burden_id
    validates :shipment_source_id
    validates :number_of_days_id
    validates :image
  end

  with_options numericality: { only_integer: true, other_than: 1, greater_than_or_equal_to: 2 } do
    validates :category_id,         numericality: { less_than_or_equal_to: 11 }
    validates :detail_id,           numericality: { less_than_or_equal_to: 7 }
    validates :burden_id,           numericality: { less_than_or_equal_to: 3 }
    validates :shipment_source_id,  numericality: { less_than_or_equal_to: 48 }
    validates :number_of_days_id,   numericality: { less_than_or_equal_to: 4 }
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
