module MarkovQuotes
  class MarkovChainer

    def initialize
      @beginnings = []
    end

    def train(sentence)
      previous_word = nil
      sentence.split.reverse.each do |w|
        word = Word.new(w,previous_word)
        previous_word = word
      end
      @beginnings.push previous_word
    end

    def generate
      words = []
      word = @beginnings.first
      while(word)
        words.push(word)
        word = word.next_word
      end
      words.join(" ")
    end

  end
end
