require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'when creating a product' do
    it 'validates the presence of a description' do
      record = Product.new(description: "Description here")
      record.validate
      expect(record.errors[:price]).to include("can't be blank")
    end
    it 'validates the presence of an address' do
      record = Product.new(price: 23)
      record.validate
      expect(record.errors[:description]).to include("can't be blank")
    end
  end
end
