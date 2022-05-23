require 'rails_helper'

RSpec.describe IngredientsController do
  describe 'GET index' do
    before(:each) do
      @user = create :user
      login_user(@user)
    end

    it "renders 'index' template" do
      get :index

      expect(response).to render_template('index')
    end

    it 'assigns [] to @ingredients' do
      get :index

      expect(assigns(:ingredients)).to eq([])
    end

    it "assigns ['apple'] to @ingredients" do
      @user.update(ingredients: ['apple'])
      get :index

      expect(assigns(:ingredients)).to eq(['apple'])
    end
  end

  describe 'GET edit_my_ingredients' do
    before(:each) do
      @user = create :user
      login_user(@user)
    end

    it "renders 'edit_my_ingredients' template" do
      get :edit_my_ingredients

      expect(response).to render_template('edit_my_ingredients')
    end

    it 'assigns current_user to @ingredients' do
      get :edit_my_ingredients

      expect(assigns(:user)).to eq(@user)
    end
  end
end
