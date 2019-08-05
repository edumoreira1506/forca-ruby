class Panel
    def initialize(word)
        @word = word
        @chars = []
        @chosen_words = []
        @chances = 3
        @last_try = false
        clean_panel
    end

    def increment_panel(letter)
        @chosen_words.push(letter)
        @contains = get_word.include? letter

        if(@contains)
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
            @chances = @chances - 1
        end

        @last_try = @contains
    end

    def clean_panel
        while (@word.length > @chars.length) do
            @chars.push('_') 
        end
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