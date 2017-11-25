class Shop < ApplicationRecord
  has_one :list, :class_name => "List", :foreign_key => "shop_id", dependent: :destroy

  validates_presence_of :location, :date, :shop_kind, :shopper
end
