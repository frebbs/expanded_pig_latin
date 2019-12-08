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
      puts "Save completed"
    else
      save_file(data_to_save)
      puts "Save Completed"
    end

  else
    puts "Goodbye!"
  end
end