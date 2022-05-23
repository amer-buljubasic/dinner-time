require 'rails_helper'

RSpec.describe 'Editing ingredients', type: :feature do
  before(:each) do
    @user = create :user
    login(@user)
  end
  scenario 'user does not have any ingredients' do
    visit home_path
    click_on 'My Ingredients'

    expect(page).to have_content('My Ingredients')
    expect(page).to have_content('Find a recipe!')
    expect(page).to have_content('Add Ingredients')
  end

  scenario 'user does have ingredients' do
    @user.update(ingredients: ['apple'])

    visit home_path
    click_on 'My Ingredients'

    expect(page).to have_content('My Ingredients')
    expect(page).to have_content('Find a recipe!')
    expect(page).to have_content('Edit Ingredients')
  end
end
