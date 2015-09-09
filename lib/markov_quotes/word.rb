module MarkovQuotes
  class Word

    attr_reader :word
    attr_reader :next_word

    def initialize(word, next_word)
      @word = word
      @next_word = next_word
    end

    def to_s
      @word
    end

  end
end
