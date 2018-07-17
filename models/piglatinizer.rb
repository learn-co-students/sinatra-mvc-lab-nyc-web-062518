require_relative '../config/environment'

class PigLatinizer

  attr_accessor :user_phrase

  def piglatinize(user_phrase)
    if user_phrase.split(" ").size == 1
      piglatinize_single_word(user_phrase)
    else
      piglatinize_multiple_words(user_phrase)
    end
  end

  def piglatinize_single_word(user_phrase)
    if user_phrase.downcase.start_with?("a", "e", "i", "o", 'u')
      user_phrase + 'way'
    else
      user_phrase = user_phrase.split("")
      consonants = user_phrase.take_while {|letter| !letter.downcase.start_with?("a", "e", "i", "o", 'u')}
      user_phrase.slice!(0, consonants.size)
      piglatinized_word = user_phrase + consonants
      piglatinized_word.join + "ay"
    end

  end

  def piglatinize_multiple_words(user_phrase)
    split_phrase = user_phrase.split(" ")
    split_phrase.map {|word| piglatinize_single_word(word)}.join(" ")
  end
end
