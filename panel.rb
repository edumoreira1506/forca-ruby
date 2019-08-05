class Panel
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
        @contains = get_word.include? letter

        if(@contains)
            @right_letters = @right_letters + 1

            if(@last_try && @chances < 3)
                @chances = @chances + 1
            end

            i = 0
            while i != @word.length
                if(@word[i] == letter)
                    @chars[i] = letter
                end
                
                i = i + 1
            end
        else
            @wrong_letters = @wrong_letters + 1
            @chances = @chances - 1
        end

        @last_try = @contains
    end

    def clean_panel
        while (@word.length > @chars.length) do
            @chars.push('_') 
        end
    end

    def get_total_plays
        @wrong_letters + @right_letters
    end

    def get_wrong_letters
        @wrong_letters
    end

    def get_right_letters
        @right_letters
    end

    def get_chars
        @chars
    end

    def get_word
        @word
    end

    def get_chances
        @chances
    end

    def get_chosen_words
        @chosen_words
    end

    def show_panel
        puts '==================='
        puts "You have #{get_chances} chances."
        puts "Your tries: #{get_chosen_words.to_s}."
        puts "Word: #{get_chars.join('')}."
    end
end