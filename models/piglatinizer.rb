class PigLatinizer

  def piglatinize(words)
    array = words.split(" ")
    new_array = array.map do |word|
      if word.start_with?("a", "e", "i", "o", "u", "A", "E", "I", "O", "U")
        word + "way"
      else
        split_word = word.split(/([aeiouAEIOU].*)/)
        first = split_word[0]
        rest = split_word[1]
        pig_latin_word = rest + first + "ay"
      end
    end
    latinized = new_array.map do |word|
      if new_array.length == 1
        word
      else
        new_array.join(" ")
      end
    end
    latinized.first
  end

end
