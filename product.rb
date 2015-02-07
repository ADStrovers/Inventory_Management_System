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
    loc[0][:name]
  end
  
  def update_location_of
    
  end
  
  def assign_new_category
    
  end
  
  def buy_product
    
  end
  
  def sell_product
    
  end
  
  def update_cost
    
  end
  
end