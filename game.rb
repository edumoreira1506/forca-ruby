load 'panel.rb'

class Game
    def initialize(categories)
        @categories = categories
        @panel = Panel.new
        @points = 0
    end

    def start
        @chances = 3

        @game_over = false
        @last_try = false
        @choice_category = nil

        @chars = []
        @chosen_letters = []
        
        @panel.welcome_text(@points)
        
        @categories.each_with_index { |category, index| puts "#{index} - #{category.name}" }
        
        index_category = gets.to_i
        valid_category?(index_category)
    end

    private
        def update_letter
            letter = @chosen_letters.last

            if @word.include? letter

                if @last_try
                    @points += 20
            
                    if @chances < 3
                        @chances += 1
                    end
                end

                i = 0
                while i < @word.length
                    if(@word[i] == letter)
                        @chars[i] = letter
                    end
                    
                    i += 1
                end
            else
                @chances -= 1
            end

            @last_try = @word.include? letter
        end

        def valid_category?(index_category)
            if @categories[index_category]
                @choice_category = @categories[index_category]

                randomize_word
                crypt_word
                make_play
            else
                start
            end
        end

        def randomize_word
            @word = @choice_category.words.sample
        end

        def crypt_word
            while @word.length > @chars.length do
                @chars.push('_') 
            end
        end

        def make_play
            @panel.show_panel(@chances, @chosen_letters, @chars)
            
            puts 'Next letter?'
            try = gets.chomp

            if try.length == 1
                if@chosen_letters.include? try
                    puts 'You already tried this letter'
                else
                    @chosen_letters.push(try)
                    update_letter
                end
            else
                @game_over = true

                if@word.casecmp(try) == 0
                    @points = @points + 100
                    @lost = false
                else
                    @lost = true
                end
            end
    
            check_game_over
            @game_over ? end_game : make_play
        end

        def check_game_over
            if !@game_over
                if @chances == 0
                    @game_over = true
                    @lost = true
                elsif !@chars.include? '_'
                    @game_over = true
                    @lost = false
                end
            end
        end

        def end_game
            total_letters = @chosen_letters.length
            wrong_letters = 0
            right_letters = 0

            @chosen_letters.each { |letter|  (@word.include? letter) ? right_letters +=  1 : wrong_letters += 1 }

            percentage_wrong_letters = (wrong_letters * 100) / total_letters 
            percentage_right_letters = 100 - percentage_wrong_letters

            @points += percentage_right_letters - percentage_wrong_letters

            @panel.end_game(@lost, @word)
            sleep(1)
            start
        end
end
