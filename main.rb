load 'category.rb'
load 'game.rb'

animals = Category.new(['horse','bird','monkey','fish','shark'], 'Animals')
vehicles = Category.new(['car','bike','motorcycle','truck','skate'], 'Vehicles')
objects = Category.new(['plate','clock','cup','glasses','fork'], 'Objects')
drinks = Category.new(['water','soda','juice','beer','wine'], 'Drinks')

categories = [animals, vehicles, objects, drinks]
game = Game.new(categories)
game.start