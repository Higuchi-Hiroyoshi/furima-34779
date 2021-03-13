class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :date_of_shipment

  with_options presence: true do
    validates :image
    validates :product_name
    validates :description_of_item
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_condition_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :date_of_shipment_id
  end

  belongs_to :user
  has_one :order
  has_many :comments
  has_one_attached :image
end
