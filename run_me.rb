#!/usr/bin/env ruby
# Created by Aaron Diable - December 8th 2019
require_relative 'helpers/move_functions'
require_relative 'helpers/piglatin_functions'
require_relative 'helpers/io_functions'
require_relative 'helpers/game_functions'
#require 'colorize'


puts "Welcome to insta-magic pig latin!"
puts "Manual input or load text file?"

user_choice = move
game(user_choice)
