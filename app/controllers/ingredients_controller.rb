class IngredientsController < ApplicationController
  require 'csv'

  def index
    @ingredients = CSV.read('test/fixtures/my_ingredients.csv')[0]
  end

  def edit_my_ingredients
  end
end
