class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_fee, :prefecture, :days_to_ship
  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :product
    validates :information
    validates :image
    with_options format: { with: /\A[0-9]+\z/, message: '半角数字で入力して下さい' } do
      validates :selling_price, numericality: { in: 300..9_999_999 }
    end
  end
end
