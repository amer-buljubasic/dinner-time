module Recipes
  class FindRelevant
    require 'csv'

    def initialize(user)
      @user = user
      @all_recipes = JSON.parse(File.read('./recipes-en.json'))
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
          @rank += 1 if recipe['ingredients'].any? { |i| i[ing] }
        end

        @sorted << recipe.merge(rank: @rank)
      end
      @sorted.sort_by! { |element| element[:rank] }.reverse!.first(10)
    end
  end
end
