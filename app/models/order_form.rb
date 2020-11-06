class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code
    validates :prefecture,      numericality: { only_integer: true, other_than: 1, greater_than_or_equal_to: 2, less_than_or_equal_to: 48 }
    validates :city
    validates :house_number
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end


  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Customer.create(postal_code: postal_code, prefecture_id: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end