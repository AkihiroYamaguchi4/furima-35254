class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :days_to_ship
  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :product
    validates :information
    validates :images
    validates :selling_price
  end
  validates :selling_price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
  validates :selling_price, format: { with: /\A[0-9]+\z/, message: '半角数字で入力して下さい' }
end
