# frozen_string_literal: false

require_relative './products'

# Write the program here

def menu
  puts 'MENU'
  puts '1. Show stocks'
  puts '2. Add new products'
  puts '3. Retire products'
  puts '4. Show movements of product'
  puts '5. Exit'
  print 'Select option: '
  gets.to_i
end

def stocks
  PRODUCTS.each do |hash_products|
    puts "_________________"
    hash_products.each do |symbol, value|
      puts "| #{symbol} = #{value} |"
    end
    puts "_________________"
  end
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

  when 2
    add

  when 3
    retire

  when 4
    movements

  when 5
    print 'Closing the program!'
    exit(0)

  else
    puts 'Select a correct option'
  end
  system('clear')
end
