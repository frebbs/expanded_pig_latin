require 'colorize'

def game(input)
  save_mode = nil
  user_choice = input

  if user_choice == 'f'
    puts "Load from a file"
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
    save_mode = 0
    save_output(data_to_save, save_mode)
    puts "End of translation!"
  elsif user_choice == 'm'
    puts "Enter a sentence to translate"
    user_sentence = gets.chomp
    translation = pig_latin_sentence_translator(user_sentence)
    puts translation
    save_mode = 1
    save_output(translation, save_mode)
  else
    puts "Googbye"
  end

end