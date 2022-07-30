class Recipe < ApplicationRecord
  has_and_belongs_to_many :users, disable_joins: true
end
