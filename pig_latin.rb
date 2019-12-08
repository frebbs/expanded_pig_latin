


def pig_latin_sentence_translator(string)
  split_string = string.split(" ")
  words = split_string.map {|word| pig_latin_word_translator(word)}
  words.join(" ")
end


def pig_latin_word_translator(word)
  first_letter = word[0].downcase
  vowels = %w[a e i o u]

  if vowels.include?(first_letter)
    # Do something here
    "#{word}way"
  else
    # Do something else here
    puts "not included!"
  end

end

puts pig_latin_sentence_translator("Aaron")
