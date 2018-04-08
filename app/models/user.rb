class User < ApplicationRecord
  has_many :items, foreign_key: :user_id
  has_many :shops, foreign_key: :shopper

  validates_presence_of :name, :email, :password_digest
end
