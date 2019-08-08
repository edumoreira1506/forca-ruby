load 'panel.rb'

class Game
    def initialize(categories)
        @categories = categories
        @panel = Panel.new
        @points = 0
    end

    def start
        @game_over = false
        @choice_category = nil
        
        puts 'Welcome to hangman game! Rules:'
        puts 'You must choice one of 4 categories to start play'
        puts 'You have 3 chances for win. One wrong choice and you lost one chance, but if you hit two times you win one chance, anyway the maximum of chances is 3.'
        puts 'Anytime you can try to guess the word typing GUESS, but if you are wrong, you lost.'
        
        break_line
        puts "You have #{@points} points"
        break_line
        
        @categories.each_with_index { |category, index| puts "#{index} - #{category.name}" }
        
        index_category = gets.to_i
        is_valid_category(index_category)
    end

    private
        def is_valid_category(index_category)
            if(@categories[index_category])
                @choice_category = @categories[index_category]

                randomize_word
                make_play
            else
                start
            end
        end

        def randomize_word
            amount_of_words = @choice_category.words.length
            random_index = rand(0..amount_of_words - 1)
            word = @choice_category.words[random_index]
            @panel.start(word)
        end

        def make_play
            @panel.show_panel
            
            puts 'Next letter?'
            try = gets.chomp

            if(''.casecmp(try) == 0 || ' '.casecmp(try) == 0 )
                make_play
            else
                if('GUESS'.casecmp(try) == 0)
                    puts 'What is your guess?'
                    guess = gets.chomp
    
                    @game_over = true

                    if(@panel.word.casecmp(guess) == 0)
                        @points = @points + 100
                        @lost = false
                    else
                        @lost = true
                    end
                else
                    if(@panel.chosen_words.include? try)
                        puts 'You already tried this letter'
                    else
                        @panel.increment_panel(try)
                    end
                end
    
                check_game_over
    
                if(@game_over)
                    end_game
                else
                    make_play
                end
            end
        end

        def check_game_over
            if(!@game_over)
                if(@panel.chances == 0)
                    @game_over = true
                    @lost = true
                end

                if(!@panel.chars.include? '_')
                    @game_over = true
                    @lost = false
                end
            end
        end

        def break_line
            puts '==================='
        end 

        def end_game
            percentage_wrong_letters =  (@panel.wrong_letters * 100) / @panel.total_plays 
            percentage_right_letters = 100 - percentage_wrong_letters

            @points += percentage_right_letters - percentage_wrong_letters

            message = @lost ? 'You loose' : 'You win'
            puts "Game ended! The word was: #{@panel.word}. #{message}"
            sleep(1)
            start
        end
end