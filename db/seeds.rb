# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

Recipe.destroy_all
Ingredient.destroy_all

20.times do
  Recipe.create(title: Faker::Food.dish)
end

40.times do
  Ingredient.create(name: Faker::Food.ingredient, quantity: Faker::Food.measurement, recipe_id: Recipe.all.sample.id)
end 