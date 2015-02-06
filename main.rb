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

binding.pry