class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Recipes::FindRelevant.new(current_user).call
    @pagy_a, @recipes = pagy_array(@items)
  end
end
