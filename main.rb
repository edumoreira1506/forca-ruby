require 'json'

load 'category.rb'
load 'game.rb'

file = File.read('database.json')
categories_hash = JSON.parse(file)

categories = []

categories_hash.keys.each do |category|     
    category_name = category
    items_category = categories_hash[category]

    object_category = Category.new(items_category, category_name)
    categories.push(object_category)
end 

game = Game.new(categories)
game.start
