# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ing_serialized = open(url).read
array = JSON.parse(ing_serialized)

ingredients_args = []
array.each do |ing|
  ing[1].each do |e|
    ingredients_args << e['strIngredient1']
  end
end

ingredients_args.each do |el|
Ingredient.create(name: el)
end
