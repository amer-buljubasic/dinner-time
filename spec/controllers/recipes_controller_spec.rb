require 'rails_helper'

RSpec.describe RecipesController do
  describe 'GET index' do
    before(:each) do
      @user = create :user
      login_user(@user)
    end

    it "renders 'index' template" do
      get :index

      expect(response).to render_template('index')
    end

    it 'assigns data to @recipes' do
      get :index

      expect(assigns(:recipes)).not_to eq([])
    end
  end
end
