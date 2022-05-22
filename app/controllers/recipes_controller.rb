class RecipesController < ApplicationController
  def index
    @recipes = JSON.load(File.open('/Users/amer/Desktop/Projects/recipes-en.json')).first(10)
  end
end
