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

        initial_quantity = element[:quantity]
        initial_cost = element[:unit_cost]

        print 'Inserte la cantidad: '.red
        new_quantity = gets.to_f
        element[:quantity] = new_quantity

        print 'Inserte el costo unitario: '.red
        new_unit_cost = gets.to_f
        element[:unit_cost] = new_unit_cost

        average = ((initial_quantity * initial_cost) + (new_quantity*new_unit_cost) ) / (initial_quantity + new_quantity)
        puts "Average = #{average}"

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
  puts 'Operacion realizada con éxito'.green

end

def retire

  print 'Selecciona un tipo: '.red
  selected_type = gets.chomp.upcase

  print 'Selecciona la cantidad: '.red
  selected_quantity = gets.to_i

  $list.each do |x|

    if selected_type == x[:type]
      if selected_quantity < x[:quantity]
        resta = x[:quantity] - selected_quantity
        x[:quantity] = resta
        puts "El producto se retiro con exito!".blue
        sleep 4

      else
        print "ERROR! ".yellow
        puts "La solicitud excede el stock actual".red
        sleep 4

      end
    end
  end

end

def movements
  puts 'working in this section, return later :)'
  #print 'Seleccione un tipo: '.red
  #movements_type = gets.chomp.upcase
  #$list.each do |x|
  #if movements_type == x[:type]
  #a = @@selected_quantity
  #b = @@initial_quantity
  #puts "Entrada = #{b}"
  #puts "Salida = #{a-b}"
  #end
  #end
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