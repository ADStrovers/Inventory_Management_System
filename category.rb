class Category
  include DatabaseMethods
  
  attr_reader :name, :description, :id
  
  def initialize(options)
    @name = options[:name]
    @description = options[:description]
    insert
  end
  
  def list_products_belonging_to
    DATABASE.execute("SELECT * FROM products WHERE category_id = #{@id}")
  end
  
end