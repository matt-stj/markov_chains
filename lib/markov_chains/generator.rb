module MarkovChains
  class Generator
    
    # Initializes the generator
    #
    # @example Create a new generator
    #   MarkovChains::Generator.new(text)
    #
    # @param Text source to generate sentences from
    #
    def initialize(text, order = 1)
      @dict = MarkovChains::Dictionary.new(text, order)
    end
    
    # Returns a given number of randonly generated sentences
    #
    # @example Get 5 sentences
    #   get_sentences(5)
    #
    # @param n [int] number of sentences to generate
    # @return Array conataining generated sentences
    #
    def get_sentences(n)
      sentences = []
      
      n.times do
        sentence = @dict.get_start_word
        
        until nw = @dict.get(sentence[-@dict.order, @dict.order])
          sentence += nw
        end
        
        sentences << sentence
      end
      
      sentences
    end
  end
end