class Panel
    attr_reader :wrong_letters, :right_letters, :chars, :word, :chances, :chosen_words

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

        if(word.include? letter)
            @right_letters += 1

            if(@last_try && @chances < 3)
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
        while (@word.length > @chars.length) do
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
end