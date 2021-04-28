class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'PhoneNumber must be 11 digit Half-width numbers' }
    validates :city
    validates :house_number
    validates :token
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
  end
  
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture, city: city, house_number: house_number,
                    building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
