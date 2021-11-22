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
  puts PRODUCTS
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

while true
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
    print 'Bye!'
    exit(0)

  else
    puts 'Select a correct option'
  end
end