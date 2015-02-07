# Class: Category
#
# Models our Category objects that help further define our
# products.
#
# Attributes:
# @id           - Integer: Primary Key related to the shelves table of db.
# @name         - String: Name given to Shelf
# @description  - String: Describes the category
#
# Public Methods:
# #list_products_belonging_to
# #list_all_categories

class Category
  include DatabaseMethods
  
  attr_accessor :name, :description, :id
  
  def initialize(options)
    @name = options["name"]
    @description = options["description"]
    @id = options["id"]
  end
  
  def list_products_belonging_to
    DATABASE.execute("SELECT * FROM products WHERE category_id = #{@id}")
  end
end