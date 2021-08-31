require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  context 'when creating a purchaser' do
    it 'validates the presence of a name' do
      record = Purchaser.new
      record.validate
      expect(record.errors[:name]).to include("can't be blank")
    end
  end
end
