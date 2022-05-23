require 'rails_helper'

RSpec.describe UsersController do
  describe 'PATCH update' do
    it 'updates users ingredients' do
      user = create :user
      login_user(user)

      patch :update, params: { id: user.id, user: { ingredients: ['apple'] } }
      user.reload

      expect(user.ingredients).to eq(['apple'])
      expect(response).to be_redirect
    end
  end
end
