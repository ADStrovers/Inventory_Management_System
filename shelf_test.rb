require 'minitest/autorun'
require 'sqlite3'
require 'rubygems'
require 'active_support/inflector'

DATABASE = SQLite3::Database.new("inventory_management_test.db")
require_relative 'database_setup'

require_relative 'database_functions'
require_relative 'shelf'

class ShelfTest < Minitest::Test
  
  def setup
    DATABASE.execute("DELETE FROM products")
    DATABASE.execute("DELETE FROM shelves")
    DATABASE.execute("DELETE FROM categories")
  end
  
  def test_shelf_receives_id_when_saved
    test = Shelf.new({name: "South-West"})
    
    assert_kind_of Integer, test.id
  end
  
end