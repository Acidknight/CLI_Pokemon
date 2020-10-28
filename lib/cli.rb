class CLI

  def start
    puts "Welcome"
    API.fetch_drinks
    self.menu
  end

  def menu
    puts "Would you like to see the list of drinks?"
    puts "Type 'yes' to continue, or any other key to exit"

    user_input = gets.strip.downcase

    if user_input == 'yes' || user_input == 'y'
      puts "Good choice!"
      display_list_of_drinks
      ask_user_for_drink_choice

      sleep(1)

      puts "\n"

      menu

    else
      puts "Goodbye."
    end
  end

  def display_list_of_drinks
    Drink.all.each.with_index(1) do |drink, index|
      #binding.pry
      puts "#{index}. #{drink.name}"
    end
  end

  def ask_user_for_drink_choice
    puts "Enter the number of the drink you would like to know more about."
    index = gets.strip.to_i - 1

    until index.between?(0, Drink.all.length - 1)
      puts "Sorry, invalid input, please choose valid number."
      index = gets.strip.to_i - 1
    end

    drink_instance = Drink.all[index]

    display_drink_details(drink_instance)
  end

  def display_drink_details(drink)
    #binding.pry
    sleep(1)
    puts "\n"
    puts drink.name
    puts "Glass: " + drink.glass
    puts "Instructions: " + drink.instructions
    puts "German Instructions: " + drink.german_instructions
  end
end
