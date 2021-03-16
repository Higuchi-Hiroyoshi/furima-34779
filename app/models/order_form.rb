class OrderForm
  include ActiveModel::Model
  attr_accessor :zip_code, :shipping_area_id, :city, :street_address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :shipping_area_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, shipping_area_id: shipping_area_id, city: city, street_address: street_address,
                             building: building, phone_number: phone_number, order_id: order_id)
  end
end