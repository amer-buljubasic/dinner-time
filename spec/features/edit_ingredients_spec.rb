require 'rails_helper'

RSpec.describe 'Editing ingredients', type: :feature do
  scenario 'valid inputs' do
    user = create :user
    login(user)

    visit edit_my_ingredients_ingredients_path
    fill_in 'user_ingredients', with: 'Apple'
    click_on 'Save Ingredients'

    expect(page).to have_content('My Ingredients')
    expect(page).to have_content('Apple')
  end
end
