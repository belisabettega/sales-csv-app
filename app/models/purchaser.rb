class Purchaser < ApplicationRecord
  validates :name, presence: true
  has_many :purchases
end
