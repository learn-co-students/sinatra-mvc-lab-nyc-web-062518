class PigLatinizer

  attr_accessor :text

  def initialize

  end

  def piglatinize(text)
    @text = text
    vowels = ["a","e","i","o","u"]
    consonants = ["b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z"]
    high_frequencies = ["th","ch","sh", "pr", "tr", "cr", "br", "fr", "gr", "pl", "sk", "wh"]
    large_high_frequencies = ["thr", "spr", "shr", "str"]
    text_array = @text.split(" ")
    text_array.map do |word|
      if vowels.include?(word[0].downcase)
        word.sub! "#{word}", "#{word}way"
      elsif large_high_frequencies.include?(word[0..2].downcase)
        first = "#{word[0..2]}"
        word.slice!(0,3)
        word.sub! "#{word}", "#{word}#{first}ay"
      elsif high_frequencies.include?(word[0..1].downcase)
        first = "#{word[0..1]}"
        word.slice!(0,2)
        word.sub! "#{word}","#{word}#{first}ay"
      elsif consonants.include?(word[0].downcase) #&& !high_frequencies.include?(word[0..1])
        first = word[0]
        word.slice!(0)
        word.sub! "#{word}","#{word}#{first}ay"
      end
    end
    text_array.join(" ")
  end

end
