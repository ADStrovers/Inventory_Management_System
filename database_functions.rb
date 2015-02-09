# Module: DatabaseMethods
#
# In charge of giving classes all of the common instance methods for database functions
#
# Public Methods:
# #save
# #insert

module DatabaseMethods
  
  # Module: ClassDatabaseMethods
  #
  # In charge of giving classes all of the common class methods for database functions
  #
  # Public Methods:
  # #save
  # #insert
  
  module ClassDatabaseMethods
    
    # Public: #list_all
    # Lists all the names from the corresponding database table.
    # IE: Shelf.class = shelves table.
    #
    # Returns:
    # Array
    #
    # State Changes:
    # None
    
    def list_all
      list = DATABASE.execute("SELECT name FROM #{self.to_s.pluralize}")
    end
    
    # Public: #delete
    # Deletes the given id from the class's database
    #
    # Parameters:
    # id - Integer: Primary ID of the row to be deleted.
    #
    # Returns:
    # Array
    #
    # State Changes:
    # None
    
    def delete(id)
      DATABASE.execute("DELETE FROM #{self.to_s.pluralize} WHERE id = #{id}")
    end
    
    # Public: #search_for
    # Searches the classes database based on input
    #
    # Parameters:
    # field - String: the field within the database to search
    # value - String: The value to search within the field for.
    #
    # Returns:
    # Array
    #
    # State Changes:
    # None
    
    def search_for(field, value)
    
      results_as_objects = []
    
      if value.is_a? Integer
        results = DATABASE.execute("SELECT * FROM #{self.to_s.pluralize} WHERE #{field} = #{value}")
      else
        results = DATABASE.execute("SELECT * FROM #{self.to_s.pluralize} WHERE #{field} = '#{value}'")
      end
    
      results.each{ |x| results_as_objects << x}
    
      results_as_objects
    end
    
  end
  
  # Private: #included
  # Auto call on include from class.  Used to extend module.
  #
  # Parameters:
  # base: String: name of the class being included in.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # None
  
  def self.included(base)
    base.extend ClassDatabaseMethods
  end
  
  # Public: #save
  # Saves the given object to the database
  #
  # Returns:
  # []
  #
  # State Changes:
  # None
  
  def save
    attributes = []
    instance_variables.each do |i|
      attributes << i.to_s.delete("@")
    end
  
    query_components_array = []
  
    attributes.each do |a|
      value = self.send(a)
    
      if value.is_a?(Integer)
        query_components_array << "#{a} = #{value}"
      else
        query_components_array << "#{a} = '#{value}'"
      end
    end
  
    query_string = query_components_array.join(", ")
  
    DATABASE.execute("UPDATE #{self.class.to_s.pluralize} SET #{query_string} WHERE id = #{id}")
  end
  
  # Public: #insert
  # Inserts the given object into the database and assigns @id to it.
  #
  # Returns:
  # @id
  #
  # State Changes:
  # @id
  
  def insert
    attributes = []
    values = []
    
    instance_variables.each do |x|
      unless x == :@id
        attributes << x.to_s.delete('@')
      end
    end
    
    columns = attributes.join(", ")
    attributes.each do |x| 
      if self.send(x).is_a? Integer
        values << self.send(x)
      else
        values << "'#{self.send(x)}'"
      end 
    end
    
    DATABASE.execute("INSERT INTO #{self.class.to_s.pluralize} (#{columns}) VALUES (#{values.join(', ')})")
    @id = DATABASE.last_insert_row_id
  end
  
end