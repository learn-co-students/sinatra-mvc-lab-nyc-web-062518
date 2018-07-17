require "pry"
class PigLatinizer
  attr_reader :text

  def piglatinize(text)
    if text.split(" ").count == 1
      pig_this(text)
    else
      split_phrase = text.split(" ")
      split_phrase.map {|word| pig_this(word)}.join(" ")
    end
  end

  def pig_this(text)
    if text.downcase.start_with?("a", "e", "i", "o", "u")
      text + "way"
    else
      text = text.split("")

      cons = text.take_while {|letter| !letter.downcase.start_with?("a", "e", "i", "o", 'u')}

      text.slice!(0, cons.length)
      (text + cons).join + "ay"
    end
  end
end
