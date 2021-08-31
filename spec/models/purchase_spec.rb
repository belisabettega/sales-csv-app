require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'purchases associations' do
    context 'with belong to association' do
      it { should respond_to(:merchant) }
      it { should respond_to(:product) }
      it { should respond_to(:purchaser) }
      it { should respond_to(:data_file) }
    end
  end
end
