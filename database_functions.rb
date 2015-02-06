module DatabaseMethods
  
  def insert
    attributes = []
    values = []
    
    instance_variables.each do |x|
      attributes << x.to_s.delete('@')
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
  
  def save
    attributes = []
    instance_variables.each do |i|
      attributes << i.to_s.delete("@")
    end
  
    binding.pry
  
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
    # name = 'Sumeet', age = 75, hometown = 'San Diego'
  
    DATABASE.execute("UPDATE students SET #{query_string} WHERE id = #{id}")
  end
  
end