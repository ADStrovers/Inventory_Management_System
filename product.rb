# Class: Category
#
# Models our Product objects that live within categories and shelves.
#
# Attributes:
# @name         - String: Primary Key related to the shelves table of db.
# @shelf_id     - Integer: Denotes what shelf the object belongs to.
# @category_id  - Integer: Denotes what category the object belongs to.
# @description  - String: Describes the product
# @price        - Integer: Price in pennies
# @quantity     - Integer: How many of the product are on the shelf
# @id           - Integer: Primary Key related to the products table of db.
#
# Public Methods:
# .requirements

class Product
  include DatabaseMethods
  
  attr_accessor :name, :quantity, :shelf_id, :category_id, 
                :description, :price, :quantity, :id
  
  def initialize(options)
    @name = options["name"]
    @shelf_id = options["shelf_id"]
    @category_id = options["category_id"]
    @description = options["description"]
    @price = options["price"]
    @quantity = options["quantity"]
    @id = options["id"]
  end
  
  # # Public: #list_location_of
  # # Prompts database for the shelf name of the product.
  # #
  # # Returns:
  # # String: Name of the shelf the product is on.
  # #
  # # State Changes:
  # # None
  #
  # def list_location_of
  #   loc = DATABASE.execute("SELECT name FROM shelves WHERE id = #{@shelf_id}")
  #   loc[0]["name"]
  # end
  #
  # # Public: #update_location_of
  # # Changes the shelf_id to new_loc
  # #
  # # Paramteres:
  # #
  # #
  # # Returns:
  # # String: Name of the shelf the product is on.
  # #
  # # State Changes:
  # # None
  #
  # def update_location_of(new_loc)
  #   @shelf_id = new_loc
  #   save
  # end
  #
  # def assign_new_category(new_category)
  #   @category_id = new_category
  #   save
  # end
  #
  # def buy_product(amount)
  #   @quantity += amount
  #   save
  # end
  #
  # def sell_product(amount)
  #   check = quantity
  #   unless check - amount < 0
  #     @quantity -= amount
  #     save
  #   end
  # end
  #
  # def update_price(amount)
  #   @price = amount
  #   save
  # end
  
  
  # Public: .requirements
  # Class method that returns the instance methods of a Product item minus @id.
  #
  # Returns:
  # Array
  #
  # State Changes:
  # None
  
  def self.requirements
    requirements = ["name", "shelf_id", "category_id", "description", "price", "quantity"]
  end
  
end