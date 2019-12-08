def pig_latin_sentence_translator(string)
  split_string = string.split(" ")
  words = split_string.map {|word| pig_latin_word_translator(word)}
  words.join(" ")
end

def pig_latin_word_translator(word)
  first_letter = word[0].downcase
  vowels = %w[a e i o u]
  if vowels.include?(first_letter)
    "#{word}way"
  else
    consonants_list = []
    consonants_list << word[0]
    if vowels.include?(word[1]) == false
      consonants_list << word[1]
      consonants_list << word[2] if vowels.include?(word[2]) == false
    end
    "#{word[consonants_list.length..-1] + consonants_list.join + "ay"}"
  end
end