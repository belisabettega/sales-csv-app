require 'rails_helper'

RSpec.describe 'DataFiles', type: :system do
  before do
    driven_by(:rack_test)
  end
  context 'when loading the index page' do
    it 'shows the label of the form' do
      visit '/'
 
      expect(page).to have_content('Sales control App')
    end
  end
  context 'when submitting a file' do
    it 'redirects the user to the root' do
      visit '/'
      attach_file("Upload Your File", "#{Rails.root}/test/fixtures/files/example_input.tsv")
      click_on 'Sum up!'
      
      expect(current_path).to eq('/') 
    end
    it 'creates merchant entities' do
      visit '/'
      attach_file("Upload Your File", "#{Rails.root}/test/fixtures/files/example_input.tsv")
      expect{ click_on 'Sum up!' }.to change{ Merchant.count }.by(3)
    end
    it 'creates purchasers entities' do
      visit '/'
      attach_file("Upload Your File", "#{Rails.root}/test/fixtures/files/example_input.tsv")
      expect{ click_on 'Sum up!' }.to change{ Purchaser.count }.by(4)
    end
    it 'creates purchases entities' do
      visit '/'
      attach_file("Upload Your File", "#{Rails.root}/test/fixtures/files/example_input.tsv")
      expect{ click_on 'Sum up!' }.to change{ Purchase.count }.by(4)
    end
    it 'creates products entities' do
      visit '/'
      attach_file("Upload Your File", "#{Rails.root}/test/fixtures/files/example_input.tsv")
      expect{ click_on 'Sum up!' }.to change{ Product.count }.by(3)
    end
  end
end
