require 'rails_helper'

RSpec.describe "DataFiles", type: :system do
  before do
    driven_by(:rack_test)
  end
  context 'when loading the index page' do
    it 'shows the label of the form' do
      visit '/'
 
      expect(page).to have_content('Upload CSV File')
    end
  end
  context 'when submitting a file' do
    it 'redirects the user to the root' do
      visit '/'
      attach_file("Upload Your File", "#{Rails.root}/test/fixtures/files/example_input.tsv")
      click_on 'Upload CSV'
      
      expect(current_path).to eq('/') 
    end
  end
end
