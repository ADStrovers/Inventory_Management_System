class Driver
  def initialize
    @last_prompt = ""
    @current_prompt = ""
  end

  def main_prompt
    system("clear")
    puts "-"*75
    puts "Welcome to Shelf Management Assistant Resource Terminal - SMART".center(75)
    puts "-"*75
    puts "What would you like to work with today? "
    puts "Please choose an option below: "
    puts "1. Products"
    puts "2. Shelves"
    puts "3. Categories"
    puts "-"*75
    puts "Type exit to close SMART"
    print "> "
    selection = gets.chomp.downcase
    system("clear")
    @current_prompt = __method__.to_s
    case selection
    when "1"
      @last_prompt = __method__.to_s
      submenu("product")
    when "2"
      @last_prompt = __method__.to_s
      submenu("shelf")
    when "3"
      @last_prompt = __method__.to_s
      submenu("category")
    when "exit"
      close_message
    else
      system("clear")
      puts "I'm sorry that is not a recognized option.  Please try again."
      sleep 1
      self.send(@current_prompt)
    end
  end
  
  def submenu(type)
    system("clear")
    puts "-"*75
    puts "Welcome to #{type.capitalize} Management System".center(75)
    puts "-"*75
    puts "What would you like to work with today? "
    puts "Please choose an option below: "
    puts "1. Create a new #{type.capitalize}"
    puts "2. View/Edit a new #{type.capitalize}"
    puts "3. Delete an existing #{type.capitalize}"
    puts "4. Search for an existing #{type.capitalize}"
    puts ""
    puts 'Please type "back" if you wish to go back to the previous prompt.'
    puts "Or type exit to close SMART"
    print "> "
    selection = gets.chomp.downcase
    @current_prompt = __method__
    
    case selection.downcase
    when "1"
      self.send("create_#{type}_prompt")
      @last_prompt = __method__
    when "2"
      self.send("modify_#{type}_prompt")
      @last_prompt = __method__
    when "3"
      self.send("delete_#{type}_prompt")
      @last_prompt = __method__
    when "4"
      self.send("fetch_#{type}_prompt")
      @last_prompt = __method__
    when "back"
      self.send(@last_prompt)
      @last_prompt = __method__
    when "exit"
      close_message
    else
      system("clear")
      puts "I'm sorry that is not a recognized option.  Please try again."
      sleep 1
      self.send(@current_prompt)
    end
  end
  
  def create_product_prompt
    create_hash = {}
    
    system("clear")
    puts "-"*75
    puts "Welcome to the Product Creation Suite - PCS"
    puts "-"*75
    puts "Note: At any time you can type back to go back to the previous screen and "
    puts "      exit to close out of SMART"
    prompt_loop = Product.requirements
    prompt_loop.each do |key|
      puts "Please insert the products' #{key}:"
      value = gets.chomp
      case value.to_s.downcase
      when "back"
        puts @last_prompt
        self.send(@last_prompt)
      when "exit"
        close_message
        break
      else
        case key
        when "shelf_id", "category_id"
          while value.to_i == 0
            puts "I'm sorry.  That is not a valid #{key}.  Please try again."
            value = gets.chomp
          end
        when "price"
          while value.to_f == 0.0
            puts "I'm sorry.  That is not a valid #{key}.  Please try again."
            value = gets.chomp
          end
          value = (value.to_f * 100).to_i
        when "quantity"
          while value.to_i < 0 || value.to_i.to_s != value
            puts "I'm sorry.  That is not a valid #{key}.  Please try again."
            value = gets.chomp
          end
        when "name"
          name_array = Product.list_all
          while name_array.include?(value) || value == ""
            puts "I'm sorry.  That is not a valid #{key}.  Please try again."
            value = gets.chomp
          end
        end
      end
      create_hash[key] = value
      system("clear")
      puts "Creating your new Product now!  Thank you."
      new_item = Product.new(create_hash)
      new_item.insert
      sleep 1
      puts "Your new product has been successfully entered with an ID of #{new_item.id}."
      sleep 1
      puts "Returning you to the main menu. One moment..."
      sleep 2
      main_prompt
      @last_prompt = __method__
    end
  end
  
  def create_shelf_prompt
      create_hash = {}
      puts "-"*75
      puts "Welcome to the Shelf Creation Suite - SCS"
      puts "-"*75
      puts "Note: At any time you can type back to go back to the previous screen and "
      puts "      exit to close out of SMART"
      prompt_loop = Shelf.requirements
      prompt_loop.each do |key|
        puts "Please insert the Shelf's #{key}:"
        value = gets.chomp
        case value.downcase
        when "back"
          self.send(@last_prompt)
          @last_prompt = __method__
          break
        when "exit"
          close_message
          break
        else
          while value == ""
            puts "I'm sorry.  You must give your Shelf a #{key}.  Please try again."
            value = gets.chomp
          end
        end
      end
      create_hash[key] = value
      system("clear")
      puts "Creating your new Shelf now!  Thank you."
      new_item = Shelf.new(create_hash)
      new_item.insert
      sleep 1
      puts "Your new shelf has been successfully entered with an ID of #{new_item.id}."
      sleep 1
      puts "Returning you to the main menu. One moment..."
      sleep 2
      main_prompt
      @last_prompt = __method__
    end
    
    def create_category_prompt
      create_hash = {}
      puts "-"*75
      puts "Welcome to the Category Creation Suite - CCS"
      puts "-"*75
      puts "Note: At any time you can type back to go back to the previous screen and "
      puts "      exit to close out of SMART"
      prompt_loop = Category.requirements
      prompt_loop.each do |key|
        puts "Please insert the Category's #{key}:"
        value = gets.chomp
        case value.downcase
        when "back"
          self.send(last_prompt)
          break
        when "exit"
          close_message
          break
        else
          while value == ""
            puts "I'm sorry.  You must give your Shelf a #{key}.  Please try again."
            value = gets.chomp
          end
        end
      end
      create_hash[key] = value
      system("clear")
      puts "Creating your new Category now!  Thank you."
      new_item = Shelf.new(create_hash)
      new_item.insert
      sleep 1
      puts "Your new category has been successfully entered with an ID of #{new_item.id}."
      sleep 1
      puts "Returning you to the main menu. One moment..."
      sleep 2
      main_prompt
      @last_prompt = __method__
  end
  
  def fetch_product_prompt
    system("clear")
    puts "-"*75
    puts "Welcome to the Product Search Suite - PSS"
    puts "-"*75
    puts "Note: At any time you can type back to go back to the previous screen and "
    puts "      exit to close out of SMART"
    puts ""
    puts "Please enter the field you would like to search by:"
    puts "(Possible fields are: name, shelf_id, category_id, description"
    puts " price, and quantity.)"
    field = gets.chomp.downcase
    case field
    when "back"
      self.send(@last_prompt)
      @last_prompt = __method__
    when "exit"
      close_message
    else
      until Product.requirements.include?(field)
        puts "I'm sorry.  That is not a valid choice.  Please try again."
        field = gets.chomp.downcase
      end
    end
    puts "Now enter the value of #{field}."
    value = gets.chomp
    case value
    when "back"
      self.send(@last_prompt)
      @last_prompt = __method__
    when "exit"
      close_message
      return nil
    end
    obj = Product.search_for("#{field}", "#{value}")
    if obj == []
      puts "I'm sorry.  Not results were found matching #{value} within #{field}."
      sleep 2
      fetch_product_prompt
    else
      puts "Results of your search: "
      obj.each do |object|
        y = Product.new(object)
        puts "#{y.name} with ID of: #{y.id}"
      end
      sleep 2
      puts ""
      puts "Press enter to continue back to the main menu."
      gets.chomp
    end
    main_prompt
  end
    
  def fetch_shelf_prompt
    system("clear")
    puts "-"*75
    puts "Welcome to the Shelf Search Suite - SSS"
    puts "-"*75
    puts "Note: At any time you can type back to go back to the previous screen and "
    puts "      exit to close out of SMART"
    puts ""
    puts "Please enter the field you would like to search by:"
    puts "(Possible fields are: name, id)"
    field = gets.chomp.downcase
    case field
    when "back"
      self.send(@last_prompt)
      @last_prompt = __method__
    when "exit"
      close_message
    else
      until Shelf.requirements.include?(field)
        puts "I'm sorry.  That is not a valid choice.  Please try again."
        field = gets.chomp.downcase
      end
    end
    puts "Now enter the value of #{field}."
    value = gets.chomp
    case value
    when "back"
      self.send(@last_prompt)
      @last_prompt = __method__
    when "exit"
      close_message
      return nil
    end
    obj = Product.search_for("#{field}", "#{value}")
    if obj == []
      puts "I'm sorry.  Not results were found matching #{value} within #{field}."
      sleep 2
      fetch_product_prompt
    else
      puts "Results of your search: "
      obj.each do |object|
        y = Shelf.new(object)
        puts "#{y.name} with ID of: #{y.id}"
      end
      sleep 2
      puts ""
      puts "Press enter to continue back to the main menu."
      gets.chomp
    end
    main_prompt
  end
  
  def fetch_shelf_prompt
    system("clear")
    puts "-"*75
    puts "Welcome to the Category Search Suite - CSS"
    puts "-"*75
    puts "Note: At any time you can type back to go back to the previous screen and "
    puts "      exit to close out of SMART"
    puts ""
    puts "Please enter the field you would like to search by:"
    puts "(Possible fields are: name, description, id)"
    field = gets.chomp.downcase
    case field
    when "back"
      self.send(@last_prompt)
      @last_prompt = __method__
    when "exit"
      close_message
    else
      until Category.requirements.include?(field)
        puts "I'm sorry.  That is not a valid choice.  Please try again."
        field = gets.chomp.downcase
      end
    end
    puts "Now enter the value of #{field}."
    value = gets.chomp
    case value
    when "back"
      self.send(@last_prompt)
      @last_prompt = __method__
    when "exit"
      close_message
      return nil
    end
    obj = Product.search_for("#{field}", "#{value}")
    if obj == []
      puts "I'm sorry.  Not results were found matching #{value} within #{field}."
      sleep 2
      fetch_product_prompt
    else
      puts "Results of your search: "
      obj.each do |object|
        y = Category.new(object)
        puts "#{y.name} with ID of: #{y.id}"
      end
      sleep 2
      puts ""
      puts "Press enter to continue back to the main menu."
      gets.chomp
    end
    main_prompt
  end
  
  def close_message
    system("clear")
    puts "Thank you for using SMART.  We hope to see you again soon!"
    sleep 3
    system("clear")
  end
  
end