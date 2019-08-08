class Panel
    attr_reader :wrong_letters, :right_letters, :chars, :word, :chances, :chosen_words

    def welcome_text(points)
        puts 'Welcome to hangman game! Rules:'
        puts 'You must choice one of 4 categories to start play'
        puts 'You have 3 chances for win. One wrong choice and you lost one chance, but if you hit two times you win one chance and 20 extra points, anyway the maximum of chances is 3.'
        puts 'Anytime you can try to guess the word, if you are right, you will win 100 extra points.'

        break_line
        puts "You have #{points} points"
        break_line
    end

    def show_panel(chances, chosen_words, chars)
        puts '==================='
        puts "You have #{chances} chances."
        puts "Your tries: #{chosen_words.to_s}."
        puts "Word: #{chars.join('')}."
    end

    def end_game(lost, word)
        message = lost ? 'You loose' : 'You win'
        puts "Game ended! The word was: #{word}. #{message}"
    end

    private
        def break_line
            puts '==================='
        end
end
