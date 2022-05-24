module Recipes
  class FindRelevant
    require 'csv'

    def initialize(user)
      @user = user
      @all_recipes = Recipe.all
      @user_ingredients = user.ingredients
    end

    def call
      find_relevant
    end

    private

    attr_reader :user, :all_recipes, :user_ingredients

    def find_relevant
      @sorted = []
      all_recipes.each do |recipe|
        @rank = 0
        user_ingredients.each do |ing|
          @rank += 1 if recipe.ingredients.any? { |i| i[ing] }
        end

        @sorted << { recipe: recipe, rank: @rank, rating: recipe.ratings } if @rank.positive?
      end

      @sorted.sort_by! { |a| [a[:rank], a[:rating]] }.reverse!
      @sorted.first(100).pluck(:recipe)
    end
  end
end
