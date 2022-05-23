require 'rails_helper'

RSpec.describe 'Editing ingredients', type: :feature do
  scenario 'valid inputs' do
    user = create :user
    login(user)

    visit home_path
    click_on 'Find a recipe!'

    expect(page).to have_content('Cook time:')
    expect(page).to have_content('Prep time:')
    expect(page).to have_content('Ingredients:')
  end
end
