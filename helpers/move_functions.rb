def move
  input = nil
  until input == "f" || input == "m" || input == 'e'
    puts "F. for file\tM. for manual\nE. To exit"
    input = gets.chomp.downcase
  end
  input
end