class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :shipping
  attr_accessor :token 
end
