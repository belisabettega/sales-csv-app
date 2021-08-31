require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  context 'when creating a purchaser' do
    it 'must have a name' do
      expect(create(:purchaser, name: nil)).to have(1).error_on(:name)
    end
  end
end
