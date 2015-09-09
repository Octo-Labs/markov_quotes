module MarkovQuotes
  class MarkovChainer

    def initialize
      @beginnings = []
      @words = {}
    end

    def train(sentence)
      previous_word = nil
      sentence.split.reverse.each do |w|
        if @words[w]
          word = @words[w]
          word.add_next_word(previous_word)
        else
          word = Word.new(w,previous_word)
          @words[w] = word
        end
        previous_word = word
      end
      @beginnings.push previous_word
    end

    def generate
      words = []
      word = @beginnings.sample
      while(word)
        words.push(word)
        word = word.next_word
      end
      words.join(" ")
    end

  end
end
