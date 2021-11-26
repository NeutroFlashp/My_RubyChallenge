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

  new_product = Hash.new

  print('Inserte el nuevo tipo: ')
  new_type = gets.chomp
  new_product["type"] = new_type

  print('Inserte la cantidad: ')
  new_quantity = gets.to_i
  new_product["quantity"] = new_quantity

  print('Inserte el costo unitario: ')
  new_unit_cost = gets.to_i
  new_product["unit_cost"] = new_unit_cost

  PRODUCTS.push(new_product)
  puts 'Se guardaron los cambios'

end

def retire

end

def movements
  puts 'movements'
end

loop do

  case menu

  when 1
    stocks
    sleep 10 #tiempo(en seg )

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
    sleep 3 #tiempo (en seg)
  end

  puts "\e[H\e[2J"
end