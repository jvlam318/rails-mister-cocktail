require "json"
require "rest-client"

puts 'Cleaning database...'
Ingredient.destroy_all

puts 'Creating ingredients...'
response = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(response)

restaurants_attributes = []

ingredients["drinks"].each do |element|
  Ingredient.create!(name: element["strIngredient1"])
end

puts 'Finished!'
