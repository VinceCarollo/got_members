require 'rails_helper'

RSpec.describe "As a visitor" do
  context 'on the home page' do

    it "can search for Greyjoy members" do
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

    it "can search for Tyrell members" do
      visit root_path

      select "Tyrell", :from => "house"
      click_button "Get Members"

      expect(page).to have_content('6 Members')
      expect(page).to have_css('.member', count: 6)
    end

    it "can search for Targaryen members" do
      visit root_path

      select "Targaryen", :from => "house"
      click_button "Get Members"

      expect(page).to have_content('8 Members')
      expect(page).to have_css('.member', count: 8)
    end

    it "can search for Stark members" do
      visit root_path

      select "Stark", :from => "house"
      click_button "Get Members"

      expect(page).to have_content('11 Members')
      expect(page).to have_css('.member', count: 11)
    end

    it "can search for Lannister members" do
      visit root_path

      select "Lannister", :from => "house"
      click_button "Get Members"

      expect(page).to have_content('12 Members')
      expect(page).to have_css('.member', count: 12)
    end

  end
end
