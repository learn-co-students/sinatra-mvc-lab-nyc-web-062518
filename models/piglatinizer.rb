class PigLatinizer
  attr_reader :text

  def initialize
  end

  def piglatinize(text)
    alpha = ('a'..'z').to_a
    vowels = %w[a e i o u]
    consonants = alpha - vowels
    new_text = ""
    text.split(" ").map do |word|
      if vowels.include?(word[0].downcase)
        new_text += word + 'way' + ' '
      elsif consonants.include?(word[0].downcase) && consonants.include?(word[1].downcase) && consonants.include?(word[2].downcase)
        new_text += word[3..-1] + word[0..2] + 'ay' + ' '  
      elsif consonants.include?(word[0].downcase) && consonants.include?(word[1].downcase)
        new_text += word[2..-1] + word[0..1] + 'ay' + ' '
      elsif consonants.include?(word[0].downcase)
        new_text += word[1..-1] + word[0] + 'ay' + ' '
      else
        new_text += word
      end
    end
    new_text[0..-2]
    # if text.length <= 1
    #   text
    # else
    #   text
    # end
  end

end
