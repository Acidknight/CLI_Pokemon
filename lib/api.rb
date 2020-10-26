class API

  def self.fetch_drinks
    url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
    binding.pry
    uri = URI(url)
    response = Net::HTTP.get(uri)
    #binding.pry
    hash = JSON.parse(response)

    array_of_drinks = hash["drinks"]
  end

end
