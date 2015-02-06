class Shelf
  include DatabaseMethods
  
  attr_reader :name, :id
  
  def initialize(options)
    @name = options[:name]
    insert
  end
  
  def list_products_stored
    
  end
  
  def get_value_of_shelf
    
  end
  
end