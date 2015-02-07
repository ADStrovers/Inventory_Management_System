# Class: Shelf
#
# Models our Shelf objects that hold products
#
# Attributes:
# @id   - Integer: Primary Key related to the shelves table of db.
# @name - String: Name given to Shelf
#
# Public Methods:
# #list_all_shelves
# #list_products_stored
# #get_value_of_shelf

class Shelf
  include DatabaseMethods
  
  attr_accessor :name, :id
  
  def initialize(options)
    @name = options["name"]
    @id   = options["id"]
  end
  
  # Public: #list_products_stored
  # Lists all the products that have shelf_id of the current shelf.
  #
  # Returns:
  # Array
  #
  # State Changes:
  # None
  
  def list_products_stored
    list = DATABASE.execute("SELECT name FROM products WHERE shelf_id = #{@id}")
  end
  
  # Public: #get_value_of_shelf
  # Lists current value of all products on the shelf.
  #
  # Returns:
  # Integer
  #
  # State Changes:
  # None
  
  def get_value_of_shelf
    value = DATABASE.execute("SELECT price, quantity FROM products WHERE shelf_id = #{@id}")
    
    value.each do |x|
      shelf_value += x[:quantity] * x[:price]
    end
    shelf_value
  end
  
end