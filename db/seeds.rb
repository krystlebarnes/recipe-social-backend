# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Krystle", username: "krystlebarnes", password: "password")

Recipe.create(name: "French Toast", description: "Basic and easy french toast", prep_time: 10, cook_time: 10, serving_size: 1, author_id: 1)

Ingredient.create(quantity: "3", unit: "slices", item: "bread", notes: "hawaiian bread recommended", recipe_id: 1)
Ingredient.create(quantity: "2", item: "eggs", recipe_id: 1)
Ingredient.create(quantity: "1/2", unit: "cup", item: "milk", recipe_id: 1)

Instruction.create(step: "Heat medium non-stick skillet or griddle to medium heat.", recipe_id: 1)
Instruction.create(step: "Whisk eggs and milk together.", recipe_id: 1)
Instruction.create(step: "Dip slice of bread into egg mixture.", recipe_id: 1)
Instruction.create(step: "Place slice of bread on skillet or griddle and fry both sides until golden brown.", recipe_id: 1)
