class IngredientsController < ApplicationController
  require 'csv'
  before_action :authenticate_user!

  def index
    @ingredients = current_user.ingredients
  end

  def edit_my_ingredients
    @user = current_user
  end
end
