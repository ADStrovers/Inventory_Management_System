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
  
  
  def list_location_of
    loc = DATABASE.execute("SELECT name FROM shelves WHERE id = #{@shelf_id}")
    loc[0]["name"]
  end
  
  def update_location_of(new_loc)
    @shelf_id = new_loc
    save
  end
  
  def assign_new_category(new_category)
    @category_id = new_category
    save
  end
  
  def buy_product(amount)
    @quantity += amount
    save
  end
  
  def sell_product(amount)
    check = quantity
    unless check - amount < 0
      @quantity -= amount
      save
    end
  end
  
  def update_price(amount)
    @price = amount
    save
  end
  
  def self.requirements
    requirements = ["name", "shelf_id", "category_id", "description", "price", "quantity"]
  end
  
end