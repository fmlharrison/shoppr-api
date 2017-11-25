class List < ApplicationRecord
  belongs_to :shop
  has_many :items

  validates_presence_of :total_capacity, :shop_id
end
