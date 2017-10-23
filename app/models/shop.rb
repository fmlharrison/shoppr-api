class Shop < ApplicationRecord
  has_one :list, dependent: :destroy

  validates_presence_of :location, :date, :type, :shopper
end
