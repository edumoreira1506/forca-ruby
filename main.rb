load 'category.rb'
load 'game.rb'

animals = Category.new(['cavalo','passarinho','macaco','peixe','tubarão'], 'Animais')
vehicles = Category.new(['carro','bicicleta','moto','caminhão','skate'], 'Veículos')
objects = Category.new(['prato','relogio','copo','óculos','garfo'], 'Objetos')
drinks = Category.new(['água','refrigerante','suco','cerveja','vinho'], 'Bebidas')

categories = [animals, vehicles, objects, drinks]
game = Game.new(categories)
game.start