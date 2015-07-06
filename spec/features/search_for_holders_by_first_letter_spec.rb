require 'rails_helper'

feature 'Search for current holders by first letter of their last name', '
  In order to get a list of current holders
  As a user
  I want to be able to search by first letter of their last name

' do
  context 'User tries to' do
    let!(:good_holder) { create(:holder, name: 'Ivan Ivanov') }
    let!(:another_good_holder) { create(:holder, name: 'Ilya Ilyin') }
    let!(:bad_holder) { create(:holder, name: 'Nikolay Mironov') }
    
    before :each do
      visit root_path
    end

    scenario 'search via selecting letter from select control' do
      fill_in 's', with: 'I'
      click_on 'Search'

      expect(page).to have_content(good_holder.name)
      expect(page).to have_content(another_good_holder.name)
      expect(page).to_not have_content(bad_holder.name)
    end

    scenario 'search without passing any value as lastname' do
      fill_in 's', with: ''
      click_on 'Search'

      expect(page).to have_content 'Please enter lastname or couple letters lastname starts with.'
    end
  end
end
