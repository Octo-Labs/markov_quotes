module MarkovQuotes
  class MarkovChainer

    def initialize
      @heads = []
      @words = {}
    end

    def train sentence
      next_word = nil
      sentence.split.reverse.each do |w|
        if @words[w]
          word = @words[w]
          word.add_next_word(next_word)
        else
          word = Word.new w, next_word
          @words[w] = word
        end
        next_word = word
      end
      @heads.push next_word
    end

    def generate
      words = []
      word = @heads.sample
      while word do
        words.push word
        word = word.next_word
      end
      words.join " "
    end
  end

  class Word
    def initialize word, next_word
      @word = word
      @next_words = [next_word]
    end

    def add_next_word word
      @next_words.push word
    end

    def next_word
      @next_words.sample
    end

    def to_s
      @word
    end
  end
end
