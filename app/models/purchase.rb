class Purchase < ApplicationRecord
  belongs_to :merchant
  belongs_to :product
  belongs_to :purchaser
  belongs_to :data_file
end
