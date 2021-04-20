class Shipping < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :shipping
  
end
