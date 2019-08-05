class Game
    def initialize(categories)
        @categories = categories
        @choice_category = nil
        @word = nil
        @chars = []
        @chosen_words = []
        @chances = 3
        @last_try = false
    end

    def start
        puts 'Welcome to hangman game! Rules:'
        puts 'You must choice one of 4 categories to start play'
        puts 'You have 3 chances for win. One wrong choice and you lost one chance, but if you hit two times you win one chance, anyway the maximum of chances is 3.'
        puts 'Anytime you can try to guess the word, but if you are wrong, you lost.'
        break_line
        
        @categories.each_with_index { |category, index| puts "#{index} - #{category.get_name}" }
        index_category = gets.to_i
        is_valid_category(index_category)
    end

    def is_valid_category(index_category)
        if(@categories[index_category])
            @choice_category = @categories[index_category]
            randomize_word
            clean_chars
            make_play
        else
            start
        end
    end

    def randomize_word
        amount_of_words = @choice_category.get_words.length
        random_index = rand(0..amount_of_words - 1)
        @word = @choice_category.get_words[random_index]
    end

    def clean_chars
        while (@word.length > @chars.length)  do
            @chars.push(0)
        end         
    end

    def game_over
        if(@chars.include? 0 && @tries >= 10)
            puts 'Ops. Você atingiu todas suas tentavias e infelizmente não venceu'
            false
        end

        if(!@chars.include? 0)
            puts 'Parabéns! Você venceu!'
        end
    end

    def make_play
        
    end

    private
        def break_line
            puts '==================='
        end 
end