class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipes::FindRelevant.new(current_user).call
  end
end
