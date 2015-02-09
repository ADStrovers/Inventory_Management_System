# Class: Category
#
# Models our Category objects that help further define our
# products.
#
# Attributes:
# @id           - Integer: Primary Key related to the categories table of db.
# @name         - String: Name given to Category
# @description  - String: Describes the category
#
# Public Methods:
# #list_products_belonging_to
# .requirements

class Category
  include DatabaseMethods
  
  attr_accessor :name, :description, :id
  
  def initialize(options)
    @name = options["name"]
    @description = options["description"]
    @id = options["id"]
  end
  
  def list_products_belonging_to
    DATABASE.execute("SELECT name FROM products WHERE category_id = #{@id}")
  end
  
  
  # Public: .requirements
  # Class method that returns the instance methods of a Category item minus @id.
  #
  # Returns:
  # Array
  #
  # State Changes:
  # None
  
  def self.requirements
    requirements = ["name", "description"]
  end
end