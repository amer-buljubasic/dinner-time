class RecipesController < ApplicationController
  def index
    @recipes = Recipes::FindRelevant.new(current_user).call
  end
end
