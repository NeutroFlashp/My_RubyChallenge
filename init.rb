# frozen_string_literal: false

require_relative './products'
require 'colorize' #gema para colores

# Write the program here
def menu #atributo 1
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
  value1 = gets.to_i #variable_de_instancia
end
$list = PRODUCTS.map(&:clone)
def stocks #atributo
  $list.each do |hash_products|
    puts "________________________________________".green
    hash_products.each do |symbol, value|
      print "|".green
      print "#{symbol} = #{value}"
      print "|".green
    end
    puts " "
  end
  print "________________________________________".green
end




def add #atributo 3
  $list = PRODUCTS.map(&:clone)
  new_product = Hash.new
  print 'Inserte el nuevo tipo: '.red
  new_type = gets.chomp.upcase
  new_product["type"] = new_type

  print 'Inserte la cantidad: '.red
  new_quantity = gets.to_i
  new_product["quantity"] = new_quantity

  print 'Inserte el costo unitario: '.red
  new_unit_cost = gets.to_i
  new_product["unit_cost"] = new_unit_cost
  $list.each do |x|
    if new_type !=  x[:type]
      $list.push(new_product)
      puts new_product
      puts 'El nuevo producto fue añadido!'.yellow
      sleep 4
      break
    elsif new_type ==  x[:type]
      puts 'El producto ya se encuentra en lista!'.yellow
      sleep 4
      break
    end
  end
end

def retire # atributo 4
  $list = PRODUCTS.map(&:clone)
  print 'Selecciona un tipo: '.red
  selected_type = gets.chomp.upcase
  print 'Selecciona la cantidad: '.red
  selected_quantity = gets.to_i
  $list.each do |x|
    if selected_type == x[:type]
      if selected_quantity < x[:quantity]
        list.push(x[:quantity] - selected_quantity)
        puts "El producto se retiro con exito!".blue
      else
        print "ERROR! ".yellow
        puts "La solicitud excede el stock actual".red
      end
    end
  end
end

def movements
  puts 'movements'
end

loop do
  case menu
  when 1
    stocks #llamando clase y atributo 2
    sleep 10 #tiempo(en seg )
  when 2
    add #llamando clase y atributo 3
  when 3
    retire #llamando clase y atributo 4
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