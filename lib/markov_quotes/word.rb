module MarkovQuotes
  class Word

    attr_reader :word
    attr_reader :next_words

    def initialize(word, next_word)
      @word = word
      @next_words = [next_word]
    end

    def add_next_word(next_word)
      @next_words.push(next_word)
    end

    def next_word
      @next_words.sample
    end

    def to_s
      @word
    end

  end
end
