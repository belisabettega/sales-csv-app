require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context 'when creating a merchant' do
    it 'validates the presence of a name' do
      record = Merchant.new(address: "Address here")
      record.validate
      expect(record.errors[:name]).to include("can't be blank")
    end
    it 'validates the presence of an address' do
      record = Merchant.new(name: "Address here")
      record.validate
      expect(record.errors[:address]).to include("can't be blank")
    end
  end
end
