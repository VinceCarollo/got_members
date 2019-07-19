require 'rails_helper'

RSpec.describe "As a visitor" do
  context 'on the home page' do

    # As a user
    # When I visit "/"
    # And I select "Greyjoy" from the dropdown
    # And I click on "Get Members"
    # Then my path should be "/search" with "house=greyjoy" in the parameters
    # And I should see a message "7 Members"
    # And I should see a list of the 7 members of House Greyjoy
    # And I should see a name and id for each member.

    it "can search for houses" do
      visit root_path

      select "Greyjoy", :from => "house"
      click_button "Get Members"

      expect(current_path).to eq(search_path)
      expect(current_url).to include('house=greyjoy')

      expect(page).to have_content('7 members')
      expect(page).to have_css('.member', count: 7)

      within(first('.member')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.id')
      end
    end

  end
end
