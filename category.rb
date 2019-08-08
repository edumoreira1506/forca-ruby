class Category
    attr_reader :name, :words

    def initialize(words, name)
        @words = words
        @name = name
    end
end
