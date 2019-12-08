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

def save_manual_input(string)
  File.open('text.RPLT', 'a') do |file|
      file.print "#{string}\n".capitalize
  end
end

def save_file(array)
  File.open('text.RPLT', 'a') do |file|
    array.each do |line|
      file.print "#{line}\n".capitalize
    end
  end
end

def save_output(data_to_save, save_mode)
  puts "Would you like to save the output to a text file?"
  user_choice = gets.chomp
  if user_choice == 'y'
    if save_mode == 1
      save_manual_input(data_to_save)
      puts "Save completed Manaual"
    else
      save_file(data_to_save)
      puts "Save Completed Automatic"
    end

  else
    puts "Goodbye!"
  end
end

def move
  input = nil
  until input == "f" || input == "m" || input == 'e'
    puts "F for file	M for manual\nE for Exit"
    input = gets.chomp.downcase
  end
  input
end

def game(input)


  save_node = nil
  user_choice = input

    if user_choice == 'f'
      puts "1st choice, load from a file"
      puts "Please enter a file name"
      file_name = gets.chomp
      puts "Please wait, opening #{file_name}"
      sleep(1)
      opened_file = open_file(file_name)
      data_to_save = []
      opened_file.each do |line|
        data_to_save.push(pig_latin_sentence_translator(line).downcase.capitalize)
        puts pig_latin_sentence_translator(line).red.downcase.capitalize
        sleep(0.3)
      end
      save_node = 0
      save_output(data_to_save, save_node)
      puts "End of translation!"
    elsif user_choice == 'm'
      puts "Enter a sentence"
      user_sentence = gets.chomp
      translation = pig_latin_sentence_translator(user_sentence)
      puts translation
      save_node = 1
      save_output(translation, save_node)
    else
      puts "Googbye"
    end

end

puts "Welcome to insta-magic pig latin!"
puts "Manual input or load text file?"

user_choice = move
game(user_choice)

