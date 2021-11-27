# frozen_string_literal: false

require_relative './products'
require 'colorize' #gema para colores

$list = PRODUCTS.map(&:clone) #variable_global clonacion de products.rb

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

  $list.each do |hash_products|
    puts "________________________________________".green
    hash_products.each do |symbol, value|
      print "|".green
      print "#{symbol} = #{value}"
      print "|".green
    end
    puts " "
  end
  puts "________________________________________".green

  sleep 5
end

def add

  types_existing = []
  print 'Inserte el tipo: '.red
  new_type = gets.chomp.upcase

  $list.each do |element|
    types_existing.push(element[:type])
  end

  if types_existing.include?(new_type)

    $list.each do |element|
      if element[:type] == new_type

        print 'Inserte la cantidad: '.red
        new_quantity = gets.to_i
        element[:quantity] = new_quantity

        print 'Inserte el costo unitario: '.red
        new_unit_cost = gets.to_i
        element[:unit_cost] = new_unit_cost

      end
    end

  else

    new_product = Hash.new

    new_product[:type] = new_type

    print 'Inserte la cantidad: '.red
    new_quantity = gets.to_i
    new_product[:quantity] = new_quantity

    print 'Inserte el costo unitario: '.red
    new_unit_cost = gets.to_i
    new_product[:unit_cost] = new_unit_cost

    $list.push(new_product)
  end

  puts 'Operacion realizada con éxito!'.yellow
  sleep 3

end

def retire

  print 'Selecciona un tipo: '.red
  selected_type = gets.chomp.upcase
  print 'Selecciona la cantidad: '.red
  selected_quantity = gets.to_i
  if selected_type == list[0][:type]
    if selected_quantity < list[0][:quantity]
      list[0][:quantity] - selected_quantity
      puts "El producto se retiro con exito!".blue
    else
      print "ERROR! ".yellow
      puts "La solicitud excede el stock actual".red
    end
  end

end

def movements



end

def out_program
  print 'Closing the program!'.red

end

loop do
  case menu

  when 1
    stocks

  when 2
    add

  when 3
    retire

  when 4
    movements

  when 5
    out_program
    exit(0)
  else

    print 'ERROR! '.yellow
    puts 'Select a correct option'.red
    sleep 5 #tiempo (en seg)

  end
end