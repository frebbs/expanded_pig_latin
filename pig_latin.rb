require 'colorize'

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

def open_file(file_name)
  lines = []
  File.open(file_name, "r") do |f|
    f.each_line do |line|
      lines.push(line)
    end
  end
  lines
end

def move
  input = nil
  until input == "f" || input == "m" || input == 'e'
    puts "F for file	M for manual, E for Exit"
    input = gets.chomp.downcase
  end
  input
end

def game(input)


  user_choice = input

    if user_choice == 'f'
      puts "1st choice, load from a file"
      puts "Please enter a file name"
      file_name = gets.chomp
      puts "Please wait, opening #{file_name}"
      sleep(1)
      opened_file = open_file(file_name)
      opened_file.each do |line|
        puts pig_latin_sentence_translator(line).red
        sleep(0.3)
      end
      puts "End of translation, goodbye!"
    elsif user_choice == 'm'
      puts "Enter a sentence"
      user_sentence = gets.chomp
      puts pig_latin_sentence_translator(user_sentence)
      puts "Thanks for playing"
    elsif user_choice == 'e'
      puts "Good bye!"
    end

end

puts "Welcome to insta-magic pig latin!"
puts "Manual input or load file?"
user_choice = move
game(user_choice)