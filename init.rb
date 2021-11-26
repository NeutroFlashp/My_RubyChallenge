# frozen_string_literal: false

require_relative './products'
require 'colorize' #gema para colores

# Write the program here
class Program #clase #1
  def self.list #atributo 1
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
    @value1 = gets.to_i #variable_de_instancia
  end
end

class Board #clase 2
  def self.show #atributo 2
    $list = PRODUCTS.map(&:clone) #variable_global #clonacion de products.rb
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
end

class Add # clase 3
  def self.new_products #atributo 3
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

    PRODUCTS.push(new_product)
    puts 'El nuevo producto fue añadido!'.yellow
    sleep 4
  end
end

class Retire #clase 4
  def self.products # atributo 4
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
end


  def movements
    puts 'movements'
  end

  loop do
    case Program.list #llamando clase y atributo 1
    when 1
      Board.show #llamando clase y atributo 2
      sleep 10 #tiempo(en seg )
    when 2
      Add.new_products #llamando clase y atributo 3
    when 3
      Retire.products #llamando clase y atributo 4
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