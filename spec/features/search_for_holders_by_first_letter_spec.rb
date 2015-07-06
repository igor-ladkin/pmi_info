require 'rails_helper'

feature 'Search for current holders by first letter of their last name', '
  In order to get a list of current holders
  As a user
  I want to be able to search by first letter of their last name

' do
  context 'User tries to' do
    before :each do
      visit root_path
    end

    scenario 'search via selecting letter from select control' do
      select 'A', from: 'lastname_starting_with'
      click_on 'Search'

      expect(page).to_not have_content('Mike Ross')
      expect(page).to have_content('Here are current holderls, whos lastname is starting with A')
    end
  end
end
