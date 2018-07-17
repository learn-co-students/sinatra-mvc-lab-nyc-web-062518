require "pry"

class PigLatinizer

  attr_accessor :word

  def initialize
    @word = word
  end

  def piglatinize_one_word(user_input)
    if user_input.downcase.start_with?("a", "e", "i", "o", "u")
      user_input + "way"
    else
      split_letters = user_input.split(/([aeiou].*)/)
      split_letters.reverse.join + "ay"
    end
  end

  def piglatinize_multiple_words(user_input)
    piglatinized_words = user_input.split(" ").map do |word|
      piglatinize_one_word(word)
    end
    piglatinized_words.join(" ")
  end

  def piglatinize(user_input)
    if user_input.split(" ").size == 1
      piglatinize_one_word(user_input)
    else piglatinize_multiple_words(user_input)
    end
  end

end
