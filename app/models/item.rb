class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:condition,:shipping_fee,:prefecture,:days_to_ship
  validates :category_id,:condition_id,:shipping_fee_id,:prefecture_id,:days_to_ship_id, numericality: { other_than: 1 }
end
