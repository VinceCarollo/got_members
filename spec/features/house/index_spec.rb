require 'rails_helper'

RSpec.describe "As a visitor" do
  context 'on the home page' do

    it "can search for houses" do
      visit root_path

      select "Greyjoy", :from => "house"
      click_button "Get Members"

      expect(current_path).to eq(search_path)
      expect(current_url).to include('house=Greyjoy')

      expect(page).to have_content('7 Members')
      expect(page).to have_css('.member', count: 7)

      within(first('.member')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.id')
      end
    end

  end
end
