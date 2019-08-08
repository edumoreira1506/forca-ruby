class Panel
    attr_reader :wrong_letters, :right_letters, :chars, :word, :chances, :chosen_words

    def welcome_text
        puts 'Welcome to hangman game! Rules:'
        puts 'You must choice one of 4 categories to start play'
        puts 'You have 3 chances for win. One wrong choice and you lost one chance, but if you hit two times you win one chance, anyway the maximum of chances is 3.'
        puts 'Anytime you can try to guess the word typing GUESS, but if you are wrong, you lost.'

        break_line
        puts "You have #{@points} points"
        break_line
    end

    def start(word)
        @last_try = false
        @word = word
        @wrong_letters = 0
        @right_letters = 0
        @chars = []
        @chosen_words = []
        @chances = 3
        clean_panel
    end

    def increment_panel(letter)
        @chosen_words.push(letter)

        if word.include? letter
            @right_letters += 1

            if @last_try && @chances < 3
                @chances += 1
            end

            i = 0
            while i < @word.length
                if(@word[i] == letter)
                    @chars[i] = letter
                end
                
                i += 1
            end
        else
            @wrong_letters += 1
            @chances -= 1
        end

        @last_try = word.include? letter
    end

    def clean_panel
        while @word.length > @chars.length do
            @chars.push('_') 
        end
    end

    def total_plays
        @wrong_letters + @right_letters
    end

    def show_panel
        puts '==================='
        puts "You have #{chances} chances."
        puts "Your tries: #{chosen_words.to_s}."
        puts "Word: #{chars.join('')}."
    end

    private
        def break_line
            puts '==================='
        end
end
