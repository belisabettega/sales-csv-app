class Product < ApplicationRecord
  validates :description, :price, presence: true
  has_many :purchases
end
