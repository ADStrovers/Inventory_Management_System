require 'pry'
require 'sqlite3'
require 'rubygems'
require 'active_support/inflector'

DATABASE = SQLite3::Database.new("inventory_management.db")

require_relative 'database_setup'
require_relative 'database_functions'
require_relative 'shelf'
require_relative 'product'
require_relative 'category'

def main_prompt
  puts "-"*75
  puts "Welcome to Shelf Management Assistant Resource Terminal - SMART".center(75)
  puts "-"*75
  puts "What would you like to do today? ".ljust(75)
  puts "Please choose an option below: ".ljust(75)
  puts "1. Create a New Product.".ljust(75)
  puts "2. View/Modify an existing Product.".ljust(75)
  puts "3. Delete an existing Product.".ljust(75)
  puts "4. Register a New Shelf Location.".ljust(75)
  puts "5. View/Modify an existing Shelf Location.".ljust(75)
  puts "6. Delete an existing Shelf Location.".ljust(75)
  puts "7. Create a new Product Category.".ljust(75)
  puts "8. View/Modify an existing Product Category.".ljust(75)
  puts "9. Delete an existing Product Category.".ljust(75)
  print "> "
  selection = gets.chomp
  
  case selection
  when 1
    
  when 2
    
  when 3
    
  when 4
    
  when 5
    
  when 6
    
  when 7
    
  when 8
    
  when 9
    
  else
    
  end
  
end

main_prompt
binding.pry