class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    @user = User.find(params[:id])

    @user.update(ingredients: params[:user][:ingredients][0].split(', '))
    redirect_to ingredients_path
  end
end
