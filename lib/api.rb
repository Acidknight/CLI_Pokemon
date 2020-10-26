class API

  def self.fetch_drinks
    url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
    #binding.pry
    uri = URI(url)
    response = Net::HTTP.get(uri)
    #binding.pry
    hash = JSON.parse(response)

    array_of_drinks = hash["drinks"]

    array_of_drinks.each do |drink_hash|
      #binding.pry
      drink = Drink.new
      drink.name = drink_hash["strDrink"]
      drink.instructions = drink_hash["strInstructions"]
      drink.glass = drink_hash["strGlass"]
      drink.german_instructions = drink_hash["strInstructionsDE"]
    end
    binding.pry 
  end

end
