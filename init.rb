# frozen_string_literal: false

require_relative './products'
require 'colorize' #gema para colores

# Write the program here

def menu
  puts 'MENU'.red
  print '1.'.blue
  puts 'Show stocks'.yellow
  print '2.'.blue
  puts 'Add new products'.yellow
  print '3.'.blue
  puts 'Retire products'.yellow
  print '4.'.blue
  puts 'Show movements of product'.yellow
  print '5.'.blue
  puts 'Exit'.yellow
  print 'Select option: '.blue
  gets.to_i
end

def stocks
  PRODUCTS.each do |hash_products|
    puts "________________________________________".green
    hash_products.each do |symbol, value|
      print "|".green
      print "#{symbol.upcase} = #{value}"
      print "|".green
    end
    puts " "
  end
  print "________________________________________".green
end

def add
  puts 'adding'
end

def retire
  print 'Select type: '
  selected_type = gets.chomp

end

def movements
  puts 'movements'
end

loop do
  case menu
  when 1
    stocks
    sleep 10 #tiempo(en seg ) de espera para que el usuario vea la tabla
  when 2
    add

  when 3
    retire

  when 4
    movements

  when 5
    print 'Closing the program!'.red
    exit(0)

  else
    print 'ERROR! '.yellow
    puts 'Select a correct option'.red
    sleep 2 #tiempo (en seg) de espera para que el usuario pueda leer el mensaje
  end
  puts "\e[H\e[2J"
end