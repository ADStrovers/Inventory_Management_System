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
    puts "What would you like to do today? ".ljust(75)
    puts "Please choose an option below: ".ljust(75)
    puts "1. Create a New Product.".ljust(75)
    puts "2. View/Modify an existing Product.".ljust(75)
    puts "3. Delete an existing Product.".ljust(75)
    puts "4. Register a New Shelf Location.".ljust(75)
    puts "5. View/Modify an existing Shelf Location.".ljust(75)
    puts "6. Delete an existing Shelf Location.".ljust(75)
    puts "7. Create a new Product Category.".ljust(75)
    puts "8. View/Modify an existing Product Category.".ljust(75)
    puts "9. Delete an existing Product Category.".ljust(75)
    puts "-"*75
    puts "Type exit to close SMART".ljust(75)
    print "> "
    selection = gets.chomp.downcase
    system("clear")
  
    @current_prompt = __method__.to_s
    case selection
    when "1"
      next_prompt = "create_product_prompt"
    when "2"
      next_prompt = "modify_product_prompt"
    when "3"
      next_prompt = "delete_product_prompt"
    when "4"
      next_prompt = "create_shelf_prompt"
    when "5"
      next_prompt = "modify_shelf_prompt"
    when "6"
      next_prompt = "delete_shelf_prompt"
    when "7"
      next_prompt = "create_category_prompt"
    when "8"
      next_prompt = "modify_category_prompt"
    when "9"
      next_prompt = "delete_category_prompt"
    when "exit"
      next_prompt = "close_message"
    else
      puts "I'm sorry that is not a recognized option.  Please try again.".ljust(75)
      self.send(@current_prompt)
    end
  
    @last_prompt = __method__.to_s
    self.send(next_prompt)
  end

  def create_product_prompt
    create_hash = {}
  
    puts "-"*75
    puts "Welcome to the Product Creation Suite - PCS"
    puts "-"*75
    puts "Note: At any time you can type back to go back to the previous screen and "
    puts "      exit to close out of SMART"
    prompt_loop = Product.requirements
    prompt_loop.each do |key|
      puts "Please insert the products' #{key}:"
      value = gets.chomp
      binding.pry
      case value.downcase
      when "back"
        puts @last_prompt
        self.send(@last_prompt)
      when "exit"
        # do nothing?
      else
        case value
        when "shelf_id", "category_id"
          while value.to_i = 0
            puts "I'm sorry.  That is not a valid #{key}.  Please try again."
            value = gets.chomp
          end
        when "price"
          while value.to_f = 0.0
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
          while name_array.includes?(value)
            puts "I'm sorry.  That is not a valid #{key}.  Please try again."
            value = gets.chomp
          end
        end
      end
      if value = "exit" || "back"
        break
      else
        create_hash[key] = value
      end
    end
    if value = "exit" || "back"
      close_message
    else
      system("clear")
      puts "Creating your new product now!  Thank you."
      new_item = Product.new(create_hash)
      new_item.insert
      puts "..."
      sleep 1
      puts "Your new item has been successfully entered with an ID of #{new_item.id}."
      sleep 1
      puts "Type exit to leave SMART or press entere to be returned back to the main screen."
      value = gets.chomp.downcase
    end
    if value = "exit"
      close_message
    else
      self.send(@last_prompt)
    end
  end

  def modify_product_prompt
  
  end
  
  def delete_product_prompt
  
  end
  
  def create_shelf_prompt
    create_hash = {}
  
    puts "-"*75
    puts "Welcome to the Shelf Location Creation Suite - SLCS"
    puts "-"*75
    puts "Note: At any time you can type back to go back to the previous screen and "
    puts "      exit to close out of SMART"
    prompt_loop = Product.requirements
    prompt_loop.each do |key|
      puts "Please insert the products' #{key}:"
      value = gets.chomp
      case value.downcase
      when "back"
        self.send(last_prompt)
        break
      when "exit"
        close_message
        break
      else
        case value
        when "shelf_id", "category_id"
          while value.to_i = 0
            puts "I'm sorry.  That is not a valid #{key}.  Please try again."
            value = gets.chomp
          end
        when "price"
          while value.to_f = 0.0
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
          while name_array.includes?(value)
            puts "I'm sorry.  That is not a valid #{key}.  Please try again."
            value = gets.chomp
          end
        end
      end
      if value.downcase == "exit" || "back"
        break
      else
        create_hash[key] = value
      end
    end
    system("clear")
    puts "Creating your new product now!  Thank you."
    new_item = Product.new(create_hash)
    new_item.insert
  end
  
  def modify_shelf_prompt
  
  end
  
  def delete_shelf_prompt
  
  end
  
  def create_category_prompt
  
  end
  
  def modify_category_prompt
  
  end
  
  def delete_category_prompt
  
  end
  
  def close_message
    puts "Thank you for using SMART.  We hope to see you again soon!"
    sleep 3
    system("clear")
  end
  
end