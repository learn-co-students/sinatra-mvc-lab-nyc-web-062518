class PigLatinizer

    attr_reader :text

    def initizlize(text)
      @text = text
    end

    def pl_word(word)
        if "aeiou".include?(word[0].downcase)
            word = word + "way"
        else
            while !"aeiou".include?(word[0].downcase)
                word = word + word.slice!(0)
            end
            word = word + "ay"
        end
        word
    end

    def piglatinize(text)
      array = text.split(/\W+/)
      new_array = array.map do |word|
        pl_word(word)
      end
      new_array.join(" ")
    end


  end
  
